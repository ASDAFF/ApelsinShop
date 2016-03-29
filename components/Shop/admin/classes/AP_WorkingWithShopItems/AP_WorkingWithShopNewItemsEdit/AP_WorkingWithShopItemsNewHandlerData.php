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
 * Обработчик данных, полученных при обработке нового товара
 *
 * @author Olga Rjabchikova
 * @copyright © 2010-2016, CompuProjec
 * @created 23.02.2016 12:11:24
 */
class AP_WorkingWithShopItemsNewHandlerData {

    private $html;
    private $SQL_HELPER;
    private $group;
    private $data;

    public function __construct() {
        global $_SQL_HELPER;
        $this->SQL_HELPER = $_SQL_HELPER;
//        if (isset($_POST['formSubmit'])) {
        $this->data = $_POST;
//            var_dump($this->data);
//        }
        $this->group = $this->data['shopItemsNewItemGroup'];
    }

    public function getHtml() {
        $this->insertDataItems();
        return $this->html;
    }

    private function insertDataItems() {
        $this->insertDataItemName();
        $this->insertDataItemDescription();
        $this->insertDataItemProperty();
    }

    private function insertDataItemName() {
        $dataItem = [];
        if ($this->data['itemName'] != null && $this->data['itemName'] != '') {
            foreach ($this->data['itemName'] as $id => $name) {
                $name = trim(InputValueHelper::getMysqlText(htmlspecialchars(strip_tags($name))));
                $query = "UPDATE `ShopItems` SET ";
                if ($name != null && $name != '') {
                    $query .= "`itemName` = '" . $name . "', ";
                }
                $query .= "`shown` = '" . $this->data['shown'][$id] . "' ";
                $query .= "WHERE `id` = '" . $id . "' ;";
                $this->SQL_HELPER->insert($query);
            }
        }
        return $dataItem;
    }

    private function insertDataItemDescription() {
        $hasDescription = [];
        if (isset($this->data['shopItemsNewEditDescriptionItemId']) && isset($this->data['shopItemsNewEditDescriptionDescription'])) {
            foreach ($this->data['shopItemsNewEditDescriptionItemId'] as $blockId => $itemsId) {
                foreach (array_keys($itemsId) as $item) {
                    $description = trim(InputValueHelper::getMysqlText($this->data['shopItemsNewEditDescriptionDescription'][$blockId]));
                    $query = "UPDATE `ShopItems` SET ";
                    $query .= "`description` = " . InputValueHelper::mayByNull($description) . "";
                    $query .= " WHERE `id` = '" . $item . "';";
                    $this->SQL_HELPER->insert($query);
                    $hasDescription[] = $item;
                }
            }
        }
        foreach (array_keys($this->data['itemName']) as $id) {
            if (!in_array($id, $hasDescription)) {
                $query = "UPDATE `ShopItems` SET ";
                $query .= "`description` = null";
                $query .= " WHERE `id` = '" . $id . "';";
                $this->SQL_HELPER->insert($query);
            }
        }
    }

    private function getDataItemProperty() {
        $dataItem = [];
        if (isset($this->data['shopItemsNewEditPropertyItemId']) && isset($this->data['shopItemsNewEditPropertyValueElementValueInput'])) {
            foreach ($this->data['shopItemsNewEditPropertyItemId'] as $blockId => $itemsId) {
                foreach ($itemsId as $id) {
                    foreach ($this->data['shopItemsNewEditPropertyValueElementValueInput'][$blockId] as $property => $values) {
                        foreach ($values as $value) {
                            $dataItem[$id][$property][] = $value;
                        }
                    }
                }
            }
        }
        return $dataItem;
    }

    private function insertDataItemProperty() {
        $hasProperty = [];
        $dataItem = $this->getDataItemProperty();
        foreach (array_keys($dataItem) as $idItem) {
            $queryDelete = "DELETE FROM `ShopItemsPropertiesValues` WHERE `item`='" . $idItem . "';";
            $this->SQL_HELPER->insert($queryDelete);
            foreach ($dataItem[$idItem] as $property => $values) {
                foreach (array_unique($values) as $value) {
                    if ($value != null && $value != '') {
                        $idRandom = ID_GENERATOR::generateID();
                        $id = $idItem . '-' . $idRandom;
                        $query = "INSERT INTO `ShopItemsPropertiesValues` SET ";
                        $query .= "`id` = '" . $id . "', ";
                        $query .= "`item` = '" . $idItem . "', ";
                        $query .= "`property` = '" . $property . "', ";
                        $query .= "`value` = '" . $value . "', ";
                        $query .= "`inFile` = '0'; ";
                        $this->SQL_HELPER->insert($query);
                    }
                }
            }
            $hasProperty[] = $idItem;
        }
        foreach (array_keys($this->data['itemName']) as $id) {
            if (!in_array($id, $hasProperty)) {
                $queryDelete = "DELETE FROM `ShopItemsPropertiesValues` WHERE `item`='" . $id . "';";
                $this->SQL_HELPER->insert($queryDelete);
            }
        }
    }

}
