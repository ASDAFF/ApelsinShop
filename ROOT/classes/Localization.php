<?php
class Localization {
    private $thisLang;
    private $filePath;
    private $local;
    
    public function __construct($dir=null) {
        global $_URL_PARAMS;
        $this->thisLang = $_URL_PARAMS['lang'];
        if($dir!=null) {
            $dir = $dir."/";
        } else {
            $dir = "";
        }
        $this->filePath = "./localization/".$dir.strtolower($this->thisLang).".lng";
        $this->local = null;
        $this->getFileData();
    }
    
    private function getFileData() {
        if(file_exists($this->filePath)){
            $temp = file($this->filePath);
            foreach ($temp as $value) {
                $spstr = explode ("=",$value);
                if(isset($spstr[0]) && $spstr[0]!="" && isset($spstr[1]) && $spstr[1]!="") {
                    $this->local[$spstr[0]]=rtrim($spstr[1]);
                }
            }
        } else {
            echo 'Lang file '.$this->filePath.' not found';
        }
    }
    
    public function get($key) {
        if($this->local!=null) {
            if (array_key_exists($key,$this->local)) {
                echo $this->local[$key];
            } else {
                echo "{localization_err|key=".$key."}";
            }
        }
    }
    
    public function getText($key) {
        if($this->local!=null) {
            if (array_key_exists($key,$this->local)) {
                return $this->local[$key];
            } else {
                return "{localization_err|key=".$key."}";
            }
        }
    }
}
?>
