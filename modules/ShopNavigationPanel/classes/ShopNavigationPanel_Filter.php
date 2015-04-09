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
        $this->HTML = '<div class="ShopNavigationPanel_Filter">';
        $this->HTML .= ShopPropertiesFilterType::getFilters(ShopPageInfoHelper::shopPageGroupId());
//        if(ShopPageInfoHelper::isShopPage() && !ShopPageInfoHelper::isShopPageError() && ShopPageInfoHelper::shopPageGroupId() !== NULL) {
//            $this->HTML .= ShopPropertiesFilterType::getFilters(ShopPageInfoHelper::shopPageGroupId());
//        } else {
//            $this->HTML .= 'Нет фильтра';
//        }
        $this->HTML .= '</div>';
    }
    
    public function getHtml() {
        return $this->HTML;
    }
}
