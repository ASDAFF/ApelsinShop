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
        if (!isset(self::$object)) {
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

    private static function getPropertyValueString($propertyId, $property, $value) {
        return "<div class='PropertyValueString' id='PrValStr_" . $propertyId . "'>" . self::clearPropertyValue($propertyId) . "<span class='property'>" . $property . "</span>: <span class='value'>&nbsp;" . $value . "</span></div>";
//        return "<span class='property'>".$property."</span>: <span class='value'>".$value."</span>; ";
    }

    private static function clearPropertyValue($propertyId) {
        $out = '<span class="propertyValueStringClear deleteValueInGroupSelect" onclick="shopPropertyValueStringClear(\'' . $propertyId . '\');" itemID="' . $propertyId . '"></span>';
        $out .= "";
        return $out;
    }

    private static function getPropertyValueForGroup_Main_Action($propertyId, $action) {
        switch ($action) {
            case '1':
                return self::getPropertyValueString($propertyId, "Акции на товар", 'Товар по акции');
            case '0':
                return self::getPropertyValueString($propertyId, "Акции на товар", 'Товар без акции');
            default:
                return '';
        }
    }

    private static function getPropertyValueForGroup_Main_ItemPrise($propertyId, $itemPrise) {
        $itemPriseValue = '';
        if (isset($itemPrise['min']) && isset($itemPrise['max'])) {
            $itemPriseValue = "от " . $itemPrise['min'] . " до " . $itemPrise['max'];
        } else {
            if (isset($itemPrise['min'])) {
                $itemPriseValue = "от " . $itemPrise['min'];
            } else {
                $itemPriseValue = "до " . $itemPrise['max'];
            }
        }
        return self::getPropertyValueString($propertyId, "Цена ", $itemPriseValue);
    }

    private static function getPropertyValueForGroup_Main_Group($groupID, $propertyValue) {
        if (isset($propertyValue['Subgroup']['value'])) {
            $searchGroupID = $propertyValue['Subgroup']['value'];
        } else {
            $searchGroupID = $groupID;
        }
        if ($searchGroupID !== 'root' && $searchGroupID !== '' && $searchGroupID !== NULL) {
            $gr = self::$shopGroupsHelper->getGroupInfo($searchGroupID);
            if ($searchGroupID != $groupID) {
                return self::getPropertyValueString('Subgroup', "Поиск по каталогу ", $gr['groupName']);
            }
        }
        return '';
    }

    private static function getPropertyValueForGroup_Main($groupID, $propertyValue) {
        $out = self::getPropertyValueForGroup_Main_Group($groupID, $propertyValue);
        foreach ($propertyValue as $property => $data) {
            switch ($property) {
                case 'ItemName':
                    $out .= self::getPropertyValueString($property, "Наименование", $data['value']);
                    break;
                case 'Action':
                    $out .= self::getPropertyValueForGroup_Main_Action($property, $data['value']);
                    break;
                case 'ItemPrise':
                    $out .= self::getPropertyValueForGroup_Main_ItemPrise($property, $data['value']);
                    break;
            }
        }
        return $out;
    }

    private static function getPropertyValueForGroup_Other_bool($property, $value) {
        if ($value == '1') {
            return self::getPropertyValueString($property, self::$properties[$property], "ДА");
        } else {
            return self::getPropertyValueString($property, self::$properties[$property], "НЕТ");
        }
    }

    private static function generationIdAndStringForValue($key, $val, $i) {
        $id = 'val_' . $key . '_' . $i;
        $out = '<span id="' . $id . '">&nbsp;' . $val;
        $out .= '<span class="deleteValueInGroupSelect" onclick="deleteValueInGroupSelect(\'' . $id . '\', \'' . $key . '\' , \'' . $val . '\');"></span>';
        $out .= '</span>';
        return $out;
    }

    private static function getPropertyValueForGroup_Other_groupSelect($property, $value) {
        $valueString = '';
        $i = 0;
        foreach ($value as $val) {
            $valueString .= self::generationIdAndStringForValue($property, $val, $i++);
        }
        return self::getPropertyValueString($property, self::$properties[$property], $valueString);
    }

    private static function getPropertyValueForGroup_Other_intRange($property, $value) {
        $valueString = '';
        if (isset($value['min']) && isset($value['max'])) {
            $valueString = "от " . $value['min'] . " до " . $value['max'];
        } else {
            if (isset($value['min'])) {
                $valueString = "от " . $value['min'];
            } else {
                $valueString = "до " . $value['max'];
            }
        }
        return self::getPropertyValueString($property, self::$properties[$property], $valueString);
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
        $out .= "<div class='ShopItemsListBlockTop'>";
        $out .= "<div class='ItemsFoundTop'>";
        $arrayActivFilter = self::getArrayForDeleteBlockProperty($groupID);
        $out .= "<span class='property'>Найдено товаров:</span> <span class='value'>" . ShopPropertiesFilterSerchArray::getArrayGroupAmauntOfItems($groupID) . "</span>";
        $out .= "</div>";
        if ($propertyValueString !== '') {
            $out .= '<div class="PropertyValueForGroup">';
            $out .= $propertyValueString;
            $out .= '</div>';
        }
        if (count($arrayActivFilter) > 0) {
            $out .= "<span class='deleteBlockProperty' onclick='deleteBlockProperty();'>Сбросить фильтры</span>";
            $out .= "<div class='clear'></div>";
        }
        $out .= '</div>';
        return $out;
    }

    public static function getArrayForDeleteBlockProperty($groupID) {
        self::createObject();
        $allProperty = ShopPropertiesFilterSerchArray::getArrayGroupProperties($groupID);
        if (isset($allProperty["Action"]["value"]) && $allProperty["Action"]["value"] === "all") {
            unset($allProperty["Action"]);
        }
        if (isset($allProperty["Subgroup"]["value"]) && $allProperty["Subgroup"]["value"] === $groupID) {
            unset($allProperty["Subgroup"]);
        }
        $delProperty = array_keys($allProperty);
        return $delProperty;
    }

}
