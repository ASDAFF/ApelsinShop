<?php

class UrlHelper {
    private $thisPage;
    private $thisLang;
    private $thisParam;
    private $mainPage;
    private $defaultLang;
    private $multilanguage;
    private $siteConf;
    
    public function __construct() {
        global $_URL_PARAMS;
        global $_SITECONFIG;
        $this->siteConf = $_SITECONFIG;
        $this->thisPage = $_URL_PARAMS['page'];
        $this->thisLang = $_URL_PARAMS['lang'];
        $this->thisParam = $_URL_PARAMS['params'];
        $this->multilanguage = $this->siteConf->getMultilanguage();
        $this->getMainPageAlias();
        $this->getDefaultLang();
    }
    
    private function getMainPageAlias() {
        $query = "Select `alias` from `Pages` where `isMainPage`='1' limit 0,1;";
        $mySqlHelper = new MySqlHelper($query);
        $pagesInfo = $mySqlHelper->getDataRow(0);
        $this->mainPage = $pagesInfo['alias'];
    }

    private function getDefaultLang() {
        $query = "Select `lang` from `Lang` where `default`='1' limit 0,1;";
        $mySqlHelper = new MySqlHelper($query);
        $langInfo = $mySqlHelper->getDataRow(0);
        $this->defaultLang = $langInfo['lang'];
    }

    private function checkLang($lang) {
        $query = "Select `lang` from `Lang` where `lang`='$lang';";
        $mySqlHelper = new MySqlHelper($query);
        $langInfo = $mySqlHelper->getAllData();
        return count($langInfo)>0 ? true : false;
    }

    private function checkPageAlias($alias) {
        $query = "Select `alias` from `Pages` where `alias`='$alias';";
        $mySqlHelper = new MySqlHelper($query);
        $pagesInfo = $mySqlHelper->getAllData();
        return count($pagesInfo)>0 ? true : false;
    }
    
    private function getPageString($page) {
        $out = "";
        if($page != null && $this->checkPageAlias($page) && $page != $this->mainPage) {
            $out = "/".$page;
        }
        return $out;
    }
    
    private function getLangString($lang) {
        $out = "";
        if($this->multilanguage) {
            if($lang!=null && $this->checkLang($lang)) {
                $out = "/".strtolower($lang);
            } else {
                $out = "/".strtolower($this->defaultLang);
            }
        }
        return $out;
    }

    private function getParamsString($params) {
        $out = "";
        if($params!=null && count($params)>0 && is_array($params)){
            foreach ($params as $param) {
                $out .= "/".$param;
            }
        }
        return $out;
    }

    /**
     * Use $lang = null for default lang
     * Use $page = null for mainPage
     * Use $params = null for url without params
     * @param type $page
     * @param type $lang
     * @param array $params
     */
    public function createUrl($page,$lang,$params) {
        return ".".$this->getPageString($page).
                $this->getLangString($lang).$this->getParamsString($params)."/";
    }
    
    public function getThisPage() {
        return $this->createUrl($this->thisPage,$this->thisLang,$this->thisParam);
    }
    
    public function getThisParentPage() {
        return $this->createUrl($this->thisPage,$this->thisLang,null);
    }
    
    /**
     * Use $lang = null for default lang
     * Use $page = null for mainPage
     * Use $params = null for url without params
     * @param type $page
     * @param type $lang
     * @param array $params
     */
    public function createUrlWithHTTP($page,$lang,$params) {
        return "http://".$this->siteConf->getHostName().$this->getPageString($page).
                $this->getLangString($lang).$this->getParamsString($params)."/";
    }
    public function createThisPageWithHTTP() {
        return "http://".$this->siteConf->getHostName().$this->getPageString($this->thisPage).
                $this->getLangString($this->thisLang).$this->getParamsString($this->thisParam)."/";
    }
    
    /**
     * Use $page = null for mainPage
     * Use $params = null for url without params
     * @param type $page
     * @param type $params
     * @return type
     */
    public function pageUrl($page,$params) {
        return $this->createUrl($page,$this->thisLang,$params);
    }
    
    /**
     * Use $lang = null for default lang
     * @param type $lang
     */
    public function homePageUrlWithLang($lang) {
        return $this->createUrl(null,$lang,null);
    }
    
    public function homePageUrl() {
        return $this->pageUrl(null,null);
    }
    
    public function chengeLangUrl($lang) {
        return $this->createUrl($this->thisPage, $lang, $this->thisParam);
    }
    
    public function chengeParams($params) {
        return $this->createUrl($this->thisPage, $this->thisLang, $params);
    }
}
?>
