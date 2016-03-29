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
 * Description of AP_WorkingWithShopItemsEditSelectItems
 *
 * @author Olga Rjabchikova
 * @copyright © 2010-2016, CompuProjec
 * @created 10.03.2016 16:52:11
 */
class AP_WorkingWithShopItemsEditSelectItems {

    private $group;
    private $html;
    private $SQL_HELPER;
    private $params;
    private $urlHelper;
    private $dataListElement;
    private $helperGroup;

    public function __construct($group) {
        global $_SQL_HELPER;
        global $_URL_PARAMS;
        $this->SQL_HELPER = $_SQL_HELPER;
        $this->params = $_URL_PARAMS['params'];
        $this->urlHelper = new UrlHelper();
        $this->group = $group;
        $this->dataListElement = [];
        $this->helperGroup = new ShopGroupsHelper();

        $this->generationUI();
    }

    public function getHtml() {
        return $this->html;
    }

    private function generationJS() {
        $out = '
            <script type="text/javascript">
            $(document).ready(function() {

                function getNewItemListGroupTitleButtonBlockId(object) {
                    return $(object).attr("blockId");
                };

                function setCheckboxNoneForNewItemListGroup(blockid) {
                    $("#"+blockid+" .newItemListGroupTitleText").removeClass("checkboxAll");
                    $("#"+blockid+" .newItemListGroupTitleText").removeClass("checkboxSome");
                    $("#"+blockid+" .newItemListGroupTitleText").addClass("checkboxNone");
                };

                function setCheckboxSomeForNewItemListGroup(blockid) {
                    $("#"+blockid+" .newItemListGroupTitleText").removeClass("checkboxNone");
                    $("#"+blockid+" .newItemListGroupTitleText").removeClass("checkboxAll");
                    $("#"+blockid+" .newItemListGroupTitleText").addClass("checkboxSome");
                };

                function setCheckboxAllForNewItemListGroup(blockid) {
                    $("#"+blockid+" .newItemListGroupTitleText").removeClass("checkboxNone");
                    $("#"+blockid+" .newItemListGroupTitleText").removeClass("checkboxSome");
                    $("#"+blockid+" .newItemListGroupTitleText").addClass("checkboxAll");
                };

                $(".newItemListGroupTitleText").click(function() {
                    var blockid = getNewItemListGroupTitleButtonBlockId(this);
                    $(this).parent().siblings().toggle();
                });

                $(".newItemListGroupTitleButtonSelectAll").click(function() {
                    var blockid = getNewItemListGroupTitleButtonBlockId(this);
                    $("#"+blockid+" .newItemItem").prop("checked", true);
                    setCheckboxAllForNewItemListGroup(blockid);
                });

                $(".newItemListGroupTitleButtonCancelAll").click(function() {
                    var blockid = getNewItemListGroupTitleButtonBlockId(this);
                    $("#"+blockid+" .newItemItem").prop("checked", false);
                    setCheckboxNoneForNewItemListGroup(blockid);
                });

                $(".newItemItem").change(function() {
                    var blockid = getNewItemListGroupTitleButtonBlockId(this);
                    countAll = $("#"+blockid+" input[type=checkbox].newItemItem").length;
                    countChecked = $("#"+blockid+" input[type=checkbox]:checked.newItemItem").length;
                    if (countChecked >= countAll) {
                        setCheckboxAllForNewItemListGroup(blockid);
                    } else if (countChecked <= 0) {
                        setCheckboxNoneForNewItemListGroup(blockid);
                    } else {
                        setCheckboxSomeForNewItemListGroup(blockid);
                    }
                });

            });
            </script>';
        return $out;
    }

    private function generationJSAddClass($id, $class) {
        $out = '
            <script type="text/javascript">
            $(function() {
                $("#"+"' . $id . '"+" .newItemListGroupTitleText").addClass("' . $class . '");
            });
            </script>';
        return $out;
    }

    private function generationUI() {
        $this->params[4] = 'workingWithShopItemsEditItemsEdit';
        $this->html = '';
        $this->html .= '<div class="PreloaderBlock"></div>';
        $this->html .= '<div class="workingWithShopItemsEditSelectItemsEditWrapper PreloaderBlockContent">';
        $this->html .= '<form class="AP_FormWorkingWithShopItemsEditSelectItemsEdit" name="AP_FormWorkingWithShopItemsEditSelectItemsEdit" action="' . $this->urlHelper->chengeParams($this->params) . '" method="POST" accept - charset="UTF-8" autocomplete="on">';
        $this->html .= $this->generationListCatalog();
        $this->html .= '<center>';
        $this->html .= '<input class="AP_SubmitWorkingWithShopItemsEditSelectItemsEditForm" type="submit" name="AP_SubmitWorkingWithShopItemsEditSelectItemsEditForm" value="Редактировать">';
        $this->html .= '</center>';
        $this->html .= '</form>';
        $this->html .= '</div/>';
        $this->html .= $this->generationJS();
    }

    private function generationListCatalog() {
        $out = '';
        $out .= '<div class="workingWithShopItemsEditSelectItemsWrapper">';
        $out .= $this->getListCatalog($this->group);
        $out .= '</div>';
        return $out;
    }

    private function getListCatalog($groupId) {
        $children = $this->helperGroup->getGroupNodeChildren($groupId);
        if (!empty($children)) {
            $content = true;
        } else {
            $content = false;
        }
        $id = ID_GENERATOR::generateID();
        $out = '<ul class="newItemListGroup newItemCatalogSelectGroupWrapperUL" id="' . $id . '">';
        $out .= $this->generationCatalog($groupId, $id, $content);
        foreach ($children as $child) {
            if ($child != null) {
                $out .= '<li class="newItemListGroupHidden" style="display: none">';
                $out .= $this->getListCatalog($child);
                $out .= '</li>';
            }
        }
        $out .= "</ul>";
        return $out;
    }

    private function generationCatalog($groupId, $id, $content) {
        $out = '<div class="newItemListGroupTitle">';
        $out .= '<div class="newItemListGroupTitleButtonSelectAll newItemListGroupTitleButton checkboxNone" id="newItemListGroupTitleButtonSelectAll" title="" blockId="' . $id . '">Выделить</div>';
        $out .= '<div class="newItemListGroupTitleButtonCancelAll newItemListGroupTitleButton" id="newItemListGroupTitleButtonCancelAll" title="" blockId="' . $id . '">Очистить</div>';
        $out .= '<div class="newItemListGroupTitleText " blockId="' . $id . '" >' . $this->getGroupName($groupId) . '</div>';
        $out .= '<div class="clear"></div>';
        $out .= '</div>';
        $out .= $this->generationListItems($groupId, $id, $content);
        return $out;
    }

    private function generationListItems($groupId, $id, $content) {
        $out = '';
        $this->getDataItem($groupId);
        $out .= '<div class="newItemListGroupWrapper" style="display: none">';
        foreach ($this->dataListElement as $item) {
            $i = 0;
            $checked = '';
            $out .= $this->generationElementItem($item, $id, $checked);
            if ($i >= count($item)) {
                $out .= $this->generationJSAddClass($id, "checkboxAll");
            } else if ($i <= 0) {
                $out .= $this->generationJSAddClass($id, "checkboxNone");
            } else {
                $out .= $this->generationJSAddClass($id, "checkboxSome");
            }
        }

        if (!$content && (empty($this->dataListElement) || $this->dataListElement == null)) {
            $out .= '<div>Данные в каталоге отсутствуют</div>';
        }
        $out .= '</div>';
        return $out;
    }

    /**
     * Генерация элемента св-ва
     * @param type $item
     * @return string
     */
    private function generationElementItem($item, $id, $checked) {
        $out = '<div class="newItemListElement">';
        $out .= '<div class="newItemListElementNameItem">';
        $out .= '<label class="newItemListElementLabel">';
        $out .= '<input type="checkbox" class="newItemItem" name="editItem[]" id="newItemItem" value="' . $item["id"] . '"  blockId="' . $id . '" ' . $checked . '>';
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

    /**
     * Возвращает название группы
     * @return type
     */
    private function getGroupName($group) {
        $query = "SELECT `groupName` FROM `ShopGroups` WHERE `id` = '" . $group . "'";
        $name = $this->SQL_HELPER->select($query, 1);
        return $name['groupName'];
    }

    private function getDataItem($group) {
        $query = "SELECT `id`, `itemName`, `group`, `status` FROM `ShopItems` WHERE "
                . "`group` = '" . $group . "' GROUP BY `itemName`;";
        $this->dataListElement = $this->SQL_HELPER->select($query);
    }

}
