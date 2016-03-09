<?php
/**
 * Description of ShopHelperSQL
 *
 * @author Максим
 */
class ShopHelperSQL {
    static private $object;
    static private $shopGroupsHelper;
    static private $SQL_HELPER;
    static private $itemOnPage = 48;
    
    private function __construct() {
        global $_SQL_HELPER;
        self::$SQL_HELPER = $_SQL_HELPER;
        self::$shopGroupsHelper = new ShopGroupsHelper();
    }
    
    private static function createObject() {
        if(!isset(self::$object)) {
            self::$object = new ShopHelperSQL();
        }
    }
    
    private static function checkArrayValues($array, $valuesID) {
        return isset($array[$valuesID]) && $array[$valuesID] !== null && $array[$valuesID] !== '' &&
                isset($array[$valuesID]["type"]) && $array[$valuesID]["type"] !== null && $array[$valuesID]["type"] !== '' &&
                isset($array[$valuesID]["value"]) && $array[$valuesID]["value"] !== null && $array[$valuesID]["value"] !== '';
    }
    
    private static function getArrayValues($array, $valuesID) {
        return self::checkArrayValues($array, $valuesID) ? $array[$valuesID]["value"] : NULL;
    }
    
    private static function getArrayTypes($array, $valuesID) {
        return self::checkArrayValues($array, $valuesID) ? $array[$valuesID]["type"] : NULL;
    }
    
    private static function isRootGroup($groupID) {
        return $groupID === '' || $groupID === NULL || $groupID === 'root';
    }
    
    private static function generateLimitSQL($page = NULL) {
        if($page !== NULL) {
            return " LIMIT ".(($page-1)*self::$itemOnPage).", ".self::$itemOnPage;
        } else {
            return "";
        }
    }
    
    private static function generateOrderBySQL($groupID) {
        $orderBy = ShopPropertiesFilterSerchArray::getOrderBy($groupID);
        if(empty($orderBy)) {
            $orderBy['COLUMN'] = ShopPropertiesFilterSerchArray::ORDER_BY_COLUMN;
            $orderBy['ASC_DESC'] = ShopPropertiesFilterSerchArray::ORDER_BY_ASC_DESC;
        }
        
        return " ORDER BY `".$orderBy['COLUMN']."` ".$orderBy['ASC_DESC']." ";
    }


    /**
     * Генерирует отсеивание по принадлежности к группе.
     * @param string $groupID - группа
     * @param array $array - параметры отсеивания
     * @return string - SQL
     */
    private static function generateWhereSQL_Group($groupID, $array) {
        $sql = '';
        if(!self::isRootGroup($groupID)) {
            $serchGroup = self::checkArrayValues($array,'Subgroup') ? self::getArrayValues($array,'Subgroup') : $groupID;
            $groups = self::$shopGroupsHelper->getGroupChildren($serchGroup);
            foreach ($groups as $group) {
                if(!self::$shopGroupsHelper->groupIsHidden($group)) {
                    $sql .= "`group`='".$group."' OR ";
                }
            }
            if($sql !== '') {
                $sql = " AND (". mb_substr($sql, 0,   mb_strlen($sql)-4).") ";
            }
            $sql .= "AND `group` NOT IN (SELECT `id` FROM `ShopGroups` WHERE `systemGroup` > 0 OR `shown` < 1)";
        }
        return $sql;
    }
    
    /**
     * Генерирует отсеивание по принадлежности к акционному товару.
     * @param array $array - параметры отсеивания
     * @return string - SQL
     */
    private static function generateWhereSQL_Action($array) {
        if(self::checkArrayValues($array,'Action') && ($value = self::getArrayValues($array,'Action')) !== 'all') {
            return " AND `action`='".$value."' ";
        } else {
            return "";
        }
    }
    
    private static function generateWhereSQL_InStock($array) {
        if(self::checkArrayValues($array,'InStock') && self::getArrayValues($array,'InStock') !== 'all') {
            if(self::getArrayValues($array,'InStock') == 'inStock') {
                return " AND (`totalAmount` > '0' AND `status` LIKE 'Возится и в наличии') ";
            } else if(self::getArrayValues($array,'InStock') == 'inStockAndOrder') {
                return " AND (`totalAmount` > '0' OR `status` != 'Возится и в наличии') ";
            }
        }
        return "";
    }
    
    /**
     * Генерирует отсеивание по соответствию имени.
     * @param array $array - параметры отсеивания
     * @return string - SQL
     */
    private static function generateWhereSQL_ItemName($array) {
        $sql = '';
        if(self::checkArrayValues($array,'ItemName')) {
            $itemNameText =  preg_replace('/ {2,}/',' ',self::getArrayValues($array,'ItemName'));
            $itemNames = explode(" ",trim($itemNameText));
            foreach ($itemNames as $name) {
                $sql .= "LOWER(`itemName`) LIKE '%".mb_strtolower($name)."%' OR ";
            }
            if($sql !== '') {
                $sql = " AND (". mb_substr($sql, 0,  mb_strlen ($sql)-4).") ";
            }
        }
        return $sql;
    }
    
    /**
     * Генерирует отсеивание по диапазону цен.
     * @param array $array - параметры отсеивания
     * @return string - SQL
     */
    private static function generateWhereSQL_Price($array, $columnPrefix = '') {
        $value = self::getArrayValues($array, 'ItemPrise');
        if($columnPrefix !== '') {
            $columnPrefix .= '.';
        }
        $sql = " ".$columnPrefix."`price` = '".ShopGroupPriceType::getPriceTypeID()."' ";
        if(isset($value['min']) && isset($value['max'])) {
            $sql .= " AND ".$columnPrefix."`value` >= ".min($value['min'], $value['max'])." AND ".
                    $columnPrefix."`value` <= ".max($value['min'], $value['max'])." ";
        } else if(isset($value['min']) && !isset($value['max'])) {
            $sql .= " AND ".$columnPrefix."`value` >= ".$value['min']." ";
        } else if(!isset($value['min']) && isset($value['max'])) {
            $sql .= " AND ".$columnPrefix."`value` <= ".$value['max']." ";
        }
        return $sql;
    }
    
    private static function generateWhereSQL_PropertyValue_bool($array, $valuesID) {
        return " AND t2.`value` = '".self::getArrayValues($array, $valuesID)."' ";
    }
    
    private static function generateWhereSQL_PropertyValue_groupSelect($array, $valuesID) {
        $sql = '';
        foreach (self::getArrayValues($array, $valuesID) as $value) {
            $sql .= "t2.`value` = '".$value."' OR ";
        }
        if($sql !== '') {
            $sql = " AND (". mb_substr($sql, 0,  mb_strlen ($sql)-4).") ";
        }
        return $sql;
    }
    
    private static function generateWhereSQL_PropertyValue_range($array, $valuesID) {
        $value = self::getArrayValues($array, $valuesID);
        if(isset($value['min']) && isset($value['max'])) {
            return " AND t2.`value` >= ".min($value['min'], $value['max'])." AND t2.`value` <= ".max($value['min'], $value['max'])." ";
        } else if(isset($value['min']) && !isset($value['max'])) {
            return " AND t2.`value` >= ".$value['min']." ";
        } else if(!isset($value['min']) && isset($value['max'])) {
            return " AND t2.`value` <= ".$value['max']." ";
        }
        return "";
    }
    
    private static function generateWhereSQL_PropertyValue_select($array, $valuesID) {
        return " AND t2.`value` = '".self::getArrayValues($array, $valuesID)."' ";
    }
    
    private static function generateWhereSQL_PropertyValue_text($array, $valuesID) {
        $sql = '';
        if(self::checkArrayValues($array, $valuesID)) {
            $textString =  preg_replace('/ {2,}/',' ',self::getArrayValues($array, $valuesID));
            $explodeText = explode(" ",trim($textString));
            foreach ($explodeText as $word) {
                $sql .= "LOWER(t2.`value`) LIKE '%".mb_strtolower($word)."%' OR ";
            }
            if($sql !== '') {
                $sql = " AND (". mb_substr($sql, 0,  mb_strlen ($sql)-4).") ";
            }
        }
        return $sql;
    }
    
    private static function generateWhereSQL_PropertyValue($array, $valuesID) {
        switch (self::getArrayTypes($array, $valuesID)) {
                case 'bool':
                    $sql = self::generateWhereSQL_PropertyValue_bool($array, $valuesID);
                    break;
                case 'groupSelect':
                    $sql = self::generateWhereSQL_PropertyValue_groupSelect($array, $valuesID);
                    break;
                case 'range':
                    $sql = self::generateWhereSQL_PropertyValue_range($array, $valuesID);
                    break;
                case 'select':
                    $sql = self::generateWhereSQL_PropertyValue_select($array, $valuesID);
                    break;
                case 'text':
                    $sql = self::generateWhereSQL_PropertyValue_text($array, $valuesID);
                    break;
                default :
                    $sql = "";
                    break;
        }
        return $sql;
    }
    
    private static function generateWhereSQL_Property($baseSQL, $array, $valuesID) {
        if(self::checkArrayValues($array, $valuesID) && self::getArrayTypes($array, $valuesID) !== 'main') {
            $sql = "
                SELECT t1.`id` FROM (
                    $baseSQL
                ) as t1
                INNER JOIN `ShopItemsPropertiesValues` as t2
                on t1.`id` = t2.`item`
                WHERE t2.`property`='".$valuesID."' 
                ".self::generateWhereSQL_PropertyValue($array, $valuesID).
                "GROUP BY `item`
            ";
            return $sql;
        } else {
            return $baseSQL;
        }
    }
    
    
    private static function generateBaseSQL_NotRootGroup($groupID, $array) {
        $sql = "
            SELECT
            t1.`id`
            FROM (
                SELECT 
                `id` 
                FROM `ShopItems` 
                WHERE `shown` = '1'
                AND `group` NOT IN (SELECT `id` FROM `ShopGroups` WHERE `systemGroup` > 0 OR `shown` < 1)
                ".self::generateWhereSQL_Group($groupID, $array)."
                ".self::generateWhereSQL_Action($array)."
                ".self::generateWhereSQL_InStock($array)."
                ".self::generateWhereSQL_ItemName($array)."
            ) as t1
            LEFT JOIN `ShopItemsPrices` as t2
            on t1.`id` = t2.`item`
            WHERE ".self::generateWhereSQL_Price($array,'t2')." 
        ";
        foreach (array_keys($array) as $valuesID) {
            $sql = self::generateWhereSQL_Property($sql, $array, $valuesID);
        }
        return $sql;
    }

    private static function generateCountSQL_RootGroup($groupID, $array) {
        if(self::checkArrayValues($array,'ItemPrise')) {
            $sql = "
                SELECT
                COUNT(t1.`id`) as amount
                FROM (
                    SELECT `id` FROM `ShopItems` WHERE `shown` = '1' 
                    AND `group` NOT IN (SELECT `id` FROM `ShopGroups` WHERE `systemGroup` > 0 OR `shown` < 1) "
                    .self::generateWhereSQL_Action($array)
                    .self::generateWhereSQL_InStock($array)
                    .self::generateWhereSQL_ItemName($array)."
                ) as t1
                LEFT JOIN `ShopItemsPrices` as t2
                on t1.`id` = t2.`item`
                WHERE ".self::generateWhereSQL_Price($array,'t2').";
            ";
        } else {
            $sql = "SELECT count(`id`) as amount FROM `ShopItems` WHERE `shown` = '1' 
                    AND `group` NOT IN (SELECT `id` FROM `ShopGroups` WHERE `systemGroup` > 0 OR `shown` < 1) "
                .self::generateWhereSQL_Action($array)
                .self::generateWhereSQL_InStock($array)
                .self::generateWhereSQL_ItemName($array).";
            ";
        }
        return $sql;
    }
    
    private static function generateCountSQL_NotRootGroup($groupID, $array) {
        $sql = "SELECT COUNT(t1.`id`) as amount FROM (".self::generateBaseSQL_NotRootGroup($groupID, $array).") as t1;";
        return $sql;
    }
        
    private static function generateCountSQL($groupID, $array) {
        self::createObject();
        if(self::isRootGroup($groupID)) {
            return self::generateCountSQL_RootGroup($groupID, $array);
        } else {
            return self::generateCountSQL_NotRootGroup($groupID, $array);
        }
    }

    private static function generateSQL_RootGroup($groupID, $array, $page=NULL) {
        $sql = "
            SELECT
            t1.`id`, 
            t1.`itemName`, 
            t1.`group`, 
            t1.`action`, 
            t1.`status`, 
            t1.`totalAmount`, 
            t1.`minAmount`,
            t1.`description`,
            t2.`value` + t2.`value`*".ShopGroupPriceType::getPriceMarkup()." as priceValue
            FROM (
                SELECT 
                `id`, 
                `itemName`, 
                `group`, 
                `action`, 
                `status`, 
                `totalAmount`, 
                `minAmount`,
                `description` 
                FROM `ShopItems` 
                WHERE `shown` = '1'
                AND `group` NOT IN (SELECT `id` FROM `ShopGroups` WHERE `systemGroup` > 0 OR `shown` < 1)
                ".self::generateWhereSQL_Action($array)."
                ".self::generateWhereSQL_InStock($array)."
                ".self::generateWhereSQL_ItemName($array)."
            ) as t1
            LEFT JOIN `ShopItemsPrices` as t2
            on t1.`id` = t2.`item`
            WHERE ".self::generateWhereSQL_Price($array,'t2')."
            ".self::generateOrderBySQL($groupID).self::generateLimitSQL($page).";
        ";
        return $sql;
    }
    
    private static function generateSQL_NotRootGroup($groupID, $array, $page=NULL) {
        $sql = self::generateBaseSQL_NotRootGroup($groupID, $array);
        $sql = "
            SELECT
            t1.`id`, 
            t1.`itemName`, 
            t1.`group`, 
            t1.`action`, 
            t1.`status`, 
            t1.`totalAmount`, 
            t1.`minAmount`,
            t1.`description`,
            t2.`value` + t2.`value`*".ShopGroupPriceType::getPriceMarkup()." as priceValue
            FROM (
                SELECT
                t2.`id`, 
                t2.`itemName`, 
                t2.`group`, 
                t2.`action`, 
                t2.`status`, 
                t2.`totalAmount`, 
                t2.`minAmount`,
                t2.`description`
                FROM (
                ".self::generateBaseSQL_NotRootGroup($groupID, $array)."
                ) as t1
                INNER JOIN `ShopItems` as t2
                on t1.`id` = t2.`id`
            ) as t1
            LEFT JOIN `ShopItemsPrices` as t2
            on t1.`id` = t2.`item`
            WHERE `shown` = '1'
                AND `group` NOT IN (SELECT `id` FROM `ShopGroups` WHERE `systemGroup` > 0 OR `shown` < 1)
                AND ".self::generateWhereSQL_Price($array,'t2')."
            ".self::generateOrderBySQL($groupID).self::generateLimitSQL($page).";
        ";
        return $sql;
    }

    public static function generateSQL($groupID, $array, $page=NULL) {
        self::createObject();
        if(self::isRootGroup($groupID)) {
            return self::generateSQL_RootGroup($groupID, $array, $page);
        } else {
            return self::generateSQL_NotRootGroup($groupID, $array, $page);
        }
    }
    
    public static function getAmountOfPages($groupID, $array) {
        $allItems = self::getAmountOfItems($groupID, $array);
        $allPages = ceil($allItems / self::$itemOnPage);
        return $allPages !== 0 ? $allPages : 1;
    }
    
    public static function getAmountOfItems($groupID, $array) {
        $countSQL = self::generateCountSQL($groupID, $array);
        $rezult = self::$SQL_HELPER->select($countSQL,1);
        return isset($rezult['amount']) ? $rezult['amount'] : 0;
    }
}
