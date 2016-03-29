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
 * Выбор каталога для разьещения новых товаров
 *
 * @author Olga Rjabchikova
 * @copyright © 2010-2016, CompuProjec
 * @created 27.01.2016 8:21:40
 */
class AP_WorkingWithShopItemsNewSelectGroup extends AP_WorkingWithShopItemsNewGeneral {

    // ----------------------- 2 страница -------------------------------

    public function __construct() {
        parent::__construct();
        if (isset($_POST['AP_SubmitNewItemCatalogNewListItems'])) {
            $this->items = $_POST;
        }
        // визуализировать выбранные товары (список)
        $this->generationListItems();
        // предоставить дерево для выбора каталога
        $this->html .= $this->generationTree();
    }

    private function generationTree() {
        $out = '';
        $out .= $this->generationJS();
        $out .= $this->getDataInsert();
        $ShopGroupsTree = new ShopGroupsTree();
        $ShopGroupsTree->addFunctionalButton(
                'workingWithShopNewItemsInsert', 'putNewItemsFromSelectedGroup (elementId, groupId);', 'Разместить здесь', true);
        $out .= $ShopGroupsTree->getTree();
        return $out;
    }

    private function generationJS() {
        $out = '
            <script type="text/javascript">
                function putNewItemsFromSelectedGroup (elementId, groupId) {
                    var groupName = $("#" + elementId).find(".GroupTreeElementContentText").html();
                    $("#hiddenNewGroup").val(groupId);
                    $(".newItemCatalogNewItemInsertText .SelectedGroupName").html(groupName);
                    $("#newItemCatalogListItemInsert").show();
                }
            </script>';
        return $out;
    }

    private function getDataInsert() {
        $this->params[4] = 'workingWithShopNewItemsEdit';
        $out = '<div class="newItemCatalogListItemInsert" id="newItemCatalogListItemInsert" style="display: none;">';
        $out .= '<form class="AP_FormnewItemCatalogListItemInsert" name="AP_FormnewItemCatalogListItemInsert" action="' . $this->urlHelper->chengeParams($this->params) . '" method="POST" accept - charset="UTF-8">';
        $out .= '<input type="hidden" id="hiddenNewGroup" name="hiddenNewGroup" value="">';
        $out .= $this->getElementHidden();
        $out .= '<center>';
        $out .= '<span class="newItemCatalogNewItemInsertText">Разместить товары в каталоге <span class="SelectedGroupName"></span> ?<br /></span>';
        $out .= '<input class="AP_SubmitNewItemCatalogNewItemInsert" type="submit" name="AP_SubmitNewItemCatalogNewItemInsert" value="Продолжить">';
        $out .= '</center>';
        $out .= '</form>';
        $out .= '</div>';
        return $out;
    }

    private function generationListItems() {
        $this->html = '<div class="newItemCatalogSelectGroupWrapper">';
        $this->html .= '<div class="newItemCatalogListItemDuble">';
        $this->html .= '<ul class="newItemCatalogSelectGroupWrapperUL">';
        $this->html .= $this->getElement();
        $this->html .= '</ul>';
        $this->html .= '</div>';
        $this->html .= $this->getElementBack();
        $this->html .= '</div/>'; // newItemCatalogWrapper
    }

    private function getElement() {
        $html = '';
        if (!empty($this->items['newItemItem'])) {
            $i = 1;
            foreach ($this->items['newItemItem'] as $item) {
                $itemName = $this->getNameItem($item);
                $this->replaceName($itemName);
                $itemPath = $i . '. ' . $itemName['directoryPath'] . ' / ' . $itemName['itemName'];
                $html .= '<li>' . $itemPath . '</li>';
                $i++;
            }
        } else {
            $html .= 'Вы не указали товары для редактирования.';
        }
        return $html;
    }

    private function getElementBack() {
        array_pop($this->params);
        $html = '';
        $html .= '<form class="AP_FormNewItemCatalogFor" name="AP_FormNewItemCatalogFor" action="' . $this->urlHelper->chengeParams($this->params) . '" method="POST" accept - charset="UTF-8">';
        $html .= $this->getElementHidden();
        $html .= '<center>';
        $html .= '<input class="AP_SubmitNewItemCatalogForm" type="submit" name="AP_SubmitNewItemCatalogNewItemBack" value="Отмена">';
        $html .= '</center>';
        $html .= '</form>';
        return $html;
    }

    private function getElementHidden() {
        $html = '';
        if (!empty($this->items['newItemItem'])) {
            foreach ($this->items['newItemItem'] as $item) {
                $html .= '<input type="hidden" name="hiddenNewItem[]" value="' . $item . '">';
            }
        }
        return $html;
    }

    private function getNameItem($id) {
        $query = "SELECT `itemName`, `directoryPath` FROM `ShopItems` WHERE  `id` = '" . $id . "';";
        $result = $this->SQL_HELPER->select($query, 1);
        return $result;
    }

}
