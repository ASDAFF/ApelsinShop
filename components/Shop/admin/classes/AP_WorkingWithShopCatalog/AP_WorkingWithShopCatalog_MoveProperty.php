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
 * Description of AP_WorkingWithShopCatalog_MoveProperty
 *
 * @author Olga Rjabchikova
 * @copyright © 2010-2016, CompuProjec
 * @created 15.01.2016 9:42:49
 */
class AP_WorkingWithShopCatalog_MoveProperty extends AP_WorkingWithShopCatalog_General {

    private $propertyMoveId;
    private $newOwner;
    private $personalDelete;
    private $dataForReport;

    public function __construct($groupId) {
        parent::__construct($groupId);
        $this->dataForReport = [];
        $this->moving();
        $this->insert();
    }

    /**
     * Перенос
     * @param type $yes
     */
    private function moving() {
        $this->html = $this->generationUI($this->getAction());
        if (isset($this->params[6])) {
            switch ($this->params[6]) {
                case 'moveParent':
                    $this->html = $this->generationUI($this->moveProperty($this->path));
                    break;
                case 'moveChildren':
                    $listDirs = $this->nodeChildrenAndParent;
                    array_shift($listDirs);
                    $this->html = $this->generationUI($this->moveProperty($listDirs, false));
                    break;
                default:
                    $this->html = 'неверная URL';
                    break;
            }
        }
    }

    private function getUI($data, $parent) {
        if ($parent) {
            $html = InputHelper::select("moveParentSelect", "moveParentSelect", $this->getCataloge($data), true, '');
        } else {
            $shopGroupsTree = new ShopGroupsTree();
            $shopGroupsTree->addFunctionalButton(
                    'movePropertyChildren', 'addChildrenGroupId(groupId,object);', 'Выбрать', true);
            $html = $shopGroupsTree->getTree($this->groupId);
        }
        return $html;
    }

    private function generatJS() {
        $out = '<script type="text/javascript">
                
            movePropertyChildrenGroupId = [];

            function addChildrenGroupId(idGroup,object) {
                    if ($.inArray(idGroup, movePropertyChildrenGroupId) < 0 ) {
                        movePropertyChildrenGroupId.push(idGroup);
                        $("#blockHiddenIdProperty").prepend(getIdGroup(idGroup));
                        $(object).addClass("shopItemsNewItemsCardsBlockItemCardActiveClass");
                    } else {
                        var i = movePropertyChildrenGroupId.indexOf(idGroup);
                        movePropertyChildrenGroupId.splice(i, 1);
                        $(object).removeClass("shopItemsNewItemsCardsBlockItemCardActiveClass");
                        $("#shopGetIdGroup_" + idGroup).remove();
                    }
            }

            // Генерирование HTML hidden - поля для addChildrenGroupId
            function getIdGroup(idGroup) { 
                var inputHidden = "<input type=\"hidden\" class=\"shopGetIdGroup\"  name=\"shopGetIdGroup[]\" value=\""+ idGroup +"\"  id=\"shopGetIdGroup_"+ idGroup +"\"> ";
                return inputHidden;
            }
                
        </script>';
        return $out;
    }

    private function generationUI($content) {
        $html = '<div class="addGroupCatalogReportWraper">';
        $html .= '<div class="addGroupShopCatalogHead">Перемещение  свойств из каталога "' . $this->nameGroup . '"</div>';
        $html .= $content;
        $html .= '</div>';
        return $html;
    }

    private function getAction() {
        $html = '';
        if ($this->parent == null && $this->node == null) {
            $html .= '<div class="addGroupCatalogReportText">Группа "' . $this->nameGroup . '" является родительской, вложенные каталоги отсутствуют, свойства перенести невозможно</div>';
            $html .= $this->getButtonBack();
        } else if ($this->info['properties']['personal'] == null) {
            $html .= '<div class="addGroupCatalogReportText">Каталог "' . $this->nameGroup . '" не имеет свойств для переноса</div>';
            $html .= $this->getButtonBack();
        } else {
            $html .= '<center>';
            $html .= $this->generationButtonForMove();
            $html .= '</center>';
        }
        return $html;
    }

    /**
     * Генерация кнопок для UI
     * @return string
     */
    private function generationButtonForMove() {
        $html = '';
        $params1[0] = $params2[0] = $params3[0] = $this->params[0];
        $params1[1] = $params2[1] = $params3[1] = $this->params[1];
        $params1[2] = $params2[2] = $params3[2] = $this->params[2];
        $params1[3] = $params2[3] = $params3[3] = $this->params[3];
        $params2[4] = $params3[4] = $this->params[4];
        $params2[5] = $params3[5] = $this->params[5];
        $params2[6] = 'moveParent';
        $params3[6] = 'moveChildren';
        $noUrl = $this->urlHelper->chengeParams($params1);
        $moveParent = $this->urlHelper->chengeParams($params2);
        $moveChildren = $this->urlHelper->chengeParams($params3);
        if ($this->parent != null) {
            $html .= '<a href="' . $moveParent . '"><input class="AP_Submit" type="button" value="Родительский каталог"></a>';
        }
        if ($this->node != null) {
            $html .= '<a href="' . $moveChildren . '"><input class="AP_Submit" type="button" value="Вложенные каталоги"></a>';
        }
        $html .= '<a href="' . $noUrl . '"><input class="AP_Submit" type="button" value="Отменить перенос"></a>';
        return $html;
    }

    private function moveProperty($data, $parent = true) {
        $html = '<form class="AP_FormShopCatalogMoveProperty" name="AP_FormShopCatalogMoveProperty" enctype="multipart/form-data" action="' . $this->urlHelper->getThisPage() . '" method="POST" accept - charset="UTF-8" >';
        $html .= '<div id="blockHiddenIdProperty"></div>';
        $html .= '<div class="addGroupCatalogMovePropertyMain">';
        $html .= $this->getPersonalProperty();
        $html .= '<div class="addGroupCatalogMoveProperty">';
        $html .= '<div class="addGroupCatalogReportText">Каталоги, в которые можно перенести свойства</div>';
        $html .= $this->getUI($data, $parent);
        $html .= '</div>';
        $html .= '</div>';
        $html .= '<div class="clear"></div>';
        $html .= '<center>';
        $html .= '<input class="AP_SubmitShopCatalogMoveProperty" type="submit" name="AP_SubmitShopCatalogMoveProperty" value="Переместить">';
        $html .= $this->getButtonBack();
        $html .= '</center>';
        $html .= '</form>';
        $html .= $this->generatJS();
        return $html;
    }

    private function getPersonalProperty() {
        $html = '<div class="addGroupCatalogPersonal">';
        $html .= '<div class="addGroupCatalogReportText">Персональные свойства каталога, которые можно перенести</div>';
        $html .= '<ul class="ListShopCatalogMoveProperty">';
        $html .= $this->getElementPersonalProperty();
        $html .= '</ul>';
        $html .= '</div>';
        return $html;
    }

    private function getElementPersonalProperty() {
        $html = '';
        foreach ($this->info['properties']['personal'] as $property) {
            $html .= '<li class="addColorSelectElementPersonalProperty">';
            $html .= '<label class="labelElementPersonalProperty">';
            $html .= $property['propertyName'];
            $html .= '<input type="checkbox" name="checkElementPersonalProperty[]" id="checkElementPersonalProperty" value="' . $property['property'] . '" style="vertical-align:middle;">';
            $html .= '<div class="clear"></div>';
            $html .= '</label>';
            $html .= '</li>';
        }
        return $html;
    }

    private function getCataloge($dirs) {
        $listParent = [];
        $i = 0;
        foreach ($dirs as $dir) {
            $listParent[$i]['text'] = $this->getGroupName($dir);
            $listParent[$i++]['value'] = $dir;
        }
        $listParent[$i + 1]['text'] = "Выберите каталог";
        $listParent[$i + 1]['value'] = '';
        return $listParent;
    }

    private function insert() {
        if (isset($_POST['AP_SubmitShopCatalogMoveProperty'])) {
            $this->getAllValue();
            if ($this->checkAllValue()) {
//                // проверить статус группы (куда) и выбрать insert
                $this->checkStatut();
            } else {
                if (!empty($this->checkAllValueErrors)) {
                    foreach ($this->checkAllValueErrors as $CVerror) {
                        $this->html .= $this->generationMessageErrorJS($CVerror);
                    }
                }
            }
        }
    }

    private function getAllValue() {
        if (isset($_POST['checkElementPersonalProperty'])) {
            $this->propertyMoveId = $_POST['checkElementPersonalProperty'];
        }
        if (isset($_POST['moveParentSelect'])) {
            $this->newOwner = $_POST['moveParentSelect'];
        } elseif (isset($_POST['shopGetIdGroup'])) {
            $this->newOwner = $_POST['shopGetIdGroup'];
        }
    }

    private function checkAllValue() {
        $error = false;
        if (!(isset($_POST['checkElementPersonalProperty']) && !empty($_POST['checkElementPersonalProperty']) && $_POST['checkElementPersonalProperty'] != null)) {
            $error = true;
            $this->checkAllValueErrors[] = "Не выбрано ни одного свойства";
        }
        if (!(isset($_POST['moveParentSelect'])) && !(isset($_POST['shopGetIdGroup']))) {
            $error = true;
            $this->checkAllValueErrors[] = "Не выбрана группа для перемещения свойства";
        }
        return !$error;
    }

    /**
     * Проверить статус группы (куда) и выбрать insert
     */
    private function checkStatut() {
        if (in_array($this->newOwner, $this->path)) {
            $this->insertParent();
        } else {
            $this->sortChildren();
            foreach ($this->newOwner as $group) {
                if (in_array($group, $this->nodeChildrenAndParent)) {
                    $this->insertChildren($group);
                }
            }
            $this->deletePropertyForParent();
            $this->html = $this->generationUI($this->getReportForChield());
        }
    }

    /**
     * Удаление дочерних групп из массива для переноса св-ва, если в массиве присутствует непосредственный родитель
     */
    private function sortChildren() {
        foreach ($this->newOwner as $group) {
            $parents = $this->helperGroup->getGroupPath($group);
            foreach ($parents as $parent) {
                if (in_array($group, $this->newOwner) && in_array($parent, $this->newOwner)) {
                    if (($key = array_search($group, $this->newOwner)) !== false) {
                        unset($this->newOwner[$key]);
                    }
                }
            }
        }
    }

    /**
     * Перемещение в родителя
     */
    private function insertParent() {
        // новое св-во добавить родителю (в обе таблицы)
        $this->addNewPropertyForNewOwner();
        // редактируем ShopPropertiesInGroupsRanking
        $infoGroup = $this->helperGroup->getGroupInfo($this->newOwner, true);
        foreach ($infoGroup['children'] as $group) {
            $this->getPersonalDelete($group);
            // сменить владельца св-вом в InGroupsRanking и удалить дубликат св-ва из InGroups
            if (isset($this->personalDelete['propertyId'])) {
                foreach ($this->personalDelete['propertyId'] as $property) {
                    $this->deletePersonalPropertyDublicate($group, $property);
                }
                $this->updateSequence($group);
            }
            // записать в InGroupsRanking новые св-ва потомкам
            if (!in_array($group, array_keys($this->dataForReport))) {
                $this->addChildrenProperty($this->newOwner, $group);
            }
        }
        $this->html = $this->generationUI($this->getReportForParent());
    }

    private function getReportForParent() {
        $html = '<div class="addGroupCatalogReportText">Перенносимые свойства каталога: </div>';
        foreach ($this->propertyMoveId as $value) {
            $html .= '<div class="addGroupCatalogReportText">' . $this->getPropertyName($value) . '</div>';
        }
        $html .= '<div class="addGroupCatalogReportText">1) Новые свойства добавлены в каталог "' . $this->getGroupName($this->newOwner) . '" и стали доступны в каталогах:</div>';
        $infoGroup = $this->helperGroup->getGroupInfo($this->newOwner, true);
        foreach ($infoGroup['children'] as $group) {
            $html .= '<div class="addGroupCatalogReportText">' . $this->getGroupName($group) . '</div>';
        }
        $html .= '<div class="addGroupCatalogReportText">2) Персональные свойства удалены у каталога: </div>';
        foreach (array_keys($this->dataForReport) as $group) {
            $html .= '<div class="addGroupCatalogReportText">"' . $this->getGroupName($group) . '"</div>';
        }
        $html .= $this->getButtonBack();
        return $html;
    }

    /**
     * Возвращает название группы
     * @param type $id
     * @return type
     */
    protected function getPropertyName($id) {
        $query = "SELECT `propertyName` FROM `ShopProperties` WHERE `id` = '" . $id . "'";
        $name = $this->SQL_HELPER->select($query, 1);
        return $name['propertyName'];
    }

    /**
     * Перемещение в потомков
     */
    private function insertChildren($newOwner) {
        // заносим св-ва новому владельцу в ShopPropertiesInGroups
        $this->updateForNewOwnerMoveProperty($newOwner);
        // редактируем ShopPropertiesInGroupsRanking
        $this->updateParentForChildren($newOwner);
    }

    private function deletePropertyForParent() {
        foreach ($this->propertyMoveId as $propertyId) {
            $deletePropertyDublicate = "DELETE FROM `ShopPropertiesInGroups` WHERE `group`='" . $this->groupId . "' AND `id` = '" . $this->groupId . $propertyId . "';";
            $this->SQL_HELPER->insert($deletePropertyDublicate);
            $this->updateSequence($this->groupId);
        }
    }

    private function updateForNewOwnerMoveProperty($newOwner) {
        $maxSequence = $this->getMaxSequence($newOwner);
        $sequence = $maxSequence + '1';
        foreach ($this->propertyMoveId as $id) {
            $propertyInGroup = $newOwner . $id;
            $property = "INSERT INTO `ShopPropertiesInGroups` SET ";
            $property .= "`id` = '" . $propertyInGroup . "', ";
            $property .= "`group` = '" . $newOwner . "', ";
            $property .= "`property` = '" . $id . "', ";
            $property .= "`sequence` = '" . $sequence++ . "';";
            $this->SQL_HELPER->insert($property);
            $update = "UPDATE `ShopPropertiesInGroupsRanking` SET 
                `propertyInGroup` = '" . $propertyInGroup . "'
                WHERE `group` = '" . $newOwner . "' 
                AND `propertyInGroup` = '" . $this->groupId . $id . "';";
            $this->SQL_HELPER->insert($update);
        }
    }

    private function updateParentForChildren($newOwner) {
        $newOwenerChildren = $this->helperGroup->getGroupChildren($newOwner);
        foreach ($newOwenerChildren as $group) {
            foreach ($this->propertyMoveId as $propertyId) {
                $updatePropertyDublicate = "UPDATE `ShopPropertiesInGroupsRanking` SET 
                    `propertyInGroup` = '" . $newOwner . $propertyId . "'
                    WHERE `group` = '" . $group . "' 
                    AND `propertyInGroup` = '" . $this->groupId . $propertyId . "';";
                $this->SQL_HELPER->insert($updatePropertyDublicate);
            }
        }
    }

    private function getReportForChield() {
        $newGroupProperty = [];
        $html = '<div class="addGroupCatalogReportText">Перенносимые свойства каталога: </div>';
        foreach ($this->propertyMoveId as $value) {
            $html .= '<div class="addGroupCatalogReportText">' . $this->getPropertyName($value) . '</div>';
        }
        $html .= '<div class="addGroupCatalogReportText">1) Cвойства доступны в каталоге: </div>';
        foreach ($this->newOwner as $group) {
            $newGroupProperty[] = $group;
            $html .= '<div class="addGroupCatalogReportText">' . $this->getGroupName($group) . '</div>';
            $groupChildren = $this->helperGroup->getGroupChildren($group);
            if (!empty($groupChildren)) {
                foreach ($groupChildren as $children) {
                    if ($children != $group) {
                        $html .= '<div class="addGroupCatalogReportText">' . $this->getGroupName($children) . '</div>';
                        $newGroupProperty[] = $children;
                    }
                }
            }
        }
        $html .= '<div class="addGroupCatalogReportText"> 2) Стали недоступны для каталога: </div>';
        foreach ($this->nodeChildrenAndParent as $groupNode) {
            if (!in_array($groupNode, $newGroupProperty)) {
                $html .= '<div class="addGroupCatalogReportText">' . $this->getGroupName($groupNode) . '</div>';
            }
        }
        $html .= '<div class="addGroupCatalogReportText">3) Перенносимые свойства удалены у каталога "' . $this->getGroupName($this->groupId) . '"</div>';
        $html .= '<div class="addGroupCatalogReportText"></div>';
        $html .= $this->getButtonBack();
        return $html;
    }

    /**
     * Массив св-тв для удаления (персональные, если совпвдают с переносимым) у потомков
     * @param type $group
     */
    private function getPersonalDelete($group) {
        $this->personalDelete = [];
        $infoGroup = $this->helperGroup->getGroupInfo($group, true);
        if (!empty($infoGroup['properties']['personal']) && $infoGroup['properties']['personal'] != null) {
            foreach ($infoGroup['properties']['personal'] as $value) {
                if (in_array($value["property"], $this->propertyMoveId)) {
                    $this->dataForReport[$group][] = $value["propertyName"];
                    $this->personalDelete['propertyInGroup'][] = $value["id"];
                    $this->personalDelete['propertyId'][] = $value["property"];
                    $this->personalDelete['propertyName'][] = $value["propertyName"];
                }
            }
        } else {
            $this->personalDelete = [];
        }
    }

    /**
     * Удаление персональных св-тс, если совпадают с родителем
     * @param type $group
     */
    private function deletePersonalPropertyDublicate($group, $propertyId) {
        $updatePropertyDublicate = "UPDATE `ShopPropertiesInGroupsRanking` SET 
            `propertyInGroup` = '" . $this->newOwner . $propertyId . "'
            WHERE `group` = '" . $group . "' 
            AND `propertyInGroup` = '" . $group . $propertyId . "';";
        $this->SQL_HELPER->insert($updatePropertyDublicate);
        $deletePropertyDublicate = "DELETE FROM `ShopPropertiesInGroups` WHERE `group`='" . $group . "' AND `id` = '" . $group . $propertyId . "';";
        $this->SQL_HELPER->insert($deletePropertyDublicate);
    }

    /**
     * Упорядочить sequence
     * @param type $group
     */
    private function updateSequence($group) {
        $maxSequence = $this->getMaxSequence($group);
        if ($maxSequence != null) {
            $propertySequenceUpdate = "UPDATE `ShopPropertiesInGroups` SET `sequence` = `sequence` + " . $maxSequence . " WHERE `group` = '" . $group . "';";
            $this->SQL_HELPER->insert($propertySequenceUpdate);
            $this->SQL_HELPER->insert("SET @incr = 0;");
            $query = "UPDATE `ShopPropertiesInGroups` SET `sequence` = @incr:=@incr+1 WHERE `group` = '" . $group . "' ORDER BY `sequence` ASC;";
            $this->SQL_HELPER->insert($query);
        }
    }

    private function addNewPropertyForNewOwner() {
        $maxSequence = $this->getMaxSequence($this->newOwner);
        $sequence = $maxSequence + '1';
        foreach ($this->propertyMoveId as $id) {
            $property = "INSERT INTO `ShopPropertiesInGroups` SET ";
            $property .= "`id` = '" . $this->newOwner . $id . "', ";
            $property .= "`group` = '" . $this->newOwner . "', ";
            $property .= "`property` = '" . $id . "', ";
            $property .= "`sequence` = '" . $sequence++ . "';";
            $this->SQL_HELPER->insert($property);
        }
        $maxSequenceInRanking = $this->getMaxSequenceRanking($this->newOwner);
        $incr = $maxSequenceInRanking + 1;
        $property = '';
        foreach ($this->propertyMoveId as $property) {
            $ranking = "INSERT INTO `ShopPropertiesInGroupsRanking` SET ";
            $ranking .= "`group`='" . $this->newOwner . "', ";
            $ranking .= "`propertyInGroup`='" . $this->newOwner . $property . "', ";
            $ranking .= "`shown`= '1',";
            $ranking .= "`sequence`= '" . $incr++ . "';";
            $this->SQL_HELPER->insert($ranking);
        }
    }

}
