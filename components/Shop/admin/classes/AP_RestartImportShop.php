<?php
/**
 * Ручной импорт выгрузки
 *
 * @author olga
 */
class AP_RestartImportShop {
    
    private $form;
    private $dirName = './resources/Components/Shop/ImportFilesXML/';
    private $filesArray  = array();
    
    private $SQL_HELPER;
    private $yourUser;
    private $yourUserData;

    public function __construct() {
        global $_SQL_HELPER;
        $this->SQL_HELPER = $_SQL_HELPER;
        $this->getUserData();
        if ($this->yourUser->checkAuthorization()) {
            $this->getDataFile();
            if (!empty($this->filesArray)) {
                $this->generateForm();
                $this->execute();
            } else {
                $this->form = " Файлы для импорта выгрузки отсутствуют";
            }
        }
        
    }
    
    public function getHtml() {
        return $this->form;
    }
    
    /**
     *  Форма
     */
    private function generateForm() {
        $urlHelper = new UrlHelper();
        $this->form = "";
        $this->form .= '<form class="AP_Form" name="AP_Form" action="'.$urlHelper->getThisPage().'" enctype="multipart/form-data" method="post" accept-charset="UTF-8">';
        $this->form .= '<table class="AP_FormTable">';
                $file = InputHelper::select('fileXML', 'fileXML', $this->generateDataFileSelect(), true, "NONE");
                $this->form .= InputHelper::createFormRow($file, true, 'Выберите файл');
            $this->form .= '</table>';
            $this->form .= '<center><input class="AP_Submit" type="submit" name="AP_Submit" value="Импортировать"></center>';
        $this->form .= '</form>';
    }
    
    /**
     * Получаем данные о файлах
     * @return string
     */
    private function getDataFile() {
        //если директория существует
        if (ShopImportDataCheckHelper::CheckFile($this->dirName) && is_dir($this->dirName)) {
            // считываем в массив
            foreach (glob($this->dirName."*.[xX][mM][lL]") as $filename) {
                $this->filesArray[] = str_replace($this->dirName,'',$filename);
            }
            // для сортировки по убыванию (если надо)
            rsort($this->filesArray);
        }
    }
    
    /**
     * Формируем массив для select
     */
    private function generateDataFileSelect() {
        $files = array();
        $i = 0;
        $files[$i]['value'] = 'NONE';
        $files[$i++]['text'] = "Выберите файл";
        foreach ($this->filesArray as $value) {
            $files[$i]['value'] = $value;
            $files[$i++]['text'] = $value;
        }
        return $files;
    }

    /** 
     * Выгрузка  и бэкап файла XML и cоздание sql, log, html файлов
     */
    private function execute() {
        // если файл выбран
        if (isset($_POST['AP_Submit']) && isset($_POST['fileXML']) && 
                $_POST['fileXML'] != null && $_POST['fileXML'] !== "") {
            if ($_POST['fileXML'] != "NONE") {
                $fileName = $_POST['fileXML'];
                // делаем запись в логи 
                $this->recordActionLog();
                // делаем бэкап и получаем отчет
                if(ShopImportDataCheckHelper::CheckFile($this->dirName.$fileName)) {
                    if(ShopImportDataCheckHelper::CheckImportSuccess()) {
                        $shopImportData = new ShopImportData($fileName);
                        $this->form .= $shopImportData->getReport();
                    }
                }
            } else {
                $this->form .= "Выберите файл для выгрузки.";
            } 
        } 
    }
    
    /**
     * Запись в логи таблица `ShopLogs`
     */
    private function recordActionLog() {
        $id = ID_GENERATOR::generateID(4);
        $date = date("Y-m-d h:i:s");
        $query = "INSERT INTO `ShopLogs` SET ";
        $query .= "`id` = '".$id."', ";
        $query .= "`user` = '".$this->yourUserData['login']."', ";
        $query .= "`actionType` = 'start_by_hand_importing', ";
        $query .= "`time` = '".$date."', ";
        $query .= "`title` = 'Запуск ручного импорта', ";
        $query .= "`logtext` = 'Запуск повторного импорта выгрузки через панель администрирования';";
        $this->SQL_HELPER->insert($query);
    }
    
    /**
     * Данные о пользователе
     */
    private function getUserData() {
        $this->yourUser = new UserData();
        $this->yourUser->checkAuthorization();
        $this->yourUserData = $this->yourUser->getUserData();
    }
}



//<?php
///**
// * Description of AP_RemoveUnloadingShop
// *
// * @author olga
// */
//class AP_RemoveUnloadingShop {
//    
////    apelsin1c_2015.02.25_17:37:50.xml
//    
//    private $form;
//    private $dirXML = './resources/Components/Shop/ImportFilesXML/';
//    private $dirMySQL = './resources/Components/Shop/ImportFilesMySQL/';
//    private $dirLOG = './resources/Components/Shop/ImportLogsText/';
//    private $dirHTML = './resources/Components/Shop/ImportLogsHtml/';
//    private $filesArray  = array(); // файлы XML для удаления
//    private $associatedFiles = array(); // файлы, ассоциированные с файлом XML 
//
//    private $SQL_HELPER;
//    private $yourUser;
//    private $yourUserData;
//
//    public function __construct() {
//        global $_SQL_HELPER;
//        $this->SQL_HELPER = $_SQL_HELPER;
//        $this->getUserData();
//        $this->getDataFile();
//        if (!empty($this->filesArray)) {
//            $this->getForm();
//            $this->deleteFiles();
//        } else {
//            $this->form = " Файлы для импорта выгрузки отсутствуют";
//        }
//    }
//    
//    public function getHtml() {
//        return $this->form;
//    }
//    
//    /**
//     *  Форма
//     */
//    private function getForm() {
//        $urlHelper = new UrlHelper();
//        $this->form = "";
//        $this->form .= '<form class="AP_Form" name="AP_Form" enctype="multipart/form-data" action="'.$urlHelper->getThisPage().'" method="POST" accept - charset="UTF-8" required >';
//            $this->form .= '<table class="AP_FormTable">';
//            foreach ($this->filesArray as $file ) {
//                $this->form .= '<tr>';
//                    $this->form .= '<td class="FormTable_Input">';
//                        $this->form .= '<div class="text">Файл для удаления</div>';
//                    $this->form .= '</td>';
//                    $this->form .= '<td class="FormTable_Input">';
//                        $this->form .= '<div class="text">"'.$file.'"</div>';
//                    $this->form .= '</td>';
//                    $this->form .= '<td class="FormTable_Input">';
//                        $this->form .= '<center><input type="checkbox" name="checkRemove[]" id="checkRemoveShopAdmin" value="'.$file.'" style="vertical-align:middle;"></center>';
//                    $this->form .= '</td>';
//                $this->form .= '</tr>';
//            }
//            $this->form .= '</table>';
//            $this->form .= '<center><input class="AP_Submit" type="submit" name="AP_Submit" value="Удалить"></center>';
//        $this->form .= '</form>';
//    }
//    
//    /**
//     * Получаем данные о файлах
//     * @return string - массив файлов XML для удаления
//     */
//    private function getDataFile() {
//        //если директория существует
//        if (ShopImportDataCheckHelper::CheckFile($this->dirXML)) {
//            // и точно директория
//            if (is_dir($this->dirXML)) {
//            // сканируем и считываем в массив
//            $this->filesArray = array();
//            $this->filesArray = array_diff(scandir($this->dirXML), array('..', '.'));
//            // для сортировки по убыванию (если надо)
//            rsort($this->filesArray);
//            }
//        }
//        return;
//    }
//    
//    /**
//     * Удаление бэкапов выгрузки
//     */
//    private function deleteFiles() {
//        // если файл выбран
//        $arrCheckRemove =  array();
//        if (isset($_POST['AP_Submit']) && isset($_POST['checkRemove']) && 
//            $_POST['checkRemove'] != null && $_POST['checkRemove'] != '') {
//            $arrCheckRemove = $_POST['checkRemove'];
//            // удаляем:
//            // если $arrCheckRemove заполнен
//            if ($arrCheckRemove != null) {
//                // получаем файл XML
//                foreach ($arrCheckRemove as $file) {
//                    // получаем данные, ассоциированые с файлом XML (sql, log, html)
////                    $this->getAssociatedFiles('sqlFile',$file);
//                        $this->getAssociatedFiles($file);
//                 
//                    
//                    
//                    
//                    // если $this->associatedFiles заполнен
////                    if ($this->associatedFiles != null) {
//                    // удаляем файлы sql, log, html 
//                        $this->removeAssociatedFiles();
////                    }
//                    // удаляем файлы XML
////                    if (ShopImportDataCheckHelper::CheckFile($this->dirXML.$file)) {
////                        unlink($this->dirXML.$file);
////                    }
//                }
//            // чистим логи
////            $this->cleaningLogs($file);
//            }
//            
//            // делаем запись в логи 
////            $this->recordActionLog();
//        }
//    }
//    
//    /**
//     * Удаляем файлы, ассоциированые с файлом XML (sql, log, html) 
//     */
//    private function removeAssociatedFiles() {
//    }
//
//    /**
//     * Удаление файлов
//     * @param type $dir - в какой директории
//     * @param type $array - какие файлы
//     */
//    
//    
//     private function removeFile($path) {
//        echo '111<br>';
//        
//            if (file_exists($path)) {
//            
//                echo $path.'<br>';
//        echo '222<br>';
////                unlink($path);
//        echo '333<br>';
////                echo $path.'<br>';
//                clearstatcache();
//        echo '444<br>';
//            } 
//    }
//    /**
//     * Получаем данные, ассоциированые с файлом XML
//     * @param type $file - файл XML
//     * @return type - массив "привязанных" файлов
//     */
//    private function getAssociatedFiles($file) {
//        $query = "SELECT `sqlFile`, `logFileText`, `logFileHtml` FROM `ShopImportLogs` WHERE `xmlFile` = '".$file."';" ;
//        $this->associatedFiles = $this->SQL_HELPER->select($query);
//        foreach ($this->associatedFiles as $keys) {
//            foreach ($keys as $key => $file) {
//                echo $key.'<br>';
//            $arrayDir = array('logFileText' => $this->dirLOG,
//                    'sqlFile' => $this->dirMySQL,
//                    'logFileHtml' => $this->dirHTML);
//                if (file_exists($arrayDir[$key].$file)) {
//                    echo $this->dirMySQL.$file.'<br> ';
//                }
//            }
//        }
//        echo '<pre>';
//        var_dump($this->associatedFiles);
//        echo '</pre>';
//    }
//    
//    /**
//     * Удаление из базы таблица ShopImportLogs
//     * @param type $file - файл XML
//     */
//    private function cleaningLogs($file) {
//        $query = "DELETE FROM `ShopImportLogs` WHERE `xmlFile`='".$file."';";
//        $this->SQL_HELPER->insert($query);
//    }
//
//    /**
//     * Запись в логи таблица `ShopLogs`
//     */
//    private function recordActionLog() {
//        $id = ID_GENERATOR::generateID(4);
//        $date = date("Y-m-d h:i:s");
//        $query = "INSERT INTO `ShopLogs` SET ";
//        $query .= "`id` = '".$id."', ";
//        $query .= "`user` = '".$this->yourUserData['login']."', ";
//        $query .= "`actionType` = 'removal_unloading', ";
//        $query .= "`time` = '".$date."', ";
//        $query .= "`title` = 'Удаление выгрузки', ";
//        $query .= "`logtext` = 'Удаление выгрузки через панель администрирования';";
//        $this->SQL_HELPER->insert($query);
//    }
//    
//    /**
//     * Данные о пользователе
//     */
//    private function getUserData() {
//        $this->yourUser = new UserData();
//        $this->yourUser->checkAuthorization();
//        $this->yourUserData = $this->yourUser->getUserData();
//    }
//}
//
//        
//        
////        $arrayDir = array('sqlFile' => $this->dirMySQL,
////                'logFileText' => $this->dirLOG,
////                'logFileHtml' => $this->dirHTML);
////       
////        $this->removeFile($arrayDir[$key], $value);
//            
////            switch ($key) {
////                case 'sqlFile':
////                    $this->removeFile($this->dirMySQL,$value);
//////                        foreach ($value as $file) {
////                            echo '<br>'.$key;
////////            unlink($dir.$file);
//////                        }
//////        
////                    echo 'sqlFile<br>';
////                    break;
////                case 'logFileText':
////                    
////                    $this->removeFile($this->dirLOG,$value);
////                    echo 'logFileText<br>';
//////                        foreach ($value as $file) {
//////                            echo '<br>'.$this->dirLOG.$file;
////////            unlink($dir.$file);
//////                        }
////                    break;
////                case 'logFileHtml':
////                    $this->removeFile($this->dirHTML,$value);
//////                        foreach ($value as $file) {
//////                            echo '<br>'.$this->dirHTML.$file;
////////            unlink($dir.$file);
//////                        }
////                    echo 'logFileHtml<br>';
////                    break;
////                default:
////                    break;
////            }
