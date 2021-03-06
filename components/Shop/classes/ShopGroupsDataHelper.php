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
    static private $allGroupsId;

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
        $this->getGroupsMoreData();
    }

    private function getCildrenList($group) {
        if ($group != null && $group != '' && $group != 'ROOT') {
            $rezult = array();
            if (!empty(self::$SQL_DATA['GroupsHierarchy'][$group])) {
                foreach (self::$SQL_DATA['GroupsHierarchy'][$group] as $child) {
                    $rezult[$child] = $child;
                    $rezult = array_merge($rezult, $this->getCildrenList($child));
                }
            }
            return $rezult;
        } else {
            return self::$allGroupsId;
        }
    }

    /**
     * Получаем данные групп
     */
    private function getGroupsData() {
        $query = "SELECT * FROM `ShopGroups` WHERE `systemGroup` != '1' ORDER BY `groupName` ASC;";
        $rezult = self::$SQL_HELPER->select($query);
        self::$SQL_DATA['Groups'] = array();
        foreach ($rezult as $group) {
            self::$allGroupsId[] = $group['id'];
            self::$SQL_DATA['Groups'][$group['id']] = $group;
            if($group['shown'] < 1) {
                self::$SQL_DATA['hiddenGroups'][] = $group['id'];
            }
        }
    }

    private function getGroupsMoreData() {
        self::$SQL_DATA['Children'] = array();
        foreach (array_keys(self::$SQL_DATA['Groups']) as $groupId) {
            self::$SQL_DATA['Groups'][$groupId]['children'] = $this->getCildrenList($groupId);
        }
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
            AND SG.`systemGroup` != '1' 
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
    public static function getData($dataKey, $update = false) {
        if (!isset(self::$object) || $update) {
            self::$object = new ShopGroupsDataHelper();
        }
        if (isset(self::$SQL_DATA[$dataKey])) {
            return self::$SQL_DATA[$dataKey];
        } else {
            return array();
        }
    }

}
