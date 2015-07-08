<?php

/**
 * Description of ShopJsHelper
 *
 * @author mzaytsev
 */
class ShopJsHelper {
    static private $object;
    static private $params;

    /**
     * Конструктор вызывается автоматически
     * @global type $_SQL_HELPER
     */
    private function __construct() {
        global $_URL_PARAMS;
        self::$params = $_URL_PARAMS['params'];
    }

    /**
     * создание объекта
     */
    private static function createObject() {
        if(!isset(self::$object)) {
            self::$object = new ShopJsHelper();
        }
    }

    public static function shopSearchResoultForScrols() {
        self::createObject();
        if(ShopPageInfoHelper::isShopPage() && ((!isset(self::$params[0])) || (isset(self::$params[0]) && self::$params[0] === ShopPageInfoHelper::getCatalogPage()))) {
            $js = '<script type="text/javascript">';
            $js .= '$(document).on("scroll", ';
            $js .= 'function(){';
            $js .= '    if(shopItemsListThisPage < shopItemsListLastPage && loadPageTrigger) {';
            $js .= '        var clientHeight = document.documentElement.clientHeight ? document.documentElement.clientHeight : document.body.clientHeight;';
            $js .= '        var documentHeight = document.documentElement.scrollHeight ? document.documentElement.scrollHeight : document.body.scrollHeight;';
            $js .= '        var scrollTop = window.pageYOffset ? window.pageYOffset : (document.documentElement.scrollTop ? document.documentElement.scrollTop : document.body.scrollTop);';
            $js .= '        if((documentHeight - clientHeight) <= scrollTop + 200 ) {';
            $js .= '            getShopItemListPage();';
            $js .= '            loadPageTrigger = false;';
            $js .= '            clearTimeout(shopItemsListTimer);';
            $js .= '            shopItemsListTimer = setTimeout(unsetLoadPageTrigger, shopItemsPageLoadTime);';
            $js .= '        }';
            $js .= '    }';
            $js .= '});';
            $js .= '</script>';
        } else {
            $js = '';
        }
        return $js;
    }
}
