<?php
class Slider {
    private $name;
    private $thisLang;
    private $defaultLang;
    private $data;
    private $html;
    private $param;
    
    private $sliderDir = './resources/Modules/Slider/';
    
    public function __construct() {
        global $_PARAM;
        $this->name = $_PARAM['name'];
        global $_URL_PARAMS;
        $this->thisLang = $_URL_PARAMS['lang'];
        $this->getDefaultLang();
        $this->generateHTML();
    }
    
    private function getDefaultLang() {
        $query = "select `lang` from `Lang` where `default`='1';";
        $mySqlHelper = new MySqlHelper($query);
        $lang = $mySqlHelper->getDataRow(0);
        $this->defaultLang = $lang['lang'];
    }
    
    private function getSliderData() {
        $query = "select * from `Sliders` where `alias`='".$this->name."';";
        $mySqlHelper = new MySqlHelper($query);
        $this->data = $mySqlHelper->getDataRow(0);
        $this->getSlidesData();
    }
    
    private function getSlidesData() {
        $query = "select * from `Slides` where `slider`='".$this->name."' order by `sequence` asc;";
        $mySqlHelper = new MySqlHelper($query);
        $this->data['slides'] = $mySqlHelper->getAllData();
    }

    private function generateHTML() {
        $this->getSliderData();
        $out = '<div class="border_box">';
        $out .= '<div class="box_skitter box_skitter_large '.$this->name.'">';
        $out .= '<ul>';
        foreach ($this->data['slides'] as $slide) {
            $html = "<li>";
//            echo $this->sliderDir.$this->name.'/'.strtolower($this->thisLang).'/'.$slide['fileName']."<br>";
            $img = '<img src="'.$this->sliderDir.$this->name.'/'.strtolower($this->thisLang).'/'.$slide['fileName'].'" class="'.$slide['animation'].'" />';
            $imgFile = $this->sliderDir.$this->name.'/'.strtolower($this->thisLang).'/'.$slide['fileName'];
            if(!file_exists($imgFile)) {
                $imgFile = $this->sliderDir.$this->name.'/'.strtolower($this->defaultLang).'/'.$slide['fileName'];
            }
            $img = '<img src="'.$imgFile.'" class="'.$slide['animation'].'" />';
            if(isset($slide['url']) && $slide['url']!=null && $slide['url']!="") {
                $urlHelper = new UrlHelper();
                $target = "";
                if(substr($slide['url'], 0, 1)=="#") {
                    $url = $urlHelper->getThisPage().$slide['url'];
                } else if(substr($slide['url'], 0, 1)=="$") {
                    $url = $urlHelper->pageUrl(substr($slide['url'], 1), null);
                } else {
                    if(substr($slide['url'], 0, 7)=="http://") {
                        $target = 'target="_blank"';
                    }
                    $url = $slide['url'];
                }
                
                $html .= '<a href="'.$url.' '.$target.'">';
                $html .= $img;
                $html .= '</a>';
            } else {
                $html .= $img;
            }
            if(isset($slide['text']) && $slide['text']!=null && $slide['text']!="") {
                $html .= '<div class="label_text">';
                $html .= $slide['text'];
                $html .= '</div>';
            }
            $html .= "</li>";
            $out .= $html;
        }
        $out .= '</ul>';
        $out .= '</div>';
        $out .= '</div>';
        $out .= $this->generateParams();
        $this->html = $out;
    }
    
    private function generateParams() {
        $out = "<script type=\"text/javascript\">\n";
        $out .= "$('.".$this->name."').skitter({\n";
        $out .= $this->getParam('theme').",\n";
        $out .= $this->getBoolParam('hideTools').",\n";
        $out .= $this->getBoolParam('show_randomly').",\n";
        $out .= $this->getBoolParam('controls').",\n";
        $out .= $this->getParam('controls_position').",\n";
        $out .= $this->getBoolParam('focus').",\n";
        $out .= $this->getParam('focus_position').",\n";
        $out .= $this->getBoolParam('numbers').",\n";
        $out .= $this->getParam('numbers_align').",\n";
        $out .= $this->getBoolParam('progressbar').",\n";
        $out .= $this->getBoolParam('enable_navigation_keys').",\n";
        $out .= $this->getBoolParam('label').",\n";
        $out .= $this->getParam('labelAnimation').",\n";
        $out .= $this->getBoolParam('dots').",\n";
        $out .= $this->getBoolParam('thumbs').",\n";
        $out .= $this->getBoolParam('preview').",\n";
        $out .= $this->getParam('animations').",\n";
        $out .= $this->getParam('interval');
        $out .= "});\n";
        $out .= "</script>\n";
        return $out;
    }
    
    private function getParam($param) {
        return $param.': "'.$this->data[$param].'"';
    }
    
    private function getBoolParam($param) {
        $this->data[$param]==1 ? $value = "true" : $value = "false";
        return $param.': '.$value;
    }
    
    public function getSlider() {
        echo $this->html;
    }
}
?>
