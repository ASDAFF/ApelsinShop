<?php
/**
 * Description of ShopNavigationPanel_Filter
 *
 * @author maxim
 */
class ShopNavigationPanel_Filter {
    private $shopGroupsHelper;
    private $HTML;
    
    public function __construct($shopGroupsHelper) {
        $this->shopGroupsHelper = $shopGroupsHelper;
        $this->generateHTML();
    }
    
    private function generateHTML() {
        $this->HTML = '<div id="shopNavigationPanelFilter" class="ShopNavigationPanel_Filter">';
        $this->HTML .= ShopPropertiesFilterType::getFilters(ShopPageInfoHelper::shopPageGroupId());
        $this->HTML .= '</div>';
        $this->HTML .= ShopPropertiesFilterType::getJS(ShopPageInfoHelper::shopPageGroupId());
    }
    
    public function getHtml() {
        return $this->HTML;
    }
    
    public function get() {
        echo $this->HTML;
    }
}
