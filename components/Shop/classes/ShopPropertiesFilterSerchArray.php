<?php
/**
 * Description of ShopPropertiesFilterSerchArray
 *
 * @author Максим
 */
class ShopPropertiesFilterSerchArray {
    
    private function __construct() {
    }
    
    public static function setArrayGroup($groupID,$array) {
        if(is_array($array)) {
            $_SESSION['ShopPropertiesFilter'][$groupID] = $array;
        }
    }
    
    public static function getArrayGroup($groupID) {
        if(isset($_SESSION['ShopPropertiesFilter'][$groupID])) {
            return $_SESSION['ShopPropertiesFilter'][$groupID];
        } else {
            return array();
        }
    }
}
