<?php
/**
 * Description of ShopPageInfoHelper
 *
 * @author maxim
 */
class ShopPageInfoHelper {
    const ComponentAlias = 'Shop';
    
    static private $SQL_HELPER;
    static private $object;
    
    static private $THIS_PAGE;
    static private $URL_PARAMS;
    
    static private $shopPage;
    static private $pageUrlType;
    static private $pageUrlElement;
    static private $pageUrlError = false;
    
//    static private $SQL_DATA;
    
    static private $SQL_DATA;
    
    /**
     * Конструктор вызывается автоматически
     * @global type $_SQL_HELPER
     */
    private function __construct() {
        global $_URL_PARAMS;
        self::$THIS_PAGE = $_URL_PARAMS['page'];
        self::$URL_PARAMS = $_URL_PARAMS['params'];
        global $_SQL_HELPER;
        self::$SQL_HELPER = $_SQL_HELPER;
        $this->checkThisPage();
        $this->getUrlPageInfo();
    }
    
    /**
     * создание объекта
     */
    private static function createObject() {
        if(!isset(self::$object)) {
            self::$object = new ShopPageInfoHelper();
        }
    }
    
    private function checkThisPage() {
        $query = "SELECT 
            count(Pa.`alias`) as pages
            FROM `Pages` as Pa
            LEFT JOIN `ComponentsElements` as CE
            on Pa.`componentElement` = CE.`id`
            WHERE Pa.`alias` = '".self::$THIS_PAGE."'
            AND CE.`component` = '".self::ComponentAlias."';";
        $rezult = self::$SQL_HELPER->select($query,1);
        self::$shopPage = $rezult['pages'] > 0;
    }
    
    private function getUrlPageInfo() {
        if(isset(self::$URL_PARAMS[0])) {
            switch (self::$URL_PARAMS[0]) {
                case 'catalog':
                    self::$pageUrlType = 'catalog';
                    break;
                case 'item':
                    self::$pageUrlType = 'item';
                    break;
                default:
                    self::$pageUrlType = 'catalog';
                    break;
            }
            if(isset(self::$URL_PARAMS[1])) {
                self::$pageUrlElement = self::$URL_PARAMS[1];
            } else {
                if(self::$pageUrlType != 'catalog') {
                    self::$pageUrlElement = null;
                } else {
                    self::$pageUrlError = true;
                }
            }
        }
    }
    
    public static function isShopPageError() {
        self::createObject();
        return self::$pageUrlError;
    }
    
    public static function isShopPage() {
        self::createObject();
        return self::$shopPage;
    }
    
    public static function shopPageUrlType() {
        self::createObject();
        return self::$pageUrlType;
    }
    
    public static function shopPageUrlElement() {
        self::createObject();
        return self::$pageUrlElement;
    }


    /**
     * 
     * @param type $dataKey
     * @return type
     */
    public static function getData($dataKey) {
        self::createObject();
        if(isset(self::$SQL_DATA[$dataKey])) {
            return self::$SQL_DATA[$dataKey];
        } else {
            return array();
        }
    }
}
