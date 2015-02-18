<?php
/**
 * Description of ErrorHelper
 *
 * @author olga
 */
class  ErrorHelper {
    
    private static $html;

    public static function getMessageError($message) {
        self::$html = '';
        self::$html .= '<div id="parentPopup">';//родительский затемняющий экран
            self::$html .= '<div class="popup">'; //основной div
                self::$html .= '<span class="popupButtonExit" style="cursor: pointer;" onclick="document.getElementById(\'parentPopup\').style.display=\'none\';">';
                    self::$html .= '<b><p>X</p></b>';
                self::$html .= '</span>';
                self::$html .= '<div >'; 
                    self::$html .= '<p>'.$message.'</p>';
                self::$html .= '</div>'; 
            self::$html .= '</div>'; //основной div
        self::$html .= '</div>'; //родительский затемняющий экран
        echo self::$html; 
    }

    // специальная функция для класса Feedback()
    public static function getMessageErrorFeedbackNoComments($message, $id) {
        $out = '';
        $out .= '<div id="parentPopup">';//родительский затемняющий экран
            $out .= '<div class="popup">'; //основной div
                $out .= '<span class="popupButtonExit" style="cursor: pointer;" onclick="errorComments(\''.$id.'\');;">';
                    $out .= '<b><p>X</p></b>';
                $out .= '</span>';
                $out .= '<div >'; 
                    $out .= '<p>'.$message.'</p>';
                $out .= '</div>'; 
            $out .= '</div>'; //основной div
        $out .= '</div>'; //родительский затемняющий экран
        return $out; 
    }
}