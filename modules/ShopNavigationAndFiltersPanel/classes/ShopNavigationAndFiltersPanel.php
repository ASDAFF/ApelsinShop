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
 * Description of ShopNavigationAndFiltersPanel
 *
 * @author Maxim Zaitsev
 * @copyright © 2010-2016, CompuProjec
 * @created 10.02.2016 11:12:02
 */
class ShopNavigationAndFiltersPanel {
    
    const ComponentAlias = 'Shop';
    const iconPath = './resources/Components/Shop/Icons/GROUPS/';
    const defaultIcon = 'defaultIcon_50x50';

    private $SQL_HELPER;
    private $THIS_PAGE;
    private $URL_PARAMS;
    
    private $shopGroupsHelper;
    private $navigations;
    private $filters;
    private $HTML;
    private $urlHelper;
    
    public function __construct() {
        global $_URL_PARAMS;
        $this->THIS_PAGE = $_URL_PARAMS['page'];
        $this->URL_PARAMS = $_URL_PARAMS['params'];
        global $_SQL_HELPER;
        $this->SQL_HELPER = $_SQL_HELPER;
        $this->urlHelper = new UrlHelper();
        $this->shopGroupsHelper = new ShopGroupsHelper();
        if($this->checkId()) {
            $this->navigations = new ShopNavigationAndFiltersPanel_Filters($this->shopGroupsHelper);
            $this->filters = new ShopNavigationAndFiltersPanel_Navigation($this->shopGroupsHelper);
            $this->generateHTML();
        } else {
            echo "Неверная ссылка. Группы с таким ID не существует.";
        }
    }
    
    private function checkId() {
        $groupId = ShopPageInfoHelper::shopPageGroupId();
        return $groupId === NULL || $this->shopGroupsHelper->getGroupInfo($groupId) !== NULL;
    }
    
    private function generateHTML() {
        $this->HTML = '';
        $this->HTML .= "<div class='ShopNavigationAndFiltersPanelMain'>";
        $this->HTML .= $this->navigations->getHtml();
        $this->HTML .= $this->filters->getHtml();
        $this->HTML .= "<div class='clear'></div>";
        $this->HTML .= "<div class='ShopNavigationAndFiltersPanelButtonPanel'>";
        $this->HTML .= '<div id="ShopNavigationAndFiltersPanelButtonClose" class="ShopNavigationAndFiltersPanelButton">Скрыть панель</div>';
        $this->HTML .= "<div class='clear'></div>";
        $this->HTML .= "</div>";
        $this->HTML .= "</div>";
    }
    
    public function getHtml() {
        return $this->HTML;
    }
}
