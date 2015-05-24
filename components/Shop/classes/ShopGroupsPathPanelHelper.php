<?php
/**
 * Description of ShopGroupsPathPanelHelper
 *
 * @author Максим
 */
class ShopGroupsPathPanelHelper {
    static private $shopGroupsHelper;
    static private $object;
    
    private function __construct() {
        self::$shopGroupsHelper = new ShopGroupsHelper();
    }
    
    /**
     * создание объекта
     */
    private static function createObject() {
        if(!isset(self::$object)) {
            self::$object = new ShopGroupsPathPanelHelper();
        }
    }
    
    public static function getPanel() {
        self::createObject();
        $thisGroup = ShopPageInfoHelper::shopPageGroupId();
        if($thisGroup == null || $thisGroup == '') {
            return '';
        }
        $group = self::$shopGroupsHelper->getGroupInfo($thisGroup);
        $out = '';
        $groupsPath = self::$shopGroupsHelper->getGroupPath($group['id']);
        $out .= '<div class="ThisGroupPathPanel">';
            $out .= '<ul class="ThisGroupPath">';
                $out .= '<li class="ThisGroupPathElement RootElement"><a href="'.ShopGroupsUrlHelper::getUrl().'"></a></li>';
                if($groupsPath !== null) {
                    foreach ($groupsPath as $groupId) {
                        $gr = self::$shopGroupsHelper->getGroupInfo($groupId);
                        $out .= '<li class="ThisGroupPathElement">';
                        $out .= '<a href="'.ShopGroupsUrlHelper::getUrl(array('catalog',$groupId)).'">';
                        $out .= $gr['groupName'];
                        $out .= '</a>';
                        $out .= '</li>';
                    }
                }
                if(ShopPageInfoHelper::isItGroupPage()) {
                    $out .= '<li class="ThisGroupPathElement">';
                    $out .= $group['groupName'];
                    $out .= '</li>';
                } else {
                    $out .= '<li class="ThisGroupPathElement">';
                    $out .= '<a href="'.ShopGroupsUrlHelper::getUrl(array('catalog',$group['id'])).'">';
                    $out .= $group['groupName'];
                        $out .= '</a>';
                    $out .= '</li>';
                }
            $out .= '</ul>';
        $out .= '</div>';
        return $out;
    }
}
