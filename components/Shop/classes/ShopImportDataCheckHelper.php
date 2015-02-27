<?php
/**
 * Description of ShopImportDataCheckHelper
 *
 * @author maxim
 */
class ShopImportDataCheckHelper {
    
    public static function CheckImportSuccess () {
        global $_SQL_HELPER;
        $chekQ = 'SELECT * FROM `ShopImportLogs` order by `importDate` DESC';
        $logs = $_SQL_HELPER->select($chekQ,1);
        return (!isset($logs['success']) || $logs['success']==='1' || $logs['errors']>'0');
    }
    
    public static function CheckFile ($file) {
        return file_exists($file);
    }
    
}
