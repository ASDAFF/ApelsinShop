<?php
class UrlParams {
    
    private $urlParams;
    private $siteConf;
    private $multilanguage;
    
    public function __construct() {
        global $_SITECONFIG;
        $this->siteConf = $_SITECONFIG;
        $this->multilanguage = $this->siteConf->getMultilanguage();
        $temp = explode("/", $_SERVER['REQUEST_URI']);
        $allParams = array();
        $params = array();
        $this->urlParams = array();
        $this->urlParams['page'] = null;
        $this->urlParams['lang'] = null;
        $this->urlParams['params'] = null;
        $this->urlParams['isRedirect'] = false;
        foreach ($temp as $value) {
            if($value != null && $value != "") {
                $allParams[] = urldecode($value);
            }
        }
        $position = 0;
        if(count($allParams)>0) {
            if($this->checkPageAlias($allParams[0])) {
                $this->urlParams['page'] = $allParams[0];
                if(count($allParams)>1) {
                    $lang = $this->getLangFromUrl($allParams,1);
                    $this->urlParams['lang'] = $lang['lang'];
                    $lang['isUrlLang'] ? $position = 2 : $position = 1;
                } else {
                    $this->urlParams['lang'] = $this->getDefaultLang();
                    $position = 1;
                }
            } else {
                $this->urlParams['page'] = $this->getMainPageAlias();
                $lang = $this->getLangFromUrl($allParams,0);
                $this->urlParams['lang'] = $lang['lang'];
                $lang['isUrlLang'] ? $position = 1 : $position = 0;
            }
            $params = array();
            for($i=$position; $i<count($allParams);$i++) {
                $params[] = $allParams[$i];
            }
            $this->urlParams['params'] = $params;
        } else {
            $this->urlParams['page'] = $this->getMainPageAlias();
            $this->urlParams['lang'] = $this->getDefaultLang();
        }
    }

    public function getUrlParam() {
        return $this->urlParams;
    }

    private function getLangFromUrl($allParams,$position) {
        if($this->checkLang($allParams[$position])) {
            $lang['lang'] = $allParams[$position];
            $lang['isUrlLang'] = true;
        } else {
            $lang['lang'] = $this->getDefaultLang();
            if($this->multilanguage) {
                $this->urlParams['isRedirect'] = true;
            }
            $lang['isUrlLang'] = false;
        }
        return $lang;
    }

    private function getMainPageAlias() {
        $query = "Select `alias` from `Pages` where `isMainPage`='1' limit 0,1;";
        $mySqlHelper = new MySqlHelper($query);
        $pagesInfo = $mySqlHelper->getDataRow(0);
        return $pagesInfo['alias'];
    }

    private function getDefaultLang() {
        $query = "Select `lang` from `Lang` where `default`='1' limit 0,1;";
        $mySqlHelper = new MySqlHelper($query);
        $langInfo = $mySqlHelper->getDataRow(0);
        return $langInfo['lang'];
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
}
?>
