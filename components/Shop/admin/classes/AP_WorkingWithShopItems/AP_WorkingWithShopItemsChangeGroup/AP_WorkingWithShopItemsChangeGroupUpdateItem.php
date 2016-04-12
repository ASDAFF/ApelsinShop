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
 * Перемещение товаров в другой каталог
 *
 * @author Olga Rjabchikova
 * @copyright © 2010-2016, CompuProjec
 * @created 07.04.2016 10:28:34
 */
class AP_WorkingWithShopItemsChangeGroupUpdateItem {

    private $html;
    private $groupOldId;
    private $SQL_HELPER;
    private $urlHelper;
    private $params = [];
    private $checkAllValueErrors;

    public function __construct($groupOldId) {
        global $_SQL_HELPER;
        global $_URL_PARAMS;
        $this->SQL_HELPER = $_SQL_HELPER;
        $this->params = $_URL_PARAMS['params'];
        $this->urlHelper = new UrlHelper();
        $this->groupOldId = $groupOldId;
        $this->html = "";
        $this->update();
    }

    public function getHtml() {
        $this->moveItems();
        return $this->html;
    }

    private function moveItems() {
        $listItems = new AP_WorkingWithShopItemsEditSelectItems($this->groupOldId);
        $shopGroupsTree = new ShopGroupsTree();
        $shopGroupsTree->addFunctionalButton('moveItemParent', 'addGroupId(groupId,object);', 'Выбрать', true);
        $this->html .= '<div class="workingWithShopItemsChangeGroupUpdateItemWrapper">';
        $this->html .= '<form class="AP_FormShopAP_SubmitworkingWithShopItemsChangeGroupUpdateItem" name="AP_FormShopAP_SubmitworkingWithShopItemsChangeGroupUpdateItem" enctype="multipart/form-data" action="' . $this->urlHelper->getThisPage() . '" method="POST" accept - charset="UTF-8" >';
        $this->html .= '<div id="blockHiddenIdProperty"></div>';

        $this->html .= '<div class="workingWithShopItemsEditSelectItems">';
        $this->html .= $listItems->generationListCatalog();
        $this->html .= '</div>';

        $this->html .= '<div class="workingWithShopItemsEditSelectGroup">';
        $this->html .= $shopGroupsTree->getTree();
        $this->html .= '</div>';

        $this->html .= '<div class="clear"></div>';
        $this->html .= '<center>';
        $this->html .= '<input class="AP_SubmitworkingWithShopItemsChangeGroupUpdateItem" type="submit" name="AP_SubmitworkingWithShopItemsChangeGroupUpdateItem" value="Переместить">';

        $this->html .= '</center>';
        $this->html .= '</form>';
        $this->html .= '</div>';
        $this->html .= $this->generatJS();
    }

    private function generatJS() {
        $out = '<script type="text/javascript">
            
            idGroupNewParentItems = "";
            function addGroupId(idGroup,object) {
                if (idGroup !== idGroupNewParentItems && idGroupNewParentItems === "") {
                    idGroupNewParentItems = idGroup;
                    $("#blockHiddenIdProperty").prepend(getIdGroup(idGroup));
                    $(object).addClass("shopItemsNewItemsCardsBlockItemCardActiveClass");
                } else if(idGroup !== idGroupNewParentItems && idGroupNewParentItems !== "") {
                    idGroupNewParentItems = idGroup;
                    $(".RootGroup").find(".GroupTreeFunctionalButton").removeClass("shopItemsNewItemsCardsBlockItemCardActiveClass");
                    $("#blockHiddenIdProperty").find(".shopGetIdGroup").remove();
                    $("#blockHiddenIdProperty").prepend(getIdGroup(idGroup));
                    $(object).addClass("shopItemsNewItemsCardsBlockItemCardActiveClass");
                } else {
                    idGroupNewParentItems = null;
                    $(".RootGroup").find(".GroupTreeFunctionalButton").removeClass("shopItemsNewItemsCardsBlockItemCardActiveClass");
                    $("#shopGetIdGroup_" + idGroup).remove();
                }
            }

            // Генерирование HTML hidden - поля для addGroupId
            function getIdGroup(idGroup) { 
                var inputHidden = "<input type=\"hidden\" class=\"shopGetIdGroup\"  name=\"shopGetIdGroup\" value=\""+ idGroup +"\"  id=\"shopGetIdGroup_"+ idGroup +"\"> ";
                return inputHidden;
            }
        </script>';
        return $out;
    }

    private function update() {
        if (isset($_POST['AP_SubmitworkingWithShopItemsChangeGroupUpdateItem'])) {
            if ($this->getAllValue()) {
                $this->insert();
            } else {
                if ($this->checkAllValueErrors != null) {
                    foreach ($this->checkAllValueErrors as $CVerror) {
                        $this->html = $CVerror . "<br />";
                    }
                }
            }
        }
    }

    private function getAllValue() {
        $error = false;
        if (!isset($_POST['shopGetIdGroup']) || $_POST['shopGetIdGroup'] == null || $_POST['shopGetIdGroup'] == "") {
            $error = true;
            $this->checkAllValueErrors[] = "Каталог не выбран";
        } else {
            $this->idGroup = $_POST['shopGetIdGroup'];
        }
        if (!isset($_POST['editItem']) || empty($_POST['editItem'])) {
            $error = true;
            $this->checkAllValueErrors[] = "Товар не выбран";
        } else {
            $this->editItem = $_POST['editItem'];
        }
        return !$error;
    }

    private function insert() {
        foreach ($this->editItem as $id) {
            $query = "UPDATE `ShopItems` SET ";
            $query .= "`group` = '" . $this->idGroup . "' ";
            $query .= "WHERE `id` = '" . $id . "' ;";
            $this->SQL_HELPER->insert($query);
        }
    }

}
