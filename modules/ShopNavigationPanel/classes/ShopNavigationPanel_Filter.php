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
    }
    
    public function getHtml() {
        return $this->HTML;
    }
}
