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
 * Description of AP_WorkingWithShopCatalog_general
 *
 * @author Olga Rjabchikova
 * @copyright © 2010-2016, CompuProjec
 * @created 25.11.2015 10:19:05
 */
class AP_WorkingWithShopCatalog_General {

    protected $html = "";
    protected $groupId;                 // хранит Id текущей группы
    protected $path;                    // хранит ин-фу о родителе(ях)
    protected $info;                    // хранит ин-фу о текущей группе
    protected $unusedPrpoperty;         // хранит ин-фу о св-ах unused
    protected $unusedPrpopertyForChild; // хранит ин-фу о св-ах Prpoperty
    protected $availableProperty;       // хранит ин-фу о св-ах available
    protected $personalPropertyNew;     // обновленные Id personal
    protected $parent;                  // хранит Id родителя 
    protected $listID1;                 // хранит Id блока1 (св-ва available)
    protected $listID2;                 // хранит Id блока2 (св-ва unused)
    protected $insertValue;
    protected $originalInsertValue;
    protected $checkAllValueErrors;
    protected $SQL_HELPER;
    protected $params;
    protected $urlHelper;
    protected $helperGroup;
    protected $interactiveListsPlugin;
    protected $nameGroup;
    protected $node;                    // УЗЕЛ потомков (их Id)
    protected $nodeChildrenAndParent;     // Id текущей и потомков             

    public function __construct($groupId) {
        $this->unusedPrpoperty = [];
        $this->availableProperty = [];
        $this->personalPropertyNew = [];
        $this->groupId = $groupId;
        global $_SQL_HELPER;
        global $_URL_PARAMS;
        $this->SQL_HELPER = $_SQL_HELPER;
        $this->params = $_URL_PARAMS['params'];
        $this->urlHelper = new UrlHelper();
        $this->helperGroup = new ShopGroupsHelper();
        $this->info = $this->helperGroup->getGroupInfo($this->groupId, true);
        $this->path = $this->helperGroup->getGroupPath($this->groupId);
        $this->node = $this->helperGroup->getGroupNodeChildren($this->groupId);
        $this->nodeChildrenAndParent = $this->helperGroup->getGroupChildren($this->groupId);
        $this->getAvailableProperty();
        $this->nameGroup = $this->getGroupName($this->groupId);
        $this->parent = $this->getParent($this->groupId);
        $this->getProperty($this->groupId);
        $this->interactiveListsPlugin = new InteractiveListsPlugin(
                'addGroupPropertyInteractiveListsPlugin', 'addGroupPropertyInteractiveListsPluginUl FerstList');
    }

    public function getHtml() {
        return $this->html;
    }

    public function get() {
        echo $this->getHtml();
    }

//    -------- Генерация элементов -------------

    /**
     * Генерация элемента св-ва
     * @param type $property
     * @param type $flag - регулирует отображение кнопок добавить/удалить для св-тв
     * @return string
     */
    public static function generationElement($property, $flag) {
        if ($flag === true) {
            $show = '<div class="addGroupDragDropListElementButton">';
            $show .= '<span class="del">X</span><span class="add">+</span>';
            $show .= '</div>';
        } else {
            $show = '';
        }
        $out = '<div class="addGroupDragDropListElement">';
        $out .= '<div class="addGroupDragDropListElementNameProperty ">';
        $out .= $property["propertyName"];
        $out .= '<input type="hidden" class="addGroupCatalogRanKingElementNamePropertyInput" name="property[]"value="' . $property["id"] . '">';
        $out .= '</div>';
        $out .= '<div class="addGroupDragDropListElementFilterAndDataType" title="Тип фильтра / Тип данных">';
        $out .= $property["filterType"] . ' / ' . $property["valueType"];
        $out .= '</div>';
        $out .= '<div class="addGroupDragDropListElementShow"  title="Отображение в фильтрах">';
        if (isset($property["shown"])) {
            $out .= InputHelper::select("addGroupDragDropListElementShowSelect[]", "addGroupDragDropListElementShowSelect", array(array('value' => "1", 'text' => "show"), array('value' => "0", 'text' => "hide")), true, $property["shown"]);
        } else {
            $out .= InputHelper::select("addGroupDragDropListElementShowSelect[]", "addGroupDragDropListElementShowSelect", array(array('value' => "1", 'text' => "show"), array('value' => "0", 'text' => "hide")), true, "1");
        }
        $out .= '</div>';
        $out .= $show;
        $out .= '</div>';
        $out .= '<div class="clear"></div>';
        return $out;
    }

    /**
     * Генерация JS
     * @param type $listID1 - идентификатор блока1 для available - св-тв
     * @param type $listID2 - идентификатор блока2 для unused - св-тв
     * @return string
     */
    protected function generationJS($listID1, $listID2) {
        $out = '<script type="text/javascript">';
        $out .= '    function addGroupCatalogAddButtonEvent() {';
        $out .= '        $( "#' . $listID2 . ' span.del" ).click(function(i,elem) {';
        $out .= '            $( "#' . $listID2 . '" ).prepend($(this).parent().parent().parent());';
        $out .= '        });';
        $out .= '        $( "#' . $listID2 . ' span.add" ).click(function(i,elem) {';
        $out .= '            $( "#' . $listID1 . '" ).append($(this).parent().parent().parent());';
        $out .= '        });';
        $out .= '        $( "#' . $listID1 . ' span.del" ).click(function(i,elem) {';
        $out .= '            $( "#' . $listID2 . '" ).prepend($(this).parent().parent().parent());';
        $out .= '        });';
        $out .= '    }';
        $out .= '    $(function() {';
        $out .= '       addGroupCatalogAddButtonEvent();';
        $out .= '    });';
        $out .= '</script>';
        return $out;
    }

    /**
     * Генерирование сообщения об ошибке 
     * @param type $message - текст сообщения
     * @return string
     */
    protected function generationMessageErrorJS($message) {
        $html = '<script type="text/javascript">';
        $html .= 'alert("' . $message . '");';
        $html .= '</script>';
        return $html;
    }

    /**
     * Генерирование отчета
     * @param type $additionally - конкретная реализация для каждого класса
     * @return string
     */
    protected function getReport($additionally, $data) {
        $html = '<div class="addGroupCatalogReportWraper">';
        $html .= '<div class="addGroupShopCatalogHead">' . $this->getTextPath() . '</div>';
        $html .= $additionally;
        $html .= $this->generationPropertyForReport($data);
        $html .= '<div class="addGroupCatalogReportButton">';
        $html .= $this->getButtonBack();
        $html .= $this->getButtonEdit();
        $html .= '</div>';
        $html .= '</div>';
        return $html;
    }

    protected function getTextPath() {
        $path = "";
        if ($this->path != null) {
            foreach ($this->path as $parent) {
                if ($this->path != "ROOT") {
                    $path .= $this->getGroupName($parent) . " >> ";
                } else {
                    $path = "Корневой каталог";
                }
            }
        } else {
            $path = "Корневой каталог";
        }
        return $path;
    }

    /**
     * Генерирование кнопки
     * @return string
     */
    protected function getButtonBack() {
        $params[0] = $this->params[0];
        $params[1] = $this->params[1];
        $params[2] = $this->params[2];
        $params[3] = $this->params[3];
        $html = '<a href="' . $this->urlHelper->chengeParams($params) . '"><input type="button" class="addGroupCatalogReportButtonBack" id="addGroupCatalogReportButtonBack" value="Назад"></a>';
        return $html;
    }

    /**
     * Генерирование кнопки
     * @return string
     */
    protected function getButtonEdit() {
        $html = '';
        return $html;
    }

    private function generationPropertyForReport($data) {
        $note = '';
        if (!empty($data)) {
            $html = '<div class="addGroupCatalogReportText">Свойства каталога:</div>';
            $html .= '<ul>';
            foreach ($data as $property) {
                if (in_array($property['property'], $this->personalPropertyNew)) {
                    $emphasisPropertyPersonal = ' class="emphasisPropertyPersonal"';
                    $note = '<div class="noteGroupShopCatalog">Другим цветом выделены персональные св-ва каталога</div>';
                } else {
                    $emphasisPropertyPersonal = '';
                }
                $html .= '<li ' . $emphasisPropertyPersonal . '>' . $property["propertyName"] . '</li>';
            }
            $html .= '</ul>';
        } else {
            $html = '<div class="addGroupCatalogReportText">Свойства каталога не определены</div>';
        }
        $html .= $note;
        return $html;
    }

//    -------- Получение данных  -------------

    /**
     * Все Available св-ва
     */
    protected function getAvailableProperty() {
        $i = 1;
        if ($this->info['properties']['available'] != null) {
            foreach ($this->info['properties']['available'] as $value) {
                $this->availableProperty[$i]['propertyName'] = $value['propertyName'];
                $this->availableProperty[$i]['filterType'] = $value['filterType'];
                $this->availableProperty[$i]['valueType'] = $value['valueType'];
                $this->availableProperty[$i]['id'] = $value['property'];
                $this->availableProperty[$i]['shown'] = $value['shown'];
                $this->availableProperty[$i++]['oneOfAllValues'] = $value['oneOfAllValues'];
            }
        }
    }

    /**
     * Обновление данных по текущей группе
     */
    protected function dataUpdate() {
        $this->helperGroup->update();
        $this->info = $this->helperGroup->getGroupInfo($this->groupId, true);
        $this->path = $this->helperGroup->getGroupPath($this->groupId);
    }

    /**
     * Формирование массива св-тв, доступных для добавления
     * @param type $groupId - текущая группа
     */
    protected function getProperty($groupId) {
        if ($groupId !== "ROOT") {
            $this->unusedPrpoperty = $this->sortPropertyArray($this->info['properties']['unused']);
            $this->unusedPrpopertyForChild = $this->sortPropertyArray($this->info['properties']['unusedForChild']);
        } else {
            $query = "SELECT * FROM `ShopProperties` ORDER BY `propertyName` ASC;";
            $this->unusedPrpoperty = $this->unusedPrpopertyForChild = $this->SQL_HELPER->select($query);
        }
    }

    /**
     * Возвращает название группы
     * @param type $id
     * @return type
     */
    protected function getGroupName($id) {
        $query = "SELECT `groupName` FROM `ShopGroups` WHERE `id` = '" . $id . "'";
        $name = $this->SQL_HELPER->select($query, 1);
        return $name['groupName'];
    }

    /**
     * Провеврка на дубликат
     * @return type 
     */
    protected function checkDuplicateGroupName() {
        $result = [];
        if (isset($_POST['groupName']) && $_POST['groupName'] != null && $_POST['groupName'] != "") {
            $query = "SELECT `groupName` FROM `ShopGroups` WHERE `groupName`='" . $_POST['groupName'] . "';";
            $result = $this->SQL_HELPER->select($query, 1);
        }
        return $result == null;
    }

    protected function checkGroupId() {
        $query = "SELECT * FROM `ShopGroups` WHERE `id`='" . $this->groupId . "';";
        $result = $this->SQL_HELPER->select($query, 1);
        return ((count($result) > 0) ? true : false);
    }

    /**
     * MAX sequence из `ShopPropertiesInGroupsRanking`
     * @param type $group - id группы
     * @return type
     */
    protected function getMaxSequenceRanking($group) {
        $query = "SELECT MAX(`sequence`) as maximum 
                    FROM `ShopPropertiesInGroupsRanking` 
                    WHERE `group` = '" . $group . "';";
        $result = $this->SQL_HELPER->select($query);
        if ($result != null) {
            $maxSequence = $result[0]['maximum'];
        } else {
            $maxSequence = 1;
        }
        return $maxSequence;
    }

    /**
     * MAX sequence из `ShopPropertiesInGroups` для записи нового св-ва
     * @param type $id - id группы
     * @return type
     */
    protected function getMaxSequence($id) {
        $query = "SELECT MAX(`sequence`) as maximum 
                    FROM `ShopPropertiesInGroups` 
                    WHERE `group` = '" . $id . "';";
        $result = $this->SQL_HELPER->select($query);
        if ($result != null) {
            $maxSequence = $result[0]['maximum'];
        } else {
            $maxSequence = 1;
        }
        return $maxSequence;
    }

    private function getParent($id) {
        $query = "SELECT `parentGroup` FROM `ShopGroupsHierarchy` WHERE `group` = '" . $id . "'";
        $result = $this->SQL_HELPER->select($query, 1);
        return (!empty($result['parentGroup']) ? $result['parentGroup'] : null);
    }

    /**
     * Сортирует массив св-тв по алфавиту
     * @param type $arrayPrpoperty
     * @return type
     */
    private function sortPropertyArray($arrayPrpoperty) {
        $arraySortPrpoperty = [];
        $i = 0;
        if (is_array($arrayPrpoperty) && !empty($arrayPrpoperty)) {
            foreach ($arrayPrpoperty as $value) {
                $arraySortPrpoperty[$i]['propertyName'] = $value['propertyName'];
                $arraySortPrpoperty[$i]['filterType'] = $value['filterType'];
                $arraySortPrpoperty[$i]['valueType'] = $value['valueType'];
                $arraySortPrpoperty[$i]['id'] = $value['id'];
                $arraySortPrpoperty[$i++]['oneOfAllValues'] = $value['oneOfAllValues'];
            }
        }
        sort($arraySortPrpoperty);
        return $arraySortPrpoperty;
    }

    // ------------------------- Добавление родительских св-тв потомкам  ------------------
    /**
     * Добавление св-ва у потомков
     */
    protected function addChildrenProperty($parent, $group) {
        $newProperty = $this->getNewPropertyChildren($parent, $group);
        $shiftStep = count($newProperty);
        $query = "select 
            max(`sequence`) as maxSequence
            FROM `ShopPropertiesInGroupsRanking`
            WHERE `group` = '" . $group . "'
            AND `propertyInGroup` IN (
                Select `id` FROM `ShopPropertiesInGroups` WHERE `group` = '" . $parent . "'
            );";
        $rezult = $this->SQL_HELPER->select($query, 1);
        $maxSequence = $this->getMaxSequenceRanking($group);
        if (isset($rezult['maxSequence']) && $rezult['maxSequence'] != "" && $rezult['maxSequence'] != null) {
            $incr = $rezult['maxSequence'] + 1;
            $query = "UPDATE `ShopPropertiesInGroupsRanking` "
                    . "SET `sequence` = `sequence` + " . ($maxSequence + $shiftStep + 2) . " "
                    . "WHERE `sequence` > '" . $rezult['maxSequence'] . "' AND `group` = '" . $group . "';";
            $this->SQL_HELPER->insert($query);
        } else {
            $incr = $maxSequence + 1;
        }
        foreach ($newProperty as $id) {
            $ranking = "INSERT INTO `ShopPropertiesInGroupsRanking` SET ";
            $ranking .= "`group`='" . $group . "', ";
            $ranking .= "`propertyInGroup`='" . $id["id"] . "', ";
            $ranking .= "`shown`='1',";
            $ranking .= "`sequence`='" . ($incr++) . "'; ";
            $this->SQL_HELPER->insert($ranking);
        }
        $this->SQL_HELPER->insert("SET @incr = 0;");
        $query = "UPDATE `ShopPropertiesInGroupsRanking` SET `sequence` = @incr:=@incr+1 WHERE `group` = '" . $group . "' ORDER BY `sequence` ASC;";
        $this->SQL_HELPER->insert($query);
    }

    /**
     * Получение данных о новых св-ах для потмков
     * @param type $parent - id
     * @param type $children - id
     * @return array
     */
    protected function getNewPropertyChildren($parent, $children) {
        $query = "SELECT `id`
                    FROM `ShopPropertiesInGroups`
                    WHERE `group` = '" . $parent . "'
                    AND `id`
                    NOT IN (
                        SELECT `propertyInGroup` 
                        FROM `ShopPropertiesInGroupsRanking`
                        WHERE `group` = '" . $children . "'
                    )
                    ORDER BY `sequence` ASC;";
        $newProperty = $this->SQL_HELPER->select($query);
        return $newProperty;
    }

}
