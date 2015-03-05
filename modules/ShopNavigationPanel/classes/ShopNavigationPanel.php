<?php
/**
 * Description of ShopNavigationPanel
 *
 * @author maxim
 */
class ShopNavigationPanel {
    const ComponentAlias = 'Shop';

    private $SQL_HELPER;
    private $THIS_PAGE;
    private $URL_PARAMS;
    
    private $shopGroupsHelper;
    private $shopNavigationPanelMenu;
    private $shopNavigationPanelFilter;
    private $HTML;
    
    public function __construct() {
        global $_URL_PARAMS;
        $this->THIS_PAGE = $_URL_PARAMS['page'];
        $this->URL_PARAMS = $_URL_PARAMS['params'];
        global $_SQL_HELPER;
        $this->SQL_HELPER = $_SQL_HELPER;
        
        $this->shopGroupsHelper = new ShopGroupsHelper();
        $this->shopNavigationPanelMenu = new ShopNavigationPanel_Menu($this->shopGroupsHelper);
        $this->shopNavigationPanelFilter = new ShopNavigationPanel_Filter($this->shopGroupsHelper);
        $this->generateHTML();
    }
    
    private function generateHTML() {
        $this->HTML = '';
        $this->HTML .= $this->shopNavigationPanelMenu->getHtml();
        $this->HTML .= $this->shopNavigationPanelFilter->getHtml();
    }
    
    public function getHtml() {
        return $this->HTML;
    }
}
