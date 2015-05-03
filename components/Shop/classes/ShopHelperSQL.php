<?php
/**
 * Description of ShopHelperSQL
 *
 * @author maxim
 */
class ShopHelperSQL {
    static private $object;
    static private $shopGroupsHelper;
    static private $SQL_HELPER;
    static private $itemOnPage = 50;
    
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
    
    /**
     * Часть запроса для фильтров. Генерирует отсеивание по группам.
     * @param type $groupID
     * @param type $array
     * @return string 
     */
    private static function generateSerchSQL_whereGroup($groupID, $array) {
        $sql = '';
        if(!self::isRootGroup($groupID)) {
            $serchGroup = self::checkArrayValues($array,'Subgroup') ? self::getArrayValues($array,'Subgroup') : $groupID;
            $groups = self::$shopGroupsHelper->getGroupChildren($serchGroup);
            foreach ($groups as $group) {
                $sql .= "`group`='".$group."' OR ";
            }
            if($sql !== '') {
                $sql = " AND (".substr($sql, 0,  strlen($sql)-4).")";
            }
        }
        return $sql;
    }
    
    /**
     * Часть запроса для фильтров. Генерирует отсеивание по принадлежности к акционному товару.
     * @param type $array
     * @return type
     */
    private static function generateSerchSQL_whereOnlyAction($array) {
        if(self::checkArrayValues($array,'Action') && ($value = self::getArrayValues($array,'Action')) !== 'all') {
            return " AND `action`='".$value."' ";
        }
    }
    
    private static function generateSerchSQL_whereItemName($array) {
        $sql = '';
        if(self::checkArrayValues($array,'ItemName')) {
//            $sql = self::generateSerchSQL_wherePropertyTextString('ItemName', self::getArrayValues($array,'ItemName'), 'itemName');
            
            $itemNameText =  preg_replace('/ {2,}/',' ',self::getArrayValues($array,'ItemName'));
            $itemNames = explode(" ",trim($itemNameText));
            foreach ($itemNames as $name) {
                $sql .= "LOWER(SI.`itemName`) LIKE '%".strtolower($name)."%' OR ";
            }
            if($sql !== '') {
                $sql = " (".substr($sql, 0,  strlen($sql)-4).") ";
            }
        }
        return $sql;
    }
    
    private static function generateSerchSQL_wherePropertyTextString($property, $value) {
        $sql = '';
        $itemNameText =  preg_replace('/ {2,}/',' ',$value);
        $itemNames = explode(" ",trim($itemNameText));
        foreach ($itemNames as $name) {
            $sql .= "LOWER(SIPV.`value`) LIKE '%".strtolower($name)."%' OR ";
        }
        if($sql !== '') {
            $sql = "(SIPV.`property`='".$property."' AND (".substr($sql, 0,  strlen($sql)-4).")) OR ";
        }
        return $sql;
    }
    
    private static function generateSerchSQL_wherePropertyDefaultString($property,$value) {
        return "(SIPV.`property`='".$property."' AND SIPV.`value`='".$value."') OR ";
    }
    
    private static function generateSerchSQL_wherePropertyIntRangeString($property,$value) {
        $sql = '';
        $minValue = $maxValue = NULL;
        if(isset($value['min'])) {
            $minValue = $value['min'];
        }
        if(isset($value['max'])) {
            $maxValue = $value['max'];
        }
        if($minValue !== NULL && $maxValue !== NULL) {
            if($minValue < $maxValue) {
                $sql .= "(SIPV.`property`='".$property."' AND ";
                $sql .= "SIPV.`value` >= '".$minValue."' AND ";
                $sql .= "SIPV.`value` <= '".$maxValue."') OR ";
            } else if($maxValue < $minValue){
                $sql .= "(SIPV.`property`='".$property."' AND ";
                $sql .= "SIPV.`value` >= '".$maxValue."' AND ";
                $sql .= "SIPV.`value` <= '".$minValue."') OR ";
            } else {
                $sql .= "(SIPV.`property`='".$property."' AND ";
                $sql .= "SIPV.`value` = '".$minValue."') OR ";
            }
        } else {
            if($minValue !== NULL) {
                $sql .= "(SIPV.`property`='".$property."' AND ";
                $sql .= "SIPV.`value` >= '".$minValue."') OR ";
            } else if($maxValue !== NULL){
                $sql .= "(SIPV.`property`='".$property."' AND ";
                $sql .= "SIPV.`value` <= '".$maxValue."') OR ";
            }
        }
        return $sql;
    }
    
    private static function generateSerchSQL_whereProperty($array) {
        $sql = '';
        foreach ($array as $key => $property) {
            if(self::checkArrayValues($array, $key)) {
                switch (self::getArrayTypes($array, $key)) {
                    case 'bool':
                        $sql .= self::generateSerchSQL_wherePropertyDefaultString($key, self::getArrayValues($array,$key));
                        break;
                    case 'groupSelect':
                        $valueArray = self::getArrayValues($array,$key);
                        if($valueArray !== NULL && is_array($valueArray)) {
                            foreach ($valueArray as $value) {
                                $sql .= self::generateSerchSQL_wherePropertyDefaultString($key, $value);
                            }
                        }
                        break;
                    case 'intRange':
                        $sql .= self::generateSerchSQL_wherePropertyIntRangeString($key, self::getArrayValues($array,$key));
                        break;
                    case 'select':
                        $sql .= self::generateSerchSQL_wherePropertyDefaultString($key, self::getArrayValues($array,$key));
                        break;
                    case 'text':
                        $sql .= self::generateSerchSQL_wherePropertyTextString($key, self::getArrayValues($array,$key));
                        break;
                }
            }
        }
        if($sql !== '') {
            $sql = substr($sql, 0,  strlen($sql)-4);
            $sql = " (".$sql.") ";
        }
        return $sql;
    }
    
    private static function generateSerchSQL_whereItemName_whereProperty($array) {
        $itemName = self::generateSerchSQL_whereItemName($array);
        $property = self::generateSerchSQL_whereProperty($array);
//        var_dump($property);
        $sql = '';
        $sql .= $itemName;
        if($itemName !== '' && $property !== '') {
            $sql .= ' AND ';
        }
        $sql .= $property;
        if($sql !== '') {
//            $sql = substr($sql, 0,  strlen($sql)-4);
        } else {
            $sql = ' 1 ';
        }
//        var_dump($sql);
        return $sql;
    }
    
    private static function generateSerchSQL_wherePrice($array) {
        $sql = '';
        $value = self::getArrayValues($array, 'ItemPrise');
        $minPrise = $maxPrise = NULL;
        if(isset($value['min'])) {
            $minPrise = $value['min'];
        }
        if(isset($value['max'])) {
            $maxPrise = $value['max'];
        }
        if($minPrise !== NULL && $maxPrise !== NULL) {
            if($minPrise < $maxPrise) {
                $sql .= " AND SIP.`value` >= '".$minPrise."' ";
                $sql .= " AND SIP.`value` <= '".$maxPrise."' ";
            } else if($maxPrise < $minPrise){
                $sql .= " AND SIP.`value` >= '".$maxPrise."' ";
                $sql .= " AND SIP.`value` <= '".$minPrise."' ";
            } else {
                $sql .= " AND SIP.`value` = '".$minPrise."' ";
            }
        } else {
            if($minPrise !== NULL) {
                $sql .= " AND SIP.`value` >= '".$minPrise."' ";
            } else if($maxPrise !== NULL){
                $sql .= " AND SIP.`value` <= '".$maxPrise."' ";
            }
        }
        return $sql;
    }
    
    private static function generateSerchSQL_getPriceTypeID() {
        $query = "SELECT `id` FROM `ShopPricesTypes` WHERE `default`='1' LIMIT 1";
        $rezult = self::$SQL_HELPER->select($query,1);
        return $rezult['id'];
    }
    
    private static function generateCountSQL_RootGroup($groupID, $array) {
        $whereName = self::generateSerchSQL_whereItemName($array);
        if($whereName !== '') {
            $whereName = " AND ".$whereName;
        }
        $sql = '';
        $sql .= "SELECT
            count(SI.`id`) as amount
            FROM `ShopItems` as SI 
            LEFT JOIN `ShopItemsPrices`  as SIP
            on SI.`id` = SIP.`item`
            WHERE
            `shown`='1' ".
            self::generateSerchSQL_whereOnlyAction($array).
            " AND SIP.`price` = '".self::generateSerchSQL_getPriceTypeID()."' ".
            self::generateSerchSQL_wherePrice($array).$whereName;
        return $sql;
    }
    
    private static function generateCountSQL_NotRootGroup($groupID, $array) {
        $sql = '';
        $sql .= "SELECT
            count(SI.`id`) as amount
            FROM(
                SELECT
                SI.`id`, 
                SI.`itemName`
                FROM(
                    SELECT 
                    `id`, 
                    `itemName`
                    FROM `ShopItems` 
                    WHERE `shown`='1'".
                    self::generateSerchSQL_whereGroup($groupID, $array).
                    self::generateSerchSQL_whereOnlyAction($array).
                ") as SI 
                LEFT JOIN 
                `ShopItemsPropertiesValues` as SIPV
                on SI.`id` = SIPV.`item`
                where ".
                self::generateSerchSQL_whereItemName_whereProperty($array).
                "GROUP BY SI.`id`
            ) as SI 
            LEFT JOIN 
            `ShopItemsPrices`  as SIP
            on SI.`id` = SIP.`item`
            where SIP.`price` = '".self::generateSerchSQL_getPriceTypeID()."' ".
            self::generateSerchSQL_wherePrice($array);
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
    
    private static function generateSQL_NotRootGroup($groupID, $array, $page=NULL) {
        $sql = '';
        $sql .= "SELECT
            SI.`id`, 
            SI.`itemName`, 
            SI.`group`, 
            SI.`action`, 
            SI.`amount`, 
            SI.`minAmount`,
            SI.`description`,
            SIP.`value` as priceValue
            FROM(
                SELECT
                SI.`id`, 
                SI.`itemName`, 
                SI.`group`, 
                SI.`action`, 
                SI.`amount`, 
                SI.`minAmount`,
                SI.`description`
                FROM(
                    SELECT 
                    `id`, 
                    `itemName`, 
                    `group`, 
                    `action`, 
                    `amount`, 
                    `minAmount`,
                    `description`
                    FROM `ShopItems` 
                    WHERE `shown`='1'".
                    self::generateSerchSQL_whereGroup($groupID, $array).
                    self::generateSerchSQL_whereOnlyAction($array).
                ") as SI 
                LEFT JOIN 
                `ShopItemsPropertiesValues` as SIPV
                on SI.`id` = SIPV.`item`
                where ".
                self::generateSerchSQL_whereItemName_whereProperty($array).
                "GROUP BY SI.`id`
            ) as SI 
            LEFT JOIN 
            `ShopItemsPrices`  as SIP
            on SI.`id` = SIP.`item`
            where SIP.`price` = '".self::generateSerchSQL_getPriceTypeID()."' ".
            self::generateSerchSQL_wherePrice($array).
            "ORDER BY priceValue DESC";
        if($page !== NULL) {
            $sql .= " LIMIT ".(($page-1)*self::$itemOnPage).", ".self::$itemOnPage;
        }
        return $sql;
    }
    
    private static function generateSQL_RootGroup($groupID, $array, $page=NULL) {
        $whereName = self::generateSerchSQL_whereItemName($array);
        if($whereName !== '') {
            $whereName = " AND ".$whereName;
        }
        $sql = '';
        $sql .= "SELECT
            SI.`id`, 
            SI.`itemName`, 
            SI.`group`, 
            SI.`action`, 
            SI.`amount`, 
            SI.`minAmount`,
            SI.`description`,
            SIP.`value` as priceValue
            FROM `ShopItems` as SI 
            LEFT JOIN `ShopItemsPrices`  as SIP
            on SI.`id` = SIP.`item`
            WHERE
            `shown`='1' ".
            self::generateSerchSQL_whereOnlyAction($array).
            " AND SIP.`price` = '".self::generateSerchSQL_getPriceTypeID()."' ".
            self::generateSerchSQL_wherePrice($array).$whereName.
            "ORDER BY priceValue DESC";
        if($page !== NULL) {
            $sql .= " LIMIT ".(($page-1)*self::$itemOnPage).", ".self::$itemOnPage;
        }
        
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
        $countSQL = self::generateCountSQL($groupID, $array);
        $rezult = self::$SQL_HELPER->select($countSQL,1);
        $allItems = isset($rezult['amount']) ? $rezult['amount'] : 0;
        return ceil($allItems / self::$itemOnPage);
    }
}