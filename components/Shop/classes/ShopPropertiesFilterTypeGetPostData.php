<?php
class ShopPropertiesFilterTypeGetPostData { 
    
    static private $object;
    static private $searchFilterDataArray;
    static private $SQL_HELPER;
    static private $allGroupProperties;
    static private $allGroupPropertiesData;
    static private $shopGroupsHelper;
    
    private function __construct() {
        self::$shopGroupsHelper = new ShopGroupsHelper();
        global $_SQL_HELPER;
        self::$SQL_HELPER = $_SQL_HELPER;
    }
    
    /**
     * создание объекта
     */
    private static function createObject() {
        if(!isset(self::$object)) {
            self::$object = new ShopPropertiesFilterTypeGetPostData();
        }
    }
    
    private static function getShopGroupsPropertiesID($groupID) {
        if(!isset(self::$allGroupProperties[$groupID]) || empty(self::$allGroupProperties[$groupID])) {
            self::$allGroupProperties[$groupID] = array();
            $properties = self::getShopGroupPropertiesData ($groupID);
            foreach ($properties as $property) {
                self::$allGroupProperties[$groupID][] = $property['property'];
                self::$allGroupPropertiesData[$groupID][$property['property']] = $property;
            }
        }
    }

    private static function getShopGroupPropertiesData ($groupID) {
        $query = "SELECT
            SPIGR.`group`,
            SPIGR.`property`,
            SPIGR.`sequence`,
            SP.`propertyName`,
            SP.`filterType`,
            SP.`valueType`,
            SP.`oneOfAllValues`
            FROM
                (SELECT
                SPIG.`property`,
                SPIG.`group`,
                SPIGR.`sequence`
                FROM `ShopPropertiesInGroupsRanking` AS SPIGR
                LEFT JOIN `ShopPropertiesInGroups` AS SPIG
                on SPIGR.`propertyInGroup` = SPIG.`id`
                WHERE SPIGR.`group`='".$groupID."' 
                AND SPIGR.`shown` > 0) AS SPIGR
            LEFT JOIN `ShopProperties` AS SP
            ON SPIGR.`property` = SP.`id`
            ORDER BY SPIGR.`sequence` ASC";
        return self::$SQL_HELPER->select($query);
    }
    
    private static function getGroupPath($groupID) {
        $groups = self::$shopGroupsHelper->getGroupPath($groupID);
        $groups[] = $groupID;
        return $groups;
    }
    
    private static function getPostValue($id, $falseValue = NULL) {
        if(isset($_POST[$id]) && $_POST[$id]!==NULL && $_POST[$id]!==NULL) {
            return $_POST[$id];
        } else {
            return $falseValue;
        }
    }
    
    private static function addSearchFilterData($groupID,$propertyID,$type,$value) {
        if($value!==NULL && $value!=='' && $value!==array()) {
            self::$searchFilterDataArray[$groupID][$propertyID]['type'] = $type;
            self::$searchFilterDataArray[$groupID][$propertyID]['value'] = $value;
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
    
    private static function getPostData_range($groupID, $propertyID) {
        $filterId_min = self::getFilterID($groupID, $propertyID).'_min';
        $filterId_max = self::getFilterID($groupID, $propertyID).'_max';
        $filterId_min_measure = self::getFilterID($groupID, $propertyID).'_min_measure';
        $filterId_max_measure = self::getFilterID($groupID, $propertyID).'_max_measure';
        
        $measure = ShopItemsPropertiesMeasureScaling::getPropertiesMeasure($propertyID);
        
        $min = self::getPostValue($filterId_min);
        $max = self::getPostValue($filterId_max);
        
        if(($min!==NULL && $min!=='') || ($max!==NULL && $max!=='')) {
            $min_measure = self::getPostValue($filterId_min_measure);
            $max_measure = self::getPostValue($filterId_max_measure);
            if($min_measure != $measure) {
                $min = ShopItemsPropertiesMeasureScaling::ConvertMeasureToSI($measure, $min, $min_measure);
            }
            if($max_measure != $measure) {
                $max = ShopItemsPropertiesMeasureScaling::ConvertMeasureToSI($measure, $max, $max_measure);
            }

            $value = array();
            if($min!==NULL && $min!=='' && $max!==NULL && $max!=='') {
                $value['min'] = min($min, $max);
                $value['max'] = max($min, $max);
            } else {
                if($min!==NULL && $min!=='') {
                    $value['min']=$min;
                }
                if($max!==NULL && $max!=='') {
                    $value['max']=$max;
                }
            }
            self::addSearchFilterData($groupID,$propertyID,'range',$value);
        }
    }
    
    private static function getPostData_select($groupID, $propertyID) {
        $filterId = self::getFilterID($groupID, $propertyID);
        self::addSearchFilterData($groupID,$propertyID,'select',self::getPostValue($filterId));
    }
    
    private static function getPostData_text($groupID, $propertyID) {
        $filterId = self::getFilterID($groupID, $propertyID);
        self::addSearchFilterData($groupID,$propertyID,'text',self::getPostValue($filterId));
    }
    
    
    private static function getShopGroupsProperties($groupID) {
        self::createObject();
        self::getShopGroupsPropertiesID($groupID);
        self::getShopGroupPropertiesData($groupID);
    }
    
    public static function getPostData($groupID) {
        self::createObject();
        self::getShopGroupsProperties($groupID);
        if(isset($_POST['ShopPropertiesFilterFormSubmit']) && $_POST['ShopPropertiesFilterFormSubmit']!=='') {            
            self::$searchFilterDataArray[$groupID] = array();
            self::addSearchFilterData($groupID, 'ItemName', 'main', self::getPostValue('ItemName', NULL));
            self::addSearchFilterData($groupID, 'Action', 'main', self::getPostValue('Action', NULL));
            self::addSearchFilterData($groupID, 'InStock', 'main', self::getPostValue('InStock', NULL));
            $itemPrise_min = self::getPostValue('ItemPrise_min', NULL);
            $itemPrise_max = self::getPostValue('ItemPrise_max', NULL);
            $itemPriseValue = array();
            
            
            if($itemPrise_min!==NULL && $itemPrise_min!=='' && $itemPrise_max!==NULL && $itemPrise_max!=='') {
                $itemPriseValue['min'] = min($itemPrise_min, $itemPrise_max);
                $itemPriseValue['max'] = max($itemPrise_min, $itemPrise_max);
            } else {
                if($itemPrise_min!==NULL && $itemPrise_min!=='') {
                    $itemPriseValue['min']=$itemPrise_min;
                }
                if($itemPrise_max!==NULL && $itemPrise_max!=='') {
                    $itemPriseValue['max']=$itemPrise_max;
                }
            }
            self::addSearchFilterData($groupID, 'ItemPrise', 'main', $itemPriseValue);
            $subgroup = self::getPostValue('Subgroup', $groupID);
            if($subgroup == ShopNavigationAndFiltersPanel_Filters::SYSTEM_ROOT_GROUP) {
                $subgroup = null;
            }
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
                        case 'range':
                            self::getPostData_range($groupID, $propertyID);
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
    
    public static function getAllGroupProperties() {
        self::createObject();
        return self::$allGroupProperties;
    }
    
    public static function getAllGroupPropertiesData() {
        self::createObject();
        return self::$allGroupPropertiesData;
    }
    
    public static function getFilterID($groupID, $propertyID) {
        return $groupID."_".$propertyID;
    }
}
