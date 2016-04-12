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
 * Description of AP_WorkingWithShopCatalog_editGroup
 *
 * @author Olga Rjabchikova
 * @copyright © 2010-2016, CompuProjec
 * @created 25.11.2015 10:18:11
 */
class AP_WorkingWithShopCatalog_EditGroup extends AP_WorkingWithShopCatalog_General {

    private $oldName;
    private $addProperty;
    private $deleteProperty;
    private $parentPropertyId;        // хранит Id родительских св-тв
    private $personalPropertyId;      // хранит Id personal
    private $propertyInGroupId;       // хранит Id для  `ShopPropertiesInGroupsRanking`

    public function __construct($groupId) {
        parent::__construct($groupId);
        $this->addProperty = [];
        $this->deleteProperty = [];
        $this->propertyInGroupId = [];
        $this->parentPropertyId = [];
        $this->personalPropertyId = [];
        $this->personalPropertyNew = [];
        $this->getPersonalProperty();
        $this->setDefaultData();
        $this->execute();
    }

    private function generationFormAddGroup() {
        $this->html = '<div class="addGroupShopCatalogWraper">';
        $this->html .= '<div class=""><a href="' . $this->urlHelper->getThisPage() . '#propertyCreated">Новое св-во</a></div>';
        $this->html .= '<a name="top"></a>';
        $this->html .= '<div class="addGroupShopCatalog">';
        $this->html .= $this->generationHeaderGroupName();
        $this->html .= $this->generationHeader();
        $this->html .= $this->generationMainProperty();
        $createdProperty = new AP_WorkingWithShopCatalog_AddBlockNewProperty();
        $this->html .= $createdProperty->getHtml();
        $this->html .= '</div>';
        $this->html .= '</div>';
        $this->html .= '<a name="propertyCreated"></a>';
        $this->html .= '<a href="' . $this->urlHelper->getThisPage() . '#top">Наверх</a>';
    }

    private function generationHeader() {
        $html = '<div class="addGroupShopCatalogHead">';
        $html .= 'Место расположения - "' . $this->getTextPath($this->path) . '"';
        $html .= '</div>';
        return $html;
    }

    private function generationHeaderGroupName() {
        $html = '<div class="addGroupShopCatalogHead">';
        $html .= 'Редактирование каталога ' . $this->getGroupName($this->groupId);
        $html .= '</div>';
        return $html;
    }

    private function generationForm() {
        $html = '<form class="AP_FormAddNewGroupShopCatalog" name="AP_FormAddNewGroupShopCatalog" action="' . $this->urlHelper->getThisPage() . '" method="POST" accept - charset="UTF-8">';
        $html .= $this->generationGetName();
        $html .= '<div class="addGroupPropertyInteractiveListsPlugin" id="addGroupPropertyInteractiveListsPlugin">';
        $html .= $this->generationElementListParent($this->availableProperty);
        $html .= '<div class="clear"></div>';
        $html .= '</div>';
        $html .= '<div class="AP_SubmitAddNewGroup">';
        $html .= $this->getButtonBack();
        $html .= '<input class="AP_SubmitEditGroup" type="submit" name="AP_SubmitEditGroup" id="AP_SubmitEditGroup" value="Изменить">';
        $html .= '</div>';
        $html .= '</form>';
        return $html;
    }

    private function generationGetName() {
        $out = '';
        $out .= '<div class="addGroupCatalogGroupNameWrapper">';
        $out .= '<div class="addGroupCatalogGroupName">';
        $out .= '<div class="addGroupCatalogGroupNameInput">';
//        $out .= InputHelper::paternTextBox('groupName', 'groupName', 'groupName', 50, false, "Название каталога", "[А-Яа-яA-Za-z0-9][^@#$%&*]{3,50}", $this->originalInsertValue['groupName']);
        $out .= InputHelper::textBox('groupName', 'groupName', 'groupName', 50, false, $this->originalInsertValue['groupName']);
        $out .= '</div>';
        $out .= '</div>';
        $out .= '<div class="addGroupCatalogGroupVisible">';
        $out .= '<div class="addGroupCatalogGroupVisibleLeft" title="Тип фильтра / Тип данных">';
        $out .= InputHelper::select("shown", "shown", array(array('value' => "1", 'text' => "Отображать группу"), array('value' => "0", 'text' => "Не отображать группу")), false, $this->originalInsertValue['shown']);
        $out .= '</div>';
        $out .= '<div class="addGroupCatalogGroupVisibleRight">';
        $out .= InputHelper::select("showInHierarchy", "showInHierarchy", array(array('value' => "1", 'text' => "Отображать группу в иерархии"), array('value' => "0", 'text' => "Не отображать группу в иерархии")), false, $this->originalInsertValue['showInHierarchy']);
        $out .= '</div>';
        $out .= '<div class="clear"></div>';
        $out .= '</div>';
        $out .= '<div class="clear"></div>';
        $out .= '</div>';
        return $out;
    }

    /**
     * Генерирует список unused - св-тв (блока2)
     * @param type $propertis
     * @return type
     */
    private function generationElementListAll($propertis) {
        $this->interactiveListsPlugin->clearList();
        $this->interactiveListsPlugin->updateId();
        if (!empty($propertis) && $propertis != null) {
            foreach ($propertis as $property) {
                $element = self::generationElement($property, true);
                $this->interactiveListsPlugin->addListElement($element);
            }
        }
        $this->interactiveListsPlugin->setOption_containment('.addGroupCatalogGroupPropertyWrapper');
        $this->interactiveListsPlugin->searchBox();
        $this->listID2 = $this->interactiveListsPlugin->getListJSID();
        return $this->interactiveListsPlugin->getList();
    }

    /**
     * Генерирует список св-тв
     * @param type $propertis
     * @return type
     */
    private function generationElementListParent($propertis) {
        if (!empty($propertis) && $propertis != null) {
            foreach ($propertis as $property) {
                if (in_array($property['id'], $this->personalPropertyId)) {
                    $element = self::generationElement($property, true);
                } else {
                    $element = self::generationElement($property, false);
                }
                $this->interactiveListsPlugin->addListElement($element);
            }
        }
        $this->interactiveListsPlugin->setOption_connectWith('#' . $this->interactiveListsPlugin->getListJSID());
        $this->interactiveListsPlugin->setOption_containment('#' . $this->interactiveListsPlugin->getListJSID());
        $this->interactiveListsPlugin->setOption_placeholder('PlaceholderClass');
        $this->interactiveListsPlugin->setOption_dropOnEmpty('true');
        $this->interactiveListsPlugin->setOption_opacity('0.6');
        $this->interactiveListsPlugin->setOption_cursor('pointer');
        $this->interactiveListsPlugin->setOption_revert('true');
        $this->interactiveListsPlugin->addEvent_start("$('#trash-for-app').css('display', 'block');");
        $this->interactiveListsPlugin->addEvent_stop("$('#trash-for-app').css('display', 'none');");
        $this->listID1 = $this->interactiveListsPlugin->getListJSID();
        return $this->interactiveListsPlugin->getList();
    }

    private function generationMainProperty() {
        $html = '<div class="addGroupCatalogGroupPropertyWrapper">';
        $html .= '<div class="addGroupCatalogGroupPropertyWrapperLeft">';
        $html .= $this->generationForm();
        $html .= '</div>';
        $html .= '<div class="addGroupCatalogGroupPropertyRight">';
        $html .= $this->generationElementListAll($this->unusedPrpoperty);
        $html .= '</div>';
        $html .= '<div class="clear"></div>';
        $html .= '</div>';
        $html .= $this->generationJS($this->listID1, $this->listID2);
        return $html;
    }

    /**
     * Данные по Default
     */
    private function setDefaultData() {
        $this->insertValue = [];
        $this->getListParentProperty();
        $this->getPersonalProperty($this->info['properties']['personal']);
        $this->oldName = $this->info["groupName"];
        $this->insertValue['groupName'] = $this->info["groupName"];
        $this->insertValue['shown'] = $this->info['shown'];
        $this->insertValue['showInHierarchy'] = $this->info['showInHierarchy'];
        $this->originalInsertValue = $this->insertValue;
    }

    /**
     * Корректировка PropertyInGroupId для `ShopPropertiesInGroupsRanking`
     * @param type $property
     * @return type
     */
    private function getPropertyInGroupId($property) {
        if (isset($this->propertyInGroupId[$property])) {
            return $this->propertyInGroupId[$property];
        } else {
            return $this->insertValue['id'] . $property;
        }
    }

    /**
     * Для перезаписи sequence св-тв в порядке получения
     * @param type $id
     * @return type
     */
    private function getPersonalPropertyNew() {
        $query = "SELECT `property` FROM `ShopPropertiesInGroups` WHERE `group`='" . $this->groupId . "' ;";
        $result = $this->SQL_HELPER->select($query);
        foreach ($result as $value) {
            $this->personalPropertyNew[] = $value["property"];
        }
    }

    /**
     * Ин-фа о personal св-вах
     */
    private function getPersonalProperty() {
        foreach ($this->info['properties']['personal'] as $value) {
            $this->personalPropertyId[] = $value["property"];
        }
    }

    /**
     * Формирование массива родителей и массива их Id для `ShopPropertiesInGroups`
     */
    private function getListParentProperty() {
        $i = 0;
        foreach ($this->path as $group) {
            $propertiesInGroupsRanking = $this->helperGroup->getGroupInfo($group, true);
            if ($propertiesInGroupsRanking != null) {
                foreach ($propertiesInGroupsRanking['properties']['personal'] as $value) {
                    $this->parentPropertyId[$i] = $value['property'];
                    $this->propertyInGroupId[$value['property']] = $value['id'];
                    $i++;
                }
            }
        }
    }

    private function execute() {
        $this->html = "";
        if (isset($_POST['AP_SubmitEditGroup'])) {
            $this->getAllValue();
            if ($this->checkAllValue()) {
                $this->insertExecute();
                $this->html = $this->getReport($this->getReportAdditionally(), $this->info['properties']['available']);
                return;
            } else {
                if ($this->checkAllValueErrors != null) {
                    foreach ($this->checkAllValueErrors as $CVerror) {
                        echo $this->generationMessageErrorJS($CVerror);
                    }
                }
            }
        }
        $this->html .= $this->generationFormAddGroup();
    }

    private function getAllValue() {
        $this->insertValue = [];
        $this->insertValue['id'] = $this->groupId;
        $this->insertValue['groupName'] = InputValueHelper::getPostValue('groupName');
        $this->insertValue['shown'] = InputValueHelper::getPostValue('shown');
        $this->insertValue['showInHierarchy'] = InputValueHelper::getPostValue('showInHierarchy');
        if (isset($_POST['property'])) {
            $this->insertValue['property'] = $_POST['property'];
            $this->insertValue['addGroupDragDropListElementShowSelect'] = $_POST['addGroupDragDropListElementShowSelect'];
        } else {
            $this->insertValue['property'] = [];
            $this->insertValue['addGroupDragDropListElementShowSelect'] = [];
        }
        if ($this->parentPropertyId != null) {
            foreach ($this->parentPropertyId as $parent) {
                if (!in_array($parent, $this->insertValue['property'])) {
                    array_push($this->insertValue['property'], $parent);
                    array_push($this->insertValue['addGroupDragDropListElementShowSelect'], 1);
                }
            }
        } else {
            $this->parentPropertyId = [];
        }
    }

    private function checkAllValue() {
        $error = false;
        if (!isset($_POST['groupName']) || $_POST['groupName'] == null || $_POST['groupName'] == "") {
            $error = true;
            $this->checkAllValueErrors[] = "Название каталога - обязательное поле ";
        }
//        if (isset($_POST['groupName']) && $_POST['groupName'] != null && $_POST['groupName'] != "") {
//            if (!InputValueHelper::checkValue('groupName', "/[А-Яа-яA-Za-z0-9][^@#$%&*]{3,50}/")) {
//                $error = true;
//                $this->checkAllValueErrors[] = "Разрешены латинские буквы, кирилические буквы, цифры и щаник тире и нижнее подчеркивание";
//            }
//        } else {
//            $error = true;
//            $this->checkAllValueErrors[] = "Название каталога - обязательное поле ";
//        }
        if ($this->insertValue['groupName'] !== $this->oldName) {
            if (!$this->checkDuplicateGroupName()) {
                $error = true;
                $this->checkAllValueErrors[] = "Такое название каталога уже используется. Выберите другое.";
            }
        }
        return !$error;
    }

    private function insertExecute() {
        $newGroup = "UPDATE `ShopGroups` SET ";
        $newGroup .= "`groupName` = '" . $this->insertValue['groupName'] . "', ";
        $newGroup .= "`shown` = '" . $this->insertValue['shown'] . "', ";
        $newGroup .= "`showInHierarchy` = '" . $this->insertValue['showInHierarchy'] . "'";
        $newGroup .= " WHERE `id`='" . $this->insertValue['id'] . "';";
        $this->SQL_HELPER->insert($newGroup);
//        if ($this->parent != null) {
//            $groupHierarchy = "UPDATE `ShopGroupsHierarchy` SET ";
//            $groupHierarchy .= "`group` = '" . $this->insertValue['id'] . "', ";
//            $groupHierarchy .= "`parentGroup` = '" . $this->parent . "'";
//            $groupHierarchy .= " WHERE `group`='" . $this->insertValue['id'] . "';";
//            $this->SQL_HELPER->insert($groupHierarchy);
//        }
        $this->getInsertInShopPropertiesInGroups();
        $this->getInsertInShopPropertiesInGroupsRanking();
        $this->dataUpdate();
    }

    private function getInsertInShopPropertiesInGroups() {
        $maxSequence = $this->getMaxSequence($this->insertValue['id']);
        $i = $maxSequence + 1;
        $property = '';
        foreach ($this->insertValue['property'] as $propertyId) {
            if (!in_array($propertyId, $this->parentPropertyId) && !in_array($propertyId, $this->personalPropertyId)) {
                $property = "INSERT INTO `ShopPropertiesInGroups` SET ";
                $property .= "`id` = '" . $this->getPropertyInGroupId($propertyId) . "', ";
                $property .= "`group` = '" . $this->insertValue['id'] . "', ";
                $property .= "`property` = '" . $propertyId . "', ";
                $property .= "`sequence` = '" . $i++ . "';";
                $this->SQL_HELPER->insert($property);
                $this->addProperty[] = $propertyId;
            }
        }
        foreach ($this->personalPropertyId as $personalId) {
            if (!in_array($personalId, $this->insertValue['property'])) {
                $propertyInGroupId = $this->getPropertyInGroupId($personalId);
                $query = "DELETE FROM `ShopPropertiesInGroups` WHERE `id` = '" . $propertyInGroupId . "';";
                $this->SQL_HELPER->insert($query);
                $this->delChildrenProperty($propertyInGroupId);
                $this->deleteProperty[$personalId] = $personalId;
            }
        }
        $maxSequence2 = $this->getMaxSequence($this->insertValue['id']);
        if ($maxSequence2 != null) {
            $propertySequenceUpdate = "UPDATE `ShopPropertiesInGroups` SET `sequence` = `sequence` + " . $maxSequence2 . " 
                                        WHERE `group` = '" . $this->insertValue['id'] . "';";
            $this->SQL_HELPER->insert($propertySequenceUpdate);
            $sequence = 1;
            $this->getPersonalPropertyNew();
            foreach ($this->insertValue['property'] as $propertyId) {
                if (in_array($propertyId, $this->personalPropertyNew)) {
                    $propertySequenceUpdate2 = "UPDATE `ShopPropertiesInGroups` SET ";
                    $propertySequenceUpdate2 .= "`sequence` = '" . $sequence++ . "'";
                    $propertySequenceUpdate2 .= " WHERE `id`='" . $this->getPropertyInGroupId($propertyId) . "';";
                    $this->SQL_HELPER->insert($propertySequenceUpdate2);
                }
            }
        }
    }

    private function getInsertInShopPropertiesInGroupsRanking() {
        $propertyInShopPropertiesInGroupsRanking = [];
        foreach ($this->insertValue['property'] as $key => $property) {
            $ranking = "INSERT INTO `ShopPropertiesInGroupsRanking` SET ";
            $ranking .= "`group`='" . $this->insertValue['id'] . "', ";
            $ranking .= "`propertyInGroup`='" . $this->getPropertyInGroupId($property) . "', ";
            $ranking .= "`shown`='" . $this->insertValue['addGroupDragDropListElementShowSelect'][$key] . "',";
            $ranking .= "`sequence`='" . ($key + 1) . "'; ";
            $propertyInShopPropertiesInGroupsRanking[] = $ranking;
        }
        $rankingDelete = "DELETE FROM `ShopPropertiesInGroupsRanking` WHERE `group`='" . $this->insertValue['id'] . "';";
        $this->SQL_HELPER->insert($rankingDelete);
        foreach ($propertyInShopPropertiesInGroupsRanking as $propertyInShopProperties_InGroupsRanking) {
            $this->SQL_HELPER->insert($propertyInShopProperties_InGroupsRanking);
        }
        $nodeChildren = $this->helperGroup->getGroupChildren($this->insertValue['id']);
        foreach ($nodeChildren as $children) {
            $this->addChildrenProperty($this->insertValue['id'], $children);
        }
    }

    /**
     * Удаление св-ва у потомков
     * @param type $propertyId
     */
    private function delChildrenProperty($propertyId) {
        $nodeChildren = $this->helperGroup->getGroupChildren($this->insertValue['id']);
        foreach ($nodeChildren as $children) {
            $rankingDelete = "DELETE FROM `ShopPropertiesInGroupsRanking` WHERE `group`='" . $children . "' "
                    . "AND `propertyInGroup` = '" . $propertyId . "';";
            $this->SQL_HELPER->insert($rankingDelete);
        }
    }

    /**
     * Название св-ва
     * @param type $id
     * @return string
     */
    private function getNameProperty($id) {
        $query = "SELECT `propertyName` FROM `ShopProperties` WHERE `id` = '" . $id . "';";
        $name = $this->SQL_HELPER->select($query, 1);
        return $name['propertyName'];
    }

    private function getReportAdditionally() {
        $additionally = '<div class="addGroupCatalogReportText">Изменен каталог "' . $this->oldName . '"</div>';
        if ($this->insertValue['groupName'] !== $this->oldName) {
            $additionally .= '<div class="addGroupCatalogReportText">Новое название каталога - ' . $this->insertValue['groupName'] . '</div>';
        }
        if (!empty($this->addProperty)) {
            $additionally .= '<div class="addGroupCatalogReportText">Добавлено св-во:</div>';
            $additionally .= '<ul>';
            foreach ($this->addProperty as $property) {
                $additionally .= '<li>' . $this->getNameProperty($property) . '</li>';
            }
            $additionally .= '</ul>';
        }
        if (!empty($this->deleteProperty)) {
            $additionally .= '<div class="addGroupCatalogReportText">Удалено св-во:</div>';
            $additionally .= '<ul>';
            foreach ($this->deleteProperty as $properti) {
                $additionally .= '<li>' . $this->getNameProperty($properti) . '</li>';
            }
            $additionally .= '</ul>';
        }
        return $additionally;
    }

    protected function getButtonEdit() {
        parent::getButtonEdit();
        $params[0] = 'components';
        $params[1] = 'Shop';
        $params[2] = 'element';
        $params[3] = 'workingWithShopCatalog';
        $params[4] = 'EditGroup';
        $params[5] = $this->insertValue['id'];
        $html = '<a href="' . $this->urlHelper->chengeParams($params) . '"><input type="button" class="addGroupCatalogReportButtonEdit" id="addGroupCatalogReportButtonEdit" value="Редактировать"></a>';
        return $html;
    }

}
