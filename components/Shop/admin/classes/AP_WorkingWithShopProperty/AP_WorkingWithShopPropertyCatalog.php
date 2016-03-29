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
 * Description of AP_WorkingWithShopPropertyCatalog
 *
 * @author Olga Rjabchikova
 * @copyright © 2010-2016, CompuProjec
 * @created 06.01.2016 17:26:35
 */
class AP_WorkingWithShopPropertyCatalog {

    private $html;
    private $urlHelper;
    private $params = [];
    private $SQL_HELPER;
    private $allProperty;               // все св-ва из базы
    private $allPropertySort;           // перезаписанные (в формате $_POST) все св-ва из базы
    private $element;                   // ссылка на класс генерации элемента таблицы св-тв
    private $dataPost;                  // $_POST-данные
    private $dataPostNew;               // непосредственно изменения
    private $dataAdd;                   // создаваемые
    private $dataEdit;                  // редактируемые
    private $dataDelete;                // удаляемые
    private $dataAddForReport;
    private $dataEditForReport;
    private $dataDeleteForReport;
    private $insertSQL;                 // предзапросы с изменениями
    private $dataEditTitle;             // неизмененные значения св-тв

    public function __construct() {
        global $_URL_PARAMS;
        global $_SQL_HELPER;
        $this->params = $_URL_PARAMS['params'];
        $this->urlHelper = new UrlHelper();
        $this->SQL_HELPER = $_SQL_HELPER;
        $this->element = new GenerationFieldForProperty();
    }

    public function getHtml() {
        $this->generationUI();
        $this->getAction();
        return $this->html;
    }

    private function generationUI() {
        $this->getAllProperty();
        $this->html = $this->generationJS();
        $this->html .= '<div class="ShopPropertyCatalog">';
        $this->html .= '<div class="ShopPropertyCatalogTopBlock">';
        $this->html .= '<div class="ShopPropertyCatalogTopBlockSearch">Искать по названию';
        $this->html .= '</div>';
        $this->html .= '<div class="ShopPropertyCatalogTopBlockAddProperty">';
        $this->html .= '<div class="ShopPropertyCatalogButtonAdd">Создать новое свойство</div>';
        $this->html .= '</div>';
        $this->html .= '</div>'; // ShopPropertyCatalogTopBlock
        $this->html .= '<div class="ShopPropertyCatalogMainBlock">';
        $this->html .= '<div class="addGroupCatalogNewPropertyWrapper">';
        $this->html .= '<div class="addGroupCatalogNewProperty">';
        $this->html .= '<form class="AP_FormShopAddPropertyCatalog" name="AP_FormShopAddPropertyCatalog" action="' . $this->urlHelper->getThisPage() . '" method="POST" accept - charset="UTF-8">';
        $this->html .= '<div class="addGroupCatalogNewPropertyButton">';
        $this->html .= '<input class="AP_ShopPropertyCatalogButton" type="submit" name="AP_ShopPropertyCatalogButtonTop" id="AP_ShopPropertyCatalogButton" value="Изменить">';
        $this->html .= '</div>';
        $this->html .= '<table class="ShopPropertyCatalogTable">';
        $this->html .= $this->generationHeaderTable();
        if (!empty($this->allProperty)) {
            foreach ($this->allProperty as $property) {
                $this->element->getBlockId();
                $this->html .= $this->element->getElementTable($property);
            }
        } else {
            $this->html .= 'Свойства не определены';
            $this->html .= $this->element->getElementTable();
        }
        $this->html .= '</table>';
        $this->html .= '<center>';
        $this->html .= '<div class="addGroupCatalogNewPropertyButton">';
        $this->html .= '<input class="AP_ShopPropertyCatalogButton" type="submit" name="AP_ShopPropertyCatalogButtonBottom" id="AP_ShopPropertyCatalogButton" value="Изменить">';
        $this->html .= '</div>';
        $this->html .= '</center>';
        $this->html .= '</form>';
        $this->html .= '<div class="clear"></div>';
        $this->html .= '</div>'; // addGroupCatalogNewProperty
        $this->html .= '</div>'; // addGroupCatalogNewPropertyWrapper
        $this->html .= '</div>'; // ShopPropertyCatalogMainBlock

        $this->html .= '<div class="ShopPropertyCatalogBottomBlock">';
//        $this->html .= '<div class="ShopPropertyCatalogTopBlockAddProperty">';
//        $this->html .= '<div class="ShopPropertyCatalogButtonAdd">Создать новое свойство</div>';
//        $this->html .= '</div>';
        $this->html .= '</div>'; // ShopPropertyCatalogButtomBlock

        $this->html .= '</div>'; //ShopPropertyCatalog
    }

    private function generationHeaderTable() {
        $html = '<tr class="ShopPropertyCatalogHeaderTable">';
        $html .= '<th colspan="2">Название</th>';
        $html .= '<th>Тип фильтра</th>';
        $html .= '<th>Тип данных</th>';
        $html .= '<th>Единица измерения</th>';
        $html .= '<th title="">Один из</th>';
        $html .= '</tr>';
        return $html;
    }

    private function generationJS() {
        $html = '<script type="text/javascript">';
        $html .= '  jQuery(document).ready(function() {';

        // add
        $html .= '      $(".ShopPropertyCatalogButtonAdd").click(function() {';
        $html .= '          addNewFieldProperty();';
        $html .= '      });';

        // delete  step1      
        $html .= '    function ShopPropertyCatalogButtonDelEvent() {';
        $html .= '      $(".ShopPropertyCatalogButtonDel").click(function() {';
        $html .= '          $(this).parent().parent().remove();';
        $html .= '      });';
        $html .= '    }';

        $html .= '    $(function() {';
        $html .= '       ShopPropertyCatalogButtonDelEvent();';
        $html .= '    });';

        // delete  step2     addGroupCatalogNewPropertyNameInput propertyName $(t).first().next()
        $html .= '      $(".ShopPropertyCatalogButtonDeleteStepSecond").click(function() {';
        $html .= '          var idBlock = $(this).parent().parent().attr("id");';
        $html .= '          var nameCansel = $("#" + idBlock + " .addGroupCatalogNewPropertyNameInput").attr("propertyName");';
        $html .= '          var isDelete = confirm("Не применять изменение для свойства \"" + nameCansel + " \" ");';
        $html .= '          if (isDelete) {';
        $html .= '              $(this).parent().parent().remove();';
        $html .= '          } ';
        $html .= '      });';

        // addNewFieldProperty()
        $html .= '      function addNewFieldProperty() {';
        $html .= '          $.ajax({';
        $html .= '              type: "POST",';
        $html .= '              url: "./components/Shop/admin/script/shopAddNewFieldProperty.php",';
        $html .= '              cache: false,';
        $html .= '              success: function(result) {';
        $html .= '                  $(".ShopPropertyCatalogHeaderTable").after(result);';
        $html .= '                  ShopPropertyCatalogButtonDelEvent();';
        $html .= '              }';
        $html .= '          });';
        $html .= '      };';

        $html .= '  });';
        $html .= '</script>';
        return $html;
    }

    private function getAllProperty() {
        $this->allProperty = [];
        $query = "SELECT 
            SHPR.`id`, 
            SHPR.`propertyName`, 
            SHPR.`filterType`, 
            SHPR.`valueType`, 
            SHPR.`oneOfAllValues`, 
            SHPRM.`measure`
            FROM 
                (SELECT * FROM `ShopPropertiesMeasure`) AS SHPRM
            RIGHT JOIN `ShopProperties` AS SHPR
            ON SHPRM.`property` = SHPR.`id`
            ORDER BY SHPR.`propertyName` ASC;";
        $this->allProperty = $this->SQL_HELPER->select($query);
    }

    public function getAction() {
        if (isset($_POST)) {
            $this->dataPost = $_POST;
            if (isset($this->dataPost['AP_ShopPropertyCatalogButtonTop']) || isset($this->dataPost['AP_ShopPropertyCatalogButtonBottom'])) {
                $this->updateStepFirst();
            } else {
                $this->applyUpdate();
            }
        }
    }

// -------------- Шаг 1 (получение данных для изменений) -------------------
    private function updateStepFirst() {
        $this->getAllValue();
        if ($this->checkAllValue()) {
            $this->insertPrepare();
            $this->getReport();
//            $this->html = $this->generationActionJS();
        } else {
            if (!empty($this->checkAllValueErrors)) {
                foreach ($this->checkAllValueErrors as $CVerror) {
                    $this->html .= $this->generationMessageErrorJS($CVerror);
                }
            }
        }
    }

    private function generationMessageErrorJS($message) {
        $html = '<script type="text/javascript">';
        $html .= 'alert("' . $message . '");';
        $html .= '</script>';
        return $html;
    }

    // ----------- получение данных ---------------
    private function getAllValue() {
        $this->getAllPropertySort();
        $this->getDataPostNew();
        $this->getDataAddAndEdit();
        $this->getDataDelete();
    }

    /**
     * Пересортировка массива св-тв для дальнейшего использования
     */
    private function getAllPropertySort() {
        $this->allPropertySort = [];
        foreach ($this->allProperty as $value) {
            $this->allPropertySort['propertyName'][$value['id']] = $value['propertyName'];
            $this->allPropertySort['filterType'][$value['id']] = $value['filterType'];
            $this->allPropertySort['valueType'][$value['id']] = $value['valueType'];
            $this->allPropertySort['oneOfAllValues'][$value['id']] = $value['oneOfAllValues'];
            $this->allPropertySort['measure'][$value['id']] = $value['measure'];
        }
    }

    /**
     * Получение непосредственно изменений в св-ах
     */
    private function getDataPostNew() {
        foreach ($this->dataPost as $post => $propertyEdit) {
            foreach ($this->allPropertySort as $propertys => $property) {
                if ($post == $propertys) {
                    $this->dataPostNew[$post] = array_diff_assoc($propertyEdit, $property);
                }
            }
        }
    }

    /**
     * Получение св-тв для создания и изменений значений св-тв для редактирования
     */
    private function getDataAddAndEdit() {
        foreach ($this->dataPostNew as $post => $propertyAdd) {
            foreach ($this->allPropertySort as $properties => $property) {
                if ($post == $properties) {
                    $this->dataAdd[$post] = array_diff_key($propertyAdd, $property);
                    $this->dataEdit[$post] = array_diff_key($this->dataPostNew[$post], $this->dataAdd[$post]);
                }
            }
        }
    }

    /**
     * Получение св-тв для удаления
     */
    private function getDataDelete() {
        $data['propertyName'] = array_diff_assoc($this->allPropertySort['propertyName'], $this->dataPost['propertyName']);
        $this->dataDelete['propertyName'] = array_diff_key($data['propertyName'], $this->dataPostNew['propertyName']);
    }

    // ----------------- проверка данных ------------------------
    private function checkAllValue() {
        $error = false;
        if (isset($this->dataAdd['propertyName']) && !empty($this->dataAdd['propertyName'])) {
            foreach ($this->dataAdd['propertyName'] as $value) {
                if ($value != "" && $value != null) {
//                    if (!preg_match("/[А-Яа-яA-Za-z0-9][^@#$%&*]{1,50}/", InputValueHelper::getMysqlText($value))) {
//                        $error = true;
//                        $this->checkAllValueErrors[] = "Разрешены латинские буквы, кирилические буквы, цифры";
//                    }
                    if (!$this->checkDuplicatePropertyName($value)) {
                        $error = true;
                        $this->checkAllValueErrors[] = '\"' . $value . '\" - такое название свойства уже используется. Выберите другое.';
                    }
                } else {
                    $error = true;
                    $this->checkAllValueErrors[] = "Название свойства - обязательное поле";
                }
            }
        }
        if (isset($this->dataEdit['propertyName']) && !empty($this->dataEdit['propertyName'])) {
            foreach ($this->dataEdit['propertyName'] as $value) {
                if ($value != "" && $value != null) {
//                    if (!preg_match("/[А-Яа-яA-Za-z0-9][^@#$%&*]{1,50}/", InputValueHelper::getMysqlText($value))) {
//                        $error = true;
//                        $this->checkAllValueErrors[] = "Разрешены латинские буквы, кирилические буквы, цифры";
//                    }
                    if (!$this->checkDuplicatePropertyName($value)) {
                        $error = true;
                        $this->checkAllValueErrors[] = '"' . $value . '" - такое название свойства уже используется. Выберите другое.';
                    }
                } else {
                    $error = true;
                    $this->checkAllValueErrors[] = "Название свойства - обязательное поле";
                }
            }
        }
        return !$error;
    }

    private function checkDuplicatePropertyName($propertyName) {
        $query = "SELECT `propertyName` FROM `ShopProperties` WHERE `propertyName`='" . $propertyName . "';";
        $result = $this->SQL_HELPER->select($query, 1);
        return $result == null;
    }

// -------------- Шаг 2 (отчет) ------------------------
    // ---------------- подготовка данных для отчета и insert-а ------------------------
    private function insertPrepare() {
        $this->insertPrepareAdd();
        $this->insertPrepareEdit();
        $this->insertPrepareDelete();
    }

    private function insertPrepareAdd() {
        if (!empty($this->dataAdd)) {
            foreach (array_keys($this->dataAdd["propertyName"]) as $value) {
                $id = ID_GENERATOR::generateID();
                $newProperty = "INSERT INTO `ShopProperties` SET ";
                $newProperty .= "`id` = '" . $id . "', ";
                $newProperty .= "`propertyName` = '" . $this->dataAdd['propertyName'][$value] . "', ";
                $newProperty .= "`filterType` = '" . $this->dataAdd['filterType'][$value] . "', ";
                $newProperty .= "`valueType` = '" . $this->dataAdd['valueType'][$value] . "', ";
                $newProperty .= "`oneOfAllValues` = '" . $this->dataAdd['oneOfAllValues'][$value] . "'; ";
                $this->insertSQL[$id][] = $newProperty;
                if ($this->dataAdd['measure'][$value] != NULL) {
                    $propertyMeasure = "INSERT INTO `ShopPropertiesMeasure` SET ";
                    $propertyMeasure .= "`property` = '" . $id . "', ";
                    $propertyMeasure .= "`measure` =  '" . $this->dataAdd['measure'][$value] . "';";
                    $this->insertSQL[$id][] = $propertyMeasure;
                }
                $this->dataAddForReport[$id]['id'] = $id;
                $this->dataAddForReport[$id]['propertyName'] = $this->dataAdd['propertyName'][$value];
                $this->dataAddForReport[$id]['filterType'] = $this->dataAdd['filterType'][$value];
                $this->dataAddForReport[$id]['valueType'] = $this->dataAdd['valueType'][$value];
                $this->dataAddForReport[$id]['oneOfAllValues'] = $this->dataAdd['oneOfAllValues'][$value];
                $this->dataAddForReport[$id]['measure'] = $this->dataAdd['measure'][$value];
            }
        }
    }

    private function insertPrepareEdit() {
        if (!empty($this->dataEdit)) {
            foreach ($this->dataEdit as $field => $property) {
                foreach ($property as $id => $value) {
                    if ($field === "measure") {
                        if ($value == null) {
                            $propertyMeasure = "DELETE FROM `ShopPropertiesMeasure` WHERE `property`='" . $id . "';";
                        } else {
                            $propertyMeasure = "UPDATE `ShopPropertiesMeasure` SET ";
                            $propertyMeasure .= " `" . $field . "` = '" . $value . "' ";
                            $propertyMeasure .= " WHERE `property` = '" . $id . "';";
                        }
                        $this->insertSQL[$id][] = $propertyMeasure;
                    } else {
                        $updateProperty = "UPDATE `ShopProperties` SET ";
                        $updateProperty .= " `" . $field . "` = '" . $value . "' ";
                        $updateProperty .= " WHERE `id` = '" . $id . "';";
                        $this->insertSQL[$id][] = $updateProperty;
                    }
                    $this->dataEditForReport[$id][$field] = $value;
                    $dataCurentProperty = $this->getDataEditElement($id);
                    $this->dataEditForReport[$id] = array_merge($dataCurentProperty, $this->dataEditForReport[$id]);
                    $this->dataEditTitle[$id] = array_merge($this->dataEditForReport[$id], $dataCurentProperty);
                }
            }
        }
    }

    private function insertPrepareDelete() {
        if (isset($this->dataDelete['propertyName']) && !empty($this->dataDelete['propertyName'])) {
            foreach (array_keys($this->dataDelete['propertyName']) as $id) {
                $deleteProperty = "DELETE FROM `ShopProperties` WHERE `id`='" . $id . "';";
                $this->insertSQL[$id][] = $deleteProperty;
                $this->dataDeleteForReport[$id] = $this->getDataEditElement($id);
                if ($this->dataDeleteForReport[$id]['measure'] !== NULL) {
                    $updateMeasure = "DELETE FROM `ShopPropertiesMeasure` WHERE `property`='" . $id . "';";
                    $this->insertSQL[$id][] = $updateMeasure;
                }
            }
        }
    }

    // получение данных о редактируемом элементе
    private function getDataEditElement($id) {
        $query = "SELECT 
            SHPR.`id`, 
            SHPR.`propertyName`, 
            SHPR.`filterType`, 
            SHPR.`valueType`, 
            SHPR.`oneOfAllValues`, 
            SHPRM.`measure`
            FROM 
                (SELECT * FROM `ShopProperties` WHERE `id` = '" . $id . "') AS SHPR
            LEFT JOIN `ShopPropertiesMeasure` AS SHPRM
            ON SHPRM.`property` = SHPR.`id`;";
        $dataCurentProperty = $this->SQL_HELPER->select($query, 1);
        return $dataCurentProperty;
    }

    private function getReport() {
        $this->html = '<div class="ShopPropertyCatalog">';
        $this->html .= $this->generationJS();
        $this->html .= '<div class="ShopPropertyCatalogMainBlock">';
        $this->html .= '<div class="addGroupCatalogNewPropertyWrapper">';
        $this->html .= '<div class="addGroupCatalogNewProperty">';
        $this->html .= '<form class="AP_FormShopAddPropertyCatalogStepSecond" name="AP_FormShopAddPropertyCatalogStepSecond" action="' . $this->urlHelper->getThisPage() . '" method="POST" accept - charset="UTF-8">';
        $this->html .= '<table class="ShopPropertyCatalogTable">';
        $this->html .= $this->generationHeaderTable();
        $this->html .= $this->getBlockForReport($this->dataAddForReport, "Создваемые свойства");
        $this->html .= $this->getBlockForReport($this->dataEditForReport, "Редактируемые свойства", $this->dataEditTitle);
        $this->html .= $this->getBlockForReport($this->dataDeleteForReport, "Удаляемые свойства");
        $this->html .= '</table>';
        $this->html .= '<center>';
        $this->html .= '<div class="addGroupCatalogNewPropertyButton">';
        $this->html .= '<input class="AP_ShopPropertyCatalogButtonApply" type="submit" name="AP_ShopPropertyCatalogButtonApply" id="AP_ShopPropertyCatalogButtonApply" value="Применить">';
        $this->html .= '</div>';
        $this->html .= '</center>';
        $this->html .= '</form>';
        $this->html .= '<div class="clear"></div>';
        $this->html .= '</div>'; // addGroupCatalogNewProperty
        $this->html .= '</div>'; // addGroupCatalogNewPropertyWrapper
        $this->html .= '</div>'; // ShopPropertyCatalogMainBlock
        $this->html .= '</div>'; //ShopPropertyCatalog
    }

    private function getBlockForReport($data, $text, $title = array()) {
        $html = '';
        if (empty($title)) {
            $title = $data;
        }
        if (!empty($data)) {
            $html .= '<tr class="ShopPropertyCatalogTitleReport"><td colspan="6">' . $text . '</td></tr>';
            foreach ($data as $property) {
                $hidden = '';
                foreach ($this->insertSQL[$property['id']] as $value) {
                    $hidden .= '<input type="hidden" name="hiddenStepSecond[]" value="' . $value . '">';
                }
                $html .= $this->getElementReportTable($property, $hidden, $title[$property['id']]);
            }
        }
        return $html;
    }

    private function getElementReportTable($property, $hidden, $title) {
        $id = ID_GENERATOR::generateID("ShopPropertyElementReport");
        $html = '<tr id="' . $id . '" class="ShopPropertyCatalogElementTable">';
        $html .= '<td>';
        $html .= '<div class="ShopPropertyCatalogButtonDeleteStepSecond">Отменить</div>';
        $html .= '</td>';
        $html .= '<td>';
        $html .= '<div class="addGroupCatalogNewPropertyNameInput ' . $this->getColorUpdate($title['propertyName'], $property['propertyName']) . '" propertyName="' . $property['propertyName'] . '" title="' . $title['propertyName'] . '">' . $property['propertyName'];
        $html .= $hidden;
        $html .= '</div>';
        $html .= '</td>';
        $html .= '<td>';
        $html .= '<div class="addGroupCatalogNewPropertyType ' . $this->getColorUpdate($title['filterType'], $property['filterType']) . '" title="' . $title['filterType'] . '">' . $property['filterType'];
        $html .= '</div>';
        $html .= '</td>';
        $html .= '<td>';
        $html .= '<div class="addGroupCatalogNewPropertyType ' . $this->getColorUpdate($title['valueType'], $property['valueType']) . '" title="' . $title['valueType'] . '">' . $property['valueType'];
        $html .= '</div>';
        $html .= '</td>';
        $html .= '<td>';
        $measure = '';
        $measureTitle = '';
        ($property["measure"] != NULL) ? $measure .= $property["measure"] : $measure .= "без единицы";
        ($title["measure"] != NULL) ? $measureTitle .= $title["measure"] : $measureTitle .= "без единицы";
        $html .= '<div class="addGroupCatalogNewPropertyType ' . $this->getColorUpdate($measureTitle, $measure) . '" title="' . $measureTitle . '">' . $measure;
        $html .= '</div>';
        $html .= '</td>';
        $html .= '<td>';
        $oneOfAll = '';
        $oneOfAllTitle = '';
        ($property["oneOfAllValues"] !== '0') ? $oneOfAll .= "да" : $oneOfAll .= "нет";
        ($title["oneOfAllValues"] !== '0') ? $oneOfAllTitle .= "да" : $oneOfAllTitle .= "нет";
        $html .= '<div class="addGroupCatalogNewPropertyType ' . $this->getColorUpdate($oneOfAllTitle, $oneOfAll) . '" title="' . $oneOfAllTitle . '">' . $oneOfAll;
        $html .= '</div>';
        $html .= '</td>';
        $html .= '</tr>';
        return $html;
    }

    private function getColorUpdate($old, $new) {
        if ($old !== $new) {
            return "ShopPropertyElementReportColorUpdate";
        }
    }

// ----------------- Шаг 3 () применение изменений -----------------------------

    private function applyUpdate() {
        if (isset($this->dataPost['AP_ShopPropertyCatalogButtonApply'])) {
            $this->insertExecute();
        }
    }

    private function insertExecute() {
        if (isset($this->dataPost["hiddenStepSecond"])) {
            foreach ($this->dataPost["hiddenStepSecond"] as $query) {
                $this->SQL_HELPER->insert($query);
            }
            $this->generationUI();
        }
    }

}

class GenerationFieldForProperty {

    private $blockId;
    private $SQL_HELPER;

    public function __construct() {
        global $_SQL_HELPER;
        $this->SQL_HELPER = $_SQL_HELPER;
    }

    public function getBlockId() {
        $this->blockId = ID_GENERATOR::generateID("ShopPropertyElement");
        return $this->blockId;
    }

    public function getElementTable($property = array()) {
        $html = '<tr id="' . $this->blockId . '" class="ShopPropertyCatalogElementTable">';
        if (empty($property)) {
            $property['propertyName'] = $property['filterType'] = $property['valueType'] = $property['measure'] = '';
            $property['oneOfAllValues'] = '0';
        }
        if (!isset($property['id'])) {
            $property['id'] = $this->blockId;
        }
        $html .= '<td>';
        $html .= '<div class="ShopPropertyCatalogButtonDel">x</div>';
        $html .= '</td>';
        $html .= '<td>';
        $html .= '<div class="addGroupCatalogNewPropertyNameInput">';
        $html .= InputHelper::textBox("propertyName[" . $property['id'] . "]", "propertyName", "propertyName", 50, true, $property["propertyName"]);
        $html .= '</div>';
        $html .= '</td>';
        $html .= '<td>';
        $html .= '<div class="addGroupCatalogNewPropertyType">';
        $html .= InputHelper::select("filterType[" . $property['id'] . "]", "filterType", $this->getFilterType(), true, $property["filterType"]);
        $html .= '</div>';
        $html .= '</td>';
        $html .= '<td>';
        $html .= '<div class="addGroupCatalogNewPropertyType">';
        $html .= InputHelper::select("valueType[" . $property['id'] . "]", "valueType", $this->getValueType(), true, $property["valueType"]);
        $html .= '</div>';
        $html .= '</td>';
        $html .= '<td>';
        $html .= '<div class="addGroupCatalogNewPropertyType">';
        $measure = '';
        ($property["measure"] !== NULL) ? $measure .= $property["measure"] : $measure .= NULL;
        $html .= InputHelper::select("measure[" . $property['id'] . "]", "measure", $this->getMeasureF(), true, $measure);
        $html .= '</div>';
        $html .= '</td>';
        $html .= '<td>';
        $html .= '<div class="addGroupCatalogNewPropertyType">';
        $html .= InputHelper::select("oneOfAllValues[" . $property['id'] . "]", "oneOfAllValues", array(array('value' => "1", 'text' => "да"), array('value' => "0", 'text' => "нет")), true, $property["oneOfAllValues"]);
        $html .= '</div>';
        $html .= '</td>';
        $html .= '</tr>';
        return $html;
    }

    private function getFilterType() {
        $listFilterType = [];
        $query = "SELECT `type` FROM `ShopPropertiesFilterType` ORDER BY `type` ASC;";
        $filterType = $this->SQL_HELPER->select($query);
        foreach ($filterType as $key => $value) {
            $listFilterType[$key]['text'] = $value["type"];
            $listFilterType[$key]['value'] = $value["type"];
        }
        return $listFilterType;
    }

    private function getValueType() {
        $listValueType = [];
        $query = "SELECT `type` FROM `ShopPropertiesValueType` ORDER BY `type` ASC;";
        $valueType = $this->SQL_HELPER->select($query);
        foreach ($valueType as $key => $value) {
            $listValueType[$key]['text'] = $value["type"];
            $listValueType[$key]['value'] = $value["type"];
        }
        return $listValueType;
    }

    private function getMeasureF() {
        $listMeasureF = [];
        $query = "SELECT `measureF` FROM `ShopMeasure` ORDER BY `measureF` ASC;";
        $measureF = $this->SQL_HELPER->select($query);
        foreach ($measureF as $key => $value) {
            $listMeasureF[$key]['text'] = $value["measureF"];
            $listMeasureF[$key]['value'] = $value["measureF"];
        }
        $listMeasureF[$key + 1]['text'] = "без единицы";
        $listMeasureF[$key + 1]['value'] = NULL;
        return $listMeasureF;
    }

}
