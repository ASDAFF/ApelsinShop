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
        if(!isset(self::$object)) {
            self::$object = new ShopPropertiesFilterSerchArray();
        }
    }


    private static function getGroupID($groupID) {
        if($groupID!=='' && $groupID!==NULL) {
            return $groupID;
        } else {
            return 'root';
        }
    }
    
    

    public static function setArrayGroup($groupID, $array) {
//        $_SESSION['ShopPropertiesFilter'] = array();
        self::createObject();        
        $groupID = self::getGroupID($groupID);
        if(is_array($array)) {
            $_SESSION['ShopPropertiesFilter'][$groupID]['Properties'] = $array;
            $amauntOfPage = ShopHelperSQL::getAmountOfPages($groupID, $array);
//            var_dump($amauntOfPage);
            $_SESSION['ShopPropertiesFilter'][$groupID]['SQL'] = array();
            for ($page = 1; $page <= $amauntOfPage; $page++) {
                $_SESSION['ShopPropertiesFilter'][$groupID]['SQL'][$page] = ShopHelperSQL::generateSQL($groupID, $array, $page);
            }
            $_SESSION['ShopPropertiesFilter'][$groupID]['AmauntOfPage'] = $amauntOfPage;
//            echo '<h1>SQL</h1><pre>';
//            var_dump($_SESSION['ShopPropertiesFilter'][$groupID]['SQL']);
//            echo '</pre><h1>SQL end</h1>';
        }
    }
    public static function issetGroupData($groupID) {
        return isset($_SESSION['ShopPropertiesFilter'][$groupID]);
    }
    
    public static function getArrayGroupProperties($groupID) {
        self::createObject();
        $groupID = self::getGroupID($groupID);
        if(isset($_SESSION['ShopPropertiesFilter'][$groupID]['Properties'])) {
            return $_SESSION['ShopPropertiesFilter'][$groupID]['Properties'];
        } else {
            return array();
        }
    }
    
    public static function getArrayGroupSQL($groupID) {
        self::createObject();
        $groupID = self::getGroupID($groupID);
        if(isset($_SESSION['ShopPropertiesFilter'][$groupID]['SQL'])) {
            return $_SESSION['ShopPropertiesFilter'][$groupID]['SQL'];
        } else {
            return array();
        }
    }
    
    public static function getArrayGroupSQL_ForPage($groupID, $page) {
        $groupID = self::getGroupID($groupID);
        $SQL = self::getArrayGroupSQL($groupID);
        if(isset($SQL[$page])) {
            return $SQL[$page];
        } else {
            return NULL;
        }
    }
    
    public static function getArrayGroupAmauntOfPage($groupID) {
        self::createObject();
        $groupID = self::getGroupID($groupID);
        if(isset($_SESSION['ShopPropertiesFilter'][$groupID]['AmauntOfPage'])) {
            return $_SESSION['ShopPropertiesFilter'][$groupID]['AmauntOfPage'];
        } else {
            return ShopHelperSQL::getAmountOfPages($groupID, array());
        }
    }
}
