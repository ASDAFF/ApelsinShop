<?php
/**
 * Description of BackgroundGeneratorHelper
 *
 * @author maxim
 */
class BackgroundGeneratorHelper {
    
    public static function getBackgroundImg(
            $path, $name, 
            $defaultImageFile = NULL, 
            $horizontalAlignment = 'center', 
            $verticalAlignment = 'center', 
            $repeat = 'no-repeat', 
            $backgroundColor = '', 
            $extensions = array('png','jpg','PNG','JPG')) {
        
        if($defaultImageFile !== NULL && file_exists($defaultImageFile)) {
            $imageFile = $defaultImageFile;
        } else {
            $imageFile = NULL;
        }
        foreach ($extensions as $extension) {
            $checkImageFile = $path.$name.'.'.$extension;
            if(file_exists($checkImageFile)) {
                $imageFile = $checkImageFile;
                break;
            }
        }
        if($imageFile !== NULL) {
            $background = "background: ".$backgroundColor.
                    " url('".$imageFile."') ".$horizontalAlignment.
                    " ".$verticalAlignment." ".$repeat.";";
        } else {
            if($backgroundColor !== '') {
                $background = "background: ".$backgroundColor.";";
            } else {
                $background = '';
            }
        }
        return $background;
    }
    
    public static function getBackgroundStyleImg(
            $path, $name, 
            $defaultImageFile = NULL, 
            $horizontalAlignment = 'center', 
            $verticalAlignment = 'center', 
            $repeat = 'no-repeat', 
            $backgroundColor = '', 
            $extensions = array('png','jpg','PNG','JPG')) {
        $background = self::getBackgroundImg($path, $name, $defaultImageFile, $horizontalAlignment, $verticalAlignment, $repeat, $backgroundColor, $extensions);
        if($background !== '') {
            return 'Style="'.$background.'"';
        } else {
            return '';
        }
    }
}
