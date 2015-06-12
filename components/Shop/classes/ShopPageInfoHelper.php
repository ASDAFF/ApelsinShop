<?php
/**
 * Description of ShopPageInfoHelper
 *
 * @author maxim
 */
class ShopPageInfoHelper {
    const ComponentAlias = 'Shop';
    const CatalogPage = 'catalog';
    const ItemPage = 'item';
    const ShopbasketPage = 'shopbasket';

    static private $SQL_HELPER;
    static private $object;

    static private $THIS_PAGE;
    static private $URL_PARAMS;

    static private $shopPage;
    static private $shopPageAlias;
    static private $pageUrlType;
    static private $pageUrlElement;
    static private $groupId;
    static private $pageUrlError = false;
    static private $groupPage = false;

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
        $this->getShopPageData();
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

    private function getShopPageData() {
        $query = "SELECT Pa.`alias`
            FROM `Pages` as Pa
            LEFT JOIN `ComponentsElements` as CE
            on Pa.`componentElement` = CE.`id`
            WHERE CE.`component` = '".self::ComponentAlias."';";
        $rezult = self::$SQL_HELPER->select($query,1);
        self::$shopPageAlias = $rezult['alias'] > 0;
    }

    private function getUrlPageInfo() {
        if(isset(self::$URL_PARAMS[0]) && (self::$URL_PARAMS[0]=='catalog' || self::$URL_PARAMS[0]=='item')) {
            switch (self::$URL_PARAMS[0]) {
                case 'catalog':
                    self::$pageUrlType = 'catalog';
                    self::$groupPage = true;
                    break;
                case 'item':
                    self::$pageUrlType = 'item';
                    self::$groupPage = false;
                    break;
            }
            if(isset(self::$URL_PARAMS[1])) {
                self::$pageUrlElement = self::$URL_PARAMS[1];
                if(self::$pageUrlType === 'catalog') {
                    self::$groupId = self::$URL_PARAMS[1];
                } else {
                    $query = "SELECT `group` FROM `ShopItems` WHERE `id`='".self::$URL_PARAMS[1]."';";
                    $rezult = self::$SQL_HELPER->select($query,1);
                    self::$groupId = $rezult['group'];
                }
            } else {
                if(self::$pageUrlType === 'catalog') {
                    self::$pageUrlElement = null;
                    self::$groupId = null;
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

    public static function shopPageGroupId() {
        self::createObject();
        return self::$groupId;
    }

    public static function isItGroupPage() {
        self::createObject();
        return self::$groupPage;
    }

    public static function getShopPageAlias() {
        self::createObject();
        return self::$shopPageAlias;
    }

    public static function getCatalogPage() {
        return self::CatalogPage;
    }

    public static function getItemPage() {
        return self::ItemPage;
    }

    public static function getShopbasketPage() {
        return self::ShopbasketPage;
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
