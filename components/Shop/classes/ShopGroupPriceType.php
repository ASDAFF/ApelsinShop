<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of ShopGroupPriceType
 *
 * @author Максим
 */
class ShopGroupPriceType {
    static private $SQL_HELPER;
    static private $object;
    
    private function __construct() {
        global $_SQL_HELPER;
        self::$SQL_HELPER = $_SQL_HELPER;
    }
    
    private static function createObject() {
        if(!isset(self::$object)) {
            self::$object = new ShopGroupPriceType();
        }
    }
    
    public static function getPriceTypeID() {
        self::createObject();
        $query = "SELECT `id` FROM `ShopPricesTypes` WHERE `default`='1' LIMIT 1";
        $rezult = self::$SQL_HELPER->select($query,1);
        return $rezult['id'];
    }
}
