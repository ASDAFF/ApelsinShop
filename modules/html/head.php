<?php
class HtmlModul {
    private $name;
    private $html;
    private $thisLang;
    
    public function __construct() {
        global $_PARAM;
        global $_URL_PARAMS;
        $this->thisLang = $_URL_PARAMS['lang'];
        $this->name = $_PARAM['name'];
        $this->getHtmlLang();
    }
    
    private function getHtmlLang() {
        $langHelper = new LangHelper("HtmlModul_Lang","lang","htmlModul",$this->name,$this->thisLang);
        $menuLangType = $langHelper->getLangType();
        if($menuLangType != -1){
            $this->html = $langHelper->getLangValue("html");
        } else {
            $this->html = "";
        }
    }
    
    public function getHtml() {
        echo $this->html;
    }
}
?>