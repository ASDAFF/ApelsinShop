<?php

class ShopOrderManagementHelper {
    static private $object;
    static private $SQL_HELPER;
    static private $thisOrderId = NULL;
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

    private static function generationOrderId() {
        $code = '';
        $date = date("ymdhis");
        $codeletters = self::codeletters;
        for ($i = 0,$j = 0; $i < self::codeBlocks; $i++){
            if($j >= strlen($date)) {
                $j = 0;
            }
            $code .= $date[$j++];
            $code .= rand(0, 9);
            $code .= $date[$j++];
            $code .= rand(0, 9);
            $code .= $date[$j++];
            $code .= '-';
        }
        return substr($code, 0,  strlen($code)-1);
    }

    public static function getThisOrderID() {
        self::createObject();
        if(is_null(self::$thisOrderId)) {
            self::$thisOrderId = self::generationOrderId();
        }
        return self::$thisOrderId;
    }

    public static function setThisOrderID($thisOrderId) {
        self::createObject();
        self::$thisOrderId = $thisOrderId;
    }

    public static function clearThisOrderID() {
        self::createObject();
        self::$thisOrderId = NULL;
    }

    public static function getOrderIdBarCode_IMG($orderId) {
        return BarCodeGenHelper::BCGcode39_IMG($orderId);
    }

    public static function getOrderIdBarCode_IMG_URL($orderId) {
        return BarCodeGenHelper::BCGcode39_IMG_URL($orderId);
    }
}
