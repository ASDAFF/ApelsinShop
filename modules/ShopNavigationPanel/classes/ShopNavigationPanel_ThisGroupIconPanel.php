<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of ShopNavigationPanel_ThisGroupIconPanel
 *
 * @author Максим
 */
class ShopNavigationPanel_ThisGroupIconPanel {    
    
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
            self::$object = new ShopNavigationPanel_ThisGroupIconPanel();
        }
    }
    
    public static function getPanel($thisGroup) {
        self::createObject();
        $bacground = ShopGroupsIcons::getGroupIcon_Menu_Background($thisGroup);
        $group = self::$shopGroupsHelper->getGroupInfo($thisGroup);
        $out = '';
        $out .= '<div class="ThisGroupIconPanel">';
            $out .= '<div class="ShopGroupIcon" '.$bacground.'></div>';
            $out .= '<div class="ShopGroupName">';
                $out .= '<div>'.$group['groupName'].'</div>';
            $out .= '</div>';
        $out .= '</div>';
        return $out;
    }
    
    public static function getPanelBlock($thisGroup) {
        self::createObject();
        $out = '<div class="ThisGroupIconPanelBlock">'
                .self::getPanel($thisGroup)
                .'</div>';
        return $out;
    }
}
