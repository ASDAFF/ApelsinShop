<?php

class ShopOrderManagementHelper {
    static private $object;
    static private $SQL_HELPER;
    const codeletters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    const codeBlocks = 4;


    private function __construct() {
        global $_SQL_HELPER;
        self::$SQL_HELPER = $_SQL_HELPER;
    }
    
    private static function createObject() {
        if(!isset(self::$object)) {
            self::$object = new ShopOrderManagementHelper();
        }
    }
    
    public static function generationOrderId() {
        self::createObject();
        $code = '';
        $date = date("ymdhis");
        $codeletters = self::codeletters;
        for ($i = 0,$j = 0; $i < self::codeBlocks; $i++){
            if($j >= strlen($date)) {
                $j = 0;
            }
            $code .= $codeletters[$date[$j++]];
            $code .= $codeletters[rand(0, strlen($codeletters)-1)];
            $code .= $codeletters[$date[$j++]];
            $code .= $codeletters[rand(0, strlen($codeletters)-1)];
            $code .= $codeletters[$date[$j++]];
            $code .= '-';
        }
        return substr($code, 0,  strlen($code)-1);
    }
    
    public static function getOrderIdBarCode_IMG($orderId) {
        return BarCodeGenHelper::BCGcode39_IMG($orderId);
    }
    
    public static function getOrderIdBarCode_IMG_URL($orderId) {
        return BarCodeGenHelper::BCGcode39_IMG_URL($orderId);
    }
}
