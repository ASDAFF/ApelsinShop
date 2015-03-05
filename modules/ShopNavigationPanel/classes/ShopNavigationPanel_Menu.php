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
    
    public function __construct($shopGroupsHelper) {
        $this->shopGroupsHelper = $shopGroupsHelper;
        $this->generateHTML();
    }
    
    private function generateHTML() {
        if(!ShopPageInfoHelper::isShopPageError() && ShopPageInfoHelper::shopPageUrlElement() !== NULL) {
            $this->HTML = $this->generateMenu();
        } else {
            $this->HTML = $this->generateRootMenu();
        }
    }
    
    private function getGroupIcon($groupID) {
        $background = $this->getGroupIconIteration($groupID);
        if($background === '') {
            $background = BackgroundGeneratorHelper::getBackgroundStyleImg(self::iconPath, self::defaultIcon);
        }
        return $background;
    }
    private function getGroupIconIteration($groupID) {
        $background = BackgroundGeneratorHelper::getBackgroundStyleImg(self::iconPath, $groupID);
        $parentGroup = $this->shopGroupsHelper->getGroupParentID($groupID);
        if($background === '' && $parentGroup != null) {
            $background = $this->getGroupIconIteration($parentGroup);
        }
        return $background;
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
                $bacground = $this->getGroupIcon($groupID);
                $out .= '<li class="SNPRootGroupsMenuElement">';
                    $out .= '<div class="ShopGroupIcon" '.$bacground.'></div>';
                    $out .= '<div class="ShopGroupName">';
                        $out .= '<div>'.$group['groupName'].'</div>';
                    $out .= '</div>';
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
        $thisGroup = ShopPageInfoHelper::shopPageUrlElement();
        $out = '';
        $out .= $this->generateThisGroupPanel($thisGroup);
        $out .= $this->generateThisGroupMenu($thisGroup);
        return $out;
    }
    
    private function generateThisGroupPanel($thisGroup) {
        $bacground = $this->getGroupIcon($thisGroup);
        $group = $this->shopGroupsHelper->getGroupInfo($thisGroup);
        $out = '';
        $out .= '<div class="ThisGroupPanel">';
            $out .= '<div class="ThisGroup">';
                $out .= '<div class="ShopGroupIcon" '.$bacground.'></div>';
                $out .= '<div class="ShopGroupName">';
                    $out .= '<div>'.$group['groupName'].'</div>';
                $out .= '</div>';
            $out .= '</div>';
        $out .= '</div>';
        return $out;
    }
    
    private function generateThisGroupMenu($thisGroup) {
        $out = '';
        $out .= '<ul class="SNPRootGroupsMenu">';
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
                $out .= '<li class="SNPRootGroupsMenuElement">';
                    $out .= '<div class="ShopGroupName">';
                        $out .= '<div>'.$group['groupName'].'</div>';
                    $out .= '</div>';
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
