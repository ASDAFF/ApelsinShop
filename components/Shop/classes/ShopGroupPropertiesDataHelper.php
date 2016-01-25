<?php

/*
 * НЕ ИЗМЕНЯТЬ И НЕ УДАЛЯТЬ АВТОРСКИЕ ПРАВА И ЗАГОЛОВОК ФАЙЛА
 * 
 * Копирайт © 2010-2016, CompuProject и/или дочерние компании.
 * Все права защищены.
 * 
 * CSystem это программное обеспечение предоставленное и разработанное 
 * CompuProject в рамках проекта CSystem без каких либо сторонних изменений.
 * 
 * Распространение, использование исходного кода в любой форме и/или его 
 * модификация разрешается при условии, что выполняются следующие условия:
 * 
 * 1. При распространении исходного кода должно оставатсья указанное выше 
 *    уведомление об авторских правах, этот список условий и последующий 
 *    отказ от гарантий.
 * 
 * 2. При изменении исходного кода должно оставатсья указанное выше 
 *    уведомление об авторских правах, этот список условий, последующий 
 *    отказ от гарантий и пометка о сделанных изменениях.
 * 
 * 3. Распространение и/или изменение исходного кода должно происходить
 *    на условиях Стандартной общественной лицензии GNU в том виде, в каком 
 *    она была опубликована Фондом свободного программного обеспечения;
 *    либо лицензии версии 3, либо (по вашему выбору) любой более поздней
 *    версии. Вы должны были получить копию Стандартной общественной 
 *    лицензии GNU вместе с этой программой. Если это не так, см. 
 *    <http://www.gnu.org/licenses/>.
 * 
 * CSystem распространяется в надежде, что она будет полезной,
 * но БЕЗО ВСЯКИХ ГАРАНТИЙ; даже без неявной гарантии ТОВАРНОГО ВИДА
 * или ПРИГОДНОСТИ ДЛЯ ОПРЕДЕЛЕННЫХ ЦЕЛЕЙ. Подробнее см. в Стандартной
 * общественной лицензии GNU.
 * 
 * НИ ПРИ КАКИХ УСЛОВИЯХ ПРОЕКТ, ЕГО УЧАСТНИКИ ИЛИ CompuProject НЕ 
 * НЕСУТ ОТВЕТСТВЕННОСТИ ЗА КАКИЕ ЛИБО ПРЯМЫЕ, КОСВЕННЫЕ, СЛУЧАЙНЫЕ, 
 * ОСОБЫЕ, ШТРАФНЫЕ ИЛИ КАКИЕ ЛИБО ДРУГИЕ УБЫТКИ (ВКЛЮЧАЯ, НО НЕ 
 * ОГРАНИЧИВАЯСЬ ПРИОБРЕТЕНИЕМ ИЛИ ЗАМЕНОЙ ТОВАРОВ И УСЛУГ; ПОТЕРЕЙ 
 * ДАННЫХ ИЛИ ПРИБЫЛИ; ПРИОСТАНОВЛЕНИЕ БИЗНЕСА). 
 * 
 * ИСПОЛЬЗОВАНИЕ ДАННОГО ИСХОДНОГО КОДА ОЗНАЧАЕТ, ЧТО ВЫ БЫЛИ ОЗНАКОЛМЛЕНЫ
 * СО ВСЕМИ ПРАВАМИ, СТАНДАРТАМИ И УСЛОВИЯМИ, УКАЗАННЫМИ ВЫШЕ, СОГЛАСНЫ С НИМИ
 * И ОБЯЗУЕТЕСЬ ИХ СОБЛЮДАТЬ.
 * 
 * ЕСЛИ ВЫ НЕ СОГЛАСНЫ С ВЫШЕУКАЗАННЫМИ ПРАВАМИ, СТАНДАРТАМИ И УСЛОВИЯМИ, 
 * ТО ВЫ МОЖЕТЕ ОТКАЗАТЬСЯ ОТ ИСПОЛЬЗОВАНИЯ ДАННОГО ИСХОДНОГО КОДА.
 * 
 * Данная копия CSystem используется для проекта Apelsin SHOP
 * 
 */

/**
 * Description of ShopGroupPropertiesDataHelper
 *
 * @author Maxim Zaitsev
 * @copyright © 2010-2016, CompuProjec
 * @created 25.01.2016 9:51:54
 */
class ShopGroupPropertiesDataHelper {

    static private $SQL_HELPER;
    static private $object;
    static private $groups;
    static private $groupsHierarchy;
    static private $groupPropertiesData;

    private function __construct($update) {
        global $_SQL_HELPER;
        self::$SQL_HELPER = $_SQL_HELPER;
        self::$groups = ShopGroupsDataHelper::getData('Groups', $update);
        self::$groupsHierarchy = ShopGroupsDataHelper::getData('GroupsHierarchy', $update);
    }

    /**
     * создание объекта
     */
    private static function createObject($update) {
        if (!isset(self::$object) || $update) {
            self::$object = new ShopGroupPropertiesDataHelper($update);
        }
    }

    private static function getGroupsAvailablePropertiesData($group) {
        $query = "SELECT 
            SPIG.`id`,
            SPIG.`property`, 
            SPIG.`group`, 
            SPIG.`shown`,
            SP.`propertyName`,
            SP.`filterType`,
            SP.`valueType`,
            SP.`oneOfAllValues`
            FROM (
                SELECT 
                SPIG.`id`,
                SPIG.`property`,
                SPIG.`group`,
                SPIGR.`sequence`,
                SPIGR.`shown`
                FROM `ShopPropertiesInGroupsRanking` as SPIGR
                LEFT JOIN `ShopPropertiesInGroups` as SPIG
                on SPIGR.`propertyInGroup` = SPIG.`id`
                WHERE SPIGR.`group` = '" . $group . "'
            ) as SPIG
            LEFT JOIN `ShopProperties` as SP
            on SPIG.`property` = SP.`id`
            ORDER BY SPIG.`sequence` ASC;";
        $rezult = self::$SQL_HELPER->select($query);
        $properties = array();
        foreach ($rezult as $property) {
            $properties[$property['id']] = $property;
        }
        return $properties;
    }

    private static function getGroupsPersonalPropertiesData($group) {
        $query = "SELECT 
            SPIG.`id`,
            SPIG.`property`, 
            SPIG.`group`, 
            SP.`propertyName`,
            SP.`filterType`,
            SP.`valueType`,
            SP.`oneOfAllValues`
            FROM `ShopPropertiesInGroups` as SPIG
            LEFT JOIN `ShopProperties` as SP
            on SPIG.`property` = SP.`id`
            WHERE SPIG.`group` = '" . $group . "'
            ORDER BY SPIG.`sequence` ASC;";
        $rezult = self::$SQL_HELPER->select($query);
        $properties = array();
        foreach ($rezult as $property) {
            $properties[$property['id']] = $property;
        }
        return $properties;
    }

    private static function getGroupsUnusedPropertiesData($group, $forChild = false) {
        if ($forChild) {
            if (isset(self::$groupsHierarchy[$group])) {
                $clildren = array_diff(self::$groups[$group]['children'], self::$groupsHierarchy[$group]);
            } else {
                $clildren = self::$groups[$group]['children'];
            }
        } else {
            $clildren = self::$groups[$group]['children'];
        }
        $where = "";

        if (count($clildren) > 0) {
            $where .= "AND `id` NOT IN (SELECT `property` FROM `ShopPropertiesInGroups` WHERE ";
            foreach ($clildren as $child) {
                $where .= "`group`='" . $child . "' OR ";
            }
            $where = mb_strcut($where, 0, strlen($where) - 4);
            $where .= ")";
        }
        $query = "SELECT 
            `id`, 
            `propertyName`, 
            `filterType`, 
            `valueType`, 
            `oneOfAllValues` 
            FROM `ShopProperties` WHERE `id`
            NOT IN (
                SELECT 
                SPIG.`property`
                FROM `ShopPropertiesInGroupsRanking` as SPIGR
                LEFT JOIN `ShopPropertiesInGroups` as SPIG
                on SPIGR.`propertyInGroup` = SPIG.`id`
                WHERE SPIGR.`group` = '" . $group . "'
            ) " . $where . ";";
        $rezult = self::$SQL_HELPER->select($query);
        $properties = array();
        foreach ($rezult as $property) {
            $properties[$property['id']] = $property;
        }
        return $properties;
    }

    private static function getGroupsChildrenPropertiesData($group) {
        $properties = array();
        
        $clildren = self::$groups[$group]['children'];
        
        if (count($clildren) > 0) {
            $query = "SELECT 
                SP.`id`, 
                SP.`propertyName`, 
                SP.`filterType`, 
                SP.`valueType`, 
                SP.`oneOfAllValues`,
                SPIG.`group` 
                FROM `ShopProperties` as SP
                LEFT JOIN 
                `ShopPropertiesInGroups` as SPIG
                on SP.`id` = SPIG.`property`
                WHERE ";
            foreach ($clildren as $child) {
                $query .= "`group`='" . $child . "' OR ";
            }
            $query = mb_strcut($query, 0, strlen($query) - 4) . ";";
            $rezult = self::$SQL_HELPER->select($query);
            foreach ($rezult as $property) {
                $properties[$property['id']] = $property;
            }
        }
        return $properties;
    }

    private static function getGroupPropertiesValue($groupId, $key, $update) {
        if (!isset(self::$groupPropertiesData[$groupId][$key]) || $update) {
            switch ($key) {
                case 'available':
                    self::$groupPropertiesData[$groupId][$key] = self::getGroupsAvailablePropertiesData($groupId);
                    break;
                case 'personal':
                    self::$groupPropertiesData[$groupId][$key] = self::getGroupsPersonalPropertiesData($groupId);
                    break;
                case 'unused':
                    self::$groupPropertiesData[$groupId][$key] = self::getGroupsUnusedPropertiesData($groupId);
                    break;
                case 'unusedForChild':
                    self::$groupPropertiesData[$groupId][$key] = self::getGroupsUnusedPropertiesData($groupId, true);
                    break;
                case 'childrenProperties':
                    self::$groupPropertiesData[$groupId][$key] = self::getGroupsChildrenPropertiesData($groupId);
                    break;
                default:
                    self::$groupPropertiesData[$groupId][$key] = array();
            }
        }
        return self::$groupPropertiesData[$groupId][$key];
    }

    /**
     * Вернет все свойства которые доступны для использования для этой группы.
     * @param type $groupId - идентификатор группы
     * @param type $update - false вернет данные котоыре были получены ранее, true - принудительно обновит данные даже если они уже были получены
     * @return Array - массив свойств
     */
    public static function getGroupAvailableProperties($groupId, $update = false, $updateGroupsDataHelper = false) {
        self::createObject($updateGroupsDataHelper);
        return self::getGroupPropertiesValue($groupId, 'available', $update);
    }
    
    /**
     * Вернет свойства который являются персональными для этой группы.
     * @param type $groupId - идентификатор группы
     * @param type $update - false вернет данные котоыре были получены ранее, true - принудительно обновит данные даже если они уже были получены
     * @return Array - массив свойств
     */
    public static function getGroupPersonalProperties($groupId, $update = false, $updateGroupsDataHelper = false) {
        self::createObject($updateGroupsDataHelper);
        return self::getGroupPropertiesValue($groupId, 'personal', $update);
    }

    /**
     * Вернет свойства которые не доступны для использования данной группой.
     * @param type $groupId - идентификатор группы
     * @param type $update - false вернет данные котоыре были получены ранее, true - принудительно обновит данные даже если они уже были получены
     * @return Array - массив свойств
     */
    public static function getGroupUnusedProperties($groupId, $update = false, $updateGroupsDataHelper = false) {
        self::createObject($updateGroupsDataHelper);
        return self::getGroupPropertiesValue($groupId, 'unused', $update);
    }

    /**
     * 
     * @param type $groupId - идентификатор группы
     * @param type $update - false вернет данные котоыре были получены ранее, true - принудительно обновит данные даже если они уже были получены
     * @return Array - массив свойств
     */
    public static function getGroupUnusedForChildrenProperties($groupId, $update = false, $updateGroupsDataHelper = false) {
        self::createObject($updateGroupsDataHelper);
        return self::getGroupPropertiesValue($groupId, 'unusedForChild', $update);
    }

    /**
     * Вернет свойства 
     * @param type $groupId - идентификатор группы
     * @param type $update - false вернет данные котоыре были получены ранее, true - принудительно обновит данные даже если они уже были получены
     * @return Array - массив свойств
     */
    public static function getGroupChildrenProperties($groupId, $update = false, $updateGroupsDataHelper = false) {
        self::createObject($updateGroupsDataHelper);
        return self::getGroupPropertiesValue($groupId, 'childrenProperties', $update);
    }

}
