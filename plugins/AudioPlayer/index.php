<?php
class AudioPlayer {
    
    public static function getPalaer($file) {
        $out = "";
        $out .= '<audio preload="auto" controls>';
        if(is_array($file)) {
            foreach ($file as $f) {
                $out .= '<source src="'.$f.'">';
            }
        } else {
            $out .= '<source src="'.$file.'">';
        }
        $out .= '</audio>';
        return $out;
    } 
}

?>
