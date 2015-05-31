<?php
/**
 * Description of ShopNavigationPanel
 *
 * @author maxim
 */
class ShopNavigationPanel {
    const ComponentAlias = 'Shop';
    const iconPath = './resources/Components/Shop/Icons/GroupsIcons/';
    const defaultIcon = 'defaultIcon';

    private $SQL_HELPER;
    private $THIS_PAGE;
    private $URL_PARAMS;
    
    private $shopGroupsHelper;
    private $shopNavigationPanelMenu;
    private $shopNavigationPanelFilter;
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
            $this->shopNavigationPanelMenu = new ShopNavigationPanel_Menu($this->shopGroupsHelper);
            $this->shopNavigationPanelFilter = new ShopNavigationPanel_Filter($this->shopGroupsHelper);
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
        $this->HTML .= "<div class='shopNavigationPanelSwitchButtonBlock'>";
        $this->HTML .= "<div class='shopNavigationPanelSwitchButtonToMenu checked'>навигация</div>";
        $this->HTML .= "<div class='shopNavigationPanelSwitchButtonToFilter noChecked'>фильтры</div>";
        $this->HTML .= "</div>";
        $this->HTML .= ShopGroupsPathPanelHelper::getPanel();
        $this->HTML .= "<div class='clear'></div>";
        $this->HTML .= $this->shopNavigationPanelMenu->getHtml();
        $this->HTML .= $this->shopNavigationPanelFilter->getHtml();
        $this->HTML .= "<div class='clear'></div>";
        $this->HTML .= "<div class='shopNavigationPanelFilterButton'>";
        $this->HTML .= '<a class="fancybox-doc" href="#shopNavigationPanelFilter">Расширенный поиск</a>';
        $this->HTML .= "</div>";
    }
    
    public function getHtml() {
        return $this->HTML;
    }
}
