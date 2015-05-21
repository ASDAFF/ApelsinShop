<?php
/**
 * класс отображения информации по одному товару
 * @author Максим
 */
class ShopItem {
    private $SQL_HELPER;
    private $elementID;
    private $HTML;
    private $data;
    private $price;
    private $property;
    private $dir = './resources/Components/Shop/Image/ItemsImage/';

    /**
     * Конструктор класса
     * @global type $_SQL_HELPER
     */
    public function __construct() {
        global $_SQL_HELPER;
        $this->SQL_HELPER = $_SQL_HELPER;
        $this->elementID = ShopPageInfoHelper::shopPageUrlElement();
        $this->getDataItem();
        if ($this->checkElementID()) {
            $this->generateHtml();
        } else {
            $this->generateUrlErrorHtml();
        }
    }
    
    /**
     * Проверяем есть ил даныне по такому товару
     * @return boolean
     */
    private function checkElementID() {
        if($this->elementID !== NULL) {
            $query = "SELECT count(`id`) as amount FROM `ShopItems` WHERE `id`='".$this->elementID."';";
            $rezult = $this->SQL_HELPER->select($query,1);
            return $rezult['amount'] === '1';
        } else {
            return FALSE;
        }
    }
    
    /**
     * Генерируем HTML в случае ошибки в URL строке браузера
     */
    private function generateUrlErrorHtml() {
        $this->HTML = '';
        $this->HTML .= '<div class="UrlErrorHtml">';
            $this->HTML .= 'Такого товара в данном разделе нет.';
        $this->HTML .= '</div>';
    }
    
    /**
     * Получение данных Item
     */
    private function getDataItem() {
        $query = "SELECT * FROM `ShopItems` WHERE `id` = '".$this->elementID."';";
        $this->data = $this->SQL_HELPER->select($query,1);
    }
    
    /**
     * Получение цены
     */
    private function getPrice() {
        $id = ShopGroupPriceType::getPriceTypeID();
        $query = "SELECT `value` FROM `ShopItemsPrices` WHERE `price` = '".$id."' AND `item` = '".$this->elementID."';";
        $this->price = $this->SQL_HELPER->select($query,1);
    }
    
    /**
     * Получение свойств
     */
    private function getPropertiesInGroup($group) {
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
            WHERE SIPV.`item` = '".$this->elementID."'
            ORDER BY SP.`sequence`;";
        $rezult = $this->SQL_HELPER->select($query);
        $this->property = [];
        $i = 0;
        foreach ($rezult as $value) {
            if ($value["oneOfAllValues"] == '0') {
                $this->property[$value["propertyName"]]["all"][$i] = $value["value"];
            } else {
                $this->property[$value["propertyName"]]["one"][$i] = $value["value"];
            }
            $i++;
        }
    }
    
    /**
     * Получение родительских групп
     */
    private function getProperty() {
        $dataAll = [];
        $groups = $this->getListGroup();
        foreach ($groups as $key => $group) {
            $dataAll[$key][$group] = $this->getPropertiesInGroup($group);
        }
    }

    /**
     * Получение списка всех групп
     */
    private function getListGroup() {
        $list = new ShopGroupsHelper();
        $listGroup = $list->getGroupPath($this->data['group']);
        array_push($listGroup, $this->data['group']);
        return $listGroup;
    }
    
    /**
     * Генерируем HTML информации о товаре
     */
    private function generateHtml() {
        $this->getPrice();
        $this->getProperty();
        $this->HTML = '';   
        $this->HTML .= '<div class="ShopItemMainWrapper">';
            $this->HTML .= '<div class="ShopItemLeftBlock">';
                $this->HTML .= '<div class="ShopItemIMG">';
                    $this->HTML .= '<img src="'.$this->getImageData().'" alt="'.$this->data['itemName'].'" title="'.$this->data['itemName'].'">';
                 $this->HTML .= '</div>';  // ShopItemIMG
                $this->HTML .= '<div class="ShopItemName">';
                    $this->HTML .= $this->data['itemName'];
                $this->HTML .= '</div>';  // ShopItemName
                $this->HTML .= '<div class="ShopItemPrice">';
                    $this->HTML .= $this->price['value'];
                $this->HTML .= '</div>';  // ShopItemPrice
                $this->HTML .= '<div class="ShopItemAmount">';
                    $this->HTML .= $this->data['amount'];
                $this->HTML .= '</div>';  // ShopItemAmount
                $this->HTML .= '<div class="ShopItemBuyButton">';
                    $this->HTML .= 'Купить';
                $this->HTML .= '</div>';  // ShopItemBuyButton
            $this->HTML .= '</div>';  // ShopItemLeftBlock
            
            $this->HTML .= '<div class="ShopItemMainBlock">';
                $this->HTML .= '<div class="ShopItemDescription">';
                    $this->HTML .= $this->data['description'];
                $this->HTML .= '</div>';  // ShopItemDescription
                
                foreach ($this->property as $proper => $allValues) {
                    $this->HTML .= '<div class="ShopItemParams">';
                        $this->HTML .= '<div class="ShopItemParamName">';
                            $this->HTML .= $proper.':';
                        $this->HTML .= '</div>';  // ShopItemParamName
                        $this->HTML .= '<div class="ShopItemParamValue">';
                            
                        foreach ($allValues as $key => $values ) {
                            if ($key == 'all') {
                                $this->HTML .= $this->getHtmlAllValue($values, true);
                            } else {
                                $this->HTML .= $this->getHtmlAllValue($values, false);
                            }
                        }
                            
                        $this->HTML .= '</div>';  // ShopItemParamValue
                    $this->HTML .= '</div>';  // ShopItemParams
                }
            $this->HTML .= '</div>';  // ShopItemMainBlock
        $this->HTML .= '</div>';  // ShopItemMainWrapper
    }
    
    /**
     * Вариант отображенияе всех свойств товара 
     * @param type $mass
     * @param type $flag
     */
    private function getHtmlAllValue($mass, $flag) {
        if ($flag == false) {
        $arr = array();
        foreach ($mass as $key => $value) {
            $arr[$key]['value'] = $arr[$key]['text'] = $value;
        }
        $this->HTML .= InputHelper::select("ShopItemPropertyValueSelectBox", "ShopItemPropertyValueSelectBox", $arr, false, '');
        } else {
            $out = '';
            foreach ($mass as $value) {
                $out .= $value.', ';
            }
            $this->HTML .= mb_substr($out, 0, mb_strlen($out) - 2);
        }
    }
    
    /**
     * Получить изображение
     * @return type
     */
    private function getImageData() {
        $desiredValue = $this->getImage($this->elementID);
        if (file_exists($desiredValue)) {
            if ($desiredValue != null && $desiredValue != '') { 
                return $desiredValue; 
            }
        } else {
            echo 'Файла с таким названием не существует';
        }
    }
    
    /**
     * Уточнить расширение
     * @param type $item
     * @return type
     */
    private function getImage($item) {
        // если есть - jpg
        if (file_exists($this->dir.$item.'_200x200.jpg'))  {
            $image = $item.'_200x200.jpg';
        // если нет - посмотреть png
        } elseif (file_exists($this->dir.$item.'_200x200.png'))  {
            $image = $item.'_200x200.png';
        } else {
            $image = 'defaultIcon.jpg';
        }
        return $this->dir.$image;
    } 
    
    /**
     * выводим HTML
     */
    public function get() {
        echo $this->HTML;
    }
    
    /**
     * Возвращаем HTML
     * @return string $this->HTML - сгенерированный HTML
     */
    public function getHtml() {
        return $this->HTML;
    }
}
