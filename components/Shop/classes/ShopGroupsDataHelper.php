<?php
/**
 * Статический класс для поулчения данных о группах.
 * Конструктор класса созадется один раз автоматически при первом запросе.
 * @author maxim
 */
class ShopGroupsDataHelper {
    static private $SQL_HELPER;
    static private $object;
    static private $SQL_DATA;
    
    /**
     * Конструктор вызывается автоматически
     * @global type $_SQL_HELPER
     */
    private function __construct() {
        global $_SQL_HELPER;
        self::$SQL_HELPER = $_SQL_HELPER;
        $this->getGroupsData();
        $this->getGroupsHierarchyData();
        $this->getRootGroupsData();
    }
    
    /**
     * Получаем данные групп
     */
    private function getGroupsData() {
        $query = "SELECT * FROM `ShopGroups` WHERE `systemGroup` != '1' ORDER BY `groupName` ASC;";
        $rezult = self::$SQL_HELPER->select($query);
        self::$SQL_DATA['Groups'] = array();
        foreach ($rezult as $group) {
            self::$SQL_DATA['Groups'][$group['id']] = $group;
            self::$SQL_DATA['Groups'][$group['id']]['properties']['available'] = $this->getGroupsAvailablePropertiesData($group['id']);
            self::$SQL_DATA['Groups'][$group['id']]['properties']['personal'] = $this->getGroupsPersonalPropertiesData($group['id']);
            self::$SQL_DATA['Groups'][$group['id']]['properties']['unused'] = $this->getGroupsUnusedPropertiesData($group['id']);
        }
    }
    
    private function getGroupsAvailablePropertiesData($group) {
        $query = "SELECT 
            SPIG.`id`,
            SPIG.`property`, 
            SPIG.`shown`,
            SP.`propertyName`,
            SP.`filterType`,
            SP.`valueType`,
            SP.`oneOfAllValues`
            FROM (
                SELECT 
                SPIG.`id`,
                SPIG.`property`,
                SPIGR.`sequence`,
                SPIGR.`shown`
                FROM `ShopPropertiesInGroupsRanking` as SPIGR
                LEFT JOIN `ShopPropertiesInGroups` as SPIG
                on SPIGR.`propertyInGroup` = SPIG.`id`
                WHERE SPIGR.`group` = '".$group."'
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
    
    private function getGroupsPersonalPropertiesData($group) {
        $query = "SELECT 
            SPIG.`id`,
            SPIG.`property`, 
            SP.`propertyName`,
            SP.`filterType`,
            SP.`valueType`,
            SP.`oneOfAllValues`
            FROM `ShopPropertiesInGroups` as SPIG
            LEFT JOIN `ShopProperties` as SP
            on SPIG.`property` = SP.`id`
            WHERE SPIG.`group` = '".$group."'
            ORDER BY SPIG.`sequence` ASC;";
        $rezult = self::$SQL_HELPER->select($query);
        $properties = array();
        foreach ($rezult as $property) {
            $properties[$property['id']] = $property;
        }
        return $properties;
    }
    
    private function getGroupsUnusedPropertiesData($group) {
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
                WHERE SPIGR.`group` = '".$group."'
            );";
        $rezult = self::$SQL_HELPER->select($query);
        $properties = array();
        foreach ($rezult as $property) {
            $properties[$property['id']] = $property;
        }
        return $properties;
    }
    
    /**
     * Получаем данные об иерархии групп
     */
    private function getGroupsHierarchyData() {
        $query = "SELECT 
            SGH.`group`, 
            SGH.`parentGroup`
            FROM `ShopGroupsHierarchy` as SGH
            LEFT JOIN `ShopGroups` as SG
            ON SGH.`group` = SG.`id`
            ORDER BY SG.`groupName` ASC;";
        $rezult = self::$SQL_HELPER->select($query);
        self::$SQL_DATA['GroupsHierarchy'] = array();
        foreach ($rezult as $pair) {
            self::$SQL_DATA['GroupsHierarchy'][$pair['parentGroup']][] = $pair['group'];
        }
    }
    
    /**
     * Получаем ID корневых групп
     */
    private function getRootGroupsData() {
        $query = "SELECT 
            SG.`id` 
            FROM `ShopGroupsHierarchy` as SGH 
            right join `ShopGroups` as SG
            on SGH.`group` = SG.`id`
            where SGH.`group` IS NULL
            ORDER BY SG.`groupName` ASC;";
        $rezult = self::$SQL_HELPER->select($query);
        self::$SQL_DATA['RootGroups'] = array();
        foreach ($rezult as $group) {
            self::$SQL_DATA['RootGroups'][] = $group['id'];
        }
    }
    /**
     * Возвращает соответствующую информацию по ключу
     * Groups - информация по группам.
     * GroupsHierarchy - данные по иерархии групп.
     * RootGroups - массив корневых групп.
     * @param string $dataKey - ключ к данным:
     * Groups; 
     * GroupsHierarchy;
     * RootGroups.
     * @return array - массив данных из базы или упстой массив если неверный ключ.
     */
    public static function getData($dataKey) {
        if(!isset(self::$object)) {
            self::$object = new ShopGroupsDataHelper();
        }
        if(isset(self::$SQL_DATA[$dataKey])) {
            return self::$SQL_DATA[$dataKey];
        } else {
            return array();
        }
    }
}
