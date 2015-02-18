<?php

/**
 * Структура данных
 * [<alias группы>][alias]
 * [<alias группы>][name]
 * [<alias группы>][url]
 * [<alias группы>][pages][<порядковый номер>][alias]
 * [<alias группы>][pages][<порядковый номер>][name]
 * [<alias группы>][pages][<порядковый номер>][url]
 */
class SiteMap {
    private $SQL_HELPER;
    private $thisLang;
    private $urlHelper;
    private $siteMapData;
    
    public function __construct() {
        global $_SQL_HELPER;
        global $_URL_PARAMS;
        $this->SQL_HELPER = $_SQL_HELPER;
        $this->thisLang = $_URL_PARAMS['lang'];
        $this->urlHelper = new UrlHelper();
        $this->getSqlSiteMapData();
    }
    
    private function getUrl($url,$page,$postfix) {
        $out = '';
        if($url != null && $url != '') {
            $out = $url;
        } else if ($page != null && $page != '') {
            if($postfix != null && $postfix != '') {
                $out = $this->urlHelper->pageUrl($page, null).$postfix;
            } else {
                $out = $this->urlHelper->pageUrl($page, null);
            }
        }
        return $out;
    }
    
    private function generateUrlHtml($url, $text) {
        $htmlURL = $text;
        if($url != null && $url != '') {
            $htmlURL = "<a href='".$url."'>".$text."</a>";
        }
        return $htmlURL;
    }
    
    private function getSqlSiteMapData() {
        $query = "SELECT SMG.`alias`, SMG.`url`, SMGP.`page`, SMGP.`postfix`
            FROM `SiteMapGroups` as SMG LEFT JOIN `SiteMapGroupsPages` as SMGP
            on SMG.`alias` = SMGP.`alias`
            ORDER BY SMG.`sequence` ASC;";
        $result = $this->SQL_HELPER->select($query);
        $this->siteMapData = array();
        if($result != null) {
            foreach ($result as $group) {
                $this->siteMapData[$group['alias']]['alias'] = $group['alias'];
                $this->siteMapData[$group['alias']]['name'] = $this->getGroupText($group['alias']);
                $this->siteMapData[$group['alias']]['url'] = $this->getUrl($group['url'],$group['page'],$group['postfix']);
                $this->siteMapData[$group['alias']]['pages'] = $this->getSqlGroupData($group['alias']);
            }
        }
    }
    
    private function getSqlGroupData($group) {
        $query = "SELECT SM.`alias`, SM.`url`, SMP.`page`, SMP.`postfix`
            FROM `SiteMap` as SM LEFT JOIN `SiteMapPages` as SMP
            on SM.`alias` = SMP.`alias`
            where SM.`group` = '".$group."'
            ORDER BY SM.`sequence` ASC;";
        $result = $this->SQL_HELPER->select($query);
        $pages = array();
        if($result != null) {
            foreach ($result as $key => $page) {
                $pages[$key]['alias'] = $page['alias'];
                $pages[$key]['name'] = $this->getPageText($page['alias']);
                $pages[$key]['url'] = $this->getUrl($page['url'],$page['page'],$page['postfix']);
            }
        }
        return $pages;
    }
    
    private function getGroupText($alias) {
        $langHelper = new LangHelper("SiteMapGroups_Lang","lang","alias",$alias,$this->thisLang);
        return $langHelper->getLangValue("name");
    }
    
    private function getPageText($alias) {
        $langHelper = new LangHelper("SiteMap_Lang","lang","alias",$alias,$this->thisLang);
        return $langHelper->getLangValue("name");
    }
    
    private function generateHtml($maxInColumn = null, $noTags = false) {
        $html = '';
        foreach ($this->siteMapData as $element) {
            $html .= $this->generateElementHtml($element['alias'],$maxInColumn,$noTags);
        }
        return $html;
    }
    
    private function generateElementHtml($group, $maxInColumn = null, $noTags = false) {
        if(!isset($this->siteMapData[$group])) {
            return "<div class='SiteMapGroup'>Indefind Group</div>";
        }
        $elementsAmount = $this->siteMapData[$group]['pages'];
        if($maxInColumn == null) {
            $maxInColumn = $elementsAmount;
        }
        $out = '';
        $out .= "<div id='SiteMapGroup_".$group."' class='SiteMapGroup SiteMapGroup_".$group."'>";
        $out .= "<div class='SiteMapGroupTitleWrapper'>";
        $out .= "<div class='SiteMapGroupTitle'>";
        $out .= $this->generateUrlHtml($this->siteMapData[$group]['url'], $this->siteMapData[$group]['name']);
        $out .= "</div>";
        $out .= "</div>";
        $counter = 1;
        $elementsCounter = 1;
        $blockCounter = 1;
        foreach ($this->siteMapData[$group]['pages'] as $element) {
            if($counter == 1) {
                $out .= "<ul class='SiteMapGroupElementBlock ElementBlock_".$blockCounter."'>";
                $blockCounter++;
            }
            $out .= "<li id='SiteMapGroupElement_".$group."_".$element['alias']."' class='SiteMapGroupElement Element_".$element['alias']."'>";
            $out .= "<div class='SiteMapGroupElementTitleWrapper'>";
            $out .= "<div class='SiteMapGroupElementTitle'>";
            if($noTags) {
                $out .= $this->generateUrlHtml($element['url'], strip_tags($element['name']));
            } else {
                $out .= $this->generateUrlHtml($element['url'], $element['name']);
            }
            $out .= "</div>";
            $out .= "</div>";
            $out .= "</li>";
            if($counter == $maxInColumn || $elementsCounter == $elementsAmount) {
                $counter = 1;
                $out .= "</ul>";
            } else {
                $counter++;
            }
            $elementsCounter ++;
        }
        $out .= "</div>";
        return $out;
    }
    
    public function getData($group = null) {
        if($group == null) {
            return $this->siteMapData;
        } else {
            return $this->siteMapData[$group];
        }
    }
    
    public function getHtml($maxInColumn = null, $group = null, $noTags = false) {
        if($group == null) {
            return $this->generateHtml($maxInColumn, $noTags);
        } else {
            return $this->generateElementHtml($group, $maxInColumn, $noTags);
        }
    }
    
    public function get($maxInColumn = null, $group = null, $noTags = false) {
        echo $this->getHtml($maxInColumn, $group, $noTags);
    }
}
