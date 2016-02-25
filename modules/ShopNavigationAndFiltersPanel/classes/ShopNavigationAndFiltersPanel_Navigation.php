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
 * Description of ShopNavigationAndFiltersPanel_Navigation
 *
 * @author Maxim Zaitsev
 * @copyright © 2010-2016, CompuProjec
 * @created 10.02.2016 11:12:18
 */
class ShopNavigationAndFiltersPanel_Navigation {
    const iconPath = './resources/Components/Shop/Icons/GROUPS/';
    const defaultIcon = 'defaultIcon_40x40';
    const defaultIconBack = 'defaultIcon_back';
    
    private $shopGroupsHelper;
    private $HTML;
    private $urlHelper;
    private $thisGroup = null;
    
    public function __construct($shopGroupsHelper) {
        $this->shopGroupsHelper = $shopGroupsHelper;
        $this->urlHelper = new UrlHelper();
        $this->generateHTML();
    }
    
    private function generateHTML() {
        if(ShopPageInfoHelper::isShopPage() && !ShopPageInfoHelper::isShopPageError() && ShopPageInfoHelper::shopPageGroupId() !== NULL) {
            $this->thisGroup = ShopPageInfoHelper::shopPageGroupId();
            $groupsList = $this->shopGroupsHelper->getGroupNodeChildren($this->thisGroup);
        } else {
            $groupsList = $this->shopGroupsHelper->getGroupRoot();
        }
        $this->HTML = '<div id="ShopNavigationMenuBlock" class="ShopNavigationAndFiltersPanelElement ShopNavigationMenuBlock">';
        $this->HTML .= $this->generateGroupMenu($groupsList);
        $this->HTML .= '</div>';
    }
    
    private function generateGroupMenu($groupsList) {
        $out = '';
        $out .= '<ul class="ShopNavigationMenuList">';
        $out .= $this->generateBackMenuElement($this->thisGroup);
        foreach ($groupsList as $groupID) {
            $out .= $this->generateGroupMenuElement($groupID);
        }
        $out .= '</ul>';
        return $out;
    }
    private function generateBackMenuElement($groupID) {
        $out = "";
        if($groupID != null) {
            $groupPath = $this->shopGroupsHelper->getGroupPath($groupID);
            if(!empty($groupPath)) {
                do {
                    $backGroup = $this->shopGroupsHelper->getGroupInfo(array_pop($groupPath));
                } while (!($backGroup['showInHierarchy'] > 0 || $backGroup['shown'] > 0));
                
                $url = $this->urlHelper->chengeParams(array('catalog', $backGroup['id']));
                $text = $backGroup['groupName'];
            } else {
                $url = $this->urlHelper->chengeParams(array());
                $text = "К каталогу";
            }
            $bacground = ShopGroupsIcons::getGroupIcon_Menu_Background(self::defaultIconBack, "40");
            $out .= '<li class="ShopNavigationMenuListElement">';
                $out .= '<a href="'.$url.'">';
                    $out .= '<div class="ShopNavigationMenuListElementIconBlock">';
                        $out .= '<div class="ShopNavigationMenuListElementIcon" '.$bacground.'></div>';
                    $out .= '</div>';
                    $out .= '<div class="ShopNavigationMenuListElementName">';
                        $out .= '<div>'.$text.'</div>';
                    $out .= '</div>';
                $out .= '</a>';
            $out .= '</li>';
        }
        return $out;
    }
    
    private function generateGroupMenuElement($groupID) {
        $group = $this->shopGroupsHelper->getGroupInfo($groupID);
        $out = "";
        if($group['shown'] > 0) {
            if($group['showInHierarchy'] > 0) {
                $bacground = ShopGroupsIcons::getGroupIcon_Menu_Background($groupID, "40");
                $out .= '<li class="ShopNavigationMenuListElement">';
                    $out .= '<a href="'.$this->urlHelper->chengeParams(array('catalog',$group['id'])).'">';
                        $out .= '<div class="ShopNavigationMenuListElementIconBlock">';
                            $out .= '<div class="ShopNavigationMenuListElementIcon" '.$bacground.'></div>';
                        $out .= '</div>';
                        $out .= '<div class="ShopNavigationMenuListElementName">';
                            $out .= '<div>'.$group['groupName'].'</div>';
                        $out .= '</div>';
                    $out .= '</a>';
                $out .= '</li>';
            } else {
                foreach ($this->shopGroupsHelper->getGroupNodeChildren($group['id']) as $id) {
                    $out .= $this->generateGroupMenuElement($id);
                }
            }
        }
        return $out;
    }
    
    public function getHtml() {
        return $this->HTML;
    }
}
