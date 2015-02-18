<?php
class Material {
    private $thisLang;
    private $malerial;
    private $malerialData;
    private $langType;
    private $html;
    private $noData;
    
    public function __construct() {
        $this->noData = false;
        global $_URL_PARAMS;
        global $_PARAM;
        $this->thisLang = $_URL_PARAMS['lang'];
        $this->malerial = $_PARAM['name'];
        $this->generateHtml();
    }
    
    private function getMaterialData() {
        $query ="select * from `Materials` where `alias`='$this->malerial'";
        $mySqlHelper = new MySqlHelper($query);
        $this->malerialData = $mySqlHelper->getDataRow(0);
        if(count($this->malerialData) == 0) {
            $this->noData = true;
            return;
        }
        $this->getMaterialDataText();
        $this->getCategories();
    }
    
    private function getMaterialDataText() {        
        $this->langHelper = new LangHelper("Materials_Lang","lang","material",$this->malerial,$this->thisLang);
        $this->langType = $this->langHelper->getLangType();
        if($this->langType != -1){
            $langData = $this->langHelper->getLangData();
            $this->malerialData['title'] = $langData["title"];
            $this->malerialData['text'] = $langData["text"];
        } else {
            $this->malerialData['title'] = "";
            $this->malerialData['text'] = "";
        }
        $this->malerialData['noLocal'] = null;
    }
    
    private function getCategories() {
        $query ="select * from `MaterialsInCategories` where `material`='$this->malerial'";
        $mySqlHelper = new MySqlHelper($query);
        $this->malerialData['categories'] = $mySqlHelper->getAllData();
    }


    private function generateHtml() {
        $this->getMaterialData();
        if($this->noData) {
            $this->html = "404 - Страница не найдена";
            return;
        }
        $out = "";
        if($this->malerialData['showTitle']>0) {
            $out .= "<h1>".$this->malerialData['title']."</h1>\n";
        }
        $out .= "<div class='text'>";
        $out .= $this->malerialData['text'];
        $out .= "</div>";
        $out .= $this->getDate();
        $this->html = $out;
    }
    
    private function getDate() {
        $out = "";
        if($this->malerialData['showCreated']>0) {
            if($this->malerialData['showChange']>0) {
                $date = new DateTime($this->malerialData['lastChange']);
            } else {
                $date = new DateTime($this->malerialData['created']);
            }
            $out .= "<div class='materials_info_panel'><span class='date'>".$date->format('d M Y')."</span></div>";
        }
        return $out;
    }
    
    public function getHtml() {
        echo $this->html;
    }
}
?>
