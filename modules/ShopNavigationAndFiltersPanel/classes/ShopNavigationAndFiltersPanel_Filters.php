<?php

/*
 * НЕ ИЗМЕНЯТЬ И НЕ УДАЛЯТЬ АВТОРСКИЕ ПРАВА И ЗАГОЛОВОК ФАЙЛА
 * 
 * Копирайт © 2010-2016, CompuProject и/или дочерние компании.
 * Все права защищены.
 * 
 * CSystem это программное обеспечение предоставленное и разработанное 
 * CompuProject в рамках проекта CSystem без каких либо сторонних изменений.
 * 
 * Распространение, использование исходного кода в любой форме и/или его 
 * модификация разрешается при условии, что выполняются следующие условия:
 * 
 * 1. При распространении исходного кода должно оставатсья указанное выше 
 *    уведомление об авторских правах, этот список условий и последующий 
 *    отказ от гарантий.
 * 
 * 2. При изменении исходного кода должно оставатсья указанное выше 
 *    уведомление об авторских правах, этот список условий, последующий 
 *    отказ от гарантий и пометка о сделанных изменениях.
 * 
 * 3. Распространение и/или изменение исходного кода должно происходить
 *    на условиях Стандартной общественной лицензии GNU в том виде, в каком 
 *    она была опубликована Фондом свободного программного обеспечения;
 *    либо лицензии версии 3, либо (по вашему выбору) любой более поздней
 *    версии. Вы должны были получить копию Стандартной общественной 
 *    лицензии GNU вместе с этой программой. Если это не так, см. 
 *    <http://www.gnu.org/licenses/>.
 * 
 * CSystem распространяется в надежде, что она будет полезной,
 * но БЕЗО ВСЯКИХ ГАРАНТИЙ; даже без неявной гарантии ТОВАРНОГО ВИДА
 * или ПРИГОДНОСТИ ДЛЯ ОПРЕДЕЛЕННЫХ ЦЕЛЕЙ. Подробнее см. в Стандартной
 * общественной лицензии GNU.
 * 
 * НИ ПРИ КАКИХ УСЛОВИЯХ ПРОЕКТ, ЕГО УЧАСТНИКИ ИЛИ CompuProject НЕ 
 * НЕСУТ ОТВЕТСТВЕННОСТИ ЗА КАКИЕ ЛИБО ПРЯМЫЕ, КОСВЕННЫЕ, СЛУЧАЙНЫЕ, 
 * ОСОБЫЕ, ШТРАФНЫЕ ИЛИ КАКИЕ ЛИБО ДРУГИЕ УБЫТКИ (ВКЛЮЧАЯ, НО НЕ 
 * ОГРАНИЧИВАЯСЬ ПРИОБРЕТЕНИЕМ ИЛИ ЗАМЕНОЙ ТОВАРОВ И УСЛУГ; ПОТЕРЕЙ 
 * ДАННЫХ ИЛИ ПРИБЫЛИ; ПРИОСТАНОВЛЕНИЕ БИЗНЕСА). 
 * 
 * ИСПОЛЬЗОВАНИЕ ДАННОГО ИСХОДНОГО КОДА ОЗНАЧАЕТ, ЧТО ВЫ БЫЛИ ОЗНАКОЛМЛЕНЫ
 * СО ВСЕМИ ПРАВАМИ, СТАНДАРТАМИ И УСЛОВИЯМИ, УКАЗАННЫМИ ВЫШЕ, СОГЛАСНЫ С НИМИ
 * И ОБЯЗУЕТЕСЬ ИХ СОБЛЮДАТЬ.
 * 
 * ЕСЛИ ВЫ НЕ СОГЛАСНЫ С ВЫШЕУКАЗАННЫМИ ПРАВАМИ, СТАНДАРТАМИ И УСЛОВИЯМИ, 
 * ТО ВЫ МОЖЕТЕ ОТКАЗАТЬСЯ ОТ ИСПОЛЬЗОВАНИЯ ДАННОГО ИСХОДНОГО КОДА.
 * 
 * Данная копия CSystem используется для проекта Apelsin SHOP
 * 
 */

/**
 * Description of ShopNavigationAndFiltersPanel_Filters
 *
 * @author Maxim Zaitsev
 * @copyright © 2010-2016, CompuProjec
 * @created 10.02.2016 11:12:35
 */
class ShopNavigationAndFiltersPanel_Filters {
    
    private $shopGroupsHelper;
    private $SQL_HELPER;
    private $urlHelper;
    private $thisGroup;
    private $allGroupProperties;
    private $allGroupPropertiesData;
    private $HTML;
    
    const SYSTEM_ROOT_GROUP = 'SYSTEM_ROOT_GROUP';


    public function __construct($shopGroupsHelper) {
        $this->shopGroupsHelper = $shopGroupsHelper;
        global $_SQL_HELPER;
        $this->SQL_HELPER = $_SQL_HELPER;
        $this->urlHelper = new UrlHelper();
        $this->thisGroup = ShopPageInfoHelper::shopPageGroupId();
        $this->getPostData($this->thisGroup);
        
        
        $this->generateHTML();
    }
    
    private function getPostData($groupID) {
        ShopPropertiesFilterTypeGetPostData::getPostData($groupID);
        $this->allGroupProperties = ShopPropertiesFilterTypeGetPostData::getAllGroupProperties();
        $this->allGroupPropertiesData = ShopPropertiesFilterTypeGetPostData::getAllGroupPropertiesData();
    }
    
    /**
     * Возвращает все известные значения указанного свойсвта для указанной группы и всех груп вложенных в нее
     * @param String $groupID - ID группы
     * @param String $propertyID - ID свойства
     * @return array - массив значений для свойсвта
     */
    private function getDataForFilter($groupID, $propertyID) {
        $childrenGroups = $this->shopGroupsHelper->getGroupChildren($groupID);
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
        $rezult = $this->SQL_HELPER->select($query);
        $values = array();
        foreach ($rezult as $key => $val) {
            $values[$key] = $val['value'];
        }
        return $values;
    }
    
    /**
     * Выбирает максимальное значение из массива
     * @param array $array
     * @return float
     */
    private function getMaxValue($array) {
        reset($array);
        $max = current($array);
        foreach ($array as $val) {
            if($max < $val) {
                $max = $val;
            }
        }
        return $max === NULL ? 0 : $max;
    }
    
    /**
     * Выбирает минимальное значение из массива
     * @param array $array
     * @return float
     */
    private function getMinValue($array) {
        reset($array);
        $min = current($array);
        foreach ($array as $val) {
            if($min > $val) {
                $min = $val;
            }
        }
        return $min === NULL ? 0 : $min;
    }
    
    /**
     * получаем максимальную длинну (в символах) значения
     * @param int $min
     * @param int $max
     * @return float
     */
    private function getRangeMaxlength($min,$max) {
        $min_l = strlen($min);
        $max_l = strlen($max);
        return $min_l > $max_l ? $min_l : $max_l;
    }
    
    
    /**
     * Данные из массива поиска
     * @param String $groupID - ID группы
     * @param String $propertyID - ID свойства
     * @return String - текущее значение свойсвта или NULL
     */
    private function getSearchFilterElementData($groupID, $propertyID) {
        $data = ShopPropertiesFilterSerchArray::getArrayGroupProperties($groupID);
        if(isset($data[$propertyID]['value'])) {
            return $data[$propertyID]['value'];
        } else {
            return NULL;
        }
    }
    
    private function getMainFilters_ItemName($groupID) {
        $value = $this->getSearchFilterElementData($groupID,ShopPropertiesFilterSerchArray::FILTER_TYPE_ITEM_NAME);
        $maxlength = 800;
        return InputHelper::textBox(
                ShopPropertiesFilterSerchArray::FILTER_TYPE_ITEM_NAME, 
                ShopPropertiesFilterSerchArray::FILTER_TYPE_ITEM_NAME, 
                'ShopFilterElementValueInput FilterTypeText '.ShopPropertiesFilterSerchArray::FILTER_TYPE_ITEM_NAME, 
                $maxlength, FALSE, $value, NULL);
    }
    
    private function getMainFilters_Action($groupID) {
        $value = $this->getSearchFilterElementData($groupID, ShopPropertiesFilterSerchArray::FILTER_TYPE_ACTION);
        if($value === NULL) {
            $value = 'all';
        }
        $actionArray = array();
        $actionArray[0]['text'] = 'Любой товар';
        $actionArray[0]['value'] = 'all';
        $actionArray[1]['text'] = 'Акционный товар';
        $actionArray[1]['value'] = '1';
        $actionArray[2]['text'] = 'Товар без акции';
        $actionArray[2]['value'] = '0';
        return InputHelper::select(
                ShopPropertiesFilterSerchArray::FILTER_TYPE_ACTION, 
                ShopPropertiesFilterSerchArray::FILTER_TYPE_ACTION, 
                $actionArray, true, $value);
    }
    
    private function getMainFilters_inStock($groupID) {
        $value = $this->getSearchFilterElementData($groupID, ShopPropertiesFilterSerchArray::FILTER_TYPE_IN_STOCK);
        if($value === NULL) {
            $value = 'inStockAndOrder';
        }
        $actionArray = array();
        $actionArray[0]['text'] = 'Весь товар';
        $actionArray[0]['value'] = 'all';
        $actionArray[1]['text'] = 'В наличии и под заказ';
        $actionArray[1]['value'] = 'inStockAndOrder';
        $actionArray[2]['text'] = 'В наличии';
        $actionArray[2]['value'] = 'inStock';
        return InputHelper::select(
                ShopPropertiesFilterSerchArray::FILTER_TYPE_IN_STOCK, 
                ShopPropertiesFilterSerchArray::FILTER_TYPE_IN_STOCK, 
                $actionArray, true, $value);
    }
    
    private function getMainFilters_ItemPrise($groupID) {
        $value = $this->getSearchFilterElementData($groupID,ShopPropertiesFilterSerchArray::FILTER_TYPE_ITEM_PRISE);
        if(!isset($value["min"]) || $value["min"]===NULL || $value["min"]==='') {
            $value["min"] = NULL;
        }
        if(!isset($value["max"]) || $value["max"]===NULL || $value["max"]==='') {
            $value["max"] = NULL;
        }
        $maxlength = 10;
        $pattern = '^[0-9.,-]+';
        $out = '';
        $out .= "<div class='FilterTypeRangeFromTo'>от</div>";
        $out .= InputHelper::paternTextBox(
                ShopPropertiesFilterSerchArray::FILTER_TYPE_ITEM_PRISE.'_min', 
                ShopPropertiesFilterSerchArray::FILTER_TYPE_ITEM_PRISE.'_min', 
                'ShopFilterElementValueInput FilterTypeRange MINrange '.ShopPropertiesFilterSerchArray::FILTER_TYPE_ITEM_PRISE.'_min', 
                $maxlength, FALSE, "Мин значение", $pattern, $value["min"], NULL);
        $out .= "<div class='FilterTypeRangeFromTo'>до</div>";
        $out .= InputHelper::paternTextBox(
                ShopPropertiesFilterSerchArray::FILTER_TYPE_ITEM_PRISE.'_max', 
                ShopPropertiesFilterSerchArray::FILTER_TYPE_ITEM_PRISE.'_max', 
                'ShopFilterElementValueInput FilterTypeRange MAXrange '.ShopPropertiesFilterSerchArray::FILTER_TYPE_ITEM_PRISE.'_max', 
                $maxlength, FALSE, "Макс значение", $pattern, $value["max"], NULL);
        return $out;
    }
    
    private function getMainFilters_Subgroup($groupID) {
        $value = $this->getSearchFilterElementData($groupID,ShopPropertiesFilterSerchArray::FILTER_TYPE_SUBGROUP);
        
        $startArray = array();
        if($groupID == null) {
            $startArray[0]['value'] = self::SYSTEM_ROOT_GROUP;
            $startArray[0]['text'] = 'Весь каталог';
        }
        $groupsArray = $this->getSubgroupValueList($groupID, 1, 0, 0, $startArray);
        
        if($value===NULL) {
            $value = $groupID;
        }
        return InputHelper::select(
                ShopPropertiesFilterSerchArray::FILTER_TYPE_SUBGROUP, 
                ShopPropertiesFilterSerchArray::FILTER_TYPE_SUBGROUP, 
                $groupsArray, true, $value);
    }
    
    private function getSubgroupValueList($groupID, $lvl, $thisCounter, $thisAllElements, $array) {
        if($groupID == NULL) {
            $counter = 1;
            $allElements = count($this->shopGroupsHelper->getGroupRoot());
            foreach ($this->shopGroupsHelper->getGroupRoot() as $subGroup) {
                $array = $this->getSubgroupValueList($subGroup, $lvl + 1, $counter++, $allElements, $array);
            }
        } else if(!empty($this->shopGroupsHelper->getGroupNodeChildren($groupID))) {
            $array[] = $this->getSubgroupValueListElement($groupID, $lvl, $thisCounter, $thisAllElements);
            $counter = 1;
            $allElements = count($this->shopGroupsHelper->getGroupNodeChildren($groupID));
            foreach ($this->shopGroupsHelper->getGroupNodeChildren($groupID) as $subGroup) {
                $array = $this->getSubgroupValueList($subGroup, $lvl + 1, $counter++, $allElements, $array);
            }
        } else {
            $array[] = $this->getSubgroupValueListElement($groupID, $lvl, $thisCounter, $thisAllElements);
        }
        return $array;
    }
    
    private function getSubgroupValueListElement($groupID, $lvl, $thisCounter, $thisAllElements) {
        $groupsArray['value'] = $groupID;
        $out = '';
        for ($i = 1; $i < $lvl; $i++) {
            $out .= "&#8195;";
        }        
        if(mb_strlen($out) > 0) {
            if($thisCounter == $thisAllElements) {
                $out .= '&#9492; ';
            } else {
                $out .= '&#9500; ';
            }
        }
        $out .= $this->shopGroupsHelper->getGroupName($groupID);
        $groupsArray['text'] = $out;
        return $groupsArray;
    }    
    
    /**
     * возвращает блок фильтра, основной
     * @param String $groupID - ID группы
     * @param String $propertyID - ID свойства
     * @return String - блок фильтра, основной
     */
    private function getMainFilterTypesValue($groupID, $propertyID) {
        $out = '';
        $out = '<div class="ShopFilterElementValueBlockConteiner" '
                . 'id="ShopFilterElementValueBlockConteiner_'.$propertyID.'" '
                . 'filterType="'.$propertyID.'">';
        switch ($propertyID) {
            case ShopPropertiesFilterSerchArray::FILTER_TYPE_ITEM_NAME:
                $out .= $this->getMainFilters_ItemName($groupID);
                break;
            case ShopPropertiesFilterSerchArray::FILTER_TYPE_ACTION:
                $out .= $this->getMainFilters_Action($groupID);
                break;
            case ShopPropertiesFilterSerchArray::FILTER_TYPE_IN_STOCK:
                $out .= $this->getMainFilters_inStock($groupID);
                break;
            case ShopPropertiesFilterSerchArray::FILTER_TYPE_ITEM_PRISE:
                $out .= $this->getMainFilters_ItemPrise($groupID);
                break;
            case ShopPropertiesFilterSerchArray::FILTER_TYPE_SUBGROUP:
                $out .= $this->getMainFilters_Subgroup($groupID);
                break;
            default:
                $out .= "?E: Unidentified Main Filter ?";
                break;
        }
        $out .= '</div>';
        return $out;
    }
    
    

    private function FilterType_bool($groupID, $propertyID) {
        $value = $this->getSearchFilterElementData($groupID,$propertyID);
        $filterId = ShopPropertiesFilterTypeGetPostData::getFilterID($groupID, $propertyID);
        $out = '';
        $out .= InputHelper::checkbox($filterId, $filterId, 'ShopFilterElementValueInput FilterTypeBool', FALSE, '1', $value, NULL);
        $out .= '<label for="'.$filterId.'"></label>';
        return $out;
    }
    
    private function FilterType_groupSelect($groupID, $propertyID) {
        $value = $this->getSearchFilterElementData($groupID,$propertyID);
        $filterId = ShopPropertiesFilterTypeGetPostData::getFilterID($groupID, $propertyID);
        $filterData = $this->getDataForFilter($groupID, $propertyID);
        if(empty($filterData)) {
            return $this->getNoDataFilterMessage();
        }
        $out = '<div class="ShopFilterGroupSelectShortValueBlock" id="FilterBlockShortValue_'.$propertyID.'">';
            $out .= '<div class="ShopFilterGroupSelectShortValue"><div>';
            if($value != null) {
                foreach ($value as $val) {
                    $out .= $val.", ";
                }
            }
            $out .= '</div></div>';
            $out .= '<div class="ShopFilterGroupSelectShortValueMoreButton" blockId="FilterBlockValue_'.$propertyID.'">';
            $out .= '...';
            $out .= '</div>';
        $out .= '</div>';
        if(count($filterData) < 1 ) {
            $SFGSEBClass = 'NOELEMENTS';
        }else if(count($filterData) == 1) {
            $SFGSEBClass = 'ONEELEMENT';
        }else if(count($filterData) == 2) {
            $SFGSEBClass = 'TWOELEMENTS';
        } else {
            $SFGSEBClass = 'MORTHENTHREEELEMENTS';
        }
        $out .= '<div class="ShopFilterGroupSelectElementsBlock '.$SFGSEBClass.'" id="FilterBlockValue_'.$propertyID.'">';
            $out .= '<div class="ShopFilterGroupSelectElementsBlockCloseButton"></div>';
            foreach ($filterData as $key => $val) {
                $out .= '<div class="ShopFilterGroupSelectElement">';
                
                $SBAttr['name'] = 'ShortBlockId';
                $SBAttr['value'] = 'FilterBlockShortValue_'.$propertyID;
                $ThisAttr['name'] = 'ThisBlockId';
                $ThisAttr['value'] = 'FilterBlockValue_'.$propertyID;
                
                $out .= InputHelper::checkbox($filterId.'['.$key.']', $filterId.'_'.$key, 
                        'ShopFilterElementValueInput FilterTypeGroupSelect', 
                        FALSE, $val, ($value!==NULL && in_array($val,$value)), NULL, array($SBAttr,$ThisAttr));
//                $out .= ' <label for="'.$filterId.'_'.$key.'">'.TextGenerator::shortenRusTextForLen($val, 25, 5, 6).'</label>';
                $out .= ' <label for="'.$filterId.'_'.$key.'">'.$val.'</label>';
                $out .= '<div></div>';
                $out .= '</div>';
            }
            $out .= '<div class="clear"></div>';
        $out .= '</div>';
        return $out;
    }
    
    private function FilterType_range($groupID, $propertyID) {
        $filterId = ShopPropertiesFilterTypeGetPostData::getFilterID($groupID, $propertyID);
        $filterData = $this->getDataForFilter($groupID, $propertyID);
        if(empty($filterData)) {
            return $this->getNoDataFilterMessage();
        }
        $min_v = $this->getMinValue($filterData);
        $max_v = $this->getmaxValue($filterData);
        $value = $this->getSearchFilterElementData($groupID,$propertyID);
        if(!isset($value["min"]) || $value["min"]===NULL || $value["min"]==='') {
            $value["min"] = NULL;
        }
        if(!isset($value["max"]) || $value["max"]===NULL || $value["max"]==='') {
            $value["max"] = NULL;
        }
        $maxlength = $this->getRangeMaxlength($min_v,$max_v);
        if($this->allGroupPropertiesData[$groupID][$propertyID]['valueType'] === 'int') {
            $pattern = '^[0-9]+';
        } else {
            $pattern = '^[0-9.,-]+';
        }
        $measure = ShopItemsPropertiesMeasureScaling::getPropertiesMeasure($propertyID);
        if(!empty(ShopItemsPropertiesMeasureScaling::getMeasureScaling($measure))) {
            $scalingClass = 'Scaling';
        } else {
            $scalingClass = 'NoScaling';
        }
        $out = '';
        $out .= "<div class='FilterTypeRangeFromTo'>от</div>";
        $out .= InputHelper::paternTextBox(
                $filterId.'_min', 
                $filterId.'_min', 
                'ShopFilterElementValueInput FilterTypeRange MINrange '.$scalingClass.' '.$filterId.'_min', 
                $maxlength, FALSE, ShopItemsPropertiesMeasureScaling::ScalingMeasureString($measure, $min_v), 
                $pattern, $value["min"], NULL);
        $out .= $this->MeasureScalingSelect($filterId, $measure, null, '_min_measure');
        $out .= "<div class='FilterTypeRangeFromTo'>до</div>";
        $out .= InputHelper::paternTextBox(
                $filterId.'_max', 
                $filterId.'_max', 
                'ShopFilterElementValueInput FilterTypeRange MAXrange '.$scalingClass.' '.$filterId.'_max', 
                $maxlength, FALSE, ShopItemsPropertiesMeasureScaling::ScalingMeasureString($measure, $max_v), 
                $pattern, $value["max"], NULL);
        $out .= $this->MeasureScalingSelect($filterId, $measure, null, '_max_measure');
        return $out;
    }
    
    private function MeasureScalingSelect($filterId, $measure, $value, $postfix = "") {
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
            return InputHelper::selectBox($filterId.$postfix, $filterId.$postfix, 'ScalingSelect', $array, true, $value);
        } else {
            return "";
        }
    }
    
    private function FilterType_select($groupID, $propertyID) {
        $value = $this->getSearchFilterElementData($groupID,$propertyID);
        $filterId = ShopPropertiesFilterTypeGetPostData::getFilterID($groupID, $propertyID);
        $filterData = $this->getDataForFilter($groupID, $propertyID);
        if(empty($filterData)) {
            return $this->getNoDataFilterMessage();
        }
        $selectData = array();
        foreach ($filterData as $key => $val) {
            $selectData[$key]['value'] = $selectData[$key]['text'] = $val;
        }
        return InputHelper::select($filterId, $filterId, $selectData, FALSE, $value, NULL);
    }
    
    private static function FilterType_text($groupID, $propertyID) {
        $value = $this->getSearchFilterElementData($groupID,$propertyID);
        $filterId = ShopPropertiesFilterTypeGetPostData::getFilterID($groupID, $propertyID);
        $maxlength = 800;
        return InputHelper::textBox($filterId, $filterId, 'ShopFilterElementValueInput FilterTypeText '.$filterId, $maxlength, FALSE, $value, NULL);
    }
    
    private function getNoDataFilterMessage() {
        return '<div class="NoData">Нет данных для фильтра</div>';
    }

    /**
     * возвращает блок фильтра, для группы
     * @param String $groupID - ID группы
     * @param String $propertyID - ID свойства
     * @return String - блок фильтра, для группы
     */
    private function getGroupFilterTypesValue($groupID, $propertyID) {
        $out = '<div class="ShopFilterElementValueBlockConteiner" '
                . 'id="ShopFilterElementValueBlockConteiner_'.$propertyID.'" '
                . 'filterType="'.$this->allGroupPropertiesData[$groupID][$propertyID]['filterType'].'">';
        switch ($this->allGroupPropertiesData[$groupID][$propertyID]['filterType']) {
            case 'bool':
                $out .= $this->FilterType_bool($groupID, $propertyID);
                break;
            case 'groupSelect':
                $out .= $this->FilterType_groupSelect($groupID, $propertyID);
                break;
            case 'range':
                $out .= $this->FilterType_range($groupID, $propertyID);
                break;
            case 'select':
                $out .= $this->FilterType_select($groupID, $propertyID);
                break;
            case 'text':
                $out .= $this->FilterType_text($groupID, $propertyID);
                break;
            case 'none':
                $out .= '';
                break;
            default:
                $out .= "?E: Unidentified Filter Type ?";
                break;
        }
        $out .= '</div>';
        return $out;
    }
    
    /**
     * Название фильтра
     * @param String $groupID - ID группы
     * @param String $propertyID - ID свойства
     * @return String Название фильтра
     */
    private function getFilterName($groupID, $propertyID) {
        $out = '';
        if( ShopPropertiesFilterSerchArray::isMainFilterTypes($propertyID) ) {
            $filterType = ShopPropertiesFilterSerchArray::getMainFilterType($propertyID);
            if($filterType != null && isset($filterType['text'])) {
                $out = "<div>" . $filterType['text'] . "</div>";
            } else {
                return "?E: Unidentified Main Filter Text ?";
            }
        } else {
            return "<div>" . $this->allGroupPropertiesData[$groupID][$propertyID]['propertyName'] . "</div>";
        }
        return $out;
    }
    
    /**
     * Название фильтра
     * @param String $groupID - ID группы
     * @param String $propertyID - ID свойства
     * @return String Название фильтра
     */
    private function getFilterValue($groupID, $propertyID) {
        if( ShopPropertiesFilterSerchArray::isMainFilterTypes($propertyID) ) {
            return $this->getMainFilterTypesValue($groupID, $propertyID);
        } else if(isset($this->allGroupPropertiesData[$groupID][$propertyID])) {
            return $this->getGroupFilterTypesValue($groupID, $propertyID);
        } else {
            return "?E: Unidentified Group Filter ?";
        }
    }

    /**
     * Получаем блок фильтра
     * @param String $groupID - ID группы
     * @param String $propertyID - ID свойства
     * @return String - блок фильтра
     */
    private function getFilterBlock($groupID, $propertyID) {
        $out = '';
        if(!isset($this->allGroupPropertiesData[$groupID][$propertyID]['filterType']) || $this->allGroupPropertiesData[$groupID][$propertyID]['filterType'] != 'none') {
            $out .= '<div class="ShopFilterElementBlock" id="ShopFilterElementBlock_'.$propertyID.'">';
            $out .= '<div class="ShopFilterElementUnsetButton" propertyId="'.$propertyID.'"></div>';
            $out .= '<div class="ShopFilterElementNameBlock">';
            $out .= $this->getFilterName($groupID, $propertyID);
            $out .= '</div>';
            $out .= '<div class="ShopFilterElementValueBlock">';
            $out .= $this->getFilterValue($groupID, $propertyID);
            $out .= '</div>';
            $out .= '</div>';
        }
        return $out;
    }

    private function getFilters() {
        $out = '';
        foreach (ShopPropertiesFilterSerchArray::getMainFilterTypes() as $mainType) {
            $out .= $this->getFilterBlock($this->thisGroup, $mainType['name']);
        }
        foreach ($this->allGroupProperties[$this->thisGroup] as $propertyID) {
            $out .= $this->getFilterBlock($this->thisGroup, $propertyID);
        }
        return $out;
    }
    
    private function generateHTML() {
        if(ShopPageInfoHelper::shopPageGroupId() !== null) {
            $url = ShopGroupsUrlHelper::getUrl(array('catalog',ShopPageInfoHelper::shopPageGroupId()));
        } else {
            $url = ShopGroupsUrlHelper::getUrl(array());
        }
        $this->HTML = '<div id="ShopFilterBlock" class="ShopNavigationAndFiltersPanelElement ShopFilterBlock">';
        $this->HTML .= '<form class="ShopPropertiesFilterForm" '
                . 'name="ShopPropertiesFilterForm" '
                . 'action="'.$url.'" '
                . 'enctype="multipart/form-data" '
                . 'method="post" '
                . 'accept-charset="UTF-8">';
        $this->HTML .= $this->getFilters();
//        $this->HTML .= '<hr>';
//        $this->HTML .= ShopPropertiesFilterType::getFilters(ShopPageInfoHelper::shopPageGroupId());
        $this->HTML .= ShopPropertiesFilterType::getJS(ShopPageInfoHelper::shopPageGroupId());
        $this->HTML .= '</form>';
        $this->HTML .= '</div>';
    }
    
    public function getHtml() {
        return $this->HTML;
    }
    
    public function get() {
        echo $this->HTML;
    }
    
}
