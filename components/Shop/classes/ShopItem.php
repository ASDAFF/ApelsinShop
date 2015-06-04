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
    private $defaultIcon = "defaultIcon_200x200.png";
    private $defaultBigIcon = "defaultIcon.png";

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
        foreach ($rezult as $value) {
            $this->property[$value["property"]]['property'] = $value['property'];
            $this->property[$value["property"]]['propertyName'] = $value['propertyName'];
            $this->property[$value["property"]]['valueType'] = $value['valueType'] ;
            $this->property[$value["property"]]['oneOfAllValues'] = $value['oneOfAllValues'];
            $this->property[$value["property"]]['measure'] = $value['measure'];
            $this->property[$value["property"]]['value'][] = $value['value'];
        }
    }
    
    /**
     * Получение родительских групп
     */
    private function getProperty() {
        $groups = $this->getListGroup();
        $this->property = [];
        foreach ($groups as $group) {
            $this->getPropertiesInGroup($group);
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
                    $this->HTML .= '<a class="fancybox-gallery" href="'.$this->getBigImageData().'">';
                    $this->HTML .= '<img src="'.$this->getImageData().'" alt="'.$this->data['itemName'].'" title="'.$this->data['itemName'].'">';
                    $this->HTML .= '</a>';
                $this->HTML .= '</div>';  // ShopItemIMG
                $this->HTML .= '<div class="ShopItemName">';
                    $this->HTML .= $this->data['itemName'];
                $this->HTML .= '</div>';  // ShopItemName
                $this->HTML .= '<div class="ShopItemPrice">';
                    $this->HTML .= $this->price['value'];
                $this->HTML .= '</div>';  // ShopItemPrice
                $this->HTML .= ShopItemAmountScale::getAmountScale($this->data['amount'], $this->data['minAmount']);
                $this->HTML .= '<div class="ShopItemBuyButtonBlock">';
                    if ($this->data['amount'] > 0) {
                        $this->HTML .= ShopBasketHelper::getDysplayButtonBuy($this->elementID);
                    } else {
                        $this->HTML .= 'Товара нет. <br />Уточняйте у менеджера.';
                    }
                $this->HTML .= '</div>';  // ShopItemBuyButtonBlock
            $this->HTML .= '</div>';  // ShopItemLeftBlock
            $this->HTML .= '<div class="ShopItemMainBlock">';
                $this->HTML .= '<div class="ShopItemDescription">';
                    $this->HTML .= $this->data['description'];
                $this->HTML .= '</div>';  // ShopItemDescription
                $this->HTML .= '<div class="ShopItemParams">';
                foreach ($this->property as $property) {
                    $this->HTML .= '<div class="ShopItemParam">';
                        $this->HTML .= '<div class="ShopItemParamName"><div>';
                            $this->HTML .= $property['propertyName'].' :';
                        $this->HTML .= '</div></div>';  // ShopItemParamName
                        $this->HTML .= '<div class="ShopItemParamValue"><div>';
                        $this->HTML .= $this->getHtmlAllValue($property, $property['oneOfAllValues'] === "1");
                        $this->HTML .= '</div></div>';  // ShopItemParamValue
                    $this->HTML .= '</div>';  // ShopItemParam
                }
                $this->HTML .= '</div>';  // ShopItemParams
            $this->HTML .= '</div>';  // ShopItemMainBlock
            $this->HTML .= '<div class="clear"></div>';
        $this->HTML .= '</div>';  // ShopItemMainWrapper
    }
    
    /**
     * Вариант отображенияе всех свойств товара 
     * @param type $property
     * @param type $oneOfAllValues
     */
    private function getHtmlAllValue($property, $oneOfAllValues) {
        $out = '';
        if(count($property['value']) > 1) {
            if ($oneOfAllValues) {
                $arr = array();
                foreach ($property['value'] as $key => $value) {
                    if($property['valueType'] == 'float' || $property['valueType'] == 'int') {
                        $value = ShopItemsPropertiesMeasureScaling::ScalingMeasureString($property['measure'], $value);
                    }
                    $arr[$key]['value'] = $arr[$key]['text'] = $value;
                }
                $out .= InputHelper::select("ShopItemPropertyValueSelectBox", "ShopItemPropertyValueSelectBox", $arr, false, '');
            } else {
                foreach ($property['value'] as $key => $value) {
                    if($property['valueType'] == 'float' || $property['valueType'] == 'int') {
                        $value = ShopItemsPropertiesMeasureScaling::ScalingMeasureString($property['measure'], $value);
                    }
                    $out .= $value.', ';
                }
                $out = mb_substr($out, 0, mb_strlen($out) - 2);
            }
        } else {
            if($property['valueType'] == 'float' || $property['valueType'] == 'int') {
                $value = ShopItemsPropertiesMeasureScaling::ScalingMeasureString($property['measure'], $property['value'][0]);
            } else {
                $value = $property['value'][0];
            }
            $out = $value;
        }
        return $out;
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
        }
        return ''; 
    }
    
    /**
     * Получить изображение
     * @return type
     */
    private function getBigImageData() {
        $desiredValue = $this->getBigImage($this->elementID);
        if (file_exists($desiredValue)) {
            if ($desiredValue != null && $desiredValue != '') { 
                return $desiredValue; 
            }
        }
        return ''; 
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
            $image = $this->defaultIcon;
        }
        return $this->dir.$image;
    } 
    
    /**
     * Уточнить расширение
     * @param type $item
     * @return type
     */
    private function getBigImage($item) {
        // если есть - jpg
        if (file_exists($this->dir.$item.'.jpg'))  {
            $image = $item.'.jpg';
        // если нет - посмотреть png
        } elseif (file_exists($this->dir.$item.'.png'))  {
            $image = $item.'.png';
        } else {
            $image = $this->defaultBigIcon;
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
