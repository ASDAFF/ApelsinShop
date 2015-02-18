<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of InputValueHelper
 *
 * @author maxim
 */
class InputValueHelper {   
    
    /**
     * Проверка значений
     * @param type $key - ключ для $_POST массива
     * @param type $preg - регулярное выражение
     * @return type
     */
    public static function checkValue($key,$preg=null,$mayByEmpty=false) {
        if($mayByEmpty) {
            $result = 
            (
                isset($_POST[$key]) && 
                $_POST[$key]!=null && 
                (
                    $preg==null || 
                    (
                        preg_match($preg, $_POST[$key]) || 
                        $_POST[$key]==""
                    )
                )
            );
        } else {
            $result = (
                isset($_POST[$key]) && 
                $_POST[$key]!=null && 
                $_POST[$key]!="" &&
                (
                    $preg==null || 
                    preg_match($preg, $_POST[$key])
                )
            );
        }
        
        return $result;
    }
    
    public static function getMysqlText($text) {
        global $_SQL_HELPER;
//        $link = mysql_connect($_DBSETTINGS['host'], $_DBSETTINGS['user'], $_DBSETTINGS['password']) OR die(mysql_error());
//        $text = mysql_real_escape_string($text);
        if($text=="") {
            $text = null;
        }
        return $_SQL_HELPER->escapeString($text);
    }
    
    public static function getPostValue($key) {        
        return (
                isset($_POST[$key]) && 
                $_POST[$key]!=null && 
                $_POST[$key]!=""
        ) ? self::getMysqlText($_POST[$key]) : null;
    }
    
    
    
    public static function getPostValueEscapeString($key) { 
        return (
                isset($_POST[$key]) && 
                $_POST[$key]!=null && 
                $_POST[$key]!=""
        ) ? $DB->escapeString($_POST[$key]) : null;
    }
    
    public static function getOriginalPostValue($key) {        
        return (
                isset($_POST[$key]) && 
                $_POST[$key]!=null && 
                $_POST[$key]!=""
        ) ? $_POST[$key] : null;
    }
    
    public static function mayByNull($value) {
        return ($value == "" || $value == null) ? "null" : "'".$value."'";
    }
}
