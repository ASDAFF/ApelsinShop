<?php
/**
 * Description of ShopImportData_ToMySQL
 *
 * @author maxim
 */
class ShopImportData_MySQL {
    private $SQL_HELPER;
    private $QUERIES_SET_LIMIT = 50;
    private $FILE_XML = './resources/Components/Shop/ImportFilesXML/';
    private $FILE = './resources/Components/Shop/ImportFilesMySQL/';
    private $LOG_Text = './resources/Components/Shop/ImportLogsText/';
    private $LOG_Html = './resources/Components/Shop/ImportLogsHtml/';
    private $FILE_SQL = '';
    private $SQL;
    
    private $yourUser;
    private $yourUserData;
    
    private $DataObject = null;
    private $constantDataSet = array();
    private $constantDataSet_MySQL = array();
    private $MySQL_IDsync = array(); // Информация о том что делать с данными
    private $MySQL_QUERIES = array();
    private $dataIdSet = array();
    private $DATA = array();
    private $ERRORS = array();
    private $WARNINGS = array();
    
    private $logDate = array();
    private $fileName ;
    
    public function __construct($fileName) {
        $this->fileName = $fileName;
        global $_SQL_HELPER;
        $this->SQL_HELPER = $_SQL_HELPER;
        $this->getUserData();
        $this->getData_XML();
        if(count($this->ERRORS) == 0) {
            $this->getData_MySQL();
            $this->generateQueriesMySQL();
            $this->createMysqlScript();
        } else {
            $this->importIsNotSuccess();
        }
    }
    
    private function getUserData() {
        $this->yourUser = new UserData();
        $this->yourUser->checkAuthorization();
        $this->yourUserData = $this->yourUser->getUserData();
    }
    
    private function getData_MySQL() {
        $query_ShopGroups = 'SELECT `id` FROM `ShopGroups`;';
        $query_ShopProperties = 'SELECT `id` FROM `ShopProperties`;';
        $query_ShopItems = 'SELECT `id` FROM `ShopItems`;';
        $query_ShopPricesTypes = 'SELECT `id` FROM `ShopPricesTypes`;';
        $this->setConstantDataSetMySQL('Groups',$this->SQL_HELPER->select($query_ShopGroups));
        $this->setConstantDataSetMySQL('Properties',$this->SQL_HELPER->select($query_ShopProperties));
        $this->setConstantDataSetMySQL('Items',$this->SQL_HELPER->select($query_ShopItems));
        $this->setConstantDataSetMySQL('PricesTypes',$this->SQL_HELPER->select($query_ShopPricesTypes));
    }
    
    private function setConstantDataSetMySQL($key,$data,$idColumn = 'id') {
        $this->constantDataSet_MySQL[$key] = array();
        foreach ($data as $id) {
            $this->constantDataSet_MySQL[$key][] = $id[$idColumn];
        }
    }
    
    private function getData_XML() {
        $this->DataObject = new ShopImportData_XML($this->fileName);
        $this->constantDataSet = $this->DataObject->get_constantDataSet();
        $this->dataIdSet = $this->DataObject->get_xmlDataIdSet();
        $this->DATA = $this->DataObject->get_DATA_XML();
        $this->ERRORS = $this->DataObject->get_ERRORS();
        $this->WARNINGS = $this->DataObject->get_WARNINGS();
        $this->addLogDate();
    }
    
    private function addLogDate() {
        $this->logDate = array();
        $this->DATA['SystemInformation']['FullExport'] ? $this->logDate['fullExport'] = '1' : $this->logDate['fullExport'] = '0';
        $this->logDate['importDate'] = date("Y-m-d h:i:s");
        $this->logDate['importDate2'] = date("Y.m.d_h:i:s");
        $this->logDate['exportDate'] = $this->DATA['SystemInformation']['ExportDateTime'];
        $this->logDate['exportDate2'] = $this->DATA['SystemInformation']['ExportDateTime2'];
        $this->logDate['exportDate3'] = $this->DATA['SystemInformation']['ExportDateTime3'];
        $this->logDate['exportUser'] = $this->DATA['SystemInformation']['user'];
        $this->logDate['importUser'] = $this->yourUserData['login'];
        $this->logDate['success'] = 0;
        
        $this->logDate['sqlFile'] = 'apelsin1c_'.$this->logDate['importDate2'].'.sql';
        $this->logDate['logFile'] = 'apelsin1c_'.$this->logDate['importDate2'].'.log';
        $this->logDate['htmlFile'] = 'apelsin1c_'.$this->logDate['importDate2'].'.html';
        $this->logDate['xmlFile'] = 'apelsin1c_'.$this->logDate['exportDate3'].'.xml';
        $this->logDate['logText'] = $this->LOG_Text;
        $this->logDate['logHtml'] = $this->LOG_Html;
        $this->FILE_SQL = $this->FILE.$this->logDate['sqlFile'];
        if (!rename($this->FILE_XML.$this->fileName, $this->FILE_XML.$this->logDate['xmlFile'])) {
            $this->ERRORS[] = 'Неудается скопирвоать файл.';
        }
        $logQ = "INSERT INTO `ShopImportLogs`(`importDate`, `exportDate`, `fullExport`, `user`, `exportUser`, `success`, `xmlFile`, `sqlFile`, `logFileText`, `logFileHtml`) VALUES ("
                . "'".$this->logDate['importDate']."',"
                . "'".$this->logDate['exportDate']."',"
                . "'".$this->logDate['fullExport']."',"
                . "'".$this->logDate['importUser']."',"
                . "'".$this->logDate['exportUser']."',"
                . "'".$this->logDate['success']."',"
                . "'".$this->logDate['xmlFile']."',"
                . "'".$this->logDate['sqlFile']."',"
                . "'".$this->logDate['logFile']."',"
                . "'".$this->logDate['htmlFile']."');";
        $this->SQL_HELPER->insert($logQ);
    }
    private function getScriptToSuccess() {
        $logQ = "UPDATE `ShopImportLogs` SET `success`='1', "
                . "`errors`='".count($this->ERRORS)."', "
                . "`warnings`='".count($this->WARNINGS)."' "
                . "WHERE "
                . "`importDate` = '".$this->logDate['importDate']."' AND "
                . "`exportDate` = '".$this->logDate['exportDate']."' AND "
                . "`user` = '".$this->logDate['importUser']."';";
        return $logQ;
    }
    private function importIsNotSuccess() {
        $logQ = "UPDATE `ShopImportLogs` SET `success`='0', "
                . "`errors`='".count($this->ERRORS)."', "
                . "`warnings`='".count($this->WARNINGS)."' "
                . "WHERE "
                . "`importDate` = '".$this->logDate['importDate']."' AND "
                . "`exportDate` = '".$this->logDate['exportDate']."' AND "
                . "`user` = '".$this->logDate['importUser']."';";
        $this->SQL_HELPER->insert($logQ);
    }

    private function generateQueriesMySQL() {
        $this->generateQueriesMySQL_IDsync('Groups', 'Groups');
        $this->generateQueriesMySQL_IDsync('Properties', 'Properties');
        $this->generateQueriesMySQL_IDsync('Items', 'Items');
        $this->generateQueriesMySQL_IDsync('PricesTypes', 'PricesTypes');
        
        
        $this->generateQueriesMySQL_DeleteDataLinks('GroupsHierarchy', 'ShopGroupsHierarchy', 'group', 'Groups', 'Groups');
        $this->generateQueriesMySQL_DeleteDataLinks('PropertiesInGroups', 'ShopPropertiesInGroups', 'group', 'Groups', 'Groups');
        $this->generateQueriesMySQL_DeleteDataLinks('ItemsPropertiesValues', 'ShopItemsPropertiesValues', 'item', 'Items', 'Items');
        $this->generateQueriesMySQL_DeleteDataLinks('ItemsPrices', 'ShopItemsPrices', 'item', 'Items', 'Items');
        
        $this->generateQueriesMySQL_HideData('Groups','ShopGroups','shown','id','Groups');
        $this->generateQueriesMySQL_HideData('Items','ShopItems','shown','id','Items');
        $this->generateQueriesMySQL_DeleteData('PricesTypes','ShopPricesTypes','id','PricesTypes');
        
        $this->generateQueriesMySQL_UpdateData('Groups', 'ShopGroups', array('id','groupName','shown','showInHierarchy'), 'Groups', 'id');
        $this->generateQueriesMySQL_UpdateData('Properties', 'ShopProperties', array('id','propertyName','filterType','valueType','oneOfAllValues'), 'Properties', 'id');
        $this->generateQueriesMySQL_UpdateData('Items', 'ShopItems', array('id','itemName','group','action','amount','minAmount','description','shown'), 'Items', 'id');
        $this->generateQueriesMySQL_UpdateData('PricesTypes', 'ShopPricesTypes', array('id','typeName','default'), 'PricesTypes', 'id');
        
        $this->generateQueriesMySQL_AddDataLinks('GroupsHierarchy','ShopGroupsHierarchy',array('group','parentGroup'), 'GroupsHierarchy');
        $this->generateQueriesMySQL_AddDataLinks('PropertiesInGroups','ShopPropertiesInGroups',array('group','property','sequence'), 'PropertiesInGroups');
        $this->generateQueriesMySQL_AddDataLinks('ItemsPropertiesValues','ShopItemsPropertiesValues',array('id','item','property','value','measure'), 'ItemsPropertiesValues');
        $this->generateQueriesMySQL_AddDataLinks('ItemsPrices','ShopItemsPrices',array('item','price','value'), 'ItemsPrices');
    }
    
    private function generateQueriesMySQL_IDsync($importSetKey,$mysqlSetKey) {
        foreach ($this->constantDataSet_MySQL[$mysqlSetKey] as $element) {
            $this->MySQL_IDsync[$importSetKey][$element] = 'lost';
        }
        foreach ($this->dataIdSet[$importSetKey] as $element) {
            if(in_array($element, $this->constantDataSet_MySQL[$mysqlSetKey])) {
                $this->MySQL_IDsync[$importSetKey][$element] = 'old';
            } else {
                $this->MySQL_IDsync[$importSetKey][$element] = 'new';
            }
        }
    }
    private function generateQueriesMySQL_DeleteDataLinks($deleteSetKey,$table,$column,$importSetKey,$mysqlSetKey,$add = false) {
        if(!$add || !isset($this->MySQL_QUERIES['DeleteDataLinks'][$deleteSetKey])) {
            $this->MySQL_QUERIES['DeleteDataLinks'][$deleteSetKey] = array();
        }
        
        $counter = 0;
        $empty = true;
        $start = false;
        $queryStart = "DELETE FROM `".$table."` WHERE ";
        
        foreach ($this->MySQL_IDsync[$importSetKey] as $element => $type) {
            if($counter == 0) {
                $query = $queryStart;
                $start = true;
                $empty = true;
            }
            if($type != 'lost' && in_array($element,$this->constantDataSet_MySQL[$mysqlSetKey])) {
                $query .= "`".$column."` = '".$element."' OR ";
                $counter++;
                $empty = false;
            }
            if($counter == $this->QUERIES_SET_LIMIT) {
                $start = false;
                $counter = 0;
                $query = substr($query, 0,  strlen($query)-3).";";
                $this->MySQL_QUERIES['DeleteDataLinks'][$deleteSetKey][] = $query;
            }
        }
        if($start && !$empty) {
            $query = substr($query, 0,  strlen($query)-3).";";
            $this->MySQL_QUERIES['DeleteDataLinks'][$deleteSetKey][] = $query;
        }
    }
    private function generateQueriesMySQL_AddDataLinks($addSetKey,$table,$columns, $importSetKey) {
        $this->MySQL_QUERIES['AddDataLinks'][$addSetKey] = array();
        $counter = 0;
        $start = false;
        $empty = true;
        
        $queryStart = "INSERT INTO `".$table."` (";
        foreach ($columns as $column) {
            $queryStart .= "`".$column."`, ";
        }
        $queryStart = substr($queryStart, 0,  strlen($queryStart)-2).") VALUES ";
        
        
        foreach ($this->DATA[$importSetKey] as $element) {
            if($counter == 0) {
                $query = $queryStart;
                $start = true;
                $empty = true;
            }
            $query .= '(';
            foreach ($columns as $column) {
                if(isset($element[$column])) {
                    $query .= "'".$element[$column]."', ";
                } else {
                    $query .= 'NULL, ';
                }
            }
            $query = substr($query, 0,  strlen($query)-2)."), ";
            $counter++;
            $empty = false;
            if($counter == $this->QUERIES_SET_LIMIT) {
                $start = false;
                $counter = 0;
                $query = substr($query, 0,  strlen($query)-2).";";
                $this->MySQL_QUERIES['AddDataLinks'][$addSetKey][] = $query;
            }
        }
        if($start && !$empty) {
            $query = substr($query, 0,  strlen($query)-2).";";
            $this->MySQL_QUERIES['AddDataLinks'][$addSetKey][] = $query;
        }
    }
    private function generateQueriesMySQL_HideData($hideSetKey,$table,$updateColumn,$column,$idSyncKey) {
        $this->MySQL_QUERIES['HideData'][$hideSetKey] = array();
        
        $counter = 0;
        $empty = true;
        $start = false;
        $queryStart = "UPDATE `".$table."` SET `".$updateColumn."` = '0' WHERE ";
        
        
        foreach ($this->MySQL_IDsync[$idSyncKey] as $element => $type) {
            if($counter == 0) {
                $query = $queryStart;
                $start = true;
                $empty = true;
            }
            if($type == 'lost') {
                $query .= "`".$column."` = '".$element."' OR ";
                $counter++;
                $empty = false;
            }
            if($counter == $this->QUERIES_SET_LIMIT) {
                $start = false;
                $counter = 0;
                $query = substr($query, 0,  strlen($query)-3).";";
                $this->MySQL_QUERIES['HideData'][$hideSetKey][] = $query;
            }
        }
        if($start && !$empty) {
            $query = substr($query, 0,  strlen($query)-3).";";
            $this->MySQL_QUERIES['HideData'][$hideSetKey][] = $query;
        }
    }
    private function generateQueriesMySQL_DeleteData($hideSetKey,$table,$column,$idSyncKey) {
        $this->MySQL_QUERIES['DeleteData'][$hideSetKey] = array();
        foreach ($this->MySQL_IDsync[$idSyncKey] as $element => $type) {
            if($type == 'lost') {
                $this->MySQL_QUERIES['DeleteData'][$hideSetKey][] = "DELETE FROM `".$table."` WHERE `".$column."` = '".$element."';";
            }
        }
    }
    private function generateQueriesMySQL_UpdateData($apdateSetKey, $table, $columns, $importSetKey, $idColumn) {
        $this->MySQL_QUERIES['UpdateData'][$apdateSetKey] = array();
        foreach ($this->DATA[$importSetKey] as $element) {
            if($this->MySQL_IDsync[$importSetKey][$element[$idColumn]] == 'old') {
                $query = "UPDATE `".$table."` SET ";
                foreach ($columns as $column) {
                    if(isset($element[$column])) {
                        $query .= "`".$column."` = '".$element[$column]."', ";
                    } else {
                        $query .= "`".$column."` = NULL, ";
                    }
                }
                $query = substr($query, 0,  strlen($query)-2);
                $query .= " WHERE `".$idColumn."` = '".$element[$idColumn]."';";
                $this->MySQL_QUERIES['UpdateData'][$apdateSetKey][] = $query;
            }
        }
        $this->generateQueriesMySQL_AddData($apdateSetKey, $table, $columns, $importSetKey, $idColumn);
    }
    private function generateQueriesMySQL_AddData($addSetKey, $table, $columns, $importSetKey, $idColumn) {
        $this->MySQL_QUERIES['AddData'][$addSetKey] = array();
        $counter = 0;
        $start = false;
        $empty = true;
        
        $queryStart = "INSERT INTO `".$table."` (";
        foreach ($columns as $column) {
            $queryStart .= "`".$column."`, ";
        }
        $queryStart = substr($queryStart, 0,  strlen($queryStart)-2).") VALUES ";
        
        
        foreach ($this->DATA[$importSetKey] as $element) {
            if($this->MySQL_IDsync[$importSetKey][$element[$idColumn]] == 'new') {
                if($counter == 0) {
                    $query = $queryStart;
                    $start = true;
                    $empty = true;
                }
                $query .= '(';
                foreach ($columns as $column) {
                    if(isset($element[$column])) {
                        $query .= "'".$element[$column]."', ";
                    } else {
                        $query .= 'NULL, ';
                    }
                }
                $query = substr($query, 0,  strlen($query)-2)."), ";
                $counter++;
                $empty = false;
                if($counter == $this->QUERIES_SET_LIMIT) {
                    $start = false;
                    $counter = 0;
                    $query = substr($query, 0,  strlen($query)-2).";";
                    $this->MySQL_QUERIES['AddData'][$addSetKey][] = $query;
                }
            }
        }
        if($start && !$empty) {
            $query = substr($query, 0,  strlen($query)-2).";";
            $this->MySQL_QUERIES['AddData'][$addSetKey][] = $query;
        }
    }
    private function createMysqlScript() {        
        $this->SQL = '';
        $this->SQL .= "--\r\n";
        $this->SQL .= "-- Export Date: ".$this->logDate['exportDate2']."\r\n";
        $this->SQL .= "-- Export User: ".$this->logDate['exportUser']."\r\n";
        $this->SQL .= "--\r\n";
        $this->SQL .= "-- Import Date: ".$this->logDate['importDate2']."\r\n";
        $this->SQL .= "-- Import User: ".$this->yourUserData['ferstName']." ".$this->yourUserData['lastName']." [".$this->yourUserData['nickname']."]\r\n";
        $this->SQL .= "--\r\n";
        
        $this->SQL .= "\r\n--\r\n-- DeleteDataLinks\r\n--\r\n\r\n";
        $this->SQL .= $this->getMysqlScript('DeleteDataLinks');
        $this->SQL .= "\r\n--\r\n-- HideData\r\n--\r\n\r\n";
        $this->SQL .= $this->getMysqlScript('HideData');
        $this->SQL .= "\r\n--\r\n-- DeleteData\r\n--\r\n\r\n";
        $this->SQL .= $this->getMysqlScript('DeleteData');
        $this->SQL .= "\r\n--\r\n-- UpdateData\r\n--\r\n\r\n";
        $this->SQL .= $this->getMysqlScript('UpdateData');
        $this->SQL .= "\r\n--\r\n-- AddData\r\n--\r\n\r\n";
        $this->SQL .= $this->getMysqlScript('AddData');
        $this->SQL .= "\r\n--\r\n-- AddDataLinks\r\n--\r\n\r\n";
        $this->SQL .= $this->getMysqlScript('AddDataLinks');
        $this->SQL .= "\r\n--\r\n-- Success\r\n--\r\n\r\n";
        $this->SQL .= $this->getScriptToSuccess();
//        $this->FILE_SQL = $this->FILE.'apelsin1c.sql';
        file_put_contents($this->FILE_SQL, $this->SQL);
    }
    
    private function getMysqlScript($key) {
        $sql = '';
        foreach ($this->MySQL_QUERIES[$key] as $queries) {
            foreach ($queries as $query) {
                $sql .= $query."\r\n";
            }
        }
        return $sql;
    }
    
    public function execMysqlScript() {
        if(count($this->ERRORS) == 0) {
            return $this->SQL_HELPER->sqlFileExec($this->FILE_SQL);
        } else {
            return 'Есть ошибки';
        }
    }
    
    public function get_ERRORS() {
        return $this->ERRORS;
    }
    
    public function get_WARNINGS() {
        return $this->WARNINGS;
    }
    
    public function getLogDate() {
        return $this->logDate;
    }

    public function TEST_DATA() {
        echo '<pre>';
//        var_dump($this->constantDataSet_MySQL);
//        var_dump($this->MySQL_IDsync['Groups']);
//        var_dump($this->MySQL_QUERIES);

//        var_dump($this->constantDataSet);
//        var_dump($this->dataIdSet);
//        var_dump($this->DATA['Groups']);
//        var_dump($this->ERRORS);
//        var_dump($this->WARNINGS);
        echo '</pre>';
    }
}
