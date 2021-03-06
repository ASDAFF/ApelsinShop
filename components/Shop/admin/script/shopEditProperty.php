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
ini_set("display_errors", 1);
error_reporting(E_ALL);
header("Content-type: text/html; charset=UTF-8");
@session_start();
include_once '../../../../ROOT/functions/includeSistemClasses.php';

includeSistemClasses('../../../../ROOT/');

include_once '../../classes/ShopIncludeClasses.php';
ShopIncludeClasses::includeAllClasses('../../', '../../../../modules/ShopNavigationAndFiltersPanel/');

include_once '../../../../plugins/InteractiveLists/classes/InteractiveListsPlugin.php';

include_once '../classes/AP_WorkingWithShopCatalog/AP_WorkingWithShopCatalog_General.php';
include_once '../classes/AP_WorkingWithShopProperty/AP_WorkingWithShopProperty_AddNewProperty.php';
include_once '../classes/AP_WorkingWithShopCatalog/AP_WorkingWithShopCatalog_AddBlockNewProperty.php';

global $_SQL_HELPER;
$_SQL_HELPER = new MysqliHelper();

global $_SITECONFIG;
$_SITECONFIG = new SiteConfig();

$urlParams = new UrlParams();
global $_URL_PARAMS;
$_URL_PARAMS = $urlParams->getUrlParam();

if (isset($_POST)) {
    if ($_POST !== "") {
        $idProperty = $_POST['idProperty'];
        $field = $_POST['field'];
        $value = $_POST['value'];
        $edit = new EditProperty();
        $edit->editProperty($idProperty, $field, $value);
    }
}

class EditProperty {

    private $SQL_HELPER;

    public function __construct() {
        global $_SQL_HELPER;
        $this->SQL_HELPER = $_SQL_HELPER;
    }

    public function editProperty($idProperty, $field, $value) {
        if ($field === "measure") {
            if ($value == null) {
                $propertyMeasure = "DELETE FROM `ShopPropertiesMeasure` WHERE `property`='" . $idProperty . "';";
            } elseif ($this->getRecordMeasure($idProperty)) {
                $propertyMeasure = "UPDATE `ShopPropertiesMeasure` SET ";
                $propertyMeasure .= " `" . $field . "` = '" . $value . "' ";
                $propertyMeasure .= " WHERE `property` = '" . $idProperty . "';";
            } else {
                $propertyMeasure = "INSERT INTO `ShopPropertiesMeasure` SET ";
                $propertyMeasure .= " `" . $field . "` = '" . $value . "', ";
                $propertyMeasure .= " `property` = '" . $idProperty . "'; ";
            }
            $this->SQL_HELPER->insert($propertyMeasure);
        } else {
            $updateProperty = "UPDATE `ShopProperties` SET ";
            $updateProperty .= " `" . $field . "` = '" . $value . "' ";
            $updateProperty .= " WHERE `id` = '" . $idProperty . "';";
            $this->SQL_HELPER->insert($updateProperty);
        }
    }

    private function getRecordMeasure($idProperty) {
        $query = "SELECT * FROM `ShopPropertiesMeasure` WHERE `property` = '" . $idProperty . "';";
        $result = $this->SQL_HELPER->select($query);
        return (!empty($result) ? true : false);
    }

}
