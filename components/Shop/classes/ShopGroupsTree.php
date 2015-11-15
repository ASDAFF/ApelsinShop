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
    private $changes = true;
    private $jsExpandGen = false;

    const FunctionalButtonClass = 'GroupTreeFunctionalButton';

    public function __construct() {
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
    public function addFunctionalButton($buttonName, $javaScript, $content = "") {
        $id = ID_GENERATOR::generateID(9, "GroupTreeFB");
        $this->buttonsForAllGroups[$id]["buttonId"] = $id;
        $this->buttonsForAllGroups[$id]["buttonName"] = $buttonName;
        $this->buttonsForAllGroups[$id]["content"] = $content;
        $this->buttonsForAllGroups[$id]["javaScript"] = $javaScript;
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
        if($this->tree === null || $this->changes) {
            $this->generateTree();
        }
        return $this->tree;
    }
    
    /**
     * Данная функция обновляет все идентификаторы кнопок
     */
    private function updateFunctionalButtonId() {
        $newFunctionalButton = array();
        foreach ($this->buttonsForAllGroups as $button) {
            $newId = ID_GENERATOR::generateID(9, "GroupTreeFB");
            $newFunctionalButton[$newId]["buttonId"] = $newId;
            $newFunctionalButton[$newId]["buttonName"] = $button["buttonName"];
            $newFunctionalButton[$newId]["content"] = $button["content"];
            $newFunctionalButton[$newId]["javaScript"] = $button["javaScript"];
        }
        $this->buttonsForAllGroups = $newFunctionalButton;
    }

    /**
     * Запуск процесса генерации дерева.
     */
    private function generateTree() {
        $this->updateFunctionalButtonId();
        $this->tree = "<div class='GroupTree'>";
        $this->tree .= "<ul class='RootGroup'>";
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
    private function getTreeNode($groupId) {
        $gteId = ID_GENERATOR::generateID(9, "GTE");
        $CGId = ID_GENERATOR::generateID(9, "CG");
        $children = $this->shopGroupsHelper->getGroupNodeChildren($groupId);
        $out = "<div class='GroupTreeElement' id='" . $gteId . "'>";
        if (!empty($children)) {
            $out .= $this->getGroupName($groupId,$CGId);
            $out .= "<ul class='ChildrenGroup' id='" . $CGId . "'>";
            foreach ($children as $child) {
                $out .= "<li>" . $this->getTreeNode($child) . "</li>";
            }
            $out .= "</ul>";
        } else {
            $out .= $this->getGroupName($groupId,$gteId, false);
        }
        $out .= "</div>";
        return $out;
    }

    /**
     * генерация заголовка узла дерева.
     * @param string $groupId - идентификатор группы
     * @param boolean $expand - разкрываемый или нет
     * @return string - заголовок узла дерва
     */
    private function getGroupName($groupId, $elementId, $expand = true) {
        $groupInfo = $this->shopGroupsHelper->getGroupInfo($groupId);
        $contentTextClass = "";
        $groupChildrenAmount = "";
        $out = "<div class='GroupTreeElementContent'>";
        if ($expand) {
            $groupChildrenAmount = " (" . count($this->shopGroupsHelper->getGroupChildren($groupId)) . ")";
            $out .= "<div class='GroupTreeElementExpandButton NoExpanded' groupId='" . $groupId . "' elementId='".$elementId."'></div>";
            $contentTextClass = 'Expanded';
        } else {
            $contentTextClass = 'NoExpanded';
        }
        foreach ($this->buttonsForAllGroups as $button) {
            $out .= $this->getFunctionalButton($button, $groupId);
        }
        $out .= "<div class='GroupTreeElementContentText " . $contentTextClass . "'>";
        $out .= $groupInfo['groupName'] . $groupChildrenAmount;
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
    private function getFunctionalButton($button, $groupId) {
        return "<div class='GroupTreeFunctionalButton " . $button['buttonId'] . " " . $button['buttonName'] . "' groupId='" . $groupId . "'>" . $button['content'] . "</div>";
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
            $this->javaScript .= '        if($(this).hasClass("NoExpanded")) {';
            $this->javaScript .= '            $(this).removeClass("NoExpanded");';
            $this->javaScript .= '            $(this).addClass("Expanded");';
            $this->javaScript .= '            $("#" + elementId).slideDown();';
            $this->javaScript .= '        } else {';
            $this->javaScript .= '            $(this).removeClass("Expanded");';
            $this->javaScript .= '            $(this).addClass("NoExpanded");';
            $this->javaScript .= '            $("#" + elementId).slideUp();';
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
        $javaScript .= $button["javaScript"];
        $javaScript .= '});';
        return $javaScript;
    }

}
