<?php

/**
 * Description of ShopGroupsIcons
 *
 * @author Максим
 */
class ShopGroupsIcons {

    const iconPath_NavPa = './resources/Components/Shop/Image/GROUPS/';
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
        if (!isset(self::$object)) {
            self::$object = new ShopGroupsIcons();
        }
    }

    public static function getGroupIcon_Menu_Background($groupID, $size = "") {
        self::createObject();
        $background = self::getGroupIconIteration_Menu_Background($groupID, $size);
        if ($background === '') {
            if($size != "") {
                $size = "_".$size."x".$size;
            }
            $background = BackgroundGeneratorHelper::getBackgroundStyleImg(self::iconPath_NavPa, self::defaultIcon_NavPa.$size);
        }
        return $background;
    }

    private static function getGroupIconIteration_Menu_Background($groupID, $size = "") {
        if($size != "") {
            $sizeString = "_".$size."x".$size;
        }
        $background = BackgroundGeneratorHelper::getBackgroundStyleImg(self::iconPath_NavPa, $groupID.$sizeString);
        $parentGroup = self::$shopGroupsHelper->getGroupParentID($groupID);
        if ($background === '' && $parentGroup != null) {
            $background = self::getGroupIconIteration_Menu_Background($parentGroup, $size);
        }
        return $background;
    }

}
