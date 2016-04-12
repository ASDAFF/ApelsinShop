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
        return $this->html;
    }

    private function generationJS() {
        $html = '<script type="text/javascript">';
        $html .= ' workingWithShopCatalogPropertyTimer = null;';
        $html .= ' workingWithShopCatalogPropertyTime = 1000;';


        $html .= '
            function deleteProperty(property) {
                    $.ajax({
                        type: "POST",
                        url: "./components/Shop/admin/script/shopDeleteProperty.php",
                        cache: false,
                        data: {"property":property},
                        success: function(result) {
//                            $(".ShopPropertyCatalogHeaderTable").after(result);
                        }
                    });
                };
                
            function shopPropertyCatalogButtonDeletePropertyOnClick(obj) {
                var idBlock = $(obj).parent().parent().attr("id");
                var idProperty = $(obj).attr("idProperty");
                var nameCansel = $("#" + idBlock + " .propertyName").val();
                var isDelete = confirm("Удалить свойство \" " + nameCansel + " \" ");
                if (isDelete) {
                    deleteProperty(idProperty);
                    $(obj).parent().parent().remove();
                } 
            }';
        $html .= '  jQuery(document).ready(function() {';

        // Удаление св-ва
        $html .= '
            $(".ShopPropertyCatalogButtonDeleteStepSecond").click(function() {
                shopPropertyCatalogButtonDeletePropertyOnClick(this);
            });
        ';


        // Редактирование св-ва
        $html .= '
                $(".ShopPropertyCatalogTable .selectBox").change(function() {
                    clearTimeout(workingWithShopCatalogPropertyTimer);
                    var field = $(this).attr("id");
                    var idProperty = $(this).parent().parent().parent().attr("idProperty");
                    var value = $(this).val();
                    $.ajax({
                        type: "POST",
                        url: "./components/Shop/admin/script/shopEditProperty.php",
                        cache: false,
                        data: {
                            "idProperty":idProperty,
                            "value":value,
                            "field":field
                        },
                        success: function(result) {
                            $(".ShopPropertyCatalogHeaderTable").after(result);
                        }
                    });
                });
                
                $(".ShopPropertyCatalogTable .propertyName").keyup(function() {
                    var textNew = $(this).val();
                    var idProperty = $(this).parent().parent().parent().attr("idProperty");
                    clearTimeout(workingWithShopCatalogPropertyTimer);
                    workingWithShopCatalogPropertyTimer = setTimeout(editNameAJAX, workingWithShopCatalogPropertyTime, idProperty, textNew);
                });
                    
                function editNameAJAX(idProperty, textNew) {
                    $.ajax({
                        type: "POST",
                        url: "./components/Shop/admin/script/shopEditNameProperty.php",
                        cache: false,
                        data: {
                            "idProperty":idProperty,
                            "textNew":textNew
                        }
                    });
                }';


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

    private function generationUI() {
        $this->getAllProperty();
        $this->html = $this->generationJS();
        $createdProperty = new AP_WorkingWithShopProperty_AddNewPropertyForProperty();
        $this->html .= $createdProperty->getHtml();
        $this->html .= '<div class="ShopPropertyCatalog">';
        $this->html .= '<div class="ShopPropertyCatalogMainBlock">';
        $this->html .= '<div class="addGroupCatalogNewPropertyWrapper">';
        $this->html .= '<div class="addGroupCatalogNewProperty">';
        $this->html .= '<table class="ShopPropertyCatalogTable">';
        $this->html .= '<tr class="ShopPropertyCatalogHeaderTable"></tr>';
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
        $this->html .= '<div class="clear"></div>';
        $this->html .= '</div>'; // addGroupCatalogNewProperty
        $this->html .= '</div>'; // addGroupCatalogNewPropertyWrapper
        $this->html .= '</div>'; // ShopPropertyCatalogMainBlock
        $this->html .= '</div>'; //ShopPropertyCatalog
    }

//        if ($field === "measure") {
//            if ($value == null) {
//                $propertyMeasure = "DELETE FROM `ShopPropertiesMeasure` WHERE `property`='" . $id . "';";
//            } else {
//                $propertyMeasure = "UPDATE `ShopPropertiesMeasure` SET ";
//                $propertyMeasure .= " `" . $field . "` = '" . $value . "' ";
//                $propertyMeasure .= " WHERE `property` = '" . $id . "';";
//            }
//        $this->SQL_HELPER->insert($propertyMeasure);
//        } else {
//            $updateProperty = "UPDATE `ShopProperties` SET ";
//            $updateProperty .= " `" . $field . "` = '" . $value . "' ";
//            $updateProperty .= " WHERE `id` = '" . $id . "';";
//        $this->SQL_HELPER->insert($updateProperty);
//        }
}

class GenerationFieldForProperty {

    private $blockId;
    private $SQL_HELPER;

    public function __construct() {
        global $_SQL_HELPER;
        $this->SQL_HELPER = $_SQL_HELPER;
    }

    public function getBlockId() {
        $this->blockId = ID_GENERATOR::generateID();
        return $this->blockId;
    }

    public function getElementTable($property = array()) {
        if (empty($property)) {
            $property['propertyName'] = $property['filterType'] = $property['valueType'] = $property['measureF'] = '';
            $property['oneOfAllValues'] = '0';
        }
        if (!isset($property['id'])) {
            $property['id'] = $this->blockId;
        }
        if (isset($property["measure"]) && $property["measure"] != null) {
            $measure = $property["measure"];
        } else {
            $measure = null;
        }
        $html = '<tr id="' . $this->blockId . '" class="ShopPropertyCatalogElementTable" idProperty="' . $property['id'] . '">';
        $html .= '<td>';
        $html .= '<div class="ShopPropertyCatalogButtonDeleteStepSecond" idBlock="propertyDelete_' . $this->blockId . '" idProperty="' . $property['id'] . '">x</div>';
        $html .= '</td>';
        $html .= '<td>';
        $html .= '<div class="addGroupCatalogNewPropertyNameInput ">';
        $html .= InputHelper::textBox("propertyName[" . $property['id'] . "]", "propertyNameInput", "propertyName", 50, true, $property["propertyName"]);
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
