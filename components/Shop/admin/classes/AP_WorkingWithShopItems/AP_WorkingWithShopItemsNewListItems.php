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
 * Получение и визуализация списка новых и нераспределенных товаров
 *
 * @author olga
 */
class AP_WorkingWithShopItemsNewListItems extends AP_WorkingWithShopItemsNewGeneral {

    public function __construct() {
        parent::__construct();

        $this->html = '';
        if (isset($this->params[4])) {
            switch ($this->params[4]) {
                case 'workingWithShopNewItemsSelectGroup':
                    $page = new AP_WorkingWithShopItemsNewSelectGroup();
                    break;
                case 'workingWithShopNewItemsEdit':
                    $page = new AP_WorkingWithShopItemsNewInsert();
                    break;
                case 'workingWithShopNewItemsHandlerData':
                    $page = new AP_WorkingWithShopItemsNewHandlerData();
                    break;
                default:
                    $this->html = 'неверная URL';
                    break;
            }
            if (isset($page)) {
                $this->html = $page->getHtml();
            }
        } else {
            if (isset($_POST['AP_SubmitNewItemCatalogNewItemBack'])) {
                $this->items = $_POST;
            }
            $this->generationUI();
        }
    }

    // ---------------- 1 страница ----------------------------------

    private function generationJS() {
        $out = '
            <script type="text/javascript">
            $(document).ready(function() {

                function getNewItemListGroupTitleButtonBlockId(object) {
                    return $(object).attr("blockId");
                };

                function setCheckboxNoneForNewItemListGroup(blockid) {
                    $("#"+blockid).find(".newItemListGroupTitleText").removeClass("checkboxAll");
                    $("#"+blockid).find(".newItemListGroupTitleText").removeClass("checkboxSome");
                    $("#"+blockid).find(".newItemListGroupTitleText").addClass("checkboxNone");
                };

                function setCheckboxSomeForNewItemListGroup(blockid) {
                    $("#"+blockid).find(".newItemListGroupTitleText").removeClass("checkboxNone");
                    $("#"+blockid).find(".newItemListGroupTitleText").removeClass("checkboxAll");
                    $("#"+blockid).find(".newItemListGroupTitleText").addClass("checkboxSome");
                };

                function setCheckboxAllForNewItemListGroup(blockid) {
                    $("#"+blockid).find(".newItemListGroupTitleText").removeClass("checkboxNone");
                    $("#"+blockid).find(".newItemListGroupTitleText").removeClass("checkboxSome");
                    $("#"+blockid).find(".newItemListGroupTitleText").addClass("checkboxAll");
                };

                $(".newItemListGroupTitleText").click(function() {
                    var blockid = getNewItemListGroupTitleButtonBlockId(this);
                    $("#"+blockid).find(".newItemListGroupWrapper").toggle();
                });

                $(".newItemListGroupTitleButtonSelectAll").click(function() {
                    var blockid = getNewItemListGroupTitleButtonBlockId(this);
                    $("#"+blockid).find(".newItemItem").prop("checked", true);
                    setCheckboxAllForNewItemListGroup(blockid);
                });

                $(".newItemListGroupTitleButtonCancelAll").click(function() {
                    var blockid = getNewItemListGroupTitleButtonBlockId(this);
                    $("#"+blockid).find(".newItemItem").prop("checked", false);
                    setCheckboxNoneForNewItemListGroup(blockid);
                });

                $(".newItemItem").change(function() {
                    var blockid = getNewItemListGroupTitleButtonBlockId(this);
                    countAll = $("#"+blockid).find("input[type=checkbox].newItemItem").length;
                    countChecked = $("#"+blockid).find("input[type=checkbox]:checked.newItemItem").length;
                    if(countChecked >= countAll) {
                        setCheckboxAllForNewItemListGroup(blockid);
                    } else if(countChecked <= 0) {
                        setCheckboxNoneForNewItemListGroup(blockid);
                    } else {
                        setCheckboxSomeForNewItemListGroup(blockid);
                    }
                });

            });
            </script>';
        return $out;
    }

    private function getDataRight($data) {
        foreach ($data as &$item) {
            $this->replaceName($item);
        }
        return $data;
    }

    private function getDataItem() {
        $query = "SELECT `id`, `itemName`, `directoryPath`, `status` FROM `ShopItems` WHERE "
                . "`group` = '" . SystemGroupIdConstants::SYSTEM_GROUP_UNALLOCATED_ITEMS . "' "
                . "OR `group` = '" . SystemGroupIdConstants::SYSTEM_GROUP_FOR_NEW_ITEMS . "' GROUP BY `directoryPath`;";
        $result = $this->SQL_HELPER->select($query);
        $this->data = $this->getDataRight($result);
    }

    private function generationUI() {
        $this->params[4] = 'workingWithShopNewItemsSelectGroup';
        $this->getDataItem();
        $this->sortDataItem();
        $this->html = '';
        $this->html .= '<div class="newItemCatalogWrapper">';
        $this->html .= '<form class="AP_FormNewItemCatalogForm" name="AP_FormNewItemCatalogForm" enctype="multipart/form-data" action="' . $this->urlHelper->chengeParams($this->params) . '" method="POST" accept - charset="UTF-8" autocomplete="on">';
        $this->html .= $this->generationGroup();
        $this->html .= '<center>';
        $this->html .= '<input class="AP_SubmitNewItemCatalogForm" type="submit" name="AP_SubmitNewItemCatalogNewListItems" value="Разместить">';
        $this->html .= '</center>';
        $this->html .= '</form>';
        $this->html .= '</div>'; // newItemCatalogWrapper
    }

    private function generationGroup() {
        $out = '';
        foreach ($this->dataListElement as $group => $items) {
            $id = ID_GENERATOR::generateID();
            $out .= '<div class="newItemListGroup" id="' . $id . '">';
            $out .= '<div class="newItemListGroupTitle">';
            $out .= '<div class="newItemListGroupTitleButtonSelectAll newItemListGroupTitleButton checkboxNone" id="newItemListGroupTitleButtonSelectAll" title="" blockId="' . $id . '">Выделить</div>';
            $out .= '<div class="newItemListGroupTitleButtonCancelAll newItemListGroupTitleButton" id="newItemListGroupTitleButtonCancelAll" title="" blockId="' . $id . '">Очистить</div>';
            $out .= '<div class="newItemListGroupTitleText" blockId="' . $id . '" title="показать/скрыть">' . $group . '</div>';
            $out .= '<div class="clear"></div>';
            $out .= '</div>';
            $out .= '<div class="newItemListGroupWrapper" style="display: none">';
            $i = 0;
            foreach ($items as $item) {
                $checked = '';
                if (!empty($this->items['hiddenNewItem']) && in_array($item["id"], $this->items['hiddenNewItem'])) {
                    $checked = 'checked';
                    $i++;
                }
                $out .= $this->generationElement($item, $id, $checked);
            }
            if ($i >= count($items)) {
                $out .= $this->generationJSAddClass($id, "checkboxAll");
            } else if ($i <= 0) {
                $out .= $this->generationJSAddClass($id, "checkboxNone");
            } else {
                $out .= $this->generationJSAddClass($id, "checkboxSome");
            }
            $out .= '</div>';
            $out .= '</div>';
        }
        $out .= $this->generationJS();
        return $out;
    }

    private function generationJSAddClass($id, $class) {
        $out = '<script type="text/javascript">
                    $(function() {
                        $("#"+"' . $id . '").find(".newItemListGroupTitleText").addClass("' . $class . '");
                    });
                </script>';
        return $out;
    }

    /**
     * Генерация элемента св-ва
     * @param type $item
     * @return string
     */
    private function generationElement($item, $id, $checked) {
        $out = '<div class="newItemListElement">';
        $out .= '<div class="newItemListElementNameItem">';
        $out .= '<label class="newItemListElementLabel">';
        $out .= '<input type="checkbox" class="newItemItem" name="newItemItem[]" id="newItemItem" value="' . $item["id"] . '"  blockId="' . $id . '" ' . $checked . '>';
        $out .= $item["itemName"];
        $out .= '</label>';
        $out .= '</div>';
        $out .= '<div class="newItemListElementStatut">';
        $status = '';
        ($item["status"] == '') ? $status .= "Статус отсутствует" : $status .= $item["status"];
        $out .= $status;
        $out .= '</div>';
        $out .= '<div class="clear"></div>';
        $out .= '</div>'; // newItemListElement
        return $out;
    }

}
