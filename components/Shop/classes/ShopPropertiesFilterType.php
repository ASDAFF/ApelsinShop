<?php
/**
 * Description of ShopPropertiesFilterType
 *
 * @author Максим
 */
class ShopPropertiesFilterType {    
    
    static private $SQL_HELPER;
    static private $shopGroupsHelper;
    static private $urlHelper;
    static private $object;
    static private $allGroupProperties;
    static private $allGroupPropertiesData;
    static private $postDataTrigger = false;
    
    private function __construct() {
        self::$shopGroupsHelper = new ShopGroupsHelper();
        global $_SQL_HELPER;
        self::$SQL_HELPER = $_SQL_HELPER;
        self::$urlHelper = new UrlHelper();
    }
    
    /**
     * создание объекта
     */
    private static function createObject() {
        if(!isset(self::$object)) {
            self::$object = new ShopPropertiesFilterType();
        }
    }
    
    private static function getDataForFilter($groupID, $propertyID) {
        $childrenGroups = self::$shopGroupsHelper->getGroupChildren($groupID);
        $query = "SELECT SIPV.`value`
            FROM `ShopItemsPropertiesValues` AS SIPV
            LEFT JOIN `ShopItems` AS SI
            ON SIPV.`item` = SI.`id`
            WHERE 
            SIPV.`property` = '".$propertyID."' AND SIPV.`value`!=''";
        if(count($childrenGroups) > 0) {
            $query .= " AND (";
            foreach ($childrenGroups as $child) {
                $query .= "SI.`group` = '".$child."' OR ";
            }
            $query = substr($query, 0,  strlen($query)-4);
            $query .= ") ";
        }
        $query .= "GROUP BY SIPV.`value` ORDER BY SIPV.`value` ASC;";
        $rezult = self::$SQL_HELPER->select($query);
        $values = array();
        foreach ($rezult as $key => $val) {
            $values[$key] = $val['value'];
        }
        return $values;
    }
    
    private static function getMaxValue($array) {
        reset($array);
        $max = current($array);
        foreach ($array as $val) {
            if($max < $val) {
                $max = $val;
            }
        }
        return $max === NULL ? 0 : $max;
    }
    
    private static function getMinValue($array) {
        reset($array);
        $min = current($array);
        foreach ($array as $val) {
            if($min > $val) {
                $min = $val;
            }
        }
        return $min === NULL ? 0 : $min;
    }
    
    private static function getRangeMaxlength($min,$max) {
        $min_l = strlen($min);
        $max_l = strlen($max);
        return $min_l > $max_l ? $min_l : $max_l;
    }

    private static function getFilterBlock($element) {
        $out = '<div class="ShopPropertiesFilterBlock">';
        $out .= $element;
        $out .= '</div>';
        return $out;
    }
    
    private static function getFilterName($groupID, $propertyID) {
        return self::$allGroupPropertiesData[$groupID][$propertyID]['propertyName'];
    }
    
    private static function getFilterBlockName($groupID, $propertyID) {
        $out = '<div class="ShopPropertiesFilterBlockName" id="FilterBlockName_'.$propertyID.'" blockID="FilterBlockValue_'.$propertyID.'">';
        $out .= self::getFilterName($groupID, $propertyID);
        $out .= '</div>';
        return $out;
    }

    private static function FilterType_bool($groupID, $propertyID) {
        $value = self::getSearchFilterElementData($groupID,$propertyID);
        $filterId = ShopPropertiesFilterTypeGetPostData::getFilterID($groupID, $propertyID);
        $out = '';
        $out .= self::getFilterName($groupID, $propertyID)." ";
        $out .= InputHelper::checkbox($filterId, $filterId, 'ShopPropertiesFilter FilterType_bool', FALSE, '1', $value, NULL);
        $out .= ' (Да/Нет)';
        return $out;
    }
    
    private static function FilterType_groupSelect($groupID, $propertyID) {
        $value = self::getSearchFilterElementData($groupID,$propertyID);
        $filterId = ShopPropertiesFilterTypeGetPostData::getFilterID($groupID, $propertyID);
        $filterData = self::getDataForFilter($groupID, $propertyID);
        if(empty($filterData)) {
            return '';
        }
        $out = self::getFilterBlockName($groupID, $propertyID);
        $out .= '<div class="ShopPropertiesFilterBlockValues" id="FilterBlockValue_'.$propertyID.'">';
        foreach ($filterData as $key => $val) {
            $out .= '<div class="ShopPropertiesFilter_GroupSelectElement">';
            $out .= InputHelper::checkbox($filterId.'['.$key.']', $filterId.'_'.$key, 'ShopPropertiesFilter FilterType_groupSelect', FALSE, $val, ($value!==NULL && in_array($val,$value)), NULL);
            $out .= ' <label for="'.$filterId.'_'.$key.'">'.TextGenerator::shortenRusTextForLen($val, 25, 5, 6).'</label>';
            $out .= '<div></div>';
            $out .= '</div>';
        }
        $out .= '</div>';
        $out .= '<div class="clear"></div>';
        return $out;
    }
    
    private static function FilterType_range($groupID, $propertyID) {
        $filterId = ShopPropertiesFilterTypeGetPostData::getFilterID($groupID, $propertyID);
        $filterData = self::getDataForFilter($groupID, $propertyID);
        if(empty($filterData)) {
            return '';
        }
        $min_v = self::getMinValue($filterData);
        $max_v = self::getmaxValue($filterData);
        $value = self::getSearchFilterElementData($groupID,$propertyID);
        if(!isset($value["min"]) || $value["min"]===NULL || $value["min"]==='') {
//            $value["min"] = $min_v;
            $value["min"] = NULL;
        }
        if(!isset($value["max"]) || $value["max"]===NULL || $value["max"]==='') {
//            $value["max"] = $max_v;
            $value["max"] = NULL;
        }
        $maxlength = self::getRangeMaxlength($min_v,$max_v);
        if(self::$allGroupPropertiesData[$groupID][$propertyID]['valueType'] === 'int') {
            $pattern = '^[0-9]+';
        } else {
            $pattern = '^[0-9.,-]+';
        }
        $measure = ShopItemsPropertiesMeasureScaling::getPropertiesMeasure($propertyID);
        $out = '';
        $out .= self::getFilterName($groupID, $propertyID)." от ";
        $out .= InputHelper::paternTextBox($filterId.'_min', $filterId.'_min', 'ShopPropertiesFilter FilterType_range MINrange', $maxlength, FALSE, "Минимальное значение", $pattern, min($value["min"],$value["max"]), NULL);
        $out .= self::MeasureScalingSelect($filterId, $measure, null, '_min_measure');
        $out .= " до ";
        $out .= InputHelper::paternTextBox($filterId.'_max', $filterId.'_max', 'ShopPropertiesFilter FilterType_range MAXrange', $maxlength, FALSE, "Максимальное значение", $pattern, max($value["min"],$value["max"]), NULL);
        $out .= self::MeasureScalingSelect($filterId, $measure, null, '_max_measure');
        $out .= " (от ".ShopItemsPropertiesMeasureScaling::ScalingMeasureString($measure, $min_v)." до ".ShopItemsPropertiesMeasureScaling::ScalingMeasureString($measure, $max_v).")";
        return $out;
    }
    
    private static function MeasureScalingSelect($filterId, $measure, $value, $postfix = "") {
        $measureS = ShopItemsPropertiesMeasureScaling::measurefToMeasures($measure);
        $scalingData = ShopItemsPropertiesMeasureScaling::getMeasureScaling($measure);
        $defaultMesure = false;
        if(!empty($scalingData)) {
            $array = array();
            foreach ($scalingData as $scalingElement) {
                if($scalingElement['factor'] >= 1) {
                    $element['text'] = $measureS;
                    $element['value'] = $measure;
                    $array[] = $element;
                    $defaultMesure = true;
                }
                if(isset($scalingElement['aliasS']) && $scalingElement['aliasS']!=='') {
                    $element['text'] = $scalingElement['aliasS'];
                } else {
                    $element['text'] = $scalingElement['prefixS'].$measureS;
                }
                $element['value'] = $scalingElement['prefixF'];
                $array[] = $element;
            }
            if(!$defaultMesure) {
                $element['text'] = $measureS;
                $element['value'] = $measure;
                $array[] = $element;
            }
            if($value == null || $value == '') {
                $value = $measure;
            }
            return InputHelper::select($filterId.$postfix, $filterId.$postfix, $array, true, $value);
        } else {
            return "";
        }
    }
    
    private static function FilterType_select($groupID, $propertyID) {
        $value = self::getSearchFilterElementData($groupID,$propertyID);
        $filterId = ShopPropertiesFilterTypeGetPostData::getFilterID($groupID, $propertyID);
        $filterData = self::getDataForFilter($groupID, $propertyID);
        if(empty($filterData)) {
            return '';
        }
        $out = '';
        $out = self::getFilterName($groupID, $propertyID)." ";
        $selectData = array();
        foreach ($filterData as $key => $val) {
            $selectData[$key]['value'] = $selectData[$key]['text'] = $val;
        }
        $out .= InputHelper::select($filterId, $filterId, $selectData, FALSE, $value, NULL);
        return $out;
    }
    
    private static function FilterType_text($groupID, $propertyID) {
        $value = self::getSearchFilterElementData($groupID,$propertyID);
        $filterId = ShopPropertiesFilterTypeGetPostData::getFilterID($groupID, $propertyID);
        $pattern = '[А-Яа-яЁёЙйЦцA-Za-z0-9\s-_]{2,800;}';
        $maxlength = 800;
        $out = '';
        $out .= self::getFilterName($groupID, $propertyID)." ";
        $out .= InputHelper::textBox($filterId, $filterId, 'ShopPropertiesFilter FilterType_text', $maxlength, FALSE, $value, NULL);
        return $out;
    }
    
    private static function getMainFilters_ItemName($groupID) {
        $value = self::getSearchFilterElementData($groupID,'ItemName');
        $pattern = '[А-Яа-яЁёЙйЦцA-Za-z0-9\s-_]{2,800;}';
        $maxlength = 800;
        $out = '';
        $out .= "Наименование ";
        $out .= InputHelper::textBox('ItemName', 'ItemName', 'ShopPropertiesFilter FilterType_text ItemName', $maxlength, FALSE, $value, NULL);
        return self::getFilterBlock($out);
    }
    
    private static function getMainFilters_ItemPrise($groupID) {
        $value = self::getSearchFilterElementData($groupID,'ItemPrise');
        if(!isset($value["min"]) || $value["min"]===NULL || $value["min"]==='') {
            $value["min"] = NULL;
        }
        if(!isset($value["max"]) || $value["max"]===NULL || $value["max"]==='') {
            $value["max"] = NULL;
        }
        $maxlength = 10;
        $pattern = '^[0-9.,-]+';
        $out = '';
        $out .= "Цена от ";
        $out .= InputHelper::paternTextBox('ItemPrise_min', 'ItemPrise_min', 'ShopPropertiesFilter FilterType_range MINrange ItemPrise_min', $maxlength, FALSE, "Минимальное значение", $pattern, $value["min"], NULL);
        $out .= " до ";
        $out .= InputHelper::paternTextBox('ItemPrise_max', 'ItemPrise_max', 'ShopPropertiesFilter FilterType_range MAXrange ItemPrise_max', $maxlength, FALSE, "Максимальное значение", $pattern, $value["max"], NULL);
        return self::getFilterBlock($out);
    }
    private static function getMainFilters_Action($groupID) {
        $value = self::getSearchFilterElementData($groupID,'Action');
        if($value === NULL) {
            $value = 'all';
        }
        $actionArray = array();
        $actionArray[0]['text'] = 'Любой товар';
        $actionArray[0]['value'] = 'all';
        $actionArray[1]['text'] = 'Только товар по акции';
        $actionArray[1]['value'] = '1';
        $actionArray[2]['text'] = 'Только товар без акции';
        $actionArray[2]['value'] = '0';
        $out = '';
        $out .= "Акции на твоар ";
        $out .= InputHelper::select('Action', 'Action', $actionArray, true, $value);
        return self::getFilterBlock($out);
    }
    private static function getMainFilters_inStock($groupID) {
        $value = self::getSearchFilterElementData($groupID,'InStock');
        if($value === NULL) {
            $value = 'all';
        }
        $actionArray = array();
        $actionArray[0]['text'] = 'Весь товар';
        $actionArray[0]['value'] = 'all';
        $actionArray[1]['text'] = 'Товар в наличии';
        $actionArray[1]['value'] = 'inStock';
        $out = '';
        $out .= "Наличие товара ";
        $out .= InputHelper::select('InStock', 'InStock', $actionArray, true, $value);
        return self::getFilterBlock($out);
    }
    
    private static function getMainFilters_Subgroup($groupID) {
        if($groupID !== NULL) {
            $value = self::getSearchFilterElementData($groupID,'Subgroup');
            $children = self::$shopGroupsHelper->getGroupChildren($groupID);
            if($value===NULL) {
                $value = $groupID;
            }
            $groupsArray = array();
            foreach ($children as $group) {
                $i = count($groupsArray);
                $groupsArray[$i]['value'] = $group;
                $gr = self::$shopGroupsHelper->getGroupInfo($group);
                $groupsArray[$i]['text'] = $gr['groupName'];
            }
            $out = '';
            $out .= "Поиск по каталогу ";
            $out .= InputHelper::select('Subgroup', 'Subgroup', $groupsArray, true, $value);
            return self::getFilterBlock($out);
        } else {
            return '';
        }
    }
    
    private static function getMainFilters($groupID) {
        $out = '';
        $out .= self::getMainFilters_ItemName($groupID);
        $out .= self::getMainFilters_Action($groupID);
        $out .= self::getMainFilters_inStock($groupID);
        $out .= self::getMainFilters_ItemPrise($groupID);
        $out .= self::getMainFilters_Subgroup($groupID);
        return $out;
    }
    
    private static function getFilter($groupID, $propertyID) {
        $out = '';
        if(isset(self::$allGroupPropertiesData[$groupID][$propertyID])) {
            switch (self::$allGroupPropertiesData[$groupID][$propertyID]['filterType']) {
                case 'bool':
                    $out = self::FilterType_bool($groupID, $propertyID);
                    break;
                case 'groupSelect':
                    $out = self::FilterType_groupSelect($groupID, $propertyID);
                    break;
                case 'range':
                    $out = self::FilterType_range($groupID, $propertyID);
                    break;
                case 'select':
                    $out = self::FilterType_select($groupID, $propertyID);
                    break;
                case 'text':
                    $out = self::FilterType_text($groupID, $propertyID);
                    break;
            }
        }
        if($out !== '') {
            return self::getFilterBlock($out);
        } else {
            return '';
        }
    }
    
    private static function getForms($inputs) {
        if(ShopPageInfoHelper::shopPageGroupId() !== null) {
            $url = ShopGroupsUrlHelper::getUrl(array('catalog',ShopPageInfoHelper::shopPageGroupId()));
        } else {
            $url = ShopGroupsUrlHelper::getUrl(array());
        }
        $out = '';
        $out .= '<form class="ShopPropertiesFilterForm" name="ShopPropertiesFilterForm" action="'.$url.'" enctype="multipart/form-data" method="post" accept-charset="UTF-8">';
        $out .= "<div class='ItemsFoundFilterBlocks'>";
        $out .= "<span class='property'>Найдено товаров:</span> <span class='value'>".ShopPropertiesFilterSerchArray::getArrayGroupAmauntOfItems(ShopPageInfoHelper::shopPageGroupId())."</span>";
        $out .= "</div>";
        $out .= '<div class="ShopPropertiesFilterBlocks">';
        $out .= $inputs;
        $out .= '</div>';
        if(!ShopPageInfoHelper::isShopPage()) {
            $out .= '<input class="ShopPropertiesFilterFormSubmit" type="submit" name="ShopPropertiesFilterFormSubmit" value="OK">';
        }
        $out .= '</form>';
        return $out;
    }
    
    private static function getSearchFilterElementData($groupID,$propertyID) {
        $data = ShopPropertiesFilterSerchArray::getArrayGroupProperties($groupID);
        if(isset($data[$propertyID]['value'])) {
            return $data[$propertyID]['value'];
        } else {
            return NULL;
        }
    }
    
    private static function getPostData($groupID) {
        if(!self::$postDataTrigger) {
            ShopPropertiesFilterTypeGetPostData::getPostData($groupID);
            self::$allGroupProperties = ShopPropertiesFilterTypeGetPostData::getAllGroupProperties();
            self::$allGroupPropertiesData = ShopPropertiesFilterTypeGetPostData::getAllGroupPropertiesData();
            self::$postDataTrigger = true;
        }
    }

    public static function getFilters($groupID) {
        self::createObject();
        self::getPostData($groupID);
        
        $out = self::getMainFilters($groupID);
        foreach (self::$allGroupProperties[$groupID] as $propertyID) {
            $out .= self::getFilter($groupID, $propertyID);
        }
        return self::getForms($out);
    }
    
    public static function getJS($groupID) {
        self::getPostData($groupID);
        $JSGenerator = new ShopPropertiesFilterTypeJSGenerator(self::$allGroupProperties, self::$allGroupPropertiesData, $groupID);
        return $JSGenerator->getHtml();
    }
    
}
