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
 * Description of AP_WorkingWithShopCatalog_ImportMovingGroup
 *
 * @author Olga Rjabchikova
 * @copyright © 2010-2016, CompuProjec
 * @created 30.12.2015 10:49:26
 */
class AP_WorkingWithShopCatalog_ImportMovingGroup extends AP_WorkingWithShopCatalog_General {

    private $newGroupId;               // Id - куда переносят
    private $infoNewGroupId;
    private $parentOldDeleteId;
    private $parentNewInsert;
    private $personalDelete;
    private $nodeChildrenGroupId;

    public function __construct($groupId, $newGroupId) {
        parent::__construct($groupId);
        $this->html = "";
        $this->parentOldDeleteId = [];
        $this->parentNewInsert = [];
        $this->newGroupId = $newGroupId;
        $this->infoNewGroupId = $this->helperGroup->getGroupInfo($this->newGroupId);
        $this->nodeChildrenGroupId = $this->helperGroup->getGroupNodeChildren($this->newGroupId);
        $this->getParentNewInsert();
        $this->getPersonalDelete($this->groupId);
        $this->moving();
    }

    /**
     * Св-ва нового родителя
     */
    private function getParentNewInsert() {
        $this->parentNewInsert = [];
        if (!empty($this->infoNewGroupId['properties']['available']) && $this->infoNewGroupId['properties']['available'] != null) {
            foreach ($this->infoNewGroupId['properties']['available'] as $value) {
                $this->parentNewInsert['propertyInGroup'][] = $value["id"];
                $this->parentNewInsert['propertyId'][] = $value["property"];
                $this->parentNewInsert['propertyName'][] = $value["propertyName"];
            }
        }
    }

    /**
     * Массив св-тв для удаления - бывшего родителя
     */
    private function getParentOldDelete() {
        $this->parentOldDeleteId = [];
        $infoGroup = $this->helperGroup->getGroupInfo($this->parent);
        if (!empty($infoGroup['properties']['available']) && $infoGroup['properties']['available'] != null) {
            foreach ($infoGroup['properties']['available'] as $value) {
                $this->parentOldDeleteId['propertyInGroup'][] = $value["id"];
                $this->parentOldDeleteId['propertyId'][] = $value["property"];
                $this->parentOldDeleteId['propertyName'][] = $value["propertyName"];
            }
        }
    }

    /**
     * Массив св-тв для удаления - персональные, если совпвдают с новым родителем
     * @param type $group
     */
    private function getPersonalDelete($group) {
        $this->personalDelete = [];
        $infoGroup = $this->helperGroup->getGroupInfo($group);
        if (!empty($infoGroup['properties']['personal']) && $infoGroup['properties']['personal'] != null && isset($this->parentNewInsert["propertyId"])) {
            foreach ($infoGroup['properties']['personal'] as $value) {
                if (in_array($value["property"], $this->parentNewInsert["propertyId"])) {
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
     * Массив св-тв для удаления (персональные, если совпвдают с новым родителем, + бывшего родителя)
     *  ( для отчета)
     * @param type $group
     * @return type
     */
    private function getPropertyForDeleteCarentGroup($group) {
        $this->getPersonalDelete($group);
        $this->getParentOldDelete();
        (isset($this->personalDelete['propertyName'])) ? $this->personalDelete['propertyName'] : $this->personalDelete['propertyName'] = [];
        (isset($this->parentOldDeleteId['propertyName'])) ? $this->parentOldDeleteId['propertyName'] : $this->parentOldDeleteId['propertyName'] = [];
        $property = array_merge($this->personalDelete['propertyName'], $this->parentOldDeleteId['propertyName']);
        return $property;
    }

    /**
     * Удаление
     * @param type $yes
     */
    public function moving() {
        if ($this->groupId != $this->newGroupId && !in_array($this->groupId, $this->info['children'])) {
            $this->html = $this->generationUI($this->provisionalReport(), true);
            if (isset($this->params[7])) {
                switch ($this->params[7]) {
                    case 'moveCatalog':
                        $this->moveCatalog($this->groupId);
                        $this->exchangeParentForChildren();
                        // у детей удалить св-ва переносимой группы ShopPropertiesInGroupsRanking
                        $this->deleteParentOldForChildren();
                        break;
                    case 'moveStructure':
                        $this->moveStructure();
                        break;
                    default:
                        $this->html = 'неверная URL';
                        break;
                }
            }
        } else {
            $content = '<div class="addGroupCatalogReportText">Перемещение каталога внутрь вложенных каталогов или самого себя недопустимо</div>';
            $this->html = $this->generationUI($content);
        }
    }

    /**
     * Перенести структуру
     */
    private function moveStructure() {
        if (isset($this->nodeChildrenAndParent) && !empty($this->nodeChildrenAndParent) && $this->nodeChildrenAndParent != null) {
            // удалить св-ва бывшего родителя ShopPropertiesInGroupsRanking
            foreach ($this->nodeChildrenAndParent as $group) {
                $this->moveCatalog($group);
            }
        }
    }

    /**
     * Перенести каталог
     * @param type $group
     */
    private function moveCatalog($group) {
        // сменить родителя
        $this->exchangeParentForGroupId();
        // если есть parentNew
        $this->getParentNewInsert();
        // если есть personal, совпадающий с newGroupId
        $this->getPersonalDelete($group);
        // если есть parentOld
        if ($this->parent != null) {
            $this->getParentOldDelete();
        }
        // удалить из `ShopPropertiesInGroups` (рersonalDelete)
        $this->deletePersonal($group);
        // удалить из `ShopPropertiesInGroupsRanking` (рersonalDelete + рarentOldDelete)
        $this->deleteParentOld($group);
        // записать в `ShopPropertiesInGroupsRanking` (рarentNewInsert)
        $this->insertParentNew($group);
        // обновить данные
        $this->dataUpdate();
        $this->getPersonalDelete($group);
        // вывести отчет
        $this->html = $this->getReport($this->getReportAdditionally(), $this->info['properties']['available']);
    }

    private function getDataPersonalPropertyNew() {
        foreach ($this->info['properties']['personal'] as $value) {
            $this->personalPropertyNew[] = $value["property"];
        }
    }

    private function getReportAdditionally() {
        $this->getDataPersonalPropertyNew();
        return( '<div class="addGroupCatalogReportText">Каталог "' . $this->getGroupName($this->groupId) . '" успешно перенесен</div>');
    }

    /**
     * Удаление персональных св-тс, если совпадают с родителем
     * @param type $group
     */
    private function deletePersonal($group) {
        if (isset($this->personalDelete['propertyInGroup'])) {
            foreach ($this->personalDelete['propertyInGroup'] as $propertyId) {
                $propertyDelete = "DELETE FROM `ShopPropertiesInGroups` WHERE `group`='" . $group . "' AND `id` = '" . $propertyId . "';";
                $this->SQL_HELPER->insert($propertyDelete);
            }
            $maxSequence = $this->getMaxSequence($group);
            if ($maxSequence != null) {
                $propertySequenceUpdate = "UPDATE `ShopPropertiesInGroups` SET `sequence` = `sequence` + " . $maxSequence . " WHERE `group` = '" . $group . "';";
                $this->SQL_HELPER->insert($propertySequenceUpdate);
                $this->SQL_HELPER->insert("SET @incr = 0;");
                $query = "UPDATE `ShopPropertiesInGroups` SET `sequence` = @incr:=@incr+1 WHERE `group` = '" . $group . "' ORDER BY `sequence` ASC;";
                $this->SQL_HELPER->insert($query);
            }
        }
    }

    /**
     * Удаление персональных, если совпвдают с новым родителем, + бывшего родителя
     * @param type $group
     */
    private function deleteParentOld($group) {
        (isset($this->personalDelete['propertyInGroup'])) ? $this->personalDelete['propertyInGroup'] : $this->personalDelete['propertyInGroup'] = [];
        (isset($this->parentOldDeleteId['propertyInGroup'])) ? $this->parentOldDeleteId['propertyInGroup'] : $this->parentOldDeleteId['propertyInGroup'] = [];
        $propertyForDelete = array_merge($this->personalDelete['propertyInGroup'], $this->parentOldDeleteId['propertyInGroup']);
        foreach ($propertyForDelete as $id) {
            $queryDelete = "DELETE FROM `ShopPropertiesInGroupsRanking` WHERE `propertyInGroup`='" . $id . "' AND `group`='" . $group . "' ;";
            $this->SQL_HELPER->insert($queryDelete);
        }
    }

    /**
     * Удаление св-тв бывшего родителя у потомков
     */
    private function deleteParentOldForChildren() {
        if (isset($this->node) && !empty($this->node) && $this->node != null && !empty($this->info['properties']['personal'])) {
            foreach ($this->node as $child) {
                foreach ($this->info['properties']['personal'] as $id) {
                    $queryDelete = "DELETE FROM `ShopPropertiesInGroupsRanking` WHERE `propertyInGroup`='" . $id['id'] . "' AND `group`='" . $child . "' ;";
                    $this->SQL_HELPER->insert($queryDelete);
                }
            }
        }
    }

    /**
     * Занесение св-тв нового родителя
     * @param type $group
     */
    private function insertParentNew($group) {
        $maxSequence = $this->getMaxSequenceRanking($group);
        $propertySequenceUpdate = "UPDATE `ShopPropertiesInGroupsRanking` SET `sequence` = `sequence` + " . ($maxSequence + 2) . " WHERE `group` = '" . $group . "';";
        $this->SQL_HELPER->insert($propertySequenceUpdate);
        $incr = 1;
        $property = '';
        if ($this->newGroupId != 'ROOT') {
            foreach ($this->infoNewGroupId['properties']['available'] as $property) {
                $ranking = "INSERT INTO `ShopPropertiesInGroupsRanking` SET ";
                $ranking .= "`group`='" . $group . "', ";
                $ranking .= "`propertyInGroup`='" . $property['id'] . "', ";
                $ranking .= "`shown`= '1',";
                $ranking .= "`sequence`= '" . $incr++ . "';";
                $this->SQL_HELPER->insert($ranking);
            }
            $this->SQL_HELPER->insert("SET @incr = 0;");
            $query = "UPDATE `ShopPropertiesInGroupsRanking` SET `sequence` = @incr:=@incr+1 WHERE `group` = '" . $group . "' ORDER BY `sequence` ASC;";
            $this->SQL_HELPER->insert($query);
        }
    }

    /**
     * Сменить родителя у детей (вложенные привязать к родителю перемещаемого каталога)
     */
    private function exchangeParentForChildren() {
        if (isset($this->node) && !empty($this->node)) {
            foreach ($this->node as $child) {
                $query = "UPDATE `ShopGroupsHierarchy` SET ";
                $query .= "`group` = '" . $child . "', ";
                $query .= "`parentGroup` = '" . $this->parent . "'";
                $query .= " WHERE `parentGroup` = '" . $this->groupId . "' AND `group` = '" . $child . "';";
                $this->SQL_HELPER->insert($query);
            }
        }
    }

    /**
     * Сменить родителя у перемещаемого каталога
     */
    private function exchangeParentForGroupId() {
        $query = '';
        if ($this->newGroupId != 'ROOT') {
            if ($this->parent != null) {
                $query .= "UPDATE `ShopGroupsHierarchy` SET ";
                $query .= "`group` = '" . $this->groupId . "', ";
                $query .= "`parentGroup` = '" . $this->newGroupId . "'";
                $query .= " WHERE `group` = '" . $this->groupId . "';";
            } else {
                if ($this->newGroupId != 'ROOT') {
                    $query .= "INSERT INTO  `ShopGroupsHierarchy` SET ";
                    $query .= "`group` = '" . $this->groupId . "', ";
                    $query .= "`parentGroup` = '" . $this->newGroupId . "';";
                }
            }
        } else {
            $query .= "DELETE FROM `ShopGroupsHierarchy` WHERE `group` = '" . $this->groupId . "' AND `parentGroup` = '" . $this->parent . "';";
        }
        $this->SQL_HELPER->insert($query);
    }

    /**
     * Генерация отчета
     * @param type $content
     * @param type $button
     * @return string
     */
    private function generationUI($content, $button = false) {
        $html = '<div class="addGroupCatalogReportWraper">';
        $html .= '<div class="addGroupShopCatalogHead">Перемещение "' . $this->nameGroup . '" в каталог "' . $this->getGroupName($this->newGroupId) . '"</div>';
        $html .= $content;
        $html .= '<center>';
        if ($button == true) {
            $html .= $this->generationButtonForDelete();
        } else {
            $html .= $this->getButtonBack();
        }
        $html .= '</center>';
        $html .= '</div>';
        return $html;
    }

    private function provisionalReport() {
        $propertyForDelete = $this->getPropertyForDeleteCarentGroup($this->groupId);
        $html = '<table class="addGroupCatalogGroupPropertyWrapper">';
        $html .= '<tr>';
        $html .= '<th>Текущие св-ва</th>';
        $html .= '<th>Удаляемые св-ва</th>';
        $html .= '<th>Приобретаемые св-ва</th>';
        $html .= '</tr>';
        $html .= '<tr>';
        $html .= '<td>' . $this->generationDataProperty($this->info['properties']['available'], true) . '</td>';
        $html .= '<td>' . $this->generationDataProperty($propertyForDelete) . '</td>';
        $html .= '<td>' . $this->generationDataProperty($this->infoNewGroupId['properties']['available']) . '</td>';
        $html .= '</tr>';
        $html .= '</table>';
        return $html;
    }

    private function generationDataProperty($data, $flag = false) {
        if ($this->info['properties']['personal']) {
            foreach ($this->info['properties']['personal'] as $value) {
                $this->personalPropertyNew[] = $value["id"];
            }
        }
        $html = '';
        $note = '';
        $emphasisPropertyPersonal = '';
        if ($data != null) {
            $html .= '<ul>';
            foreach ($data as $property) {
                if ($flag) {
                    if (in_array($property['id'], $this->personalPropertyNew)) {
                        $emphasisPropertyPersonal = ' class="emphasisPropertyPersonal"';
                        $note = '<div class="noteGroupShopCatalog">Другим цветом выделены персональные св-ва каталога</div>';
                    } else {
                        $emphasisPropertyPersonal = '';
                    }
                }
                (isset($property['propertyName'])) ? $propertyName = $property['propertyName'] : $propertyName = $property;
                $html .= '<li ' . $emphasisPropertyPersonal . '>' . $propertyName . '</li>';
            }
            $html .= '</ul>';
            $html .= $note;
        } else {
            $html .= '<div class="addGroupCatalogReportText">Свойства отсутствуют</div>';
        }
        return $html;
    }

    /**
     * Генерация кнопок для отчета
     * @return string
     */
    private function generationButtonForDelete() {
        $params1[0] = $params2[0] = $params3[0] = $this->params[0];
        $params1[1] = $params2[1] = $params3[1] = $this->params[1];
        $params1[2] = $params2[2] = $params3[2] = $this->params[2];
        $params1[3] = $params2[3] = $params3[3] = $this->params[3];
        $params2[4] = $params3[4] = $this->params[4];
        $params2[5] = $params3[5] = $this->params[5];
        $params2[6] = $params3[6] = $this->params[6];
        $params2[7] = 'moveCatalog';
        $params3[7] = 'moveStructure';
        $noUrl = $this->urlHelper->chengeParams($params1);
        $yesUrlMoveCatalog = $this->urlHelper->chengeParams($params2);
        $yesMoveStructure = $this->urlHelper->chengeParams($params3);
        $html = '<a href="' . $yesUrlMoveCatalog . '"><input class="AP_Submit" type="button" value="Перенести каталог" '
                . 'title="Перенесение каталога (без вложенных каталогов)"></a>';
        $html .= '<a href="' . $yesMoveStructure . '"><input class="AP_Submit" type="button" value="Перенести структуру" '
                . 'title="Перенесение каталога с содержимым"></a>';
        $html .= '<a href="' . $noUrl . '"><input class="AP_Submit" type="button" value="Отменить перенос"></a>';
        return $html;
    }

}
