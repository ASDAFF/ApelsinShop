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
 * Description of AP_WorkingWithShopCatalog
 *
 * @author Olga Rjabchikova
 * @copyright © 2010-2016, CompuProjec
 * @created 17.11.2015 14:01:57
 */
class AP_WorkingWithShopCatalog {

    private $html;
    private $urlHelper;
    private $params = [];

    public function __construct() {
        global $_URL_PARAMS;
        $this->params = $_URL_PARAMS['params'];
        $this->urlHelper = new UrlHelper();
    }

    public function getHtml() {
        $this->html = '';
        if (isset($this->params[4])) {
            switch ($this->params[4]) {
                case 'AddGroup':
                    if (isset($this->params[5])) {
                        $groupId = $this->params[5];
                        $page = new AP_WorkingWithShopCatalog_AddGroup($groupId);
                    }
                    break;
                case 'EditGroup':
                    if (isset($this->params[5])) {
                        $groupId = $this->params[5];
                        $page = new AP_WorkingWithShopCatalog_EditGroup($groupId);
                    }
                    break;
                case 'DeleteGroup':
                    if (isset($this->params[5])) {
                        $groupId = $this->params[5];
                        $page = new AP_WorkingWithShopCatalog_DeleteGroup($groupId);
                    }
                    break;
                case 'ImportMoveGroup':
                    if (isset($this->params[5]) && isset($this->params[6])) {
                        $groupId = $this->params[5];
                        $moveGroupId = $this->params[6];
                        $page = new AP_WorkingWithShopCatalog_ImportMovingGroup($groupId, $moveGroupId);
                    }
                    break;
                case 'ImportMoveProperty':
                    if (isset($this->params[5])) {
                        $groupId = $this->params[5];
                        $page = new AP_WorkingWithShopCatalog_MoveProperty($groupId);
                    }
                    break;
                default:
                    $this->html = 'неверная URL';
                    break;
            }
            if (isset($page)) {
                $this->html = $page->getHtml();
            }
        } else {
            $ShopGroupsTree = new ShopGroupsTree();
            $ShopGroupsTree->addFunctionalButton(
                    'AddGroup', 'window.location.href = "' . $this->urlHelper->chengeParams($this->params) . 'AddGroup/" + groupId + "/"', 'Добавить');
            $ShopGroupsTree->addFunctionalButton(
                    'EditGroup', 'window.location.href = "' . $this->urlHelper->chengeParams($this->params) . 'EditGroup/" + groupId + "/"', 'Редактировать', true);
            $ShopGroupsTree->addFunctionalButton(
                    'DeleteGroup', 'window.location.href = "' . $this->urlHelper->chengeParams($this->params) . 'DeleteGroup/" + groupId + "/"', 'Удалить', true);
            $ShopGroupsTree->addFunctionalButton(
                    'MovingGroup', 'moveGroup ($("#" + elementId),groupId);', 'Перенести каталог', true);
            $ShopGroupsTree->addFunctionalButton(
                    'ImportMoveGroup', 'window.location.href = "' . $this->urlHelper->chengeParams($this->params) . 'ImportMoveGroup/" + moveGroupId + "/" + groupId + "/"', 'Вставить');
            $ShopGroupsTree->addFunctionalButton(
                    'CancelMoveGroup', 'cancelMoveGroup ();', 'Отменить перенос');

            $ShopGroupsTree->addFunctionalButton(
                    'ImportMoveProperty', 'window.location.href = "' . $this->urlHelper->chengeParams($this->params) . 'ImportMoveProperty/" + groupId + "/"', 'Перенести свойство', true);

            $this->html .= '<div class="AddGroupNameAndPropertyParent" id="AddGroupNameAndPropertyParent"></div>';
            $this->html .= '<div class="AddGroupRanKingParent" id="AddGroupRanKingParent"></div>';
            $this->html .= $ShopGroupsTree->getTree();
            $this->html .= $this->generationJS();
        }
        return $this->html;
    }

    private function generationJS() {
        $html = '<script type="text/javascript">';
        $html .= '    var moveGroupObject = null;';
        $html .= '    var moveGroupId = null;';
        $html .= '    function cancelMoveGroup () {';
        $html .= '        if(moveGroupObject != null) {';
        $html .= '            moveGroupObject.show();';
        $html .= '        }';
        $html .= '        moveGroupObject = null;';
        $html .= '        moveGroupId = null;';
        $html .= '        $(".ImportMoveGroup").hide();';
        $html .= '        $(".CancelMoveGroup").hide();';
        $html .= '        $(".MovingGroup").show();';
        $html .= '        $(".ImportMoveGroup").prop("title","");';
        $html .= '        $(".CancelMoveGroup").prop("title","");';
        $html .= '    }';
        $html .= '    function moveGroup (object, groupId) {';
        $html .= '        if(moveGroupObject != null) {';
        $html .= '            moveGroupObject.show();';
        $html .= '        }';
        $html .= '        moveGroupParentObject = object.parent().parent();';
        $html .= '        moveGroupObject = object.parent();';
        $html .= '        moveGroupObject.hide();';
        $html .= '        moveGroupId = groupId;';
        $html .= '        $(".ImportMoveGroup").show();';
        $html .= '        $(".CancelMoveGroup").show();';
        $html .= '        $(".MovingGroup").hide();';
        $html .= '        var groupName = moveGroupObject.find(".GroupTreeElement .GroupTreeElementContent .GroupTreeElementContentText").html();';
        $html .= '        $(".ImportMoveGroup").prop("title","Вставить каталог " + groupName);';
        $html .= '        $(".CancelMoveGroup").prop("title","Отменить перенос каталога " + groupName);';
        $html .= '    }';
        $html .= '</script>';
        return $html;
    }

}
