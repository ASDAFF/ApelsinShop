<?php

/**
 * Класс для работы с группами
 *
 * @author maxim
 */
class ShopGroupsHelper {

    private $groups; // Информация о группах
    private $rootGroups; // Идентификаторы корневых элементов групп
    private $groupsHierarchyData; // Данные об иерархии групп
    private $groupsTree; // Дерево групп
    private $groupPath; // Пути из родительских групп до указанной группы
    private $groupChildren; // Список всех дочерних групп указанной группы.
    private $showHidden;

    public function __construct($showHidden = false) {
        $this->getShopGroupsHelperData($showHidden);
    }

    private function getShopGroupsHelperData($showHidden = false, $update = false) {
        $this->rootGroups = ShopGroupsDataHelper::getData('RootGroups', $update);
        $this->groups = ShopGroupsDataHelper::getData('Groups', $update);
        $this->groupsHierarchyData = ShopGroupsDataHelper::getData('GroupsHierarchy', $update);
        $this->showHidden = $showHidden;
        $this->getGroupsTree();
        $this->getGroupsPath();
        $this->getGroupsChildren();
    }

    /**
     * Формируем дерево групп
     */
    private function getGroupsTree() {
        $this->groupsTree = array();
        foreach ($this->rootGroups as $rootElement) {
            $this->groupsTree['children'][$rootElement] = $this->addGroupsTreeNode($rootElement);
        }
    }

    /**
     * Добавлем узел в дерево групп
     * @param string $parentID - ID родительского элемента
     * @return array $node - узел дерева
     */
    private function addGroupsTreeNode($parentID) {
        $node['info'] = $this->groups[$parentID];
        $node['children'] = array();
        if (isset($this->groupsHierarchyData[$parentID])) {
            foreach ($this->groupsHierarchyData[$parentID] as $childrenID) {
                if ($this->showHidden || $this->groups[$childrenID]['shown'] === '1') {
                    $node['children'][$childrenID] = $this->addGroupsTreeNode($childrenID);
                }
            }
        }
        return $node;
    }

    /**
     * Формируем путь из родительских элементов к каждой группе.
     */
    private function getGroupsPath() {
        foreach ($this->rootGroups as $rootElement) {
            $this->addGroupsPath($this->groupsTree['children'][$rootElement], array());
        }
    }

    /**
     * Добавляем отрезок пути
     * @param array $element - оперделенный элемент дерева
     * @param array $path - изначальный путь из элементов
     * @return array $path - новый путь из элементов
     */
    private function addGroupsPath($element, $path) {
        if (!empty($element['children'])) {
            foreach ($element['children'] as $child) {
                $path[] = $element['info']['id'];
                $path = $this->addGroupsPath($child, $path);
            }
        }
        $this->groupPath[$element['info']['id']] = $path;
        array_pop($path);
        return $path;
    }

    /**
     * Формируем массив всех потомков каждой из групп
     */
    private function getGroupsChildren() {
        foreach ($this->rootGroups as $rootElement) {
            $this->addGroupsChild($this->groupsTree['children'][$rootElement]);
        }
    }

    private function addGroupsChild($element) {
        $children = array();
        $children[$element['info']['id']] = $element['info']['id'];
        if (!empty($element['children'])) {
            foreach ($element['children'] as $child) {
                $nodeChildren = $this->addGroupsChild($child);
                foreach ($nodeChildren as $nodeChild) {
                    $children[$nodeChild] = $nodeChild;
                }
            }
        }
        $this->groupChildren[$element['info']['id']] = $children;
        return $children;
    }

    /**
     * получаем информацию о потомке указанной группы
     * @param array $data - блок информации о группах из дерева начиная с текущего узла
     * @param string $groupID - ключ потомка группы
     * @return array $data - блок информации о группах из дерева начина с узла выбранного потомка
     */
    private function getChildGroupNode($data, $groupID) {
        return $data['children'][$groupID];
    }

    /**
     * Получаем узел из дерева;
     * @param string $groupID - ID группы
     * @return array - информация о группе
     */
    public function getGroupNode($groupID) {
        $data = $this->groupsTree;
        if (isset($this->groupPath[$groupID])) {
            foreach ($this->groupPath[$groupID] as $child) {
                $data = $this->getChildGroupNode($data, $child);
            }
            return $this->getChildGroupNode($data, $groupID);
        } else {
            return NULL;
        }
    }

    /**
     * Получаем информацию о группе из дерева;
     * @param string $groupID - ID группы
     * @return array - информация о группе
     */
    public function getGroupInfo($groupID, $getPropertiesData = false) {
        if (isset($this->groupPath[$groupID])) {
            if($getPropertiesData && !isset($this->groups[$groupID]['properties'])) {
                $this->groups[$groupID]['properties']['available'] = ShopGroupPropertiesDataHelper::getGroupAvailableProperties($groupID);
                $this->groups[$groupID]['properties']['personal'] = ShopGroupPropertiesDataHelper::getGroupPersonalProperties($groupID);
                $this->groups[$groupID]['properties']['unused'] = ShopGroupPropertiesDataHelper::getGroupUnusedProperties($groupID);
                $this->groups[$groupID]['properties']['unusedForChild'] = ShopGroupPropertiesDataHelper::getGroupUnusedForChildrenProperties($groupID);
                $this->groups[$groupID]['properties']['childrenProperties'] = ShopGroupPropertiesDataHelper::getGroupChildrenProperties($groupID);
            }
            return $this->groups[$groupID];
        } else {
            return NULL;
        }
    }

    /**
     * Получаем информацию о группе из дерева;
     * @param string $groupID - ID группы
     * @return array - информация о группе
     */
    public function getGroupName($groupID) {
        if (isset($this->groups[$groupID]['groupName'])) {
            return $this->groups[$groupID]['groupName'];
        } else {
            return NULL;
        }
    }

    /**
     * Получает массив родительских элементов группы, начиная от корневого элемента
     * @param type $groupID - ID группы
     * @return type array - массив родительских элементов группы
     */
    public function getGroupPath($groupID) {
        if (isset($this->groupPath[$groupID])) {
            return $this->groupPath[$groupID];
        } else {
            return array();
        }
    }

    /**
     * Получает id родительского элемента
     * @param type $groupID - ID группы
     * @return string - ID родительской группы
     */
    public function getGroupParentID($groupID) {
        if (isset($this->groupPath[$groupID])) {
            $key = count($this->groupPath[$groupID]);
            if ($key-- != 0) {
                return $this->groupPath[$groupID][0];
            }
        }
        return NULL;
    }

    /**
     * Получает массив всех дочерних элементов группы
     * @param type $groupID - ID группы
     * @return type array - массив всех дочерних элементов группы
     */
    public function getGroupRoot() {
        return $this->rootGroups;
    }

    /**
     * Получает массив всех дочерних элементов группы
     * @param type $groupID - ID группы
     * @return type array - массив всех дочерних элементов группы
     */
    public function getGroupChildren($groupID) {
        if (isset($this->groupChildren[$groupID])) {
            return $this->groupChildren[$groupID];
        } else {
            return array();
        }
    }

    /**
     * Получает массив всех дочерних элементов группы
     * @param type $groupID - ID группы
     * @return type array - массив всех дочерних элементов группы
     */
    public function getGroupNodeChildren($groupID) {
        $node = $this->getGroupNode($groupID);
        if ($node !== NULL) {
            return array_keys($node["children"]);
        } else {
            return array();
        }
    }

    public function getGroupIdNodeChildren($group) {
        if (isset($this->groupsHierarchyData[$group])) {
            return $this->groupsHierarchyData[$group];
        } else {
            return array();
        }
    }

    /**
     * Получает массив всех групп
     * @return type array - массив всех групп
     */
    public function getGroups() {
        return array_keys($this->groups);
    }

    public function update($showHidden = false) {
        $this->getShopGroupsHelperData($showHidden, true);
    }

    public function TEST_DATA() {
        echo '<pre>';
//        var_dump($this->groups);
//        var_dump($this->rootGroups);
//        var_dump($this->groupsHierarchyData);
//        var_dump($this->groupsTree);
//        var_dump($this->groupsTree);
//        var_dump($this->groupPath);
//        var_dump( $this->groupChildren);
        echo '</pre>';

//        echo $this->groupsTree['children']['7bf74024-99a5-11db-937f-000e0c431b59']['info']['groupName'].'<br><br>';
//        $test = $this->getGroupInfo('7bf74024-99a5-11db-

        foreach ($this->groupPath as $key => $value) {
            $path = './';
            foreach ($value as $element) {
                $path .= $element . '/';
            }
            echo $path . '<b>' . $key . '</b><br>';
        }
        echo '<hr>';
        foreach ($this->groupPath as $key => $value) {
            $path = './ ';
            foreach ($value as $element) {
                $gr = $this->getGroupInfo($element);
                $path .= $gr['groupName'] . ' / ';
            }
            $gr = $this->getGroupInfo($key);
            echo $path . '' . $gr['groupName'] . '<br>';
        }
    }

}
