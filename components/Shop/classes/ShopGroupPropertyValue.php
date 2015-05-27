<?php

class ShopGroupPropertyValue {
    static private $object;
    static private $shopGroupsHelper;
    static private $SQL_HELPER;
    static private $properties;
    
    private function __construct() {
        self::$shopGroupsHelper = new ShopGroupsHelper();
        global $_SQL_HELPER;
        self::$SQL_HELPER = $_SQL_HELPER;
        self::getAllProperties();
    }
    
    /**
     * создание объекта
     */
    private static function createObject() {
        if(!isset(self::$object)) {
            self::$object = new ShopGroupPropertyValue();
        }
    }
    
    private static function getAllProperties() {
        self::$properties = array();
        $query = "SELECT `id`, `propertyName` FROM `ShopProperties`;";
        $rezult = self::$SQL_HELPER->select($query);
        foreach ($rezult as $property) {
            self::$properties[$property['id']] = $property['propertyName'];
        }
    }
    
    private static function getPropertyValueString($property, $value) {
        return "<div class='PropertyValueString'><span class='property'>".$property."</span>: <span class='value'>".$value."</span></div>";
//        return "<span class='property'>".$property."</span>: <span class='value'>".$value."</span>; ";
    }
    
    private static function getPropertyValueForGroup_Main_Action($action) {
        $actionValue = '';
        switch ($action) {
            case '1':
                return self::getPropertyValueString("Акции на товар", 'Товар по акции');
            case '0':
                return self::getPropertyValueString("Акции на товар", 'Товар без акции');
            default:
                return '';
        }
    }
    
    private static function getPropertyValueForGroup_Main_ItemPrise($itemPrise) {
        $itemPriseValue = '';
        if(isset($itemPrise['min']) && isset($itemPrise['max'])) {
            $itemPriseValue = "от ".$itemPrise['min']." до ".$itemPrise['max'];
        } else {
            if(isset($itemPrise['min'])) {
                $itemPriseValue = "от ".$itemPrise['min'];
            } else {
                $itemPriseValue = "до ".$itemPrise['max'];
            }
        }
        return self::getPropertyValueString("Цена ", $itemPriseValue);
    }
    private static function getPropertyValueForGroup_Main_Group($groupID, $propertyValue) {
        if(isset($propertyValue['Subgroup']['value'])) {
            $searchGroupID = $propertyValue['Subgroup']['value'];
        } else {
            $searchGroupID = $groupID;
        }
        if($searchGroupID !== 'root' && $searchGroupID !== '' && $searchGroupID !== NULL) {
            $gr = self::$shopGroupsHelper->getGroupInfo($searchGroupID);
            return self::getPropertyValueString("Поиск по каталогу ", $gr['groupName']);
        } else {
            return '';
        }
    }
    
    private static function getPropertyValueForGroup_Main($groupID, $propertyValue) {
        $out = self::getPropertyValueForGroup_Main_Group($groupID, $propertyValue);
        if(isset($propertyValue['ItemName']['value'])) {
            $out .= self::getPropertyValueString("Наименование", $propertyValue['ItemName']['value']);
        }
        if(isset($propertyValue['Action']['value'])) {
            $out .= self::getPropertyValueForGroup_Main_Action($propertyValue['Action']['value']);
        }
        if(isset($propertyValue['ItemPrise']['value']['min']) || isset($propertyValue['ItemPrise']['value']['max'])) {
            $out .= self::getPropertyValueForGroup_Main_ItemPrise($propertyValue['ItemPrise']['value']);
        }
        return $out;
    }
    
    private static function getPropertyValueForGroup_Other_bool($property, $value) {
        if($value == '1') {
            return self::getPropertyValueString(self::$properties[$property], "ДА");
        } else {
            return self::getPropertyValueString(self::$properties[$property], "НЕТ");
        }
    }
    private static function getPropertyValueForGroup_Other_groupSelect($property, $value) {
        $valueString = '';
        foreach ($value as $val) {
            $valueString .= $val.', ';
        }
        if(mb_strlen($valueString) > 2) {
            $valueString = mb_substr($valueString, 0, mb_strlen($valueString) - 2);
        }
        return self::getPropertyValueString(self::$properties[$property], $valueString);
    }
    private static function getPropertyValueForGroup_Other_intRange($property, $value) {
        $valueString = '';
        if(isset($value['min']) && isset($value['max'])) {
            $valueString = "от ".$value['min']." до ".$value['max'];
        } else {
            if(isset($value['min'])) {
                $valueString = "от ".$value['min'];
            } else {
                $valueString = "до ".$value['max'];
            }
        }
        return self::getPropertyValueString(self::$properties[$property], $valueString);
    }
    
    private static function getPropertyValueForGroup_Other($propertyValue) {
        $out = '';
        foreach ($propertyValue as $property => $data) {
            switch ($data["type"]) {
                case 'bool':
                    $out .= self::getPropertyValueForGroup_Other_bool($property, $data["value"]);
                    break;
                case 'groupSelect':
                    $out .= self::getPropertyValueForGroup_Other_groupSelect($property, $data["value"]);
                    break;
                case 'intRange':
                    $out .= self::getPropertyValueForGroup_Other_intRange($property, $data["value"]);
                    break;
                case 'select':
                    $out .= self::getPropertyValueString(self::$properties[$property], $data["value"]);
                    break;
                case 'text':
                    $out .= self::getPropertyValueString(self::$properties[$property], $data["value"]);
                    break;
            }
        }
        return $out;
    }
    
    public static function getPropertyValueForGroup($groupID) {
        self::createObject();
        $out = '';
        $propertyValue = ShopPropertiesFilterSerchArray::getArrayGroupProperties($groupID);
        $propertyValueString = '';
        $propertyValueString .= self::getPropertyValueForGroup_Main($groupID, $propertyValue);
        $propertyValueString .= self::getPropertyValueForGroup_Other($propertyValue);
        $out .= "<div class='ItemsFoundTop'>";
        $out .= "<span class='property'>Найдено товаров:</span> <span class='value'>".ShopPropertiesFilterSerchArray::getArrayGroupAmauntOfItems($groupID)."</span>";
        $out .= "</div>";
        if($propertyValueString !== '') {
            $out .= '<div class="PropertyValueForGroup">';
            $out .= $propertyValueString;
            $out .= '</div>';
        }
        return $out;
    }
}
