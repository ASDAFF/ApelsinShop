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
 * Предпросмотр карточки товара
 *
 * @author Olga Rjabchikova
 * @copyright © 2010-2016, CompuProjec
 * @created 25.02.2016 9:57:39
 */
class AP_WorkingWithShopItemsNewItemsCards extends AP_AbstractPanelEditNewItems {

    public function __construct($data) {
        parent::__construct($data);
        $this->setNamePanel('Просмотр товаров');
    }

    public function getContentPanel() {
        $this->html = '<div class="shopItemsNewItemsCardsWrapper">';
        $this->html .= '<div class="shopItemsNewItemsCardsBlockItems">';
        $this->html .= $this->getBlockGroupName();
        $this->html .= '<div class="shopItemsNewItemsCardsBlockItemList">';
        foreach ($this->items as $item) {
            $this->html .= '<div class="shopItemsNewItemsCardsBlockItemCardItem shopItemsNewEditTextItemName" id="itemsCards_' . $item . '" idItem="' . $item . '">' . $this->getNameItem($item) . '</div>';
        }
        $this->html .= '</div>'; // shopItemsNewItemsCardsBlockItemCardList
        $this->html .= '<div class="shopItemsNewItemsCardsBlockItemCardWrapper">';
        $this->html .= '</div>'; // shopItemsNewItemsCardsBlockItemCardWrapper
        $this->html .= '</div>'; // shopItemsNewItemsCardsBlockItems
        $this->html .= $this->generationJS();
        $this->html .= '</div>'; // shopItemsNewItemsCardsWrapper
        return $this->html;
    }

    private function generationJS() { // $(".shopItemsNewItemsCardsBlockItemCardWrapper").show();
        $out = '';
        $out .= '<script type="text/javascript">';
        $out .= '$(document).ready(function() {';
        $out .= '$(".shopItemsNewItemsCardsBlockItemCardItem").click(function() {
            
                    $(".shopItemsNewItemsCardsBlockItemCardItem").each(function(index) {
                        $(this).removeClass("shopItemsNewItemsCardsBlockItemCardActiveClass");
                    });
                    
                    $(this).toggleClass("shopItemsNewItemsCardsBlockItemCardActiveClass");
                    
                    var idItem = $(this).attr("idItem");
                    getDataItems(idItem);
                    $(".shopItemsNewItemsCardsBlockItemCardWrapper").show();
                });
                
                function getDataItems(idItem) {
                    var dataItem = $("#AP_FormShopItemsNew").serialize() + "&idItem=" + idItem ;
                    $.ajax({
                        type: "POST",
                        url: "./components/Shop/admin/script/shopItemsNewItemCards.php",
                        cache: false,
                        data: dataItem,
                        success: function(result) {
                            $(".shopItemsNewItemsCardsBlockItemCardWrapper").html(result);
                        }
                    });
                    return false;
                }';

        $out .= '});';
        $out .= '</script>';
        return $out;
    }

}

class BlockItemCard {

    private $SQL_HELPER;
    private $item;

    public function __construct($data) {
        global $_SQL_HELPER;
        $this->SQL_HELPER = $_SQL_HELPER;
        $this->data = $data;
        $this->item = $this->data['idItem'];
    }

    public function getBlockItemCard() {
        $description = $this->getDescription();
        $out = '<div class="ShopItemMainWrapper">';
        $out .= '<div class="ShopItemLeftBlock">';
        $out .= '<div class="ShopItemName" id="itemsCards_' . $this->item . '">' . $this->data['itemName'][$this->item] . '</div>';
        $out .= '</div>';
        $out .= '<div class="ShopItemMainBlock">';
        $out .= '<div class="ShopItemDescription">';
        if ($description != null && $description != '' && isset($description[$this->item]) && $description[$this->item] != null && $description[$this->item] != '') {
            $out .= $description[$this->item];
        } else {
            $out .= 'Описание отсутствует';
        }
        $out .= '</div>';  // ShopItemDescription
        $out .= '<div class="ShopItemParams">';
        $out .= $this->generationPropertyValue();
        $out .= '</div>';  // ShopItemParams
        $out .= '</div>';  // ShopItemMainBlock
        $out .= '<div class="clear"></div>';
        $out .= '</div>';  // ShopItemMainWrapper
        return $out;
    }

    private function generationPropertyValue() {
        $properties = $this->getProperty();
        $out = '';
        if (isset($properties[$this->item]) && $properties[$this->item] != null) {
            foreach ($properties[$this->item] as $property => $values) {
                $out .= '<div class="ShopItemParam">';
                if ($this->getValueElement($values) != null) {
                    $out .= '<div class="ShopItemParamName">';
                    $out .= $this->getPropertyNames($property) . ' :';
                    $out .= '</div>';
                    $out .= '<div class="ShopItemParamValue">';
                    $out .= $this->getValueElement($values);
                    $out .= '</div>';
                }
                $out .= '</div>';  // ShopItemParam
            }
        } else {
            $out .= 'Свойства отсутствуют';
        }
        return $out;
    }

    private function getValueElement($values) {
        $out = '';
        foreach (array_unique($values) as $value) {
            if ($value != null && $value != "") {
                $out .= $value . ', ';
            }
        }
        $html = mb_strcut($out, 0, strlen($out) - 2);
        return (strlen($html) > 0) ? $html : null;
    }

    private function getDescription() {
        $descriptionItem = [];
        if (isset($this->data['shopItemsNewEditDescriptionItemId']) && isset($this->data['shopItemsNewEditDescriptionDescription']) &&
                $this->data['shopItemsNewEditDescriptionDescription'] != '' && $this->data['shopItemsNewEditDescriptionDescription'] != null) {
            foreach ($this->data['shopItemsNewEditDescriptionItemId'] as $blockId => $itemsId) {
                foreach (array_keys($itemsId) as $id) {
                    $descriptionItem[$id] = $this->data['shopItemsNewEditDescriptionDescription'][$blockId];
                }
            }
        }
        return array_unique($descriptionItem);
    }

    private function getProperty() {
        $dataItem = [];
        if (isset($this->data['shopItemsNewEditPropertyItemId']) && isset($this->data['shopItemsNewEditPropertyValueElementValueInput']) &&
                $this->data['shopItemsNewEditPropertyValueElementValueInput'] != '' && $this->data['shopItemsNewEditPropertyValueElementValueInput'] != null) {
            foreach ($this->data['shopItemsNewEditPropertyItemId'] as $blockId => $itemsId) {
                if (isset($this->data['shopItemsNewEditPropertyValueElementValueInput'][$blockId]) && $this->data['shopItemsNewEditPropertyValueElementValueInput'][$blockId] != null) {
                    foreach ($itemsId as $id) {
                        foreach ($this->data['shopItemsNewEditPropertyValueElementValueInput'][$blockId] as $property => $values) {
                            foreach ($values as $value) {
                                $dataItem[$id][$property][] = $value;
                            }
                        }
                    }
                }
            }
        }
        return $dataItem;
    }

    private function getPropertyNames($id) {
        $query = "SELECT `propertyName` FROM `ShopProperties` WHERE `id` = '" . $id . "'";
        $name = $this->SQL_HELPER->select($query, 1);
        return $name['propertyName'];
    }

}
