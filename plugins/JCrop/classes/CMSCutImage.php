<?php
class CMSCutImage {
    private $file;
    
    public function __construct($file) {
        $this->file = $file;
    }
    
    public function saveCutImage($X, $Y, $W, $H, $logo=null, $text=null, $file=null) {
        $img=new CMSIMG();
        $img->load($this->file);
        $img->imageCut($X,$Y,$W,$H);
        if($logo!=null && isset($logo['file']) && isset($logo['position'])) {
            $img->setlogo($logo['file'],$logo['position']);
        }
        if($text!=null && isset($logo['text']) && isset($logo['fontfile']) && 
                isset($logo['color']) && isset($logo['size']) && 
                isset($logo['angle']) && isset($logo['x']) && 
                isset($logo['y']) && isset($logo['pr'])) {
            $img->text($logo['text'], $logo['fontfile'], $logo['color'], 
                    $logo['size'], $logo['angle'], $logo['x'], 
                    $logo['y'], $logo['pr']);
        }
        if($file==null) {
            $img->save($this->file);
        } else {
            $img->save($file);
        }
    }
    
    public function getSmall($src, $dest, $width, $height, $rgb=0xFFFFFF, $quality=100) {
        if (!file_exists($src)) return false;

        $size = getimagesize($src);

        if ($size === false) return false;

        // Определяем исходный формат по MIME-информации, предоставленной
        // функцией getimagesize, и выбираем соответствующую формату
        // imagecreatefrom-функцию.
        $format = strtolower(substr($size['mime'], strpos($size['mime'], '/')+1));
        $icfunc = "imagecreatefrom" . $format;
        if (!function_exists($icfunc)) return false;

        $x_ratio = $width / $size[0];
        $y_ratio = $height / $size[1];

        $ratio       = min($x_ratio, $y_ratio);
        $use_x_ratio = ($x_ratio == $ratio);

        $new_width   = $use_x_ratio  ? $width  : floor($size[0] * $ratio);
        $new_height  = !$use_x_ratio ? $height : floor($size[1] * $ratio);
        $new_left    = $use_x_ratio  ? 0 : floor(($width - $new_width) / 2);
        $new_top     = !$use_x_ratio ? 0 : floor(($height - $new_height) / 2);

        $isrc = $icfunc($src);
        $idest = imagecreatetruecolor($width, $height);

        imagefill($idest, 0, 0, $rgb);
        imagecopyresampled($idest, $isrc, $new_left, $new_top, 0, 0, 
          $new_width, $new_height, $size[0], $size[1]);

        imagejpeg($idest, $dest, $quality);

        imagedestroy($isrc);
        imagedestroy($idest);

        return true;
    }

        public function getPreview($id=null,$width=null,$height=null) {
        if($id==null) {
            $id = "preview";
        }
        if($width==null) {
            $width = "";
        } else {
            $width = "width: ".$width.";";
        }
        if($height==null) {
            $height = "";
        } else {
            $height = "height: ".$height.";";
        }
        $out = "";
        $out .= '<div style="overflow: hidden; '.$width.' '.$height.'">';
        $out .= '<img id="'.$id.'" src="'.$this->file.'"/>';
        $out .= '</div>';
        return $out;
    }
    
    public function getImg($id) {
        $out = '<img src="'.$this->file.'?r='.rand().'" id="'.$id.'" />';
        return $out;
    }
    
    public function getForm($actionFile,$cancel=null) {
        $out = "";
 	$out .= '<form class="CMSCutImageForme" action="'.$actionFile.'" method="post" onsubmit="return checkCoords();">';
	$out .= '<input type="hidden" id="x" name="x" />';
	$out .= '<input type="hidden" id="y" name="y" />';
	$out .= '<input type="hidden" id="w" name="w" />';
	$out .= '<input type="hidden" id="h" name="h" />';
        if($cancel!=null) {
            $out .= '<input type="button" value="Отменить" onclick="'.$cancel.'"/>';
        }
	$out .= '<input type="submit" value="Применить" />';
	$out .= '</form>';
        return $out;
    }
}
?>
