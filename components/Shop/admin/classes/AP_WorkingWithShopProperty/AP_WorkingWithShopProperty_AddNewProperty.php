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
 * Description of AP_WorkingWithShopProperty_AddNewProperty
 *
 * @author Olga Rjabchikova
 * @copyright © 2010-2016, CompuProjec
 * @created 31.03.2016 10:06:38
 */
abstract class AP_WorkingWithShopProperty_AddNewProperty {

    protected $html;
    protected $SQL_HELPER;
    protected $urlHelper;

    public function __construct() {
        global $_SQL_HELPER;
        $this->SQL_HELPER = $_SQL_HELPER;
        $this->urlHelper = new UrlHelper();
        $this->generationCreateNewProperty();
    }

    public function getHtml() {
        return $this->html;
    }

    public function insert() {
        $this->getAllValue();
        if ($this->checkAllValue()) {
            $this->insertExecute();
            $this->html = $this->generationActionJS();
        } else {
            if ($this->checkAllValueErrors != null) {
                foreach ($this->checkAllValueErrors as $CVerror) {
                    echo $this->generationMessageErrorJS($CVerror);
                }
            }
        }
    }

    public function getPropertyId() {
        return $this->insertValue['id'];
    }

    public function generationAJAX() {
        
    }

    protected function generationCreateNewProperty() {
        $this->html = '';
        $this->html .= '<div class="addGroupCatalogNewPropertyWrapper">';
        $this->html .= '<div class="addGroupCatalogNewProperty">';
        $this->html .= '<form class="AP_FormAddGroupPropertyShopCatalog" name="AP_FormAddGroupPropertyShopCatalog" action="' . $this->urlHelper->getThisPage() . '" method="POST" accept - charset="UTF-8">';
        $this->html .= '<table class="addGroupCatalogGroupPropertyWrapper">';
        $this->html .= '<tr>';
        $this->html .= '<th>Название свойства</th>';
        $this->html .= '<th>Тип фильтра</th>';
        $this->html .= '<th>Тип данных</th>';
        $this->html .= '<th>Единица измерения</th>';
        $this->html .= '<th>Один из множества</th>';
        $this->html .= '<th></th>';
        $this->html .= '</tr>';
        $this->html .= '<tr>';
        $this->html .= '<td>';
        $this->html .= '<div class="addGroupCatalogNewPropertyNameInput">';
//        $this->html .= InputHelper::paternTextBox("propertyName", "propertyName", "propertyName", 50, true, "Латиница, кирилица", "/[А-Яа-яA-Za-z0-9]{1,50}/", "");
        $this->html .= InputHelper::textBox("propertyName", "propertyName", "propertyName", 50, true, "");
        $this->html .= '</div>';
        $this->html .= '</td>';
        $this->html .= '<td>';
        $this->html .= '<div class="addGroupCatalogNewPropertyType">';
        $this->html .= InputHelper::select("filterType", "filterType", $this->getFilterType(), true, "1");
        $this->html .= '</div>';
        $this->html .= '</td>';
        $this->html .= '<td>';
        $this->html .= '<div class="addGroupCatalogNewPropertyType">';
        $this->html .= InputHelper::select("valueType", "valueType", $this->getValueType(), true, "1");
        $this->html .= '</div>';
        $this->html .= '</td>';
        $this->html .= '<td>';
        $this->html .= '<div class="addGroupCatalogNewPropertyType">';
        $this->html .= InputHelper::select("measure", "measure", $this->getMeasureF(), true, "1");
        $this->html .= '</div>';
        $this->html .= '</td>';
        $this->html .= '<td>';
        $this->html .= '<div class="addGroupCatalogNewPropertyType">';
        $this->html .= InputHelper::select("oneOfAllValues", "oneOfAllValues", array(array('value' => "1", 'text' => "да"), array('value' => "0", 'text' => "нет")), true, "0");
        $this->html .= '</div>';
        $this->html .= '</td>';
        $this->html .= '<td>';
        $this->html .= '<div class="addGroupCatalogNewPropertyButton">';
        $this->html .= '<input class="addGroupCatalogNewPropertyButtonInput" type="button" name="addGroupCatalogNewPropertyButtonInput" id="addGroupCatalogNewPropertyButtonInput" value="Создать ">';
        $this->html .= '</div>';
        $this->html .= '</td>';
        $this->html .= '</tr>';
        $this->html .= '</table>';
        $this->html .= '</form>';
        $this->html .= '<div class="clear"></div>';
        $this->html .= '</div>';
        $this->html .= $this->generationAJAX();
    }

    protected function getFilterType() {
        $listFilterType = [];
        $query = "SELECT `type` FROM `ShopPropertiesFilterType` ORDER BY `type` ASC;";
        $filterType = $this->SQL_HELPER->select($query);
        foreach ($filterType as $key => $value) {
            $listFilterType[$key]['text'] = $value["type"];
            $listFilterType[$key]['value'] = $value["type"];
        }
        return $listFilterType;
    }

    protected function getValueType() {
        $listValueType = [];
        $query = "SELECT `type` FROM `ShopPropertiesValueType` ORDER BY `type` ASC;";
        $valueType = $this->SQL_HELPER->select($query);
        foreach ($valueType as $key => $value) {
            $listValueType[$key]['text'] = $value["type"];
            $listValueType[$key]['value'] = $value["type"];
        }
        return $listValueType;
    }

    protected function getMeasureF() {
        $listMeasureF = [];
        $query = "SELECT `measureF` FROM `ShopMeasure` ORDER BY `measureF` ASC;";
        $measureF = $this->SQL_HELPER->select($query);
        foreach ($measureF as $key => $value) {
            $listMeasureF[$key]['text'] = $value["measureF"];
            $listMeasureF[$key]['value'] = $value["measureF"];
        }
        $listMeasureF[$key + 1]['text'] = "без единицы";
        $listMeasureF[$key + 1]['value'] = null;
        return $listMeasureF;
    }

    protected function generationActionJS() {
        $html = '<script type="text/javascript">';
        $html .= 'alert("Свойство создано");';
        $html .= '</script>';
        return $html;
    }

    protected function generationMessageErrorJS($message) {
        $html = '<script type="text/javascript">';
        $html .= 'alert("' . $message . '");';
        $html .= '</script>';
        return $html;
    }

    protected function getAllValue() {
        $this->insertValue = [];
        $this->insertValue['id'] = ID_GENERATOR::generateID();
        $this->insertValue['propertyName'] = InputValueHelper::getPostValue('propertyName');
        $this->insertValue['filterType'] = InputValueHelper::getPostValue('filterType');
        $this->insertValue['valueType'] = InputValueHelper::getPostValue('valueType');
        $this->insertValue['oneOfAllValues'] = InputValueHelper::getPostValue('oneOfAllValues');
        $this->insertValue['measure'] = InputValueHelper::getPostValue('measure');
    }

    protected function checkAllValue() {
        $error = false;
        if (!(isset($_POST['propertyName']) && $_POST['propertyName'] != null && $_POST['propertyName'] != "")) {
            $error = true;
            $this->checkAllValueErrors[] = "Название свойства - обязательное поле";
        }
        if (!$this->checkDuplicatePropertyName()) {
            $error = true;
            $this->checkAllValueErrors[] = "Такое название свойства уже используется. Выберите другое.";
        }
        return !$error;
    }

    protected function checkDuplicatePropertyName() {
        $result = [];
        if (isset($_POST['propertyName']) && $_POST['propertyName'] != null && $_POST['propertyName'] != "") {
            $query = "SELECT `propertyName` FROM `ShopProperties` WHERE `propertyName`='" . $_POST['propertyName'] . "';";
            $result = $this->SQL_HELPER->select($query, 1);
        }
        return $result == null;
    }

    protected function insertExecute() {
        $newProperties = "INSERT INTO `ShopProperties` SET ";
        $newProperties .= "`id` = '" . $this->insertValue['id'] . "', ";
        $newProperties .= "`propertyName` = '" . $this->insertValue['propertyName'] . "', ";
        $newProperties .= "`filterType` = '" . $this->insertValue['filterType'] . "', ";
        $newProperties .= "`valueType` = '" . $this->insertValue['valueType'] . "', ";
        $newProperties .= "`oneOfAllValues` = '" . $this->insertValue['oneOfAllValues'] . "'; ";
        $this->SQL_HELPER->insert($newProperties);
        if ($this->insertValue['measure'] !== null) {
            $propertiesMeasure = "INSERT INTO `ShopPropertiesMeasure` SET ";
            $propertiesMeasure .= "`property` = '" . $this->insertValue['id'] . "', ";
            $propertiesMeasure .= "`measure` = '" . $this->insertValue['measure'] . "'; ";
            $this->SQL_HELPER->insert($propertiesMeasure);
        }
    }

}
