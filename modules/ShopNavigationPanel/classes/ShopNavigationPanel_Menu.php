<?php
/**
 * Description of ShopNavigationPanel_Menu
 *
 * @author maxim
 */
class ShopNavigationPanel_Menu {
    const iconPath = './resources/Components/Shop/Icons/GroupsIcons/';
    const defaultIcon = 'defaultIcon';
    
    private $shopGroupsHelper;
    private $HTML;
    private $urlHelper;
    
    public function __construct($shopGroupsHelper) {
        $this->shopGroupsHelper = $shopGroupsHelper;
        $this->urlHelper = new UrlHelper();
        $this->generateHTML();
    }
    
    private function generateHTML() {
        $this->HTML = '<div class="ShopNavigationPanel_Menu">';
        if(ShopPageInfoHelper::isShopPage() && !ShopPageInfoHelper::isShopPageError() && ShopPageInfoHelper::shopPageGroupId() !== NULL) {
            $this->HTML .= $this->generateMenu();
        } else {
            $this->HTML .= $this->generateRootMenu();
        }
        $this->HTML .= '</div>';
    }
    
    private function generateRootMenu() {
        $out = '';
        $out .= '<ul class="SNPRootGroupsMenu">';
        foreach ($this->shopGroupsHelper->getGroupRoot() as $id) {
            $out .= $this->generateRootMenuElement($id);
        }
        $out .= '</ul>';
        return $out;
    }
    
    private function generateRootMenuElement($groupID) {
        $out = '';
        $group = $this->shopGroupsHelper->getGroupInfo($groupID);
        if($group['shown'] > 0) {
            if($group['showInHierarchy'] > 0) {
                $bacground = ShopGroupsIcons::getGroupIcon_Menu_Background($groupID);
                $out .= '<li class="SNPRootGroupsMenuElement">';
                    $out .= '<a href="'.ShopGroupsUrlHelper::getUrl(array('catalog',$group['id'])).'">';
                        $out .= '<div class="ShopGroupIcon" '.$bacground.'></div>';
                        $out .= '<div class="ShopGroupName">';
                            $out .= '<div>'.$group['groupName'].'</div>';
                        $out .= '</div>';
                    $out .= '</a>';
                $out .= '</li>';
            } else {
                foreach ($this->shopGroupsHelper->getGroupNodeChildren($group['id']) as $id) {
                    $out .= $this->generateRootMenuElement($id);
                }
            }
        }
        return $out;
    }
    
    private function generateMenu() {
        $thisGroup = ShopPageInfoHelper::shopPageGroupId();
        $out = '';
        $out .= ShopNavigationPanel_ThisGroupIconPanel::getPanelBlock($thisGroup);
        $out .= $this->generateThisGroupMenu($thisGroup);
        return $out;
    }
    
    private function generateThisGroupMenu($thisGroup) {
        $out = '';
        $out .= '<ul class="SNPGroupsMenu">';
        foreach ($this->shopGroupsHelper->getGroupNodeChildren($thisGroup) as $id) {
            $out .= $this->generateThisGroupMenuElement($id);
        }
        $out .= '</ul>';
        return $out;
    }
    
    private function generateThisGroupMenuElement($groupID) {
        $out = '';
        $group = $this->shopGroupsHelper->getGroupInfo($groupID);
        if($group['shown'] > 0) {
            if($group['showInHierarchy'] > 0) {
                $out .= '<li class="SNPGroupsMenuElement">';
                    $out .= '<a href="'.$this->urlHelper->chengeParams(array('catalog',$group['id'])).'">';
                        $out .= '<div class="ShopGroupName">';
                            $out .= '<div>'.$group['groupName'].'</div>';
                        $out .= '</div>';
                    $out .= '</a>';
                $out .= '</li>';
            } else {
                foreach ($this->shopGroupsHelper->getGroupNodeChildren($group['id']) as $id) {
                    $out .= $this->generateThisGroupMenuElement($id);
                }
            }
        }
        return $out;
    }
    
    public function getHtml() {
        return $this->HTML;
    }
}
