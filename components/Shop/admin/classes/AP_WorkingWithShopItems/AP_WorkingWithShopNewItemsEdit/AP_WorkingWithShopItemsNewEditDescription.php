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
 * Редактирование описания товаров
 *
 * @author Olga Rjabchikova
 * @copyright © 2010-2016, CompuProjec
 * @created 29.01.2016 12:06:17
 */
class AP_WorkingWithShopItemsNewEditDescription extends AP_AbstractPanelEditNewItems {

    private $notHasDescription;      // id товаров, не имеющие описание
    private $hasDescription;         // id товаров, имеющие описание
    private $descriptions;           // все описания
    private $dataItem;

    public function __construct($data) {
        parent::__construct($data);
        $this->setNamePanel('Редактирование описания');
        // Все уникальные описания
        $this->getDataDescription();
        // Все id и itemName товаров, имеющих описание
        $this->getDataHasDescription();
        // Все id товаров, не имеющих описание
        $this->getIdItemsNotHasDescription();
        $this->dataItem = $this->getDataItem();
    }

    public function getContentPanel() {
        $this->html .= '<div class="shopItemsNewEditDescriptionWrapper">';
        $this->html .= '<div class="shopItemsNewEditDescriptionBlockGeneral" >';
        $this->html .= '<div class="shopItemsNewEditDescriptionBlockItemHasDescriptionWrapper" >';
        foreach ($this->descriptions as $description) {
            if ($description['description'] != '') {
                $this->html .= $this->getHasDescriptionBlock($description['description']);
            }
        }
        $this->html .= '</div>';
        $this->html .= '<div class="shopItemsNewEditDescriptionButtonAddBlockGeneral shopItemsNewEditTextItemName" id="shopItemsNewEditDescriptionButtonAddBlockGeneral">';
        $this->html .= 'Добавить поле для описания';
        $this->html .= '</div>';
        $this->html .= '</div>';
        $this->html .= $this->generationJS();
        $this->html .= '</div>'; // shopItemsNewEditDescriptionWrapper
        return $this->html;
    }

    private function generationJS() {
        $out = '';
        $out .= '<script type="text/javascript">';
        $out .= '   $(document).ready(function() {';

        $out .= 'dataItems = ' . json_encode($this->dataItem) . ';
                    allItems = ' . json_encode($this->items) . ';
                    hasDescription = ' . json_encode($this->hasDescription) . ';';

        // Получить всплывающий лист товаров 
        $out .= 'function generationUIBlockAllItems() { 
                    $("div .shopItemsNewEditDescriptionButtonAllItems").click(function() { 
                        $(".shopItemsNewEditDescriptionBlockAllListCItems").remove();
                        blockIdDescription = $(this).attr("blockid");
                        getListAllItems(blockIdDescription);
                    });
                }';

        $out .='function generationUIBlockAllItemsID(id) {
                    $("#descriptionButtonAllItems_" + id).click(function() {
                        if ($("*").is(".shopItemsNewEditDescriptionBlockAllListCItems") )
                        $(".shopItemsNewEditDescriptionBlockAllListCItems").remove();
                        blockIdDescription = id;
                        getListAllItems(blockIdDescription); 
                    });
                }';

        // Получить данные для всплывающего листа товаров 
        $out .= 'function getListAllItems(blockIdDescription) {
                    var curentAllBlock = []; var notHasDescription = []; 
                    var curentHasBlock = 
                    $("#" + blockIdDescription + " div .shopItemsNewEditDescriptionItemName").map(function(i, element) {
                        return $(element).attr("itemid");
                    }).get();
                    $.each(allItems, function(index, value) {
                        if ($.inArray(value, hasDescription) < 0 ) {
                            notHasDescription.push(value);
                        }
                    });
                    curentAllBlock = $.merge(notHasDescription, curentHasBlock);
                    generationElement(curentHasBlock, curentAllBlock);
                }';

        // Генерирование HTML всплывающего листа товаров  textNewAjax
        $out .= 'function generationElement(curentHasBlock, curentAllBlock) {
                    $.ajax({
                        type: "POST",
                        url: "./components/Shop/admin/script/shopItemsNewEditDescription.php",
                        cache: false,
                        data: {
                            "curentHasBlock":curentHasBlock,
                            "curentAllBlock":curentAllBlock,
                            "textNewAjax":textNewAjax,
                        },
                        success: function(result) {
                            $(".shopItemsNewEditDescriptionBlockItemHasDescriptionWrapper").after(result);
                            deleteAllBlock();
                        }
                    });
                    return false;
                };';

        // Удалить всплывающий лист товаров 
        $out .= 'function deleteAllBlock() {    
                    $("#shopItemsNewEditDescriptionButtonExitList").click(function() {
                        $(".shopItemsNewEditDescriptionBlockAllListCItems").remove();
                    }); 
                };';

        // Запуск
        $out .= '$(function() {
                    generationUIBlockAllItems();
                    hideAllItemsBllock(); 
                });';

        // Генерирование HTML  доп. блока
        $out .= 'function generationUIBlockGeneral() {
                    $.ajax({ 
                        type: "POST", 
                        url: "./components/Shop/admin/script/shopItemsNewEditDescriptionAddBlock.php",
                        cache: false, 
                        success: function(result) {
                            $(".shopItemsNewEditDescriptionBlockItemHasDescriptionWrapper").after(result);
                            var id = $(result).attr("id");
                            generationUIBlockAllItemsID(id);
                        } 
                    });
                    return false; 
                };';

        // Сгенерировать доп. блок
        $out .= '$("#shopItemsNewEditDescriptionButtonAddBlockGeneral").click(function() {  
                    generationUIBlockGeneral();
                });';

        // Скрыть блок с доступными товарами
        $out .='function hideAllItemsBllock() {
                    $(document).click(function(event) {
                        if ($(event.target).closest(".shopItemsNewEditDescriptionBlockAllListCItems").length) return;
                        $(".shopItemsNewEditDescriptionBlockAllListCItems").hide();
                        event.stopPropagation();
                    });
                }';

        $out .= '   });';
        $out .= '</script>';
        return $out;
    }

    /**
     *  Все id товаров, не имеющих описание
     */
    private function getIdItemsNotHasDescription() {
        foreach ($this->items as $item) {
            if (!in_array($item, $this->hasDescription)) {
                $this->notHasDescription[] = $item;
            }
        }
    }

    /**
     * Все id и itemName товаров, имеющих описание
     * @return type
     */
    private function getDataHasDescription() {
        $this->hasDescription = [];
        foreach ($this->descriptions as $description) {
            $dataHasDescriptionItems = $this->getItemHasDescriptionItems($description['description']);
            foreach ($dataHasDescriptionItems as $data) {
                $this->hasDescription[] = $data['id'];
            }
        }
    }

    /**
     * Все уникальные описания
     */
    private function getDataDescription() {
        $query = "SELECT `description` FROM `ShopItems` WHERE (";
        foreach ($this->items as $item) {
            $query .= "`id` = '" . $item . "' OR ";
        }
        $query = mb_strcut($query, 0, strlen($query) - 4);
        $query .= ") AND `description` IS NOT NULL AND `description` != '' GROUP BY `description`;";
        $this->descriptions = $this->SQL_HELPER->select($query);
    }

    /**
     * id и itemName для одного товара
     * @param type $description
     * @return type
     */
    private function getItemHasDescriptionItems($description) {
        $query = "SELECT `id`, `itemName`, `description` FROM `ShopItems` WHERE (";
        foreach ($this->items as $item) {
            $query .= "`id` = '" . $item . "' OR ";
        }
        $query = mb_strcut($query, 0, strlen($query) - 4);
        $query .= ") AND `description` = '" . $description . "' GROUP BY `itemName`;";
        $dataItems = $this->SQL_HELPER->select($query);
        return $dataItems;
    }

    private function getDataItem() {
        $data = [];
        foreach ($this->items as $item) {
            $data[$item] = $this->getNameItem($item);
        }
        return $data;
    }

    /**
     * Формирование данных о товарах имеющих описания
     * @param type $description
     * @return type
     */
    private function getDataHasDescriptionItems($description) {
        $data['hasDescription'] = $this->getItemHasDescriptionItems($description);
        $data['notHasDescription'] = $this->notHasDescription;
        $data['description'] = $description;
        return $data;
    }

    /**
     * Генерирование блока с товарами уже имеющими описания
     * @param type $description
     * @return type
     */
    private function getHasDescriptionBlock($description) {
        $out = '';
        $data = $this->getDataHasDescriptionItems($description);
//        asort($data);
        if ($data != null) {
            $out .= self::generationListItemHasDescription(true, $data);
        }
        return $out;
    }

//    ---------------- Генерирование списка товаров уже имеющих описание -----------

    /**
     * Генерирование списка товаров уже имеющих описание
     */
    public static function generationListItemHasDescription($flag, $data = null) {
        $descriptionText = $data['description'];
        $id = ID_GENERATOR::generateID();
        $out = '<div class="shopItemsNewEditDescriptionBlockItemHasDescription" id="' . $id . '">';
        $out .= '<div class="shopItemsNewEditDescriptionItemNameWrapper">';
        $out .= '<div class="shopItemsNewEditDescriptionMainItemName" idblock="' . $id . '">';
        if ($flag) {
            foreach ($data['hasDescription'] as $item) {
                $data['notHasDescription'][] = $item['id'];
                $out .= self::generationElementListItemHasDescription($item, $id);
            }
        }
        $out .= '</div>';
        $out .= '<div class="shopItemsNewEditDescriptionButtonAllItems shopItemsNewEditTextItemName" id="descriptionButtonAllItems_' . $id . '" blockid="' . $id . '">Добавить товары</div>';
        $out .= '</div>';
        $out .= '<div class="shopItemsNewEditDescriptionBlockDescription">';
        $out .= '<textarea name="shopItemsNewEditDescriptionDescription[' . $id . ']">' . $descriptionText . '</textarea>';
        $out .= '</div>';
        $out .= '<div class="clear"></div>';
        $out .= '</div>';
        return $out;
    }

    /**
     * Генерирование элемента для списка товаров имеющих описания
     * @param type $item
     * @param type $idBlock
     * @return string
     */
    private static function generationElementListItemHasDescription($item, $idBlock) {
        $out = '';
        $out .= '<div itemId="' . $item['id'] . '" id="descriptionItemIdHasDescription_' . $item['id'] . '">';
        $out .= '<div class="shopItemsNewEditDescriptionItemName shopItemsNewEditTextItemName" itemId="' . $item['id'] . '" id="descriptionItemId_' . $item['id'] . '">';
        $out .= $item['itemName'];
        $out .= '</div>';
        $out .= '<input type="hidden" name="shopItemsNewEditDescriptionItemId[' . $idBlock . '][' . $item['id'] . ']" value="">';
        $out .= '</div>';
        return $out;
    }

}

// Класс для генерации блока с доступными товарами

class AllItemsBllock {

    private $curentHasBlock;
    private $curentAllBlock;
    private $blockId;
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
        $out .= '<div class="shopItemsNewEditDescriptionBlockAllListCItems" id="shopItemsNewEditDescriptionBlockAllListItems">';
        $out .= '<input type="checkbox" name="shopItemsNewEditDescriptionElementAllListItemsCheckbox" title="выбрать все товары" id="shopItemsNewEditDescriptionButonSelectAllList" >';
        $out .= '<div class="shopItemsNewEditDescriptionTitletList">Все наименования</div>';
        $out .= '<div class="shopItemsNewEditDescriptionButtonExitList" id="shopItemsNewEditDescriptionButtonExitList">x</div>';
        $out .= '<div class="shopItemsNewEditDescriptionMainListItems">';
        if (!empty($this->data)) {
            foreach ($this->data as $id => $name) {
                $out .= $this->generationElementListAllItems($id, $name);
            }
        } else {
            $out .= '<div class="shopItemsNewEditDescriptionElementAllListItems shopItemsNewEditTextItemName noItems">Доступных товаров нет</div>';
        }
        $out .= '<div class="clear"></div>';
        $out .= '</div>';
        $out .= $this->generationJS($this->blockId);
        $out .= '</div>';
        return $out;
    }

    /**
     * Генерирование элемента для скрытого списка всех товаров
     * @param type $item
     * @return string
     */
    private function generationElementListAllItems($id, $name) {
        $out = '';
        $out .= '<label class="shopItemsNewEditDescriptionElementAllListItems shopItemsNewEditTextItemName">';
        $checked = '';
        (in_array($id, $this->curentHasBlock)) ? $checked .= 'checked' : $checked .= '';
        $out .= '<input type="checkbox" name="shopItemsNewEditDescriptionElementAllListItemsCheckbox[]" ' . $checked . ' class="shopItemsNewEditDescriptionElementAllListItemsCheckbox" id="itemsCheckbox_' . $id . '">';
        $out .= '<span class="shopItemsNewEditDescriptionElementAllListItemsItemsName" itemId="' . $id . '" id="allitemid_' . $id . '">';
        $out .= $name;
        $out .= '</span>';
        $out .= '</label>';
        return $out;
    }

    private function getDataItem() {
        $data = [];
        foreach ($this->curentAllBlock as $item) {
            $data[$item] = $this->getNameItem($item);
        }
        foreach ($this->textNewAjax as $item => $itemName) {
            if (isset($data[$item])) {
                $data[$item] = $itemName;
            }
        }
        return $data;
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
        $out .='$("#shopItemsNewEditDescriptionButonSelectAllList").change(function() {
                            if ($(this).prop("checked")) {
                                $(".shopItemsNewEditDescriptionElementAllListItems").find(".shopItemsNewEditDescriptionElementAllListItemsCheckbox").prop("checked", true);
                                clearListItemsInBlock();
                                $.each(dataItems, function(id, name) {                                
                                    if ($.inArray(id, hasDescription) < 0 ) {
                                        $("#" + blockIdDescription).find(".shopItemsNewEditDescriptionMainItemName").prepend(addItemHasBlock(id, name));
                                        hasDescription.push(id);
                                    }
                                });
                            } else {
                                $(".shopItemsNewEditDescriptionElementAllListItems").find(".shopItemsNewEditDescriptionElementAllListItemsCheckbox").prop("checked", false);
                                clearListItemsInBlock();
                            }
                        });';

        // Очистить список товаров
        $out .='function clearListItemsInBlock() {
                            var curentHasBlock = 
                                $("#" + blockIdDescription + " div .shopItemsNewEditDescriptionItemName").map(function(i, element) {
                                    return $(element).attr("itemid");
                                }).get();
                            $.each(curentHasBlock, function(index, idItem) {
                                var i = hasDescription.indexOf(idItem);
                                hasDescription.splice(i, 1);
                                $("#descriptionItemIdHasDescription_" + idItem).remove();
                            });
                        }';

        // Выбор/удаление товаров
        $out .='$(".shopItemsNewEditDescriptionElementAllListItems").change(function() {
                            var element = $(this).find("span");
                            var idItem = element.attr("itemId");
                            var nameItem = element.html();
                            if ($("#itemsCheckbox_" + idItem).prop("checked")) {
                                $("#" + blockIdDescription).find(".shopItemsNewEditDescriptionMainItemName").prepend(addItemHasBlock(idItem, nameItem));
                                hasDescription.push(idItem);    
                            } else {
                                $("#descriptionItemIdHasDescription_" + idItem).remove();
                                var i = hasDescription.indexOf(idItem);
                                hasDescription.splice(i, 1); 
                                $("#shopItemsNewEditDescriptionButonSelectAllList").prop("checked", false);   
                            }
                            selectAllItems();
                            return false;
                        });';
        // Постепенный выбор всех товаров 
        $out .='function selectAllItems() {
                            var checkbox_count = $(".shopItemsNewEditDescriptionElementAllListItemsCheckbox").length; 
                            var checked_count = $(":checkbox:checked.shopItemsNewEditDescriptionElementAllListItemsCheckbox").length; 
                            if (checkbox_count == checked_count) {
                                $("#shopItemsNewEditDescriptionButonSelectAllList").prop("checked", true);
                            }
                        }';
        // Запустить
        $out .='$(function() {
                selectAllItems();
            });';

        // Генерировние HTML строки выбраного товара
        $out .='function addItemHasBlock(idItem, nameItem) {
                            var obj = "<div id=\"descriptionItemIdHasDescription_" + idItem + "\"><div class=\"shopItemsNewEditDescriptionItemName shopItemsNewEditTextItemName\" itemId=\"" + idItem + "\" id=\"descriptionItemId_" + idItem + "\">\n\
                                     " + nameItem + "</div><input type=\"hidden\" name=\"shopItemsNewEditDescriptionItemId[" + blockIdDescription + "][" + idItem + "]\"></div>";
                            return obj;
                        }';

        $out .='});';
        $out .='</script>';
        return $out;
    }

}
