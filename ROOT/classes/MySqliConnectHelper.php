<?php
/**
 * Description of MySqliConnectHelper
 *
 * @author maxim
 */
class MySqliConnectHelper {
    static private $object;
    static private $mysqli;
    
    public function __construct() {
        global $_DBSETTINGS;
        self::$mysqli = new mysqli($_DBSETTINGS['host'], $_DBSETTINGS['user'], $_DBSETTINGS['password'], $_DBSETTINGS['db_name']);
        self::$mysqli->set_charset($_DBSETTINGS['charset']);
        if (mysqli_connect_errno()) {
            exit();
        }
    }
    
    public static function getConection() {
        if(!isset(self::$object)) {
            self::$object = new MySqliConnectHelper();
        }
        return self::$mysqli;
    }
}
