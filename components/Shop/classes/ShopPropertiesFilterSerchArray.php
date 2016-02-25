<?php

/**
 * Description of ShopPropertiesFilterSerchArray
 *
 * @author Максим
 */
class ShopPropertiesFilterSerchArray {

    static private $object;
    static private $shopGroupsHelper;
    static private $SQL_HELPER;
    
    static private $mainFilterType;
    
    const FILTER_TYPE_ITEM_NAME = 'ItemName';
    const FILTER_TYPE_ACTION = 'Action';
    const FILTER_TYPE_IN_STOCK = 'InStock';
    const FILTER_TYPE_ITEM_PRISE = 'ItemPrise';
    const FILTER_TYPE_SUBGROUP = 'Subgroup';
    
    const ORDER_BY_COLUMN = 'itemName';
    const ORDER_BY_ASC_DESC = 'ASC';

    private function __construct() {
        global $_SQL_HELPER;
        self::$SQL_HELPER = $_SQL_HELPER;
        self::setMainFilterType();
        self::$shopGroupsHelper = new ShopGroupsHelper();
    }

    private static function createObject() {
//        self::clearFilterData();
        if (!isset(self::$object)) {
            self::$object = new ShopPropertiesFilterSerchArray();
        }
    }
    
    private static function setMainFilterType () {
        self::$mainFilterType[self::FILTER_TYPE_ITEM_NAME] = array('name' => self::FILTER_TYPE_ITEM_NAME, 'text' => 'Наименование');
        self::$mainFilterType[self::FILTER_TYPE_ACTION] = array('name' => self::FILTER_TYPE_ACTION, 'text' => 'Акции на твоар');
        self::$mainFilterType[self::FILTER_TYPE_IN_STOCK] = array('name' => self::FILTER_TYPE_IN_STOCK, 'text' => 'Наличие товара');
        self::$mainFilterType[self::FILTER_TYPE_ITEM_PRISE] = array('name' => self::FILTER_TYPE_ITEM_PRISE, 'text' => 'Цена');
        self::$mainFilterType[self::FILTER_TYPE_SUBGROUP] = array('name' => self::FILTER_TYPE_SUBGROUP, 'text' => 'Поиск по каталогу');
    }

    private static function getGroupID($groupID) {
        if ($groupID !== '' && $groupID !== NULL) {
            return $groupID;
        } else {
            return 'root';
        }
    }

    public static function setArrayGroup($groupID, $array) {
        self::createObject();
        if ($groupID === NULL || $groupID == "") {
            $groupID = self::getGroupID($groupID);
        }
        if (is_array($array)) {
            if(!isset($_SESSION['ShopPropertiesFilter'][$groupID]['ORDER_BY']['COLUMN'])) {
                $_SESSION['ShopPropertiesFilter'][$groupID]['ORDER_BY']['COLUMN'] = self::ORDER_BY_COLUMN;
            }
            if(!isset($_SESSION['ShopPropertiesFilter'][$groupID]['ORDER_BY']['ASC_DESC'])) {
                $_SESSION['ShopPropertiesFilter'][$groupID]['ORDER_BY']['ASC_DESC'] = self::ORDER_BY_ASC_DESC;
            }
            $_SESSION['ShopPropertiesFilter'][$groupID]['Properties'] = $array;
            $amauntOfPage = ShopHelperSQL::getAmountOfPages($groupID, $array);
            $amauntOfItems = ShopHelperSQL::getAmountOfItems($groupID, $array);
            $_SESSION['ShopPropertiesFilter'][$groupID]['SQL'] = array();
            for ($page = 1; $page <= $amauntOfPage; $page++) {
                $_SESSION['ShopPropertiesFilter'][$groupID]['SQL'][$page] = ShopHelperSQL::generateSQL($groupID, $array, $page);
            }
            $_SESSION['ShopPropertiesFilter'][$groupID]['AmauntOfPage'] = $amauntOfPage;
            $_SESSION['ShopPropertiesFilter'][$groupID]['AmountOfItems'] = $amauntOfItems;
//            echo '<pre>';
//            var_dump($_SESSION['ShopPropertiesFilter'][$groupID]['SQL']);
//            var_dump($_SESSION['ShopPropertiesFilter'][$groupID]['Properties']);
//            echo '</pre>';
        }
    }

    public static function unsetGroupFilter($groupID, $filter) {
        self::createObject();
        if ($groupID === NULL) {
            $groupID = self::getGroupID($groupID);
        }
        if (isset($_SESSION['ShopPropertiesFilter'][$groupID]['Properties'][$filter])) {
            unset($_SESSION['ShopPropertiesFilter'][$groupID]['Properties'][$filter]);
            self::setArrayGroup($groupID, $_SESSION['ShopPropertiesFilter'][$groupID]['Properties']);
        }
    }

    public static function unsetGroupFilterValue($groupID, $filter, $value) {
        self::createObject();
        if (isset($_SESSION['ShopPropertiesFilter'][$groupID]['Properties'][$filter]["value"]) && is_array($_SESSION['ShopPropertiesFilter'][$groupID]['Properties'][$filter]["value"])) {
            foreach ($_SESSION['ShopPropertiesFilter'][$groupID]['Properties'][$filter]["value"] as $key => $val) {
                if ($value === $val) {
                    unset($_SESSION['ShopPropertiesFilter'][$groupID]['Properties'][$filter]["value"][$key]);
                    if (count($_SESSION['ShopPropertiesFilter'][$groupID]['Properties'][$filter]["value"]) > 0) {
                        self::setArrayGroup($groupID, $_SESSION['ShopPropertiesFilter'][$groupID]['Properties']);
                    } else {
                        self::unsetGroupFilter($groupID, $filter);
                    }
                }
            }
        }
    }

    public static function getPropertiesValue($groupID, $filter) {
        self::createObject();
        if (isset($_SESSION['ShopPropertiesFilter'][$groupID]['Properties'][$filter]["value"])) {
            return $_SESSION['ShopPropertiesFilter'][$groupID]['Properties'][$filter]["value"];
        }
        return null;
    }

    public static function countPropertiesValue($groupID, $filter) {
        self::createObject();
        if (isset($_SESSION['ShopPropertiesFilter'][$groupID]['Properties'][$filter]["value"]) && is_array($_SESSION['ShopPropertiesFilter'][$groupID]['Properties'][$filter]["value"])) {
            return count($_SESSION['ShopPropertiesFilter'][$groupID]['Properties'][$filter]["value"]);
        }
        return 0;
    }

    public static function issetGroupData($groupID) {
        return isset($_SESSION['ShopPropertiesFilter'][$groupID]);
    }

    public static function getArrayGroupProperties($groupID) {
        self::createObject();
        if ($groupID === NULL) {
            $groupID = self::getGroupID($groupID);
        }
        if (isset($_SESSION['ShopPropertiesFilter'][$groupID]['Properties'])) {
            return $_SESSION['ShopPropertiesFilter'][$groupID]['Properties'];
        } else {
            return array();
        }
    }

    public static function getArrayGroupSQL($groupID) {
        self::createObject();
        if ($groupID === NULL) {
            $groupID = self::getGroupID($groupID);
        }
        if (isset($_SESSION['ShopPropertiesFilter'][$groupID]['SQL'])) {
            return $_SESSION['ShopPropertiesFilter'][$groupID]['SQL'];
        } else {
            return array();
        }
    }

    public static function getOrderBy($groupID) {
        self::createObject();
        if ($groupID === NULL) {
            $groupID = self::getGroupID($groupID);
        }
        if (isset($_SESSION['ShopPropertiesFilter'][$groupID]['ORDER_BY'])) {
            return $_SESSION['ShopPropertiesFilter'][$groupID]['ORDER_BY'];
        } else {
            return array();
        }
    }

    public static function setOrderBy($groupID, $column, $asc_desc) {
        self::createObject();
        if ($groupID === NULL) {
            $groupID = self::getGroupID($groupID);
        }
        $_SESSION['ShopPropertiesFilter'][$groupID]['ORDER_BY']['COLUMN'] = $column;
        $_SESSION['ShopPropertiesFilter'][$groupID]['ORDER_BY']['ASC_DESC'] = $asc_desc;
    }

    public static function getArrayGroupSQL_ForPage($groupID, $page) {
        self::createObject();
        if ($groupID === NULL) {
            $groupID = self::getGroupID($groupID);
        }
        $SQL = self::getArrayGroupSQL($groupID);
        if (isset($SQL[$page])) {
            return $SQL[$page];
        } else {
            return NULL;
        }
    }

    public static function getArrayGroupAmauntOfPage($groupID) {
        self::createObject();
        if ($groupID === NULL) {
            $groupID = self::getGroupID($groupID);
        }
        if (isset($_SESSION['ShopPropertiesFilter'][$groupID]['AmauntOfPage'])) {
            return $_SESSION['ShopPropertiesFilter'][$groupID]['AmauntOfPage'];
        } else {
            return ShopHelperSQL::getAmountOfPages($groupID, array());
        }
    }

    public static function getArrayGroupAmauntOfItems($groupID) {
        self::createObject();
        if ($groupID === NULL) {
            $groupID = self::getGroupID($groupID);
        }
        if (isset($_SESSION['ShopPropertiesFilter'][$groupID]['AmountOfItems'])) {
            return $_SESSION['ShopPropertiesFilter'][$groupID]['AmountOfItems'];
        } else {
            return ShopHelperSQL::getAmountOfItems($groupID, array());
        }
    }

    public static function clearFilterData() {
        $_SESSION['ShopPropertiesFilter'] = array();
    }
    
    public static function getMainFilterTypes() {
        return self::$mainFilterType;
    }
    
    public static function getMainFilterType($type) {
        if(self::isMainFilterTypes($type)) {
            return self::$mainFilterType[$type];
        } else {
            return null;
        }
    }
    
    public static function isMainFilterTypes($type) {
        return isset(self::$mainFilterType[$type]);
    }

}
