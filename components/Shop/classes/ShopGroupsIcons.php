<?php
/**
 * Description of ShopGroupsIcons
 *
 * @author Максим
 */
class ShopGroupsIcons {
    const iconPath_NavPa = './resources/Components/Shop/Image/GroupsIcons/';
    const defaultIcon_NavPa = 'defaultIcon';
    
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
            self::$object = new ShopGroupsIcons();
        }
    }

    public static function getGroupIcon_Menu_Background($groupID) {
        self::createObject();
        $background = self::getGroupIconIteration_Menu_Background($groupID);
        if($background === '') {
            $background = BackgroundGeneratorHelper::getBackgroundStyleImg(self::iconPath_NavPa, self::defaultIcon_NavPa);
        }
        return $background;
    }
    private static function getGroupIconIteration_Menu_Background($groupID) {
        $background = BackgroundGeneratorHelper::getBackgroundStyleImg(self::iconPath_NavPa, $groupID);
        $parentGroup = self::$shopGroupsHelper->getGroupParentID($groupID);
        if($background === '' && $parentGroup != null) {
            $background = self::getGroupIconIteration_Menu_Background($parentGroup);
        }
        return $background;
    }
}
