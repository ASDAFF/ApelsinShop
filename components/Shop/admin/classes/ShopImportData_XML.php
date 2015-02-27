<?php
/**
 * Клас для импортирвоания данный из XML файла
 *
 * @author maxim
 */
class ShopImportData_XML {
    private $SQL_HELPER;
    private $FILE = './resources/Components/Shop/ImportFilesXML/';
    
    private $FILE_BUFFER = array();
    private $DATA_XML = array();
    private $DATA_MYSQL = array();
    private $ERRORS = array();
    private $WARNINGS = array();
    
    private $constantDataSet = array();
    private $xmlDataIdSet = array();
    private $fileName ;
    
    public function __construct($fileName) {
        $this->fileName = $fileName;
        $this->FILE .= $this->fileName;
        global $_SQL_HELPER;
        $this->SQL_HELPER = $_SQL_HELPER;
        $this->getMysqlData();
        $this->getXmlData();
    }
    private function getMysqlData() {
        $this->DATA_MYSQL = array();
        $this->getMysqlData_PropertiesFilterType();
        $this->getMysqlData_PropertiesValueType();
    }
    private function getMysqlData_PropertiesFilterType() {
        $query = 'SELECT * FROM `ShopPropertiesFilterType`;';
        $result = $this->SQL_HELPER->select($query);
        $this->DATA_MYSQL['PropertiesFilterType'] = array();
        foreach ($result as $element) {
            $this->DATA_MYSQL['PropertiesFilterType'][] = $element['type'];
        }
    }
    private function getMysqlData_PropertiesValueType() {
        $query = 'SELECT * FROM `ShopPropertiesValueType`;';
        $result = $this->SQL_HELPER->select($query);
        $this->DATA_MYSQL['PropertiesValueType'] = array();
        foreach ($result as $element) {
            $this->DATA_MYSQL['PropertiesValueType'][] = $element['type'];
        }
    }
    private function getXmlData() {
        $xmlwebi = new XML();
        $data = $xmlwebi->xmlwebi($this->FILE);
//        echo '<pre>';
//        var_dump($data);
//        echo '</pre>';
        $this->FILE_BUFFER = $data['BodyUpload'][0]['#'];        
        $this->getXmlData_SystemInformation();
        $this->getXmlData_PricesTypes();
        $this->getXmlData_Properties();
        $this->getXmlData_Groups();
        $this->getXmlData_GroupsHierarchy();
        $this->getXmlData_PropertiesInGroups();
        $this->getXmlData_Items();
    }
    private function checkXmlDataInArray($array,$key) {
        return isset($array[$key][0]['#']) && $array[$key][0]['#']!==null && $array[$key][0]['#']!=='';
    }
    private function getErrorTextNoBlock($block,$number = null) {
        $out = 'Отсутствует блок <span class="WarErrTextId">'.$block.'</span>.';
        if($number !== null) {
            $out .= 'Порядковый номер блока:<span class="WarErrTextName">'.($number+1).'</span>.';
        }
        return $out;
    }
    private function getErrorTextNoBlock_ID($block,$id) {
        return 'Отсутствует блок <span class="WarErrTextId">'.$block.'</span>. ID блока:<span class="WarErrTextName">'.$id.'</span>.';
    }
    private function getXmlData_SystemInformation() {
        if(!isset($this->FILE_BUFFER['SystemInformation'][0]['#'])) {
            $this->ERRORS[] = $this->getErrorTextNoBlock('SystemInformation');
        } else {
            $systemInformation = $this->FILE_BUFFER['SystemInformation'][0]['#'];
            if($this->checkXmlData_SystemInformation($systemInformation)) {
                $exportDateTime = $systemInformation['ExportDateTime'][0]['#'];
                $this->DATA_XML['SystemInformation']['ExportDateTime'] = '';
                $this->DATA_XML['SystemInformation']['ExportDateTime'] .= $exportDateTime['year'][0]['#'].'-';
                $this->DATA_XML['SystemInformation']['ExportDateTime'] .= $exportDateTime['month'][0]['#'].'-';
                $this->DATA_XML['SystemInformation']['ExportDateTime'] .= $exportDateTime['day'][0]['#'].' ';
                $this->DATA_XML['SystemInformation']['ExportDateTime'] .= $exportDateTime['hours'][0]['#'].':';
                $this->DATA_XML['SystemInformation']['ExportDateTime'] .= $exportDateTime['minutes'][0]['#'].':';
                $this->DATA_XML['SystemInformation']['ExportDateTime'] .= $exportDateTime['seconds'][0]['#'];
                $this->DATA_XML['SystemInformation']['ExportDateTime2'] = '';
                $this->DATA_XML['SystemInformation']['ExportDateTime2'] .= $exportDateTime['year'][0]['#'].'.';
                $this->DATA_XML['SystemInformation']['ExportDateTime2'] .= $exportDateTime['month'][0]['#'].'.';
                $this->DATA_XML['SystemInformation']['ExportDateTime2'] .= $exportDateTime['day'][0]['#'].' ';
                $this->DATA_XML['SystemInformation']['ExportDateTime2'] .= $exportDateTime['hours'][0]['#'].':';
                $this->DATA_XML['SystemInformation']['ExportDateTime2'] .= $exportDateTime['minutes'][0]['#'].':';
                $this->DATA_XML['SystemInformation']['ExportDateTime2'] .= $exportDateTime['seconds'][0]['#'];
                $this->DATA_XML['SystemInformation']['ExportDateTime3'] = '';
                $this->DATA_XML['SystemInformation']['ExportDateTime3'] .= $exportDateTime['year'][0]['#'].'.';
                $this->DATA_XML['SystemInformation']['ExportDateTime3'] .= $exportDateTime['month'][0]['#'].'.';
                $this->DATA_XML['SystemInformation']['ExportDateTime3'] .= $exportDateTime['day'][0]['#'].'_';
                $this->DATA_XML['SystemInformation']['ExportDateTime3'] .= $exportDateTime['hours'][0]['#'].':';
                $this->DATA_XML['SystemInformation']['ExportDateTime3'] .= $exportDateTime['minutes'][0]['#'].':';
                $this->DATA_XML['SystemInformation']['ExportDateTime3'] .= $exportDateTime['seconds'][0]['#'];
                $this->DATA_XML['SystemInformation']['FullExport'] = $systemInformation['FullExport'][0]['#'] == 1;
                $this->DATA_XML['SystemInformation']['user'] = $systemInformation['user'][0]['#'];
            } else {
                $this->DATA_XML['SystemInformation']['ExportDateTime'] = '';
                $this->DATA_XML['SystemInformation']['FullExport'] = '';
                $this->DATA_XML['SystemInformation']['user'] = '';
            }
        }
    }
    private function checkXmlData_SystemInformation($systemInformation) {
        $noError = true;
        if(!$this->checkXmlDataInArray($systemInformation,'FullExport')) {
            $this->ERRORS[] = $this->getErrorTextNoBlock('SystemInformation::FullExport');
            $noError = false;
        }
        if(!$this->checkXmlDataInArray($systemInformation,'ExportDateTime')) {
            $this->ERRORS[] = $this->getErrorTextNoBlock('SystemInformation::ExportDateTime');
            $noError = false;
        } else {
            $exportDateTime = $systemInformation['ExportDateTime'][0]['#'];
            if(!$this->checkXmlDataInArray($exportDateTime,'year')) {
                $this->ERRORS[] = $this->getErrorTextNoBlock('SystemInformation::ExportDateTime::year');
                $noError = false;
            }
            if(!$this->checkXmlDataInArray($exportDateTime,'month')) {
                $this->ERRORS[] = $this->getErrorTextNoBlock('SystemInformation::ExportDateTime::month');
                $noError = false;
            }
            if(!$this->checkXmlDataInArray($exportDateTime,'day')) {
                $this->ERRORS[] = $this->getErrorTextNoBlock('SystemInformation::ExportDateTime::day');
                $noError = false;
            }
            if(!$this->checkXmlDataInArray($exportDateTime,'hours')) {
                $this->ERRORS[] = $this->getErrorTextNoBlock('SystemInformation::ExportDateTime::hours');
                $noError = false;
            }
            if(!$this->checkXmlDataInArray($exportDateTime,'minutes')) {
                $this->ERRORS[] = $this->getErrorTextNoBlock('SystemInformation::ExportDateTime::minutes');
                $noError = false;
            }
            if(!$this->checkXmlDataInArray($exportDateTime,'seconds')) {
                $this->ERRORS[] = $this->getErrorTextNoBlock('SystemInformation::ExportDateTime::seconds');
                $noError = false;
            }
        }
        if(!$this->checkXmlDataInArray($systemInformation,'user')) {
            $this->ERRORS[] = $this->getErrorTextNoBlock('SystemInformation::user');
            $noError = false;
        }
        return $noError;
    }
    private function getXmlData_PricesTypes() {
        $this->xmlDataIdSet['PricesTypes'] = array();
        $default = 0;
        if(!isset($this->FILE_BUFFER['PricesTypes'][0]['#']['type'] )) {
            $this->ERRORS[] = $this->getErrorTextNoBlock('PricesTypes');
        } else {
            foreach ($this->FILE_BUFFER['PricesTypes'][0]['#']['type'] as $key => $type) {
                if(isset($type['#'])) {
                    if($this->checkXmlData_PricesTypes($key,$type['#'])) {
                        $this->xmlDataIdSet['PricesTypes'][] = $type['#']['id'][0]['#'];
                        $this->DATA_XML['PricesTypes'][$key]['id'] = $type['#']['id'][0]['#'];
                        $this->DATA_XML['PricesTypes'][$key]['typeName'] = $type['#']['typeName'][0]['#'];
                        if($type['#']['default'][0]['#'] !== '1' && $type['#']['default'][0]['#'] !== '0') {
                            $this->ERRORS[] = 'Некорректное значение default для типа цен <span class="WarErrTextId">'.$type['#']['id'][0]['#'].'</span>';
                        }
                        $this->DATA_XML['PricesTypes'][$key]['default'] = $type['#']['default'][0]['#'];
                        
                        $default += $type['#']['default'][0]['#'];
                    }
                } else {
                    $this->ERRORS[] = $this->getErrorTextNoBlock('PricesTypes::type',$key);
                }
            }
            if($default < 1) {
                $this->ERRORS[] = 'Не один из типов цен не был выбран по умолчанию';
            } else if($default > 1) {
                $this->WARNINGS[] = 'Более одного типа цен были выбраны по умолчанию';
            }
        }
    }
    private function checkXmlData_PricesTypes($key,$type) {
        $noError = true;
        $goodID = true;
        if (!$this->checkXmlDataInArray($type, 'id')) {
            $this->ERRORS[] = $this->getErrorTextNoBlock('PricesTypes::type::id',$key);
            $noError = false;
            $goodID = false;
        }
        if (!$this->checkXmlDataInArray($type, 'typeName')) {
            $block = 'PricesTypes::type::typeName';
            if($goodID) {
                $this->ERRORS[] = $this->getErrorTextNoBlock_ID($block,$type['id'][0]['#']);
            } else {
                $this->ERRORS[] = $this->getErrorTextNoBlock($block,$key);
            }
            $noError = false;
        }
        if (!$this->checkXmlDataInArray($type, 'default')) {
            $block = 'PricesTypes::type::default';
            if($goodID) {
                $this->ERRORS[] = $this->getErrorTextNoBlock_ID($block,$type['id'][0]['#']);
            } else {
                $this->ERRORS[] = $this->getErrorTextNoBlock($block,$key);
            }
            $noError = false;
        }
        return $noError;
    }
    private function getXmlData_Properties() {
        $this->constantDataSet = array();
        $this->xmlDataIdSet['Properties'] = array();
        if(!isset($this->FILE_BUFFER['PricesTypes'][0]['#']['type'])) {
            $this->ERRORS[] = $this->getErrorTextNoBlock('Properties');
        } else {
            foreach ($this->FILE_BUFFER['Properties'][0]['#']['property'] as $key => $property) {
                if(isset($property['#'])) {
                    if($this->checkXmlData_Properties($key,$property['#'])) {
                        $this->xmlDataIdSet['Properties'][] = $property['#']['id'][0]['#'];
                        $this->DATA_XML['Properties'][$key]['id'] = $property['#']['id'][0]['#'];
                        $this->DATA_XML['Properties'][$key]['propertyName'] = $property['#']['propertyName'][0]['#'];
                        $this->DATA_XML['Properties'][$key]['filterType'] = $property['#']['filterType'][0]['#'];
                        $this->DATA_XML['Properties'][$key]['valueType'] = $property['#']['valueType'][0]['#'];
                        if($property['#']['oneOfAllValues'][0]['#'] !== '1' && $property['#']['oneOfAllValues'][0]['#'] !== '0') {
                            $this->ERRORS[] = 'Некорректное значение oneOfAllValues для свойства <span class="WarErrTextId">'.$property['#']['id'][0]['#'].'</span>';
                        }
                        $this->DATA_XML['Properties'][$key]['oneOfAllValues'] = $property['#']['oneOfAllValues'][0]['#'];
                        $this->addConstantDataSetValue('filterType', $property['#']['filterType'][0]['#']);
                        $this->addConstantDataSetValue('valueType', $property['#']['valueType'][0]['#']);
                        if(!in_array($property['#']['filterType'][0]['#'],$this->DATA_MYSQL['PropertiesFilterType'])) {
                            $this->ERRORS[] = 'Для свойства <span class="WarErrTextId">'.$property['#']['id'][0]['#'].'</span> указан неизвестный тип фильтров <span class="WarErrTextName">'.$property['#']['filterType'][0]['#'].'</span>';
                        }
                        if(!in_array($property['#']['valueType'][0]['#'],$this->DATA_MYSQL['PropertiesValueType'])) {
                            $this->ERRORS[] = 'Для свойства <span class="WarErrTextId">'.$property['#']['id'][0]['#'].'</span> указан неизвестный тип значения <span class="WarErrTextName">'.$property['#']['valueType'][0]['#'].'</span>';
                        }
                    }
                } else {
                    $this->ERRORS[] = $this->getErrorTextNoBlock('Properties::property',$key);
                }
            }
        }
    }
    private function checkXmlData_Properties($key,$property) {
        $noError = true;
        $goodID = true;
        if (!$this->checkXmlDataInArray($property, 'id')) {
            $this->ERRORS[] = $this->getErrorTextNoBlock('Properties::property::id',$key);
            $noError = false;
            $goodID = false;
        }
        if (!$this->checkXmlDataInArray($property, 'propertyName')) {
            $block = 'Properties::property::propertyName';
            if($goodID) {
                $this->ERRORS[] = $this->getErrorTextNoBlock_ID($block,$property['id'][0]['#']);
            } else {
                $this->ERRORS[] = $this->getErrorTextNoBlock($block,$key);
            }
            $noError = false;
        }
        if (!$this->checkXmlDataInArray($property, 'filterType')) {
            $block = 'Properties::property::filterType';
            if($goodID) {
                $this->ERRORS[] = $this->getErrorTextNoBlock_ID($block,$property['id'][0]['#']);
            } else {
                $this->ERRORS[] = $this->getErrorTextNoBlock($block,$key);
            }
            $noError = false;
        }
        if (!$this->checkXmlDataInArray($property, 'valueType')) {
            $block = 'Properties::property::valueType';
            if($goodID) {
                $this->ERRORS[] = $this->getErrorTextNoBlock_ID($block,$property['id'][0]['#']);
            } else {
                $this->ERRORS[] = $this->getErrorTextNoBlock($block,$key);
            }
            $noError = false;
        }
        if (!$this->checkXmlDataInArray($property, 'oneOfAllValues')) {
            $block = 'Properties::property::oneOfAllValues';
            if($goodID) {
                $this->ERRORS[] = $this->getErrorTextNoBlock_ID($block,$property['id'][0]['#']);
            } else {
                $this->ERRORS[] = $this->getErrorTextNoBlock($block,$key);
            }
            $noError = false;
        }
        return $noError;
    }
    private function getXmlData_Groups() {
        $this->xmlDataIdSet['Groups'] = array();
        if(!isset($this->FILE_BUFFER['Groups'][0]['#']['Group'])) {
            $this->ERRORS[] = $this->getErrorTextNoBlock('Groups');
        } else {
            foreach ($this->FILE_BUFFER['Groups'][0]['#']['Group'] as $key => $group) {
                if(isset($group['#'])) {
                    if($this->checkXmlData_Groups($key,$group['#'])) {
                        $this->xmlDataIdSet['Groups'][] = $group['#']['id'][0]['#'];
                        $this->DATA_XML['Groups'][$key]['id'] = $group['#']['id'][0]['#'];
                        $this->DATA_XML['Groups'][$key]['groupName'] = $group['#']['groupName'][0]['#'];
                        $this->DATA_XML['Groups'][$key]['shown'] = $group['#']['shown'][0]['#'];
                        $this->DATA_XML['Groups'][$key]['showInHierarchy'] = $group['#']['showInHierarchy'][0]['#'];
                        if($group['#']['shown'][0]['#'] != '1' && $group['#']['shown'][0]['#'] != '0') {
                            $this->ERRORS[] = 'Неверное значение поля shown для группы <span class="WarErrTextId">'.$group['#']['id'][0]['#'].'</span>';
                        }
                        if($group['#']['showInHierarchy'][0]['#'] != '1' && $group['#']['showInHierarchy'][0]['#'] != '0') {
                            $this->ERRORS[] = 'Неверное значение поля showInHierarchy для группы <span class="WarErrTextId">'.$group['#']['id'][0]['#'].'</span>';
                        }
                    }
                } else {
                    $this->ERRORS[] = $this->getErrorTextNoBlock('Groups::Group',$key);
                }
            }
        }
    }
    private function checkXmlData_Groups($key,$group) {
        $noError = true;
        $goodID = true;
        if (!$this->checkXmlDataInArray($group, 'id')) {
            $this->ERRORS[] = $this->getErrorTextNoBlock('Groups::Group::id',$key);
            $noError = false;
            $goodID = false;
        }
        if (!$this->checkXmlDataInArray($group, 'groupName')) {
            $block = 'Groups::Group::groupName';
            if($goodID) {
                $this->ERRORS[] = $this->getErrorTextNoBlock_ID($block,$group['id'][0]['#']);
            } else {
                $this->ERRORS[] = $this->getErrorTextNoBlock($block,$key);
            }
            $noError = false;
        }
        if (!$this->checkXmlDataInArray($group, 'shown')) {
            $block = 'Groups::Group::shown';
            if($goodID) {
                $this->ERRORS[] = $this->getErrorTextNoBlock_ID($block,$group['id'][0]['#']);
            } else {
                $this->ERRORS[] = $this->getErrorTextNoBlock($block,$key);
            }
            $noError = false;
        }
        if (!$this->checkXmlDataInArray($group, 'showInHierarchy')) {
            $block = 'Groups::Group::showInHierarchy';
            if($goodID) {
                $this->ERRORS[] = $this->getErrorTextNoBlock_ID($block,$group['id'][0]['#']);
            } else {
                $this->ERRORS[] = $this->getErrorTextNoBlock($block,$key);
            }
            $noError = false;
        }
        return $noError;
    }
    private function getXmlData_GroupsHierarchy() {
        $this->xmlDataIdSet['GroupsHierarchy'] = array();
        if(!isset($this->FILE_BUFFER['GroupsHierarchy'][0]['#']['Relation'])) {
            $this->WARNINGS[] = $this->getErrorTextNoBlock('GroupsHierarchy');
        } else {
            foreach ($this->FILE_BUFFER['GroupsHierarchy'][0]['#']['Relation'] as $key => $groupHierarchy) {
                if(isset($groupHierarchy['#'])) {
                    if($this->checkXmlData_GroupsHierarchy($key,$groupHierarchy['#'])) {
                        $this->DATA_XML['GroupsHierarchy'][$key]['group'] = $groupHierarchy['#']['group'][0]['#'];
                        $this->DATA_XML['GroupsHierarchy'][$key]['parentGroup'] = $groupHierarchy['#']['parentGroup'][0]['#'];
                        if(!in_array($groupHierarchy['#']['group'][0]['#'],$this->xmlDataIdSet["Groups"])) {
                            $this->ERRORS[] = 'В иерархии указана дочерняя группа <span class="WarErrTextId">'.$groupHierarchy['#']['group'][0]['#'].'</span> информация о которой отсутствует';
                        }
                        if(!in_array($groupHierarchy['#']['parentGroup'][0]['#'],$this->xmlDataIdSet["Groups"])) {
                            $this->ERRORS[] = 'В иерархии указана родительская группа <span class="WarErrTextId">'.$groupHierarchy['#']['parentGroup'][0]['#'].'</span> информация о которой отсутствует';
                        }
                    }
                } else {
                    $this->ERRORS[] = $this->getErrorTextNoBlock('GroupsHierarchy::Relation',$key);
                }
            }
        }
    }
    private function checkXmlData_GroupsHierarchy($key,$groupHierarchy) {
        $noError = true;
        $goodID = true;
        if (!$this->checkXmlDataInArray($groupHierarchy, 'group')) {
            $this->ERRORS[] = $this->getErrorTextNoBlock('GroupsHierarchy::Relation::group',$key);
            $noError = false;
            $goodID = false;
        }
        if (!$this->checkXmlDataInArray($groupHierarchy, 'parentGroup')) {
            $block = 'GroupsHierarchy::Relation::parentGroup';
            if($goodID) {
                $this->ERRORS[] = $this->getErrorTextNoBlock_ID($block,$groupHierarchy['group'][0]['#']);
            } else {
                $this->ERRORS[] = $this->getErrorTextNoBlock($block,$key);
            }
            $noError = false;
        }
        return $noError;
    }
    private function getXmlData_PropertiesInGroups() {
        $this->xmlDataIdSet['PropertiesInGroups'] = array();
        if(!isset($this->FILE_BUFFER['PropertiesInGroups'][0]['#']['Relation'])) {
            $this->ERRORS[] = $this->getErrorTextNoBlock('PropertiesInGroups');
        } else {
            foreach ($this->FILE_BUFFER['PropertiesInGroups'][0]['#']['Relation'] as $key => $propertiesInGroups) {
                if(isset($propertiesInGroups['#'])) {
                    if($this->checkXmlData_PropertiesInGroups($key,$propertiesInGroups['#'])) {
                        $this->DATA_XML['PropertiesInGroups'][$key]['group'] = $propertiesInGroups['#']['group'][0]['#'];
                        $this->DATA_XML['PropertiesInGroups'][$key]['property'] = $propertiesInGroups['#']['property'][0]['#'];
                        if($propertiesInGroups['#']['sequence'][0]['#'] <= 0 ) {
                            $this->ERRORS[] = 'Неверное значение поля sequence в PropertiesInGroups. Номер записи <span class="WarErrTextName">'.$key.'</span>';
                        }
                        $this->DATA_XML['PropertiesInGroups'][$key]['sequence'] = $propertiesInGroups['#']['sequence'][0]['#'];
                        if(!in_array($propertiesInGroups['#']['group'][0]['#'],$this->xmlDataIdSet["Groups"])) {
                            $this->ERRORS[] = 'Свойство <span class="WarErrTextId">'.$propertiesInGroups['#']['property'][0]['#'].'</span> указано для группы <span class="WarErrTextId">'.$propertiesInGroups['#']['group'][0]['#'].'</span> информация о которой отсутствует';
                        }
                        if(!in_array($propertiesInGroups['#']['property'][0]['#'],$this->xmlDataIdSet["Properties"])) {
                            $this->ERRORS[] = 'Для группы <span class="WarErrTextId">'.$propertiesInGroups['#']['group'][0]['#'].'</span> указано свойство <span class="WarErrTextId">'.$propertiesInGroups['#']['property'][0]['#'].'</span> информация о котором отсутствует';
                        }
                    }
                }
            }
        }
    }
    private function checkXmlData_PropertiesInGroups($key,$propertiesInGroups) {
        $noError = true;
        $goodID = true;
        if (!$this->checkXmlDataInArray($propertiesInGroups, 'group')) {
            $this->ERRORS[] = $this->getErrorTextNoBlock('PropertiesInGroups::Relation::group',$key);
            $noError = false;
            $goodID = false;
        }
        if (!$this->checkXmlDataInArray($propertiesInGroups, 'property')) {
            $block = 'PropertiesInGroups::Relation::group';
            if($goodID) {
                $this->ERRORS[] = $this->getErrorTextNoBlock_ID($block,$propertiesInGroups['group'][0]['#']);
            } else {
                $this->ERRORS[] = $this->getErrorTextNoBlock($block,$key);
            }
            $noError = false;
        }
        if (!$this->checkXmlDataInArray($propertiesInGroups, 'sequence')) {
            $block = 'PropertiesInGroups::Relation::sequence';
            if($goodID) {
                $this->ERRORS[] = $this->getErrorTextNoBlock_ID($block,$propertiesInGroups['group'][0]['#']);
            } else {
                $this->ERRORS[] = $this->getErrorTextNoBlock($block,$key);
            }
            $noError = false;
        }
        return $noError;
    }
    private function getXmlData_Items() {
        $this->xmlDataIdSet['Items'] = array();
        if(!isset($this->FILE_BUFFER['Items'][0]['#']['Item'])) {
            $this->ERRORS[] = $this->getErrorTextNoBlock('Items');
        } else {
            foreach ($this->FILE_BUFFER['Items'][0]['#']['Item'] as $key => $item) {
                if(isset($item['#'])) {
                    if($this->checkXmlData_Items($key,$item['#'])) {
                        $this->xmlDataIdSet['Items'][] = $item['#']['id'][0]['#'];
                        $this->DATA_XML['Items'][$key]['id'] = $item['#']['id'][0]['#'];
                        $this->DATA_XML['Items'][$key]['itemName'] = $item['#']['itemName'][0]['#'];
                        if(!in_array($item['#']['group'][0]['#'],$this->xmlDataIdSet["Groups"])) {
                            $this->ERRORS[] = 'Для товара <span class="WarErrTextId">'.$item['#']['id'][0]['#'].'</span> указана группа <span class="WarErrTextId">'.$item['#']['group'][0]['#'].'</span> информация о которой отсутствует';
                        }
                        $this->DATA_XML['Items'][$key]['group'] = $item['#']['group'][0]['#'];
                        $this->DATA_XML['Items'][$key]['action'] = $item['#']['action'][0]['#'];
                        
                        if($item['#']['action'][0]['#'] != '1' && $item['#']['action'][0]['#'] != '0') {
                            $this->ERRORS[] = 'Неверное значение поля action для товара <span class="WarErrTextId">'.$item['#']['id'][0]['#'].'</span>';
                        }
                        
                        $item['#']['amount'][0]['#'] = str_replace(',', '.', $item['#']['amount'][0]['#']);
                        if($this->checkXmlDataInArray($item['#'], 'amount') && $item['#']['amount'][0]['#'] > 0) {
                            $this->DATA_XML['Items'][$key]['amount'] = $item['#']['amount'][0]['#'];
                        } else {
                            $this->DATA_XML['Items'][$key]['amount'] = 0;
                        }
                        $item['#']['minAmount'][0]['#'] = str_replace(',', '.', $item['#']['minAmount'][0]['#']);
                        if($this->checkXmlDataInArray($item['#'], 'minAmount') && $item['#']['minAmount'][0]['#'] > 0) {
                            $this->DATA_XML['Items'][$key]['minAmount'] = $item['#']['minAmount'][0]['#'];
                        } else {
                            $this->DATA_XML['Items'][$key]['minAmount'] = 0;
                        }
                        if($this->checkXmlDataInArray($item['#'], 'description')) {
                            $this->DATA_XML['Items'][$key]['description'] = $item['#']['description'][0]['#'];
                        } else {
                            $this->DATA_XML['Items'][$key]['description'] = '';
                        }
                        $this->DATA_XML['Items'][$key]['shown'] = $item['#']['shown'][0]['#'];
                        
                        if($item['#']['shown'][0]['#'] != '1' && $item['#']['shown'][0]['#'] != '0') {
                            $this->ERRORS[] = 'Неверное значение поля shown для товара <span class="WarErrTextId">'.$item['#']['id'][0]['#'].'</span>';
                        }
                        
                        if(isset($item['#']['prices'][0]['#']['price'])) {
                            $this->getXmlData_ItemsPrices($item['#']['id'][0]['#'],$item['#']['prices'][0]['#']['price']);
                        } else {
                            $this->ERRORS[] = 'Для товара <span class="WarErrTextId">'.$item['#']['id'][0]['#'].'</span> <span class="WarErrTextName">"'.$item['#']['itemName'][0]['#'].'"</span> не указана ни одна цена';
                        }
                        if(isset($item['#']['propertiesValues'][0]['#']['propertyValue'])) {
                            $this->getXmlData_ItemsPropertiesValues($item['#']['id'][0]['#'],$item['#']['propertiesValues'][0]['#']['propertyValue']);
                        } else {
                            $this->WARNINGS[] = 'Для товара <span class="WarErrTextId">'.$item['#']['id'][0]['#'].'</span> <span class="WarErrTextName">"'.$item['#']['itemName'][0]['#'].'"</span> не определено ни одно свойство';
                        }
                    }
                } else {
                    $this->ERRORS[] = $this->getErrorTextNoBlock('Items::Item');
                }
            }
        }
    }
    private function checkXmlData_Items($key,$item) {
        $noError = true;
        $goodID = true;
        if (!$this->checkXmlDataInArray($item, 'id')) {
            $this->ERRORS[] = $this->getErrorTextNoBlock('Items::Item::id',$key);
            $noError = false;
            $goodID = false;
        }
        if (!$this->checkXmlDataInArray($item, 'itemName')) {
            $block = 'Items::Item::itemName';
            if($goodID) {
                $this->ERRORS[] = $this->getErrorTextNoBlock_ID($block,$item['id'][0]['#']);
            } else {
                $this->ERRORS[] = $this->getErrorTextNoBlock($block,$key);
            }
            $noError = false;
        }
        if (!$this->checkXmlDataInArray($item, 'group')) {
            $block = 'Items::Item::group';
            if($goodID) {
                $this->ERRORS[] = $this->getErrorTextNoBlock_ID($block,$item['id'][0]['#']);
            } else {
                $this->ERRORS[] = $this->getErrorTextNoBlock($block,$key);
            }
            $noError = false;
        }
        if (!$this->checkXmlDataInArray($item, 'action')) {
            $block = 'Items::Item::action';
            if($goodID) {
                $this->ERRORS[] = $this->getErrorTextNoBlock_ID($block,$item['id'][0]['#']);
            } else {
                $this->ERRORS[] = $this->getErrorTextNoBlock($block,$key);
            }
            $noError = false;
        }
        if (!$this->checkXmlDataInArray($item, 'amount')) {
            $block = 'Items::Item::amount';
            if($goodID) {
                $this->WARNINGS[] = $this->getErrorTextNoBlock_ID($block,$item['id'][0]['#']);
            } else {
                $this->WARNINGS[] = $this->getErrorTextNoBlock($block,$key);
            }
//            $noError = false;
        }
        if (!$this->checkXmlDataInArray($item, 'minAmount')) {
            $block = 'Items::Item::minAmount';
            if($goodID) {
                $this->WARNINGS[] = $this->getErrorTextNoBlock_ID($block,$item['id'][0]['#']);
            } else {
                $this->WARNINGS[] = $this->getErrorTextNoBlock($block,$key);
            }
//            $noError = false;
        }
        if (!$this->checkXmlDataInArray($item, 'description')) {
            $block = 'Items::Item::description';
            if($goodID) {
                $this->WARNINGS[] = $this->getErrorTextNoBlock_ID($block,$item['id'][0]['#']);
            } else {
                $this->WARNINGS[] = $this->getErrorTextNoBlock($block,$key);
            }
//            $noError = false;
        }
        if (!$this->checkXmlDataInArray($item, 'shown')) {
            $block = 'Items::Item::shown';
            if($goodID) {
                $this->ERRORS[] = $this->getErrorTextNoBlock_ID($block,$item['id'][0]['#']);
            } else {
                $this->ERRORS[] = $this->getErrorTextNoBlock($block,$key);
            }
            $noError = false;
        }
        if (!$this->checkXmlDataInArray($item, 'prices')) {
            $block = 'Items::Item::prices';
            if($goodID) {
                $this->ERRORS[] = $this->getErrorTextNoBlock_ID($block,$item['id'][0]['#']);
            } else {
                $this->ERRORS[] = $this->getErrorTextNoBlock($block,$key);
            }
            $noError = false;
        }
        return $noError;
    }
    private function getXmlData_ItemsPrices($item,$prices) {
        if(!isset($this->DATA_XML['ItemsPrices'])) {
            $this->DATA_XML['ItemsPrices'] = array();
        }
        $data['item'] = $item;
        foreach ($prices as $key => $price) {
            if(isset($price['#'])) {
                if($this->checkXmlData_ItemsPrices($key,$price['#'],$item)) {
                    $data['price'] = $price['#']['id'][0]['#'];
                    $price['#']['value'][0]['#'] = str_replace(',', '.', $price['#']['value'][0]['#']);
                    if($price['#']['value'][0]['#'] <= 0) {
                        $this->ERRORS[] = 'Цена ('.$price['#']['value'][0]['#'].') для товара '.$item.' меньше или равна нулю.';
                        $data['value'] = 0;
                    } else {
                        $data['value'] = $price['#']['value'][0]['#'];
                    }
                    $this->DATA_XML['ItemsPrices'][] = $data;
                    if(!in_array($price['#']['id'][0]['#'],$this->xmlDataIdSet["PricesTypes"])) {
                        $this->ERRORS[] = 'Для товара <span class="WarErrTextId">'.$item.'</span> указан неизвестный тип цен <span class="WarErrTextId">'.$price['#']['id'][0]['#'].'</span>';
                    }
                    if(!isset($price['#']['value'][0]['#']) || $price['#']['value'][0]['#']='') {
                        $this->WARNINGS[] = 'Для товара <span class="WarErrTextId">'.$item.'</span> указано пустое значения для цены с типом: <span class="WarErrTextId">'.$price['#']['id'][0]['#'].'</span>';
                    }
                }
            } else {
                $this->ERRORS[] = $this->getErrorTextNoBlock('Items::Item['.$item.']::prices::price',$key);
            }
        }
    }
    private function checkXmlData_ItemsPrices($key,$price,$item) {
        $noError = true;
        if (!$this->checkXmlDataInArray($price, 'id')) {
            $this->ERRORS[] = $this->getErrorTextNoBlock('Items::Item['.$item.']::prices::price::id',$key);
            $noError = false;
        }
        if (!$this->checkXmlDataInArray($price, 'value')) {
            $this->ERRORS[] = $this->getErrorTextNoBlock('Items::Item['.$item.']::prices::price::value',$key);
            $noError = false;
        }
        return $noError;
    }
    private function getXmlData_ItemsPropertiesValues($item, $properties) {
        if(!isset($this->DATA_XML['ItemsPropertiesValues'])) {
            $this->DATA_XML['ItemsPropertiesValues'] = array();
        }
        $data['item'] = $item;
        foreach ($properties as $key => $property) {
            if(isset($property['#'])) {
                if($this->checkXmlData_ItemsPropertiesValues($key,$property['#'],$item)) {
                    $data['id'] = ID_GENERATOR::generateID(6,$item);
                    $data['property'] = $property['#']['property'][0]['#'];
                    if(isset($property['#']['measure'][0]['#'])) {
                        $data['measure'] = $property['#']['measure'][0]['#'];
                    } else {
                        $data['measure'] = '';
                    }
                    $this->DATA_XML['ItemsPropertiesValues'][] = $data;
                    if(!in_array($property['#']['property'][0]['#'],$this->xmlDataIdSet["Properties"])) {
                        $this->ERRORS[] = 'Для товара <span class="WarErrTextId">'.$item.'</span> указано значение неизвестного свойства <span class="WarErrTextId">'.$property['#']['property'][0]['#'].'</span>';
                    }
                    if(!$this->checkXmlDataInArray($property['#'], 'value')) {
                        $data['value'] = '';
//                        $this->WARNINGS[] = 'Для товара <span class="WarErrTextId">'.$item.'</span> указано пустое значения для свойства <span class="WarErrTextId">'.$property['#']['property'][0]['#'].'</span>';
                    } else {
                        $data['value'] = $property['#']['value'][0]['#'];
                    }
                }
            } else {
                $this->ERRORS[] = $this->getErrorTextNoBlock('Items::Item['.$item.']::propertiesValues::propertyValue',$key);
            }
        }
    }
    private function checkXmlData_ItemsPropertiesValues($key,$property,$item) {
        $noError = true;
        if (!$this->checkXmlDataInArray($property, 'property')) {
            $this->ERRORS[] = $this->getErrorTextNoBlock('Items::Item['.$item.']::propertiesValues::propertyValue::property',$key);
            $noError = false;
        }
//        if (!$this->checkXmlDataInArray($property, 'value')) {
//            $this->ERRORS[] = $this->getErrorTextNoBlock('Items::Item['.$item.']::propertiesValues::propertyValue::value',$key);
//            $noError = false;
//        }
        return $noError;
    }
    private function addConstantDataSetValue($setKey,$value) {
        if(!isset($this->constantDataSet[$setKey])) {
            $this->constantDataSet[$setKey] = array();
        }
        if(!in_array($value, $this->constantDataSet[$setKey])) {
            $this->constantDataSet[$setKey][] = $value;
        }
    }
    
    public function get_constantDataSet() {
        return $this->constantDataSet;
    }
    
    public function get_xmlDataIdSet() {
        return $this->xmlDataIdSet;
    }
    
    public function get_DATA_XML() {
        return $this->DATA_XML;
    }
    
    public function get_ERRORS() {
        return $this->ERRORS;
    }
    
    public function get_WARNINGS() {
        return $this->WARNINGS;
    }
}
