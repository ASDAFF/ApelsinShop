<?php
/**
 * Description of ID_GENERATOR
 *
 * @author maxim
 */
class ID_GENERATOR {
    
    public static function generateID($codeBlocks,$prefix=null,$postfix=null) {
        $codeletters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890';
        $date = date("ymdhis");
        if($prefix == null) {
            $code = '';
        } else {
            $code = $prefix.'-';
        }
        for ($i = 0,$j = 0; $i < $codeBlocks; $i++){
            if($j >= strlen($date)) {
                $j = 0;
            }
            $code .= $codeletters[$date[$j++]];
            $code .= $codeletters[rand(0, strlen($codeletters)-1)];
            $code .= $codeletters[rand(0, strlen($codeletters)-1)];
            $code .= $codeletters[rand(0, strlen($codeletters)-1)];
            $code .= '-';
        }
        if($postfix == null) {
            return substr($code, 0,  strlen($code)-1);
        } else {
            return $code.$postfix;
        }
    }
}