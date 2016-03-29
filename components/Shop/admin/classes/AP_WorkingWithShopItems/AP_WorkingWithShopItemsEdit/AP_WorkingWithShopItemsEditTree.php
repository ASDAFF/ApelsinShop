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
 * Description of AP_WorkingWithShopItemsEditTree
 *
 * @author Olga Rjabchikova
 * @copyright © 2010-2016, CompuProjec
 * @created 10.03.2016 16:29:57
 */
class AP_WorkingWithShopItemsEditTree {

    private $html;
    private $urlHelper;
    private $params = [];

    public function __construct() {
        global $_URL_PARAMS;
        $this->params = $_URL_PARAMS['params'];
        $this->urlHelper = new UrlHelper();
        $this->generationTree();
    }

    public function getHtml() {
        return $this->html;
    }

    private function generationTree() {
        if (isset($this->params[4]) && isset($this->params[5])) {
            $groupId = $this->params[5];
            switch ($this->params[4]) {
                case 'workingWithShopItemsEditItems':
                    $page = new AP_WorkingWithShopItemsEditSelectItems($groupId);
                    break;
                case 'workingWithShopItemsEditItemsEdit':
                    $page = new AP_WorkingWithShopItemsEditEdit($groupId);
                    break;
                case 'workingWithShopNewItemsHandlerData':
                    $page = new AP_WorkingWithShopItemsNewHandlerData($groupId);
                    break;
                default:
                    $this->html = 'неверная URL';
                    break;
            }
        } else {
            $shopGroupsTree = new ShopGroupsTree();
            $shopGroupsTree->addFunctionalButton(
                    'workingWithShopItemsEditItems', 'window.location.href = "' . $this->urlHelper->chengeParams($this->params) . 'workingWithShopItemsEditItems/" + groupId + "/"', 'Выбрать', true);
            $this->html = $shopGroupsTree->getTree();
        }
        if (isset($page)) {
            $this->html = $page->getHtml();
        }
    }

}
