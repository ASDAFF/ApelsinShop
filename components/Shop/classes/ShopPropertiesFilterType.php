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
    static private $searchFilterDataArray;
    
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
    
    private static function getGroupPath($groupID) {
        $groups = self::$shopGroupsHelper->getGroupPath($groupID);
        $groups[] = $groupID;
        return $groups;
    }
    
    private static function getShopGroupPropertiesData($groupID) {
        if(!isset(self::$allGroupPropertiesData[$groupID]) || empty(self::$allGroupPropertiesData[$groupID])) {
            self::$allGroupPropertiesData[$groupID] = array();
            $groups = self::getGroupPath($groupID);
            $query = "SELECT 
                SPIG.`group`,
                SPIG.`property`,
                SPIG.`sequence`,
                SP.`propertyName`,
                SP.`filterType`,
                SP.`valueType`,
                SP.`oneOfAllValues`
                FROM `ShopPropertiesInGroups` as SPIG
                LEFT JOIN `ShopProperties` AS SP
                ON SPIG.`property` = SP.`id`
                WHERE ";
            foreach ($groups as $group) {
                $query .= "`group`='".$group."' OR ";
            }
            $query = substr($query, 0,  strlen($query)-4).";";
            $properties = self::$SQL_HELPER->select($query);
            foreach ($properties as $property) {
                self::$allGroupPropertiesData[$groupID][$property['property']] = $property;
            }
        }
    }

    private static function getShopGroupProperties($groupID) {
        $query = "SELECT 
            SPIG.`property`
            FROM `ShopPropertiesInGroups` as SPIG
            LEFT JOIN `ShopProperties` AS SP
            ON SPIG.`property` = SP.`id`
            WHERE `group`='".$groupID."' 
            ORDER BY SPIG.`sequence` ASC";
        return self::$SQL_HELPER->select($query);
    }
    
    private static function getShopGroupsPropertiesID($groupID) {
        if(!isset(self::$allGroupProperties[$groupID]) || empty(self::$allGroupProperties[$groupID])) {
            self::$allGroupProperties[$groupID] = array();
            $properties = array();
            $groups = self::getGroupPath($groupID);
            foreach ($groups as $group) {
                $properties = array_merge($properties, self::getShopGroupProperties($group));
            }
            foreach ($properties as $property) {
                self::$allGroupProperties[$groupID][] = $property['property'];
            }
        }
    }
    
    private static function getShopGroupsProperties($groupID) {
        self::getShopGroupsPropertiesID($groupID);
        self::getShopGroupPropertiesData($groupID);
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

    private static function getFilterID($groupID, $propertyID) {
        return $groupID."_".$propertyID;
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
    
    private static function getIntRangeMaxlength($min,$max) {
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
        $out = '<div class="ShopPropertiesFilterBlockName">';
        $out .= self::getFilterName($groupID, $propertyID);
        $out .= '</div>';
        return $out;
    }

    private static function FilterType_bool($groupID, $propertyID) {
        $value = self::getSearchFilterElementData($groupID,$propertyID);
        $filterId = self::getFilterID($groupID, $propertyID);
        $out = '';
        $out .= self::getFilterName($groupID, $propertyID)." ";
        $out .= InputHelper::checkbox($filterId, $filterId, 'ShopPropertiesFilter FilterType_bool', FALSE, '1', $value, NULL);
        $out .= ' (Да/Нет)';
        return $out;
    }
    
    private static function FilterType_groupSelect($groupID, $propertyID) {
        $value = self::getSearchFilterElementData($groupID,$propertyID);
        $filterId = self::getFilterID($groupID, $propertyID);
        $filterData = self::getDataForFilter($groupID, $propertyID);
        $out = '';
        $out = self::getFilterBlockName($groupID, $propertyID);
        foreach ($filterData as $key => $val) {
            $out .= '<div class="ShopPropertiesFilter_GroupSelectElement">';
            $out .= InputHelper::checkbox($filterId.'['.$key.']', $filterId.'_'.$key, 'ShopPropertiesFilter FilterType_groupSelect', FALSE, $val, ($value!==NULL && in_array($val,$value)), NULL);
            $out .= ' <label for="'.$filterId.'_'.$key.'">'.TextGenerator::shortenRusTextForLen($val, 25, 5, 6).'</label>';
            $out .= '</div>';
        }
        return $out;
    }
    
    private static function FilterType_intRange($groupID, $propertyID) {
        $filterId = self::getFilterID($groupID, $propertyID);
        $filterData = self::getDataForFilter($groupID, $propertyID);
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
        $maxlength = self::getIntRangeMaxlength($min_v,$max_v);
        if(self::$allGroupPropertiesData[$groupID][$propertyID]['valueType'] === 'int') {
            $pattern = '^[0-9]+';
        } else {
            $pattern = '^[0-9.,-]+';
        }
        $out = '';
        $out .= self::getFilterName($groupID, $propertyID)." от ";
        $out .= InputHelper::paternTextBox($filterId.'_min', $filterId.'_min', 'ShopPropertiesFilter FilterType_intRange MINintRange', $maxlength, FALSE, "Минимальное значение", $pattern, min($value["min"],$value["max"]), NULL);
        $out .= " до ";
        $out .= InputHelper::paternTextBox($filterId.'_max', $filterId.'_max', 'ShopPropertiesFilter FilterType_intRange MAXintRange', $maxlength, FALSE, "Максимальное значение", $pattern, max($value["min"],$value["max"]), NULL);
        $out .= " (от ".$min_v." до ".$max_v.")";
        return $out;
    }
    
    private static function FilterType_select($groupID, $propertyID) {
        $value = self::getSearchFilterElementData($groupID,$propertyID);
        $filterId = self::getFilterID($groupID, $propertyID);
        $filterData = self::getDataForFilter($groupID, $propertyID);
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
        $filterId = self::getFilterID($groupID, $propertyID);
        $pattern = '[А-Яа-яЁёЙйЦцA-Za-z0-9\s-_]{2,800;}';
        $maxlength = 800;
        $out = '';
        $out .= self::getFilterName($groupID, $propertyID)." ";
//        $out .= InputHelper::paternTextBox($filterId, $filterId, 'ShopPropertiesFilter FilterType_text', $maxlength, FALSE, "Буквы пробелы и цифры", $pattern, NULL, NULL);
        $out .= InputHelper::textBox($filterId, $filterId, 'ShopPropertiesFilter FilterType_text', $maxlength, FALSE, $value, NULL);
        return $out;
    }
    
    private static function getMainFilters_ItemName($groupID) {
        $value = self::getSearchFilterElementData($groupID,'ItemName');
        $pattern = '[А-Яа-яЁёЙйЦцA-Za-z0-9\s-_]{2,800;}';
        $maxlength = 800;
        $out = '';
        $out .= "Наименование ";
//        $out .= InputHelper::paternTextBox('ItemName', 'ItemName', 'ShopPropertiesFilter FilterType_text ItemName', $maxlength, FALSE, "Буквы пробелы и цифры", $pattern, NULL, NULL);
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
        $out .= InputHelper::paternTextBox('ItemPrise_min', 'ItemPrise_min', 'ShopPropertiesFilter FilterType_intRange MINintRange ItemPrise_min', $maxlength, FALSE, "Минимальное значение", $pattern, $value["min"], NULL);
        $out .= " до ";
        $out .= InputHelper::paternTextBox('ItemPrise_max', 'ItemPrise_max', 'ShopPropertiesFilter FilterType_intRange MAXintRange ItemPrise_max', $maxlength, FALSE, "Максимальное значение", $pattern, $value["max"], NULL);
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
                case 'intRange':
                    $out = self::FilterType_intRange($groupID, $propertyID);
                    break;
                case 'select':
                    $out = self::FilterType_select($groupID, $propertyID);
                    break;
                case 'text':
                    $out = self::FilterType_text($groupID, $propertyID);
                    break;
            }
        }
        return self::getFilterBlock($out);
    }
    
    private static function getForms($inputs) {
        $out = '';
        $out .= '<form class="ShopPropertiesFilterForm" name="ShopPropertiesFilterForm" action="'.self::$urlHelper->getThisPage().'" enctype="multipart/form-data" method="post" accept-charset="UTF-8">';
        $out .= $inputs;
        $out .= '<center><input class="ShopPropertiesFilterFormSubmit" type="submit" name="ShopPropertiesFilterFormSubmit" value="OK"></center>';
        $out .= '</form>';
        return $out;
    }
    
    private static function getPostValue($id, $falseValue = NULL) {
        if(isset($_POST[$id]) && $_POST[$id]!==NULL && $_POST[$id]!==NULL) {
            return $_POST[$id];
        } else {
            return $falseValue;
        }
    }
    private static function getSearchFilterElementData($groupID,$propertyID) {
        $data = ShopPropertiesFilterSerchArray::getArrayGroupProperties($groupID);
        if(isset($data[$propertyID]['value'])) {
            return $data[$propertyID]['value'];
        } else {
            return NULL;
        }
    }

    private static function addSearchFilterData($groupID,$propertyID,$type,$value) {
        if($value!==NULL && $value!=='' && $value!==array()) {
            self::$searchFilterDataArray[$groupID][$propertyID]['type'] = $type;
            self::$searchFilterDataArray[$groupID][$propertyID]['value'] = $value;
        }
    }
    
    private static function getPostData($groupID) {
        if(isset($_POST['ShopPropertiesFilterFormSubmit']) && $_POST['ShopPropertiesFilterFormSubmit']!=='') {
            self::$searchFilterDataArray[$groupID] = array();
            self::addSearchFilterData($groupID, 'ItemName', 'main', self::getPostValue('ItemName', NULL));
            self::addSearchFilterData($groupID, 'Action', 'main', self::getPostValue('Action', NULL));
            $itemPrise_min = self::getPostValue('ItemPrise_min', NULL);
            $itemPrise_max = self::getPostValue('ItemPrise_max', NULL);
            $itemPriseValue = array();
            if($itemPrise_min!==NULL && $itemPrise_min!=='') {
                $itemPriseValue['min']=$itemPrise_min;
            }
            if($itemPrise_max!==NULL && $itemPrise_max!=='') {
                $itemPriseValue['max']=$itemPrise_max;
            }
            self::addSearchFilterData($groupID, 'ItemPrise', 'main', $itemPriseValue);
            $subgroup = self::getPostValue('Subgroup', $groupID);
            self::addSearchFilterData($groupID, 'Subgroup', 'main', $subgroup);
            foreach (self::$allGroupProperties[$groupID] as $propertyID) {
                if(isset(self::$allGroupPropertiesData[$groupID][$propertyID])) {
                    switch (self::$allGroupPropertiesData[$groupID][$propertyID]['filterType']) {
                        case 'bool':
                            self::getPostData_bool($groupID, $propertyID);
                            break;
                        case 'groupSelect':
                            self::getPostData_groupSelect($groupID, $propertyID);
                            break;
                        case 'intRange':
                            self::getPostData_intRange($groupID, $propertyID);
                            break;
                        case 'select':
                            self::getPostData_select($groupID, $propertyID);
                            break;
                        case 'text':
                            self::getPostData_text($groupID, $propertyID);
                            break;
                    }
                }
            }
            ShopPropertiesFilterSerchArray::setArrayGroup($groupID, self::$searchFilterDataArray[$groupID]);
        } else {
            If(count(ShopPropertiesFilterSerchArray::getArrayGroupProperties($groupID)) === 0) {
                ShopPropertiesFilterSerchArray::setArrayGroup($groupID, array());
            }
        }
    }
    
    private static function getPostData_bool($groupID, $propertyID) {
        $filterId = self::getFilterID($groupID, $propertyID);
        self::addSearchFilterData($groupID,$propertyID,'bool',self::getPostValue($filterId,false));
    }
    
    private static function getPostData_groupSelect($groupID, $propertyID) {
        $filterId = self::getFilterID($groupID, $propertyID);
        self::addSearchFilterData($groupID,$propertyID,'groupSelect',self::getPostValue($filterId,array()));
    }
    
    private static function getPostData_intRange($groupID, $propertyID) {
        $filterId_min = self::getFilterID($groupID, $propertyID).'_min';
        $filterId_max = self::getFilterID($groupID, $propertyID).'_max';
        $min = self::getPostValue($filterId_min);
        $max = self::getPostValue($filterId_max);
        $value = array();
        if($min!==NULL && $min!=='') {
            $value['min']=$min;
        }
        if($max!==NULL && $max!=='') {
            $value['max']=$max;
        }
        self::addSearchFilterData($groupID,$propertyID,'intRange',$value);
    }
    
    private static function getPostData_select($groupID, $propertyID) {
        $filterId = self::getFilterID($groupID, $propertyID);
        self::addSearchFilterData($groupID,$propertyID,'select',self::getPostValue($filterId));
    }
    
    private static function getPostData_text($groupID, $propertyID) {
        $filterId = self::getFilterID($groupID, $propertyID);
        self::addSearchFilterData($groupID,$propertyID,'text',self::getPostValue($filterId));
    }
    
    public static function getFilters($groupID) {
        self::createObject();
        self::getShopGroupsProperties($groupID);
        self::getPostData($groupID);
        $out = self::getMainFilters($groupID);
        foreach (self::$allGroupProperties[$groupID] as $propertyID) {
            $out .= self::getFilter($groupID, $propertyID);
        }
        return self::getForms($out);
    }
    
}
