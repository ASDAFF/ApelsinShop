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

include_once '../classes/AP_WorkingWithShopItems/AP_WorkingWithShopNewItemsEdit/AP_ListPanelNewItems.php';
include_once '../classes/AP_WorkingWithShopItems/AP_WorkingWithShopNewItemsEdit/AP_AbstractPanelEditNewItems.php';
include_once '../classes/AP_WorkingWithShopItems/AP_WorkingWithShopNewItemsEdit/AP_WorkingWithShopItemsNewEditProperty.php';

global $_SQL_HELPER;
$_SQL_HELPER = new MysqliHelper();
$sql = $_SQL_HELPER;

global $_SITECONFIG;
$_SITECONFIG = new SiteConfig();

if (isset($_GET['id']) && !empty($_GET['id'])) {
    $id = $_GET['id'];
}
if (isset($_GET['simbol']) && !empty($_GET['simbol'])) {
    $simbol = $_GET['simbol'];
    $search = new SearchShopItem($id, $simbol);
    echo $search->getHtmlResult();
}

class SearchShopItem {

    private $id;
    private $simbol;
    private $SQL_HELPER;

    public function __construct($id, $simbol) {
        global $_SQL_HELPER;
        $this->SQL_HELPER = $_SQL_HELPER;
        $this->id = $id;
        $this->simbol = $simbol;
    }

    public function getResult() {
        $sql = '';
        $stringText = preg_replace('/ {2,}/', ' ', $this->simbol);
        $string = explode(" ", trim($stringText));
        foreach ($string as $word) {
            $sql .= "LOWER(`value`) LIKE '%" . mb_strtolower($word) . "%' OR ";
        }
        if ($sql !== '') {
            $sql = " AND (" . mb_substr($sql, 0, mb_strlen($sql) - 4) . ") ";
        }
        $query1 = "SELECT DISTINCT `value` FROM `ShopItemsPropertiesValues` WHERE `property` = '" . $this->id . "' AND LOWER(`value`) LIKE '" . mb_strtolower($word) . "' Order BY `value`;";
        $rezult1 = $this->SQL_HELPER->select($query1);
        $query2 = "SELECT DISTINCT `value` FROM `ShopItemsPropertiesValues` WHERE `property` = '" . $this->id . "' AND LOWER(`value`) LIKE '" . mb_strtolower($word) . "%' Order BY `value`;";
        $rezult2 = $this->SQL_HELPER->select($query2);
        $query3 = "SELECT DISTINCT `value` FROM `ShopItemsPropertiesValues` WHERE `property` = '" . $this->id . "' " . $sql . " Order BY `value`;";
        $rezult3 = $this->SQL_HELPER->select($query3);
        $rezult = array();
        foreach ($rezult1 as $val) {
            if (!in_array($val, $rezult)) {
                $rezult[] = $val;
            }
        }
        foreach ($rezult2 as $val) {
            if (!in_array($val, $rezult)) {
                $rezult[] = $val;
            }
        }
        foreach ($rezult3 as $val) {
            if (!in_array($val, $rezult)) {
                $rezult[] = $val;
            }
        }


//        foreach ($rezult as $values) {
//            foreach ($values as $value) {
//                $rezultOut[] = $value;
//            }
//        }
//$rezultOut = array("Астра", "Нарцисс", "Роза", "Пион", "Примула",
//                      "Подснежник", "Мак", "Первоцвет", "Петуния", "Фиалка");
//        var_dump($rezultOut);
//        return $rezultOut;        
        return $rezult;
    }

    public function getHtmlResult() {
        $rezult = $this->getResult();
        $html = "";
        if (count($rezult) > 0 && !empty($rezult)) {
            $html .= '<div class="shopItemsSearchResultContent">';
            foreach ($rezult as $values) {
                foreach ($values as $value) {
                    if ($value != null && $value != '') {
                        $html .= '<div class="shopItemsSearchResultValue">' . $value . '</div>';
                    } else {
                        $html .= '';
                    }
                }
            }
            $html .= '</div>';
        }
        return $html;
    }

}
