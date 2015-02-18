<?php
function getCaptcha($width, $height,$class=null) {
    if($class==null){
        $class = 'captcha_img';
    }
    return '<img class="'.$class.'" src="./plugins/captcha/captcha.php" width="'.$width.'" height="'.$height.'" />';
}
?>
