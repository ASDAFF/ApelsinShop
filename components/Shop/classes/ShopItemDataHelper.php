<?php
/**
 * Description of ShopItemDataHelper
 *
 * @author olga
 */
class ShopItemDataHelper {

    private static $object;
    private static $property;
    private static $SQL_HELPER;
    private static $imageDir = './resources/Components/Shop/Image/ItemsImage/';
    private static $defaultIcon = "defaultIcon";

    /**
     * Конструктор класса
     * @global type $_SQL_HELPER
     */
    private function __construct() {
        global $_SQL_HELPER;
        self::$SQL_HELPER = $_SQL_HELPER;
    }

    /**
     * создание объекта
     */
    private static function createObject() {
        if(!isset(self::$object)) {
            self::$object = new ShopItemDataHelper();
        }
    }

    /**
     * Получить изображение
     * @param type $item
     * @return type
     */
    public static function getImage($item, $imgSize = '') {
        self::createObject();
        if (file_exists(self::$imageDir.$item.$imgSize.'.jpg')) {
            $image = $item.$imgSize.'.jpg';
        } elseif (file_exists(self::$imageDir.$item.$imgSize.'.png')) {
            $image = $item.$imgSize.'.png';
        } else {
            $image = self::$defaultIcon.$imgSize.'.png';
        }
        return self::$imageDir.$image;
    }

    /**
     * Записать свойства группы
     * @param type $item
     * @param type $group
     */
    private static function getPropertiesInGroup($item, $group) {
        $query = "SELECT
            SP.`property`,
            SP.`propertyName`,
            SP.`valueType`,
            SP.`oneOfAllValues`,
            SIPV.`value`,
            SIPV.`measure`
            FROM (
                SELECT
                SPIG.`property`,
                SPIG.`sequence`,
                SP.`propertyName`,
                SP.`valueType`,
                SP.`oneOfAllValues`
                FROM `ShopPropertiesInGroups` as SPIG
                lEFT JOIN `ShopProperties` as SP
                ON SPIG.`property` = SP.`id`
                WHERE SPIG.`group` = '".$group."'
            ) as SP
            INNER JOIN `ShopItemsPropertiesValues` as SIPV
            ON SP.`property` = SIPV.`property`
            WHERE SIPV.`item` = '".$item."'
            ORDER BY SP.`sequence`;";
        $rezult = self::$SQL_HELPER->select($query);
        foreach ($rezult as $value) {
            self::$property[$value["property"]]['property'] = $value['property'];
            self::$property[$value["property"]]['propertyName'] = $value['propertyName'];
            self::$property[$value["property"]]['valueType'] = $value['valueType'];
            self::$property[$value["property"]]['oneOfAllValues'] = $value['oneOfAllValues'];
            self::$property[$value["property"]]['measure'] = $value['measure'];
            self::$property[$value["property"]]['value'][] = $value['value'];
        }
    }

    /**
     * Получение св-в всех групп
     */
    public static function getProperty($item, $dataGroup) {
        self::createObject();
        $groups = self::getListGroup($dataGroup);
        self::$property = [];
        foreach ($groups as $group) {
            self::getPropertiesInGroup($item, $group);
        }
        return self::$property;
    }

    /**
     * Получение списка всех групп
     */
    private static function getListGroup($dataGroup) {
        $list = new ShopGroupsHelper();
        $listGroup = $list->getGroupPath($dataGroup);
        array_push($listGroup, $dataGroup);
        return $listGroup;
    }

    /**
     * Вариант отображение всех свойств товара
     * @param type $property
     * @param type $oneOfAllValues
     */
    public static function getHtmlAllValue($property, $oneOfAllValues) {
        self::createObject();
        $out = '';
        if (count($property['value']) > 1) {
            if ($oneOfAllValues) {
                $arr = array();
                foreach ($property['value'] as $key => $value) {
                    if ($property['valueType'] == 'float' || $property['valueType'] == 'int') {
                        $value = ShopItemsPropertiesMeasureScaling::ScalingMeasureString($property['measure'], $value);
                    }
                    $arr[$key]['value'] = $arr[$key]['text'] = $value;
                }
                $out .= InputHelper::select("ShopItemPropertyValueSelectBox", "ShopItemPropertyValueSelectBox", $arr, false, '');
            } else {
                foreach ($property['value'] as $key => $value) {
                    if ($property['valueType'] == 'float' || $property['valueType'] == 'int') {
                        $value = ShopItemsPropertiesMeasureScaling::ScalingMeasureString($property['measure'], $value);
                    }
                    $out .= $value.', ';
                }
                $out = mb_substr($out, 0, mb_strlen($out) - 2);
            }
        } else {
            if ($property['valueType'] == 'float' || $property['valueType'] == 'int') {
                $value = ShopItemsPropertiesMeasureScaling::ScalingMeasureString($property['measure'], $property['value'][0]);
            } else {
                $value = $property['value'][0];
            }
            $out = $value;
        }
        return $out;
    }
}
