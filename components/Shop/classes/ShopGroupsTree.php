<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Дерево групп
 *
 * @author Maxim Zaytsev
 * @copyright © 2010-2016, CompuProjec
 * @created 15.11.2015 10:44:03
 */
class ShopGroupsTree {

    private $tree = null;
    private $javaScript = "";
    private $shopGroupsHelper;
    private $rootGroups;
    private $buttonsForAllGroups;
    private $showGroupTreeRootButton;
    private $changes = true;
    private $jsExpandGen = false;

    const FunctionalButtonClass = 'GroupTreeFunctionalButton';

    public function __construct($showGroupTreeRootButton = true) {
        $this->showGroupTreeRootButton = $showGroupTreeRootButton;
        $this->shopGroupsHelper = new ShopGroupsHelper();
        $this->rootGroups = $this->shopGroupsHelper->getGroupRoot();
        $this->buttonsForAllGroups = array();
    }

    /**
     * Добавляем кнопки для группы.
     * Чтобы изменения встипили в силу нужно вызвать метод generateTree().
     * @param string $buttonName - имя кнопки, без пробелов и спец символов.
     *      Используется как идентификатор для JavaScript
     * @param string $javaScript - java Script который будет выполняться при нажатии кнопки.
     *      При написании скрипта можно обращатсья к сделующим переменным:
     *          object - ссылка на текущий объект по которому совершен клик.
     *          groupId - текстовое значение хранящее идентификатор группы к которой относится нажатая кнопка.
     * @param string $content - текст на кнопки, можно оставить пустым.
     */
    public function addFunctionalButton($buttonName, $javaScript, $content = "", $ignoreRoot = false) {
        $id = ID_GENERATOR::generateID("GroupTreeFB");
        $this->buttonsForAllGroups[$id]["buttonId"] = $id;
        $this->buttonsForAllGroups[$id]["buttonName"] = $buttonName;
        $this->buttonsForAllGroups[$id]["content"] = $content;
        $this->buttonsForAllGroups[$id]["javaScript"] = $javaScript;
        $this->buttonsForAllGroups[$id]["ignoreRoot"] = $ignoreRoot;
        $this->changes = true;
    }
    
    public function clearFunctionalButton() {
        $this->buttonsForAllGroups = array();
        $this->changes = true;
    }

    /**
     * Возвращает дерево каталогов. Если после последнего получения были внесены изменения, то последующие вызовы данной функции автоматически обновят 
     * @return string - html код дерева каталогов
     */
    public function getTree() {
        $this->generateTree();
        return $this->tree;
    }
    
    /**
     * Данная функция обновляет все идентификаторы кнопок
     */
    private function updateFunctionalButtonId() {
        $newFunctionalButton = array();
        foreach ($this->buttonsForAllGroups as $button) {
            $newId = ID_GENERATOR::generateID("GroupTreeFB");
            $newFunctionalButton[$newId]["buttonId"] = $newId;
            $newFunctionalButton[$newId]["buttonName"] = $button["buttonName"];
            $newFunctionalButton[$newId]["content"] = $button["content"];
            $newFunctionalButton[$newId]["javaScript"] = $button["javaScript"];
            $newFunctionalButton[$newId]["ignoreRoot"] = $button["ignoreRoot"];
        }
        $this->buttonsForAllGroups = $newFunctionalButton;
    }

    /**
     * Запуск процесса генерации дерева.
     */
    private function generateTree() {
        $this->updateFunctionalButtonId();
        $rootId = ID_GENERATOR::generateID("RootGroup");
        $treeId = ID_GENERATOR::generateID("GroupTree");
        $this->tree = "<div class='GroupTree' id='".$treeId."'>";
        if($this->showGroupTreeRootButton) {
            foreach ($this->buttonsForAllGroups as $button) {
                if(!$button["ignoreRoot"]) {
                    $this->tree .= $this->getFunctionalButton($button, 'ROOT', $treeId, $rootId, 'ROOT');
                }
            }
        }
        $this->tree .= "<ul class='RootGroup' id='".$rootId."'>";
        foreach ($this->rootGroups as $group) {
            $this->tree .= "<li>" . $this->getTreeNode($group) . "</li>";
        }
        $this->tree .= "</ul>";
        $this->tree .= "</div>";
        $this->generateJavaScript();
        $this->tree .= $this->javaScript;
        $this->changes = false;
    }

    /**
     * Генерация узла дерева
     * @param string $groupId - идентификатор группы
     * @return string - узел дерева
     */
    public function getTreeNode($groupId) {
        $gteId = ID_GENERATOR::generateID("GTE");
        $CGId = ID_GENERATOR::generateID("CG");
        $children = $this->shopGroupsHelper->getGroupNodeChildren($groupId);
        $out = "<div class='GroupTreeElement' id='" . $gteId . "'>";
        $out .= $this->getGroupName($groupId,$gteId,$CGId,!empty($children));
        $out .= "<ul class='ChildrenGroup' id='" . $CGId . "'>";
        foreach ($children as $child) {
            $out .= "<li>" . $this->getTreeNode($child) . "</li>";
        }
        $out .= "</ul>";
        $out .= "</div>";
        return $out;
    }

    /**
     * генерация заголовка узла дерева.
     * @param string $groupId - идентификатор группы
     * @param boolean $expand - разкрываемый или нет
     * @return string - заголовок узла дерва
     */
    private function getGroupName($groupId, $elementId, $childrenGroupId, $expand = false) {
        $groupInfo = $this->shopGroupsHelper->getGroupInfo($groupId);
        $contentTextClass = "";
        $groupChildrenAmount = "";
        $out = "<div class='GroupTreeElementContent'>";
        if ($expand) {
            $groupChildrenAmount = " (" . count($this->shopGroupsHelper->getGroupChildren($groupId)) . ")";
            $out .= "<div class='GroupTreeElementExpandButton NoExpanded' groupId='" . $groupId . "' elementId='".$elementId."' childrenGroupId='".$childrenGroupId."'></div>";
            $contentTextClass = 'Expanded';
        } else {
            $out .= "<div class='GroupTreeElementExpandButton NoExpanded GroupTreeHideElement' groupId='" . $groupId . "' elementId='".$elementId."' childrenGroupId='".$childrenGroupId."'></div>";
            $contentTextClass = 'NoExpanded';
        }
        foreach ($this->buttonsForAllGroups as $button) {
            $out .= $this->getFunctionalButton($button, $groupId, $elementId, $childrenGroupId);
        }
        $out .= "<div class='GroupTreeElementContentText " . $contentTextClass . "'>";
        $out .= $groupInfo['groupName'];
        $out .= "</div>";
        $out .= "</div>";
        return $out;
    }

    /**
     * Получить функциональную кнопку для заголвока узла дерева
     * @param array $button - данные по кнопке
     * @param string $groupId - идентификатор группы
     * @return string - html код кнопки
     */
    private function getFunctionalButton($button, $groupId, $elementId, $childrenGroupId, $cssClass = '') {
        return "<div class='GroupTreeFunctionalButton " . $button['buttonId'] . " " . $button['buttonName'] . " " . $cssClass . "' groupId='" . $groupId . "' elementId='".$elementId."' childrenGroupId='".$childrenGroupId."'>" . $button['content'] . "</div>";
    }

    /**
     * генерация javaScript для работы дерева.
     */
    private function generateJavaScript() {
        $this->javaScript = '<script type="text/javascript">';
        if(!$this->jsExpandGen) {
            $this->javaScript .= 'jQuery(document).ready(function() {';
            $this->javaScript .= '    jQuery(".GroupTreeElementExpandButton").click(function(){';
            $this->javaScript .= '        var groupId = $(this).attr("groupId");';
            $this->javaScript .= '        var elementId = $(this).attr("elementId");';
            $this->javaScript .= '        var childrenGroupId = $(this).attr("childrenGroupId");';
            $this->javaScript .= '        if($(this).hasClass("NoExpanded")) {';
            $this->javaScript .= '            $(this).removeClass("NoExpanded");';
            $this->javaScript .= '            $(this).addClass("Expanded");';
            $this->javaScript .= '            $("#" + childrenGroupId).slideDown();';
            $this->javaScript .= '        } else {';
            $this->javaScript .= '            $(this).removeClass("Expanded");';
            $this->javaScript .= '            $(this).addClass("NoExpanded");';
            $this->javaScript .= '            $("#" + childrenGroupId).slideUp();';
            $this->javaScript .= '        }';
            $this->javaScript .= '    });';
            $this->javaScript .= '});';
            $this->jsExpandGen = true;
        }
        foreach ($this->buttonsForAllGroups as $key => $button) {
            $this->javaScript .= $this->generateJavaScriptForFunctionalButton($button);
            $this->buttonsForAllGroups[$key]["gsGen"] = true;
        }
        $this->javaScript .= '</script>';
    }

    /**
     * генерация javaScript для работы функциональной кнопки для элементов дерева.
     * @param array $button - данные по кнопке.
     * @return string - javaScript для работы кнопки.
     */
    private function generateJavaScriptForFunctionalButton($button) {
        $javaScript = 'jQuery(".' . self::FunctionalButtonClass . '.' . $button["buttonId"] . '").click(function(){';
        $javaScript .= 'var object = object = $(this);';
        $javaScript .= 'var groupId = object.attr("groupId");';
        $javaScript .= 'var elementId = object.attr("elementId");';
        $javaScript .= 'var childrenGroupId = object.attr("childrenGroupId");';
        $javaScript .= $button["javaScript"];
        $javaScript .= '});';
        return $javaScript;
    }
    
    private function addNewNode() {
        
    }
}
