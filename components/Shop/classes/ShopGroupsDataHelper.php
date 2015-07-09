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
    private static function getGroupsData() {
        $query = "SELECT * FROM `ShopGroups` ORDER BY `groupName` ASC";
        $rezult = self::$SQL_HELPER->select($query);
        self::$SQL_DATA['Groups'] = array();
        foreach ($rezult as $group) {
            self::$SQL_DATA['Groups'][$group['id']] = $group;
        }
    }
    
    /**
     * Получаем данные об иерархии групп
     */
    private static function getGroupsHierarchyData() {
        $query = "SELECT * FROM `ShopGroupsHierarchy`;";
        $rezult = self::$SQL_HELPER->select($query);
        self::$SQL_DATA['GroupsHierarchy'] = array();
        foreach ($rezult as $pair) {
            self::$SQL_DATA['GroupsHierarchy'][$pair['parentGroup']][] = $pair['group'];
        }
    }
    
    /**
     * Получаем ID корневых групп
     */
    private static function getRootGroupsData() {
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
