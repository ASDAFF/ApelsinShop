<?php
/**
 * Description of ShopGroupsUrlHelper
 *
 * @author Максим
 */
class ShopGroupsUrlHelper {
    static private $SQL_HELPER;
    static private $object;
    static private $urlHelper;
    static private $shopPage;
    
    private function __construct() {
        global $_SQL_HELPER;
        self::$SQL_HELPER = $_SQL_HELPER;
        self::$urlHelper = new UrlHelper();
        $this->getShopPage();
    }
    
    /**
     * создание объекта
     */
    private static function createObject() {
        if(!isset(self::$object)) {
            self::$object = new ShopGroupsUrlHelper();
        }
    }
    
    private function getShopPage() {
        $query = "SELECT 
            Pe.`alias`
            FROM `ComponentsElements` AS CE 
            LEFT JOIN `Pages` as Pe
            ON CE.`id` = Pe.`componentElement`
            WHERE CE.`alias` = 'Shop'
            AND CE.`component` = 'Shop'
            order by Pe.`isMainPage` desc
            LIMIT 1;";
        $rezult = self::$SQL_HELPER->select($query,1);
        self::$shopPage = $rezult['alias'];
    }
    
    public static function getUrl($params = array()) {
        self::createObject();
        return self::$urlHelper->pageUrl(self::$shopPage, $params);
    }
}
