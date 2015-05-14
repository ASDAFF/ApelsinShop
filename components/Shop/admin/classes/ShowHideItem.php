<?php
include_once '../../../../ROOT/classes/MysqliHelper.php'; 
include_once '../../../../ROOT/classes/MySqliConnectHelper.php'; 
include_once '../../../../ROOT/configure.php';
ini_set("display_errors",1);
error_reporting(E_ALL); 
/**
 * Description of ShowHideItem
 *
 * @author olga
 */

class ShowHideItem {

    private $shown;
    private $SQL_HELPER;
    private $id;

    public function __construct($id, $shown) {
        $this->id = $id;
        $this->shown = $shown;
        $this->SQL_HELPER = new MysqliHelper();
    }

    public function getData() {
        $query = "UPDATE `ShopItems` SET `shown` = '".$this->shown."' WHERE `id` = '".  $this->id."';";
        $this->SQL_HELPER->insert($query);
    }
}

class ShowHideGroup {

    private $shown;
    private $SQL_HELPER;
    private $id;

    public function __construct($id, $shown) {
        $this->id = $id;
        $this->shown = $shown;
        $this->SQL_HELPER = new MysqliHelper();
    }

    public function getData() {
        $query = "UPDATE `ShopGroups` SET `shown` = '".$this->shown."' WHERE `id` = '".  $this->id."';";
        $this->SQL_HELPER->insert($query);
    }
}

class ShowHideInHierarchy {

    private $shown;
    private $SQL_HELPER;
    private $id;

    public function __construct($id, $shown) {
        $this->id = $id;
        $this->shown = $shown;
        $this->SQL_HELPER = new MysqliHelper();
    }

    public function getData() {
        $query = "UPDATE `ShopGroups` SET `showInHierarchy` = '".$this->shown."' WHERE `id` = '".  $this->id."';";
        $this->SQL_HELPER->insert($query);
    }
}