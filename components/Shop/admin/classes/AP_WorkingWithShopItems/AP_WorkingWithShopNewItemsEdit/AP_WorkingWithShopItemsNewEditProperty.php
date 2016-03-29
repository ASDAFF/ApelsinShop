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
 * Редактирование значений свойств товаров
 *
 * @author Olga Rjabchikova
 * @copyright © 2010-2016, CompuProjec
 * @created 29.01.2016 12:06:34
 */
class AP_WorkingWithShopItemsNewEditProperty extends AP_AbstractPanelEditNewItems {

    private $dataItems;
    private $dataProperty;
    private $properties;
    private $hasProperty;
    private $propertyValue = array();
    private $groupedPropertyValueHelperArray = array();
    private $itemsHelperArray = array();

    public function __construct($data) {
        parent::__construct($data);
        $this->setNamePanel('Редактирование свойств');
        $this->properties = $this->getDataPropertyInGroups();
        $this->dataProperty = $this->getDataProperty();
        $this->dataItems = $this->getDataItems();
        $this->getItemsPropertyValue();
    }

//    ---------------- получаем данные -----------------------
    private function getDataItems() {
        $data = [];
        foreach ($this->items as $item) {
            $data[$item] = $this->getNameItem($item);
        }
        return $data;
    }

    private function getDataProperty() {
        $data = [];
        foreach ($this->properties as $property) {
            $data[$property['property']] = $property['propertyName'];
        }
        return $data;
    }

    private function getDataPropertyInGroups() {
        $data = ShopGroupPropertiesDataHelper::getGroupAvailableProperties($this->group);
        return $data;
    }

    /**
     * Подготавливаем сформираванные данные (getItemsPropertyValue()) для будущей визуализации
     * @return type
     */
    private function getDataHasPropertyItems() {
        $dataItemProperty = [];
        foreach ($this->itemsHelperArray as $blockId => $itemsId) {
            foreach ($itemsId as $id) {
                $dataItemProperty[$blockId]['dataItem'][$id] = $this->getNameItem($id);
            }
            array_reverse($dataItemProperty[$blockId]['dataItem']);
            foreach ($this->groupedPropertyValueHelperArray[$blockId] as $property) {
                $dataItemProperty[$blockId]['dataProperty'][$property['property']]['id'] = $property['property'];
                $dataItemProperty[$blockId]['dataProperty'][$property['property']]['name'] = $this->getPropertyName($property['property']);
                $dataItemProperty[$blockId]['dataProperty'][$property['property']]['val'][] = $property['value'];
            }
        }
        return $dataItemProperty;
    }

    /**
     * Формиравание данных о уже присвоенных значениях свойствам новых товаров
     */
    private function getItemsPropertyValue() {
        foreach ($this->items as $item) {
            $query = "SELECT * FROM `ShopItemsPropertiesValues` WHERE `item`='" . $item . "';";
            $rezult = $this->SQL_HELPER->select($query);
            foreach ($rezult as $value) {
                $this->propertyValue[$item][$value['property']][] = $value['value'];
            }
        }
        $groupedItemsHelperArray = array();
        $propertyValueHelperArray = array();
        foreach ($this->propertyValue as $item => $propertyValueArray) {
            foreach ($propertyValueArray as $property => $valueArray) {
                foreach ($valueArray as $value) {
                    $groupedItemsHelperArray[$property . ' ' . $value][] = $item;
                    $propertyValueHelperArray[$property . ' ' . $value]['property'] = $property;
                    $propertyValueHelperArray[$property . ' ' . $value]['value'] = $value;
                }
            }
        }
        $this->groupedPropertyValueHelperArray = array();
        $this->itemsHelperArray = array();
        foreach ($groupedItemsHelperArray as $key => $itemsArray) {
            $itemsArrayToString = '';
            foreach ($itemsArray as $item) {
                $itemsArrayToString .= '_' . $item;
            }
            $this->itemsHelperArray[$itemsArrayToString] = array();
            foreach ($itemsArray as $item) {
                if (!in_array($item, $this->itemsHelperArray[$itemsArrayToString])) {
                    $this->itemsHelperArray[$itemsArrayToString][] = $item;
                }
            }
            $this->groupedPropertyValueHelperArray[$itemsArrayToString][] = $propertyValueHelperArray[$key];
        }
    }

//    ----------------- генерируем HTML -----------------

    public function getContentPanel() {
        $this->html .= '<div class="shopItemsNewEditPropertyWrapper">';
        $this->html .= '<div class="shopItemsNewEditPropertyBlockGeneral" >';
        $this->html .= $this->getHasPropertyBlock();
        $this->html .= '<div class="shopItemsNewEditPropertyButtonAddBlockGeneral">';
        $this->html .= 'Добавить блок для другого набора товаров';
        $this->html .= '</div>';
        $this->html .= '</div>'; // shopItemsNewEditPropertyBlockGeneral
        $this->html .= $this->generationJS();
        $this->html .= '</div>'; // shopItemsNewEditPropertyWrapper
        return $this->html;
    }

    /**
     * Генерирование блока для товаров с уже имеющимися значениями св-тв
     * @return type
     */
    private function getHasPropertyBlock() {
        $out = '';
        $data = $this->getDataHasPropertyItems();
        if ($data != null) {
            foreach ($data as $block) {
                $out .= self::getBlockPropertyAndItems(true, $block);
            }
        }
        return $out;
    }

    /**
     * Генерирование html блока для товаров с уже имеющимися значениями св-тв
     * @param type $flag - true, если у товаров уже имеются значения св-тв
     * @param type $data - данные для товаров
     * @return string
     */
    public static function getBlockPropertyAndItems($flag, $data = null) {
        $idBlock = ID_GENERATOR::generateID();
        $html = '';
        $blockProperty = '';
        $html .= '<div class="shopItemsNewEditPropertyBlockPropertyAndItems" id="' . $idBlock . '">';
        // Блок товаров
        $html .= '<div class="shopItemsNewEditPropertyBlockItems" id="blockItems_' . $idBlock . '">';
        $html .= '<div class="shopItemsNewEditPropertyBlockItemsWrapper" id="shopItemsNewEditPropertyItemsBlock_' . $idBlock . '">';
        $html .= '<div class="shopItemsNewEditPropertyBlockItemsContent">';
        if ($flag) {
            $html .= self::getListItems($idBlock, $data['dataItem']);
            $blockProperty .= self::getBlockProperty($idBlock, $data['dataProperty']);
        }
        $html .= '</div/>';
        $html .= '<div class="shopItemsNewEditPropertyButtonAllItems shopItemsNewEditTextItemName" id="propertyButtonAllItems_' . $idBlock . '" blockid="' . $idBlock . '">Добавить товары</div>';
        $html .= '</div>';
        $html .= '</div>';
        // Блок св-тв
        $html .= '<div class="shopItemsNewEditPropertyBlockProperty" id="shopItemsNewEditPropertyBlockProperty_' . $idBlock . '">';
        $html .= $blockProperty;
        $html .= '<div class="clear"></div>';
        $html .= '<div class="shopItemsNewEditPropertyAllProperty" blockid="' . $idBlock . '" id="shopItemsNewEditPropertyAllProperty_' . $idBlock . '">';
        $html .= 'Все доступные свойства';
        $html .= '</div>';
        $html .= '</div>';

        $html .= '<div class="clear"></div>';
        $html .= '</div>';
        return $html;
    }

    /**
     * Генерирование html элемента для списка товаров имеющих св-ва
     * @param type $idBlock - id общего блока
     * @param type $item - данные о товаре
     * @return string
     */
    private static function getListItems($idBlock, $item) {
        $html = '';
        foreach ($item as $id => $name) {
            $html .= '<div itemId="' . $id . '" id="propertyItemIdHasProperty_' . $idBlock . '_' . $id . '">';
            $html .= '<div class="shopItemsNewEditPropertyAllListItemsName shopItemsNewEditTextItemName" itemId="' . $id . '" id="propertyItemId_' . $id . '">';
            $html .= htmlspecialchars($name);
            $html .= '</div>';
            $html .= '<input type="hidden" name="shopItemsNewEditPropertyItemId[' . $idBlock . '][]" value="' . $id . '">';
            $html .= '</div>';
        }
        return $html;
    }

    /**
     * Генерирование html блока с св-ми и их значениями
     * @param type $idBlock
     * @param type $properties
     * @return string
     */
    public static function getBlockProperty($idBlock, $properties) {
        $html = '';
        foreach ($properties as $property) {
            $html .= '<div class="shopItemsNewEditPropertyBlockPropertyElement" id="blockProperty_' . $idBlock . '_' . $property['id'] . '">';
            $html .= '<div class="shopItemsNewEditPropertyBlockPropertyElementFields">';
            $html .= '<div class="shopItemsNewEditPropertyPropertyElement">';
            $html .= '<div class="shopItemsNewEditPropertyProperty" >';
            $html .= '<div class="shopItemsNewEditPropertyPropertyInput">' . $property['name'] . '</div>';
            $html .= '<div class="shopItemsNewEditPropertyExitBlockPropertyDeleteProperty" title="Удалить свойство"  idBlock="' . $idBlock . '" idProperty="' . $property['id'] . '">x</div>';
            $html .= '</div>';
            $html .= '</div>';
            $html .= '<div class="shopItemsNewEditPropertyValueElement">';
            foreach ($property['val'] as $value) {
                $html .= '<div class="shopItemsNewEditPropertyValueElementValue">';
                $html .= '<input type="text" name="shopItemsNewEditPropertyValueElementValueInput[' . $idBlock . '][' . $property['id'] . '][]" class="shopItemsNewEditPropertyValueElementValueInput" autofocus value="' . $value . '" idProperty="' . $property['id'] . '" id="valueElement_' . $property['id'] . '">';
                $html .= '<div class="shopItemsNewEditPropertyValueElementDeleteValue" title="Удалить значение">x</div>';
                $html .= '<div class="shopItemsSearchResult" id="shopItemsSearchResult"></div>';
                $html .= '</div>';
            }
            $html .= '<div class="shopItemsNewEditPropertyValueElementAddElementValue" id="shopItemsNewEditPropertyValueElementAddElementValue_' . $idBlock . '" idBlock="' . $idBlock . '" idProperty="' . $property['id'] . '">Добавить поле для значения</div>';
            $html .= '</div>';
            $html .= '<div class="clear"></div>';
            $html .= '</div>';
            $html .= '</div>';
        }
        return $html;
    }

//  ----------------- генерируем javascript -----------------
    private function generationJS() {
        $out = '';
        $out .= '<script type="text/javascript">';

        $out .= '$(document).ready(function() {';

        // данные
        $out .='dataProperty = ' . json_encode($this->dataProperty) . ';
                        allItemsForProperty = ' . json_encode($this->items) . ';
                        dataItemsForProperty = ' . json_encode($this->dataItems) . ';
                        hasProperty = ' . json_encode($this->hasProperty) . ';';

        // Запустить
        $out .='$(function() {
                        getAllProperty(); 
                        getSearchValueItem(); 
                        generationUIBlockAllItemsForProperty();
                        getValueDelete();
                        getPropertyDelete();
                        addFieldValue();
                    });';

        // search 
        $out .= GenerationJS::getCodeSearch();

        // свойства 
        $out .= GenerationJS::getCodeAllProperty(json_encode($this->properties), json_encode($this->dataItems));

        // товар
        $out .= GenerationJS::getCodeAllItems();

        // работа с значением св-ва и удаление св-ва
        $out .= GenerationJS::getCodeValue();
        // Удалить св-во
        $out .= 'function getPropertyDelete() {
                    $(".shopItemsNewEditPropertyExitBlockPropertyDeleteProperty").click(function() {
                        blockId = $(this).attr("idBlock");
                        var idProperty = $(this).attr("idProperty");
                        if (confirm("Вы пытаетесь удалить значение свойства, которое закреплено за данным списком товаров. Подтвердите?")) {
                            $("#propertyCheckbox_" + blockId + "_" + idProperty).prop("checked", false);
                            $("#blockProperty_" + blockId + "_" + idProperty).remove();
                        } 
                    });
                }';
        // Сгенерировать дополнительное поле для значения
        $out .= 'function addFieldValue() {
                    $(".shopItemsNewEditPropertyValueElementAddElementValue").click(function() {
                        blockId = $(this).attr("idBlock");
                        var idProperty = $(this).attr("idProperty");
                        $(this).parent().prepend(getInputValue(idProperty));
                        getSearchValueItem(); 
                        getValueDelete();
                        event.stopPropagation();
                    });
                }';

        $out .= '});';
        $out .= '</script>';
        return $out;
    }

}

// Класс для генерирования HTML блока со всеми доступными св-ми

class AllPropertyBllock {

    public static function getBlockAllListProperty($data, $hasProperty, $blockId) {
        $html = '';
        // Список св-тв
        $html .= self::generationJS();
        $html .= '<div class="shopItemsNewEditPropertyBlockAllList" id="blockAllList_' . $blockId . '" >';
        $html .= '<input type="checkbox" name="shopItemsNewEditPropertyButonSelectAllProperty" title="все свойствa" id="shopItemsNewEditPropertyButonSelectAllProperty" >';
        $html .= '<div class="shopItemsNewEditDescriptionTitletList">Доступные свойствa</div>';
        $html .= '<div class="shopItemsNewEditPropertyButtonExitList">x</div>';
        $html .= '<div class="shopItemsNewEditPropertyMainList" >';
        $html .= '<div class="shopItemsNewEditPropertyBlockAllListProperty">';
        if (!empty($data)) {
            foreach ($data as $property) {
                $html .= self::getListPropertyElement($property, $hasProperty, $blockId);
            }
        } else {
            $html .= '<div class="shopItemsNewEditDescriptionElementAllListItems shopItemsNewEditTextItemName noItems">Доступных свойств нет</div>';
        }


        foreach ($data as $property) {
            $html .= self::getListPropertyElement($property, $hasProperty, $blockId);
        }


        $html .= '</div>';
        $html .= '</div>';
        $html .= '</div>';
        return $html;
    }

    private static function getListPropertyElement($property, $hasProperty, $blockId) {
        $checked = '';
        (in_array($property['property'], $hasProperty)) ? $checked .= 'checked' : $checked .= '';
        $html = '<label class="shopItemsNewEditPropertyElementAllListProperty shopItemsNewEditTextItemName" id="shopItemsNewEditPropertyElementAllListProperty_' . $property['property'] . '">';
        $html .= '<input type="checkbox" name="shopItemsNewEditPropertyBlockAllListPropertyCheckbox[' . $property['property'] . '][]" ' . $checked . ' value="' . $property['propertyName'] . '" id="propertyCheckbox_' . $blockId . "_" . $property['property'] . '" idProperty="' . $property['property'] . '"  class="shopItemsNewEditDescriptionElementAllListPropertyCheckbox">';
        $html .= '<span class="shopItemsNewEditPropertyBlockAllListPropertyItemsName" idProperty="' . $property['property'] . '">';
        $html .= $property['propertyName'];
        $html .= '</span>';
        $html .= '</label>';
        return $html;
    }

    private static function generationJS() {
        $out = '';
        $out .= '<script type="text/javascript">';
        $out .= '$(document).ready(function() {';

        // search 
        $out .= GenerationJS::getCodeSearch();

        // Удалить значение св-ва
        $out .= GenerationJS::getCodeValue();

        // Сгенерировать дополнительное поле для значения определенного св-ва
        $out .= 'function getAddFieldValueID(id, idProperty) {
                    $("#shopItemsNewEditPropertyValueElementAddElementValue_" + id).click(function() {
                        $(this).parent().prepend(getInputValue(idProperty));
                        getSearchValueItem(); 
                        getValueDelete();
                    });
                }';
        // Генерирование HTML дополнительного поля для св-ва
        $out .= 'function getBlockPropertyField(idProperty, propertyName) {
                    var obj = "\n\
                        <div class=\"shopItemsNewEditPropertyBlockPropertyElement\" id=\"blockProperty_" + blockId + "_" + idProperty + "\">\n\
                            <div class=\"shopItemsNewEditPropertyBlockPropertyElementFields\">\n\
                                <div class=\"shopItemsNewEditPropertyPropertyElement\">\n\
                                    <div class=\"shopItemsNewEditPropertyProperty\">\n\
                                        <div class=\"shopItemsNewEditPropertyPropertyInput\">" + propertyName + "</div>\n\
                                        <div class=\"shopItemsNewEditPropertyExitBlockPropertyDeleteProperty\" idProperty=\"" + idProperty + "\" idBlock=\"" + blockId + "\" title=\"Удалить свойство\">x</div>\n\
                                    </div>\n\
                                </div>\n\
                                <div class=\"shopItemsNewEditPropertyValueElement\">\n\
                                    "+ getInputValue(idProperty) +"\n\
                                    <div class=\"shopItemsNewEditPropertyValueElementAddElementValue\" id=\"shopItemsNewEditPropertyValueElementAddElementValue_" + blockId + "\" idProperty=\"" + idProperty + "\">Добавить поле для значения</div>\n\
                                </div>\n\
                                <div class=\"clear\">\n\
                            </div>\n\
                        </div>";
                    return obj;
                }';

        // Удалить новое св-во
        $out .= 'function getNewPropertyDelete(butonBlockId, propertyId) {
                    $(butonBlockId).each(function() {
                        var idProperty = $(this).attr("idProperty");
                        if(idProperty == propertyId) {
                            $(this).click(function() {
                                var idProperty = $(this).attr("idProperty");
                                blockId = $(this).attr("idBlock");
                                $("#propertyCheckbox_" + blockId + "_" + idProperty).prop("checked", false);
                                $("#blockProperty_" + blockId + "_" + idProperty).remove();
                            });
                        }
                    });
                }';

        // Генерация блока св-тв и добавление к нему событий
        $out .= 'function generateEvent(idProperty, nameProperty) {
                    var obj = getBlockPropertyField(idProperty, nameProperty);
                    $("#shopItemsNewEditPropertyBlockProperty_" + blockId).prepend(obj);
                    getAddFieldValueID(blockId, idProperty);
                    getSearchValueItem(); 
                    getValueDelete();
                    getNewPropertyDelete("#shopItemsNewEditPropertyBlockProperty_" + blockId + " .shopItemsNewEditPropertyExitBlockPropertyDeleteProperty", idProperty); 
                }';
        // Добавление/удаление св-тв для выбраных товаров
        $out .= '$(".shopItemsNewEditPropertyElementAllListProperty").change(function() {
                    var element = $(this).find("span");
                    var idProperty = element.attr("idProperty");
                    var nameProperty = element.html();
                    if ($("#propertyCheckbox_" + blockId + "_" + idProperty).prop("checked")) {
                        generateEvent(idProperty, nameProperty);
                    } else {
                        $("#blockProperty_" + blockId + "_" + idProperty).remove();
                    }
                    selectProperty();
                    return false;
                });';

        // Постепенный выбор всех свойств 
        $out .='function selectProperty() {
                    var checkbox_count = $(".shopItemsNewEditDescriptionElementAllListPropertyCheckbox").length; 
                    var checked_count = $(":checkbox:checked.shopItemsNewEditDescriptionElementAllListPropertyCheckbox").length; 
                    if (checkbox_count == checked_count) {
                        $("#shopItemsNewEditPropertyButonSelectAllProperty").prop("checked", true);
                    } else {
                        $("#shopItemsNewEditPropertyButonSelectAllProperty").prop("checked", false);
                    }
                }';

        // Выбрать все свойства
        $out .='$("#shopItemsNewEditPropertyButonSelectAllProperty").change(function() {
                    var curentHasProperty = 
                        $("#shopItemsNewEditPropertyBlockProperty_" + blockId + " div .shopItemsNewEditPropertyExitBlockPropertyDeleteProperty").map(function(i, element) {
                            return $(element).attr("idProperty");
                        }).get();
                    if ($(this).prop("checked")) {
                        $(".shopItemsNewEditPropertyBlockAllListProperty").find(".shopItemsNewEditDescriptionElementAllListPropertyCheckbox").prop("checked", true);
                        $.each(dataProperty, function(id, name) {
                            if ($.inArray(id, curentHasProperty) < 0 ) {
                                generateEvent(id, name);
                            }
                        });
                    } else {
                        $.each(dataProperty, function(id, name) {
                            $("#blockProperty_" + blockId + "_" + id).remove();
                            $(".shopItemsNewEditPropertyBlockAllListProperty").find(".shopItemsNewEditDescriptionElementAllListPropertyCheckbox").prop("checked", false);
                        });
                    }
                });';
        // Запустить
        $out .='$(function() {
                        getSearchValueItem(); 
                        getValueDelete();
                        selectProperty();
                    });';

        $out .='});';
        $out .='</script>';
        return $out;
    }

}

// Класс для генерирования HTML блока со всеми доступными товарами

class AllItemsBllockForProperty {

    private $curentHasBlock;
    private $curentAllBlock;
    private $SQL_HELPER;
    private $data;

    public function __construct($curentHasBlock, $curentAllBlock, $textNewAjax) {
        global $_SQL_HELPER;
        $this->SQL_HELPER = $_SQL_HELPER;
        $this->curentHasBlock = $curentHasBlock;
        $this->curentAllBlock = $curentAllBlock;
        $this->textNewAjax = $textNewAjax;
        $this->data = $this->getDataItem();
        asort($this->data);
    }

    /**
     * Генерирование скрытого списка всех товаров
     * @return string
     */
    public function generationListAllItems() {
        $out = '';
        $out .= '<div class="shopItemsNewEditPropertyBlockAllListItems" id="shopItemsNewEditPropertyBlockAllListItems">';
        $out .= '<input type="checkbox" name="shopItemsNewEditPropertyElementSelectAlltemsCheckbox" title="все товары" id="shopItemsNewEditPropertyButonSelectAllList">';
        $out .= '<div class="shopItemsNewEditPropertyTitletList">Все наименования</div>';
        $out .= '<div class="shopItemsNewEditPropertyButtonExitList" id="shopItemsNewEditPropertyButtonExitList">x</div>';
        $out .= '<div class="shopItemsNewEditPropertyMainListItems">';
        if (!empty($this->data)) {
            foreach ($this->data as $id => $name) {
                $out .= $this->generationElementListAllItems($id, $name);
            }
        } else {
            $out .= '<div class="shopItemsNewEditDescriptionElementAllListItems shopItemsNewEditTextItemName noItems">Доступных товаров нет</div>';
        }
        $out .= '<div class="clear"></div>';
        $out .= '</div>';
        $out .= '</div>';
        $out .= $this->generationJS();
        return $out;
    }

    /**
     * Генерирование элемента для скрытого списка всех товаров
     * @param type $item
     * @return string
     */
    private function generationElementListAllItems($id, $name) {
        $html = '';
        $html .= '<label class="shopItemsNewEditPropertyElementAllListItems shopItemsNewEditTextItemName">';
        $checked = '';
        (in_array($id, $this->curentHasBlock)) ? $checked .= 'checked' : $checked .= '';
        $html .= '<input type="checkbox" name="shopItemsNewEditPropertyElementAllListItemsCheckbox[]" ' . $checked . ' class="shopItemsNewEditPropertyElementAllListItemsCheckbox" value="' . $id . '" id="itemsPropertyCheckbox_' . $id . '">';
        $html .= '<span class="shopItemsNewEditPropertyElementAllListItemsItemsName" id="allItemId_' . $id . '" itemId="' . $id . '">';
        $html .= $name;
        $html .= '</span>';
        $html .= '</label>';
        return $html;
    }

    /**
     * Название товара с учетом возможного изменения
     * @return type
     */
    private function getDataItem() {
        $data = [];
        foreach ($this->curentAllBlock as $item) {
            $data[$item] = $this->getNameItem($item);
        }
        asort($data);
        $result = array_merge($data, $this->textNewAjax);
        return $result;
    }

    private function getNameItem($id) {
        $query = "SELECT `itemName` FROM `ShopItems` WHERE `id` = '" . $id . "';";
        $nameItem = $this->SQL_HELPER->select($query, 1);
        return $nameItem['itemName'];
    }

    private function generationJS() {
        $out = '';
        $out .='<script type="text/javascript">';

        $out .='$(document).ready(function() {';

        // Выбрать все товары
        $out .='$("#shopItemsNewEditPropertyButonSelectAllList").change(function() {
                        if ($(this).prop("checked")) {
                            $(".shopItemsNewEditPropertyElementAllListItems").find(".shopItemsNewEditPropertyElementAllListItemsCheckbox").prop("checked", true);
                            clearListItemsInBlock();
                            $.each(dataItemsForProperty, function(id, name) {
                                $("#" + blockId).find(".shopItemsNewEditPropertyBlockItemsWrapper").prepend(addItemHasBlock(id, name));
                            });
                        } else {
                            $(".shopItemsNewEditPropertyElementAllListItems").find(".shopItemsNewEditPropertyElementAllListItemsCheckbox").prop("checked", false);
                            clearListItemsInBlock();
                        }
                    });';
        // Выбор/удаление товаров
        $out .='$(".shopItemsNewEditPropertyElementAllListItems").change(function() {
                        var element = $(this).find("span");
                        var idItem = element.attr("itemId");
                        var nameItem = element.html();
                        if ($("#itemsPropertyCheckbox_" + idItem).prop("checked")) {
                            $("#" + blockId).find(".shopItemsNewEditPropertyBlockItemsContent").prepend(addItemHasBlock(idItem, nameItem));
                        } else {
                            $("#propertyItemIdHasProperty_" + blockId + "_" + idItem).remove();
                            $("#shopItemsNewEditPropertyButonSelectAllList").prop("checked", false);                           
                        }
                        selectAllItem();
                        return false;
                    });';

        // Очистить список товаров
        $out .='function clearListItemsInBlock() {
                        var curentHasBlock = 
                            $("#blockItems_" + blockId + " div .shopItemsNewEditPropertyAllListItemsName").map(function(i, element) {
                                return $(element).attr("itemId");
                            }).get();
                        $.each(curentHasBlock, function(index, idItem) {
                            $("#blockItems_" + blockId ).find("#propertyItemIdHasProperty_" + blockId + "_" + idItem).remove();
                        });
                    }';

        // Генерировние HTML строки выбраного товара
        $out .='function addItemHasBlock(idItem, nameItem) {
                        var obj = "<div itemId=\"" + idItem + "\" id=\"propertyItemIdHasProperty_" + blockId + "_" + idItem + "\"><div class=\"shopItemsNewEditPropertyAllListItemsName shopItemsNewEditTextItemName\" itemId=\"" + idItem + "\" id=\"propertyItemId_" + idItem + "\">\n\
                                 " + nameItem + "</div><input type=\"hidden\" name=\"shopItemsNewEditPropertyItemId[" + blockId + "][" + idItem + "]\" value=\"" + idItem + "\"></div>";
                        return obj;
                    }';

        // Постепенный выбор всех товаров 
        $out .='function selectAllItem() {
                        var checkbox_count = $(".shopItemsNewEditPropertyElementAllListItemsCheckbox").length; 
                        var checked_count = $(":checkbox:checked.shopItemsNewEditPropertyElementAllListItemsCheckbox").length; 
                        if (checkbox_count == checked_count) {
                            $("#shopItemsNewEditPropertyButonSelectAllList").prop("checked", true);
                        }
                    }';
        // Запустить
        $out .='$(function() {
                    selectAllItem();
                });';

        $out .='});';
        $out .='</script>';
        return $out;
    }

}

class GenerationJS {

    public static function getCodeSearch() {
        $out = ' function getSearchValueItem() {
                    $(".shopItemsNewEditPropertyValueElementValueInput").keyup(function() {
                        var id = $(this).attr("idProperty"); 
                        var simbol = $(this).val();
                        var elem = $(this);
                        if (event.keyCode !== 9) {
                            if (simbol !== "") {
                                searchValueItem(simbol, id, elem);
                            }
                        } else {
                            event.preventDefault();
                            $(".shopItemsSearchResultContent").hide();
                        }
                        return false;
                    });
                }

                function searchValueItem(simbol, id, elem) {
                    $.ajax({
                        type: "GET",
                        url: "./components/Shop/admin/script/searchShopItem.php",
                        cache: false,
                        data: { 
                            "id":id,
                            "simbol":simbol 
                            },
                        success: function(result) {
                            var place = $(".shopItemsSearchResult");
                            elem.siblings("#shopItemsSearchResult").html(result);
                            getResultValueItem(elem);
                            hideBlockResult();
                        }
                    });
                    return false;
                };

                function getResultValueItem(elem) { 
                    $(".shopItemsSearchResultValue").click(function () {
                        var result = $(this).text();
                        $(".shopItemsSearchResultContent").fadeOut(350).html("");
                        elem.val(result);
                    });
                }
                        
                function hideBlockResult() {
                    $(document).click(function(event) {
                        if ($(event.target).closest(".shopItemsSearchResultContent").length) return;
                        $(".shopItemsSearchResultContent").hide();
                        event.stopPropagation();
                    });
                }';
        return $out;
    }

    public static function getCodeAllProperty($property, $item) {
        $out = '';
        // Сгенерировать блок со всеми св-ми
        $out .='function getAllProperty() {
                    $(".shopItemsNewEditPropertyAllProperty").click(function() {
                        blockId = $(this).attr("blockid");
                        $(".shopItemsNewEditPropertyBlockAllList").remove();
                        generationAllProperty(); 
                    });
                }';
        // Сгенерировать определенный блок со всеми св-ми
        $out .='function getAllPropertyForBlock(id) { 
                    $("#shopItemsNewEditPropertyAllProperty_" + id).click(function() {
                        if( $("*").is(".shopItemsNewEditPropertyBlockAllList") ) {
                            $(".shopItemsNewEditPropertyBlockAllList").remove();
                        }
                        blockId = id;
                        generationAllProperty(); 
                    });
                }';
        // Генерирование блока со всеми св-ми
        $out .='function generationAllProperty() {
                    var curentPropertyBlock = [];
                    curentPropertyBlock = 
                    $("#shopItemsNewEditPropertyBlockProperty_" + blockId + " .shopItemsNewEditPropertyExitBlockPropertyDeleteProperty").map(function(i, element) {
                       return $(element).attr("idProperty");
                    }).get(); 
                    var property = ' . $property . ';
                    generationHtmlAllProperty(property, curentPropertyBlock);
                }';
        // Генерирование HTML блока со всеми св-ми
        $out .= 'function generationHtmlAllProperty(property, curentPropertyBlock) {
                    $.ajax({
                        type: "POST",
                        url: "./components/Shop/admin/script/shopItemsNewEditPropertyAllProperty.php",
                        cache: false,
                        data: { 
                            "property":property,
                            "curentPropertyBlock":curentPropertyBlock,
                            "blockId":blockId
                        },
                        success: function(result) {
                            $(".shopItemsNewEditPropertyBlockGeneral").append(result);
                            deleteAllProperty();
                            getValueDelete();
                            getSearchValueItem();
                            hideAllPropertyBllock();
                        }
                    });
                    return false;
                }';
        // Удалить блок  со всеми св-ми
        $out .='function deleteAllProperty() {
                    $(".shopItemsNewEditPropertyButtonExitList").click(function() {
                        $(".shopItemsNewEditPropertyBlockAllList").remove();
                    });
                }';
        // Сгенерировать дополнительный блок для другого набора св-тв
        $out .='$(".shopItemsNewEditPropertyButtonAddBlockGeneral").click(function() {
                    generationBlockProperty();
                });';
        // Генерирование HTML дополнительный блок для другого набора св-тв 
        $out .='function generationBlockProperty() {
                    var items = ' . $item . ';
                    $.ajax({
                        type: "POST",
                        url: "./components/Shop/admin/script/shopItemsNewEditPropertyPropertyElement.php",
                        cache: false,
                        data: { "items":items },
                        success: function(result) {
                            $(".shopItemsNewEditPropertyButtonAddBlockGeneral").before(result);
                            var id = $(result).attr("id");
                            getAllPropertyForBlock(id); // !!!!!!!!!!!!!!!
                            generationUIBlockAllItemsForPropertyID(id); // !!!!!!!!!!!!!!!
                        }
                    });
                    return false;
                }';
        // Скрыть блок с доступными свойствами
        $out .='function hideAllPropertyBllock() {
                    $(document).click(function(event) {
                        if ($(event.target).closest(".shopItemsNewEditPropertyBlockAllList").length) return;
                        $(".shopItemsNewEditPropertyBlockAllList").hide();
                        event.stopPropagation();
                    });
                }';
        return $out;
    }

    public static function getCodeAllItems() {
        $out = '';
        // Сгенерировать блок со всеми товарами  
        $out .='function generationUIBlockAllItemsForProperty() { 
                    $("div .shopItemsNewEditPropertyButtonAllItems").click(function() { 
                        $(".shopItemsNewEditPropertyBlockAllListItems").remove();
                        blockId = $(this).attr("blockid");
                        getListAllItemsForProperty(); 
                    });
                }';
        // Сгенерировать определенный блок со всеми товарами 
        $out .='function generationUIBlockAllItemsForPropertyID(id) { 
                    $("#propertyButtonAllItems_" + id).click(function() {
                        if( $("*").is(".shopItemsNewEditPropertyBlockAllListItems") ) {
                            $(".shopItemsNewEditPropertyBlockAllListItems").remove();
                        }
                        blockId = id;
                        getListAllItemsForProperty(); 
                    });
                }';
        // Генерирование блока со всеми товарами 
        $out .='function getListAllItemsForProperty() { 
                    var curentHasBlock = 
                    $("#shopItemsNewEditPropertyItemsBlock_" + blockId + " div .shopItemsNewEditPropertyAllListItemsName").map(function(i, element) {
                        return $(element).attr("itemid");
                    }).get();
                    generationElementForProperty(curentHasBlock, allItemsForProperty);
                }';
        // Генерирование HTML блока со всеми товарами 
        $out .='function generationElementForProperty(curentHasBlock, curentAllBlock) {
                    $.ajax({
                        type: "POST",
                        url: "./components/Shop/admin/script/shopItemsNewEditPropertyAllItems.php",
                        cache: false,
                        data: {
                            "curentHasBlock":curentHasBlock,
                            "curentAllBlock":curentAllBlock,
                            "textNewAjax":textNewAjax,
                            },
                        success: function(result) {
                            $(".shopItemsNewEditPropertyBlockGeneral").after(result);
                            deleteAllBlockForProperty(); 
                            hideAllItemsBllockForProperty(); 
                        }
                    });
                    return false;
                }';
        // Удаление блока  со всеми товарами 
        $out .='function deleteAllBlockForProperty() {    
                    $("#shopItemsNewEditPropertyButtonExitList").click(function() {
                        $(".shopItemsNewEditPropertyBlockAllListItems").remove();
                    }); 
                }';
        // Скрыть блок с доступными товарами 
        $out .='function hideAllItemsBllockForProperty() { 
                    $(document).click(function(event) {
                        if ($(event.target).closest(".shopItemsNewEditPropertyBlockAllListItems").length) return;
                        $(".shopItemsNewEditPropertyBlockAllListItems").hide();
                        event.stopPropagation();
                    });
                }';
        return $out;
    }

    public static function getCodeValue() {
        $out = '';
        // Генерирование HTML дополнительного поля для значения св-ва
        $out .= 'function getInputValue(idProperty) {                                                                                                                        
                    var inputValue = "\n\
                        <div class=\"shopItemsNewEditPropertyValueElementValue\">\n\
                            <input type=\"text\" class=\"shopItemsNewEditPropertyValueElementValueInput\" name=\"shopItemsNewEditPropertyValueElementValueInput["+ blockId + "]["+ idProperty + "][]\" autofocus idProperty=\""+ idProperty +"\" id=\"valueElement_"+ idProperty +"\">\n\
                            <div class=\"shopItemsNewEditPropertyValueElementDeleteValue\" title=\"Удалить значение\">x</div>\n\
                            <div class=\"shopItemsSearchResult\" id=\"shopItemsSearchResult\"></div>\n\
                        </div>";
                    return inputValue;
                }';
        // Удалить значение св-ва

        $out .= 'function getValueDelete() {
                    $(".shopItemsNewEditPropertyValueElementDeleteValue").click(function() {
                        $(this).parent().remove();
                    });
                    event.stopPropagation();
                }';

        return $out;
    }

}
