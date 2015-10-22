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

    private function __construct() {
        global $_SQL_HELPER;
        self::$SQL_HELPER = $_SQL_HELPER;
        self::$shopGroupsHelper = new ShopGroupsHelper();
    }

    private static function createObject() {
//        self::clearFilterData();
        if (!isset(self::$object)) {
            self::$object = new ShopPropertiesFilterSerchArray();
        }
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

}
