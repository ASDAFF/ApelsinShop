<?php
/**
 * Description of AP_RemoveUnloadingShop
 *
 * @author olga
 */
class AP_RemoveUnloadingShop {
    
    private $form;
    private $dirXML = './resources/Components/Shop/ImportFilesXML/';
    private $dirMySQL = './resources/Components/Shop/ImportFilesMySQL/';
    private $dirLOG = './resources/Components/Shop/ImportLogsText/';
    private $dirHTML = './resources/Components/Shop/ImportLogsHtml/';
    private $filesArray  = array(); // файлы XML для удаления
    private $associatedFiles = array(); // файлы, ассоциированные с файлом XML 

    private $SQL_HELPER;
    private $yourUser;
    private $yourUserData;

    public function __construct() {
        global $_SQL_HELPER;
        $this->SQL_HELPER = $_SQL_HELPER;
        $this->getUserData();
        $this->getDataFile();
        if (!empty($this->filesArray)) {
            $this->getForm();
            $this->deleteFiles();
        } else {
            $this->form = " Файлы для импорта выгрузки отсутствуют";
        }
    }
    
    public function getHtml() {
        return $this->form;
    }
    
    /**
     *  Форма
     */
    private function getForm() {
        $urlHelper = new UrlHelper();
        $this->form = "";
        $this->form .= '<form class="AP_Form" name="AP_Form" enctype="multipart/form-data" action="'.$urlHelper->getThisPage().'" method="POST" accept - charset="UTF-8" required >';
            $this->form .= '<table class="AP_FormTable">';
            foreach ($this->filesArray as $file ) {
                $this->form .= '<tr>';
                    $this->form .= '<td class="FormTable_Input">';
                        $this->form .= '<div class="text">Файл для удаления</div>';
                    $this->form .= '</td>';
                    $this->form .= '<td class="FormTable_Input">';
                        $this->form .= '<div class="text">"'.$file.'"</div>';
                    $this->form .= '</td>';
                    $this->form .= '<td class="FormTable_Input">';
                        $this->form .= '<center><input type="checkbox" name="checkRemove[]" id="checkRemoveShopAdmin" value="'.$file.'" style="vertical-align:middle;"></center>';
                    $this->form .= '</td>';
                $this->form .= '</tr>';
            }
            $this->form .= '</table>';
            $this->form .= '<center><input class="AP_Submit" type="submit" name="AP_Submit" value="Удалить"></center>';
        $this->form .= '</form>';
    }
    
    /**
     * Получаем данные о файлах
     * @return string - массив файлов XML для удаления
     */
    private function getDataFile() {
        //если директория существует
        if (ShopImportDataCheckHelper::CheckFile($this->dirXML)) {
            // и точно директория
            if (is_dir($this->dirXML)) {
                // сканируем и считываем в массив
//                $all = array_diff(scandir($this->dirXML), array('..', '.'));
                $this->filesArray = array();
                $all = scandir($this->dirXML);
                foreach ($all as $element) {
                    if (!is_dir($this->dirXML.$element)) {
                        $this->filesArray[] = $element;
                    }
                }
                // для сортировки по убыванию (если надо)
                rsort($this->filesArray);
            }
        }
    }
    
    /**
     * Удаление бэкапов выгрузки
     */
    private function deleteFiles() {
        // если файл выбран
        if (isset($_POST['AP_Submit']) && isset($_POST['checkRemove']) && 
            $_POST['checkRemove'] != null && $_POST['checkRemove'] != '') {
            $arrCheckRemove = $_POST['checkRemove'];
            // удаляем:
            // если $arrCheckRemove заполнен
            if ($arrCheckRemove != null) {
                // получаем файл XML
                foreach ($arrCheckRemove as $file) {
                    // удаляем файлы sql, log, html 
                    $this->removeAssociatedFiles($file);
                    // удаляем файлы XML
                    if (ShopImportDataCheckHelper::CheckFile($this->dirXML.$file)) {
                        unlink($this->dirXML.$file);
                    }
                    $this->cleaningLogs($file);
                    // делаем запись в логи 
                    $this->recordActionLog($file);
                }
            }
        }
    }
    
    /**
     * Удаляем файлы, ассоциированые с файлом XML (sql, log, html) 
     */
    private function removeAssociatedFiles($file) {
        // получаем данные, ассоциированые с файлом XML
        $this->getAssociatedFiles($file);
        // если $this->associatedFiles заполнен
        if ($this->associatedFiles != null) {
            $this->removeAssociatedFileForType('sqlFile',$this->dirMySQL);
            $this->removeAssociatedFileForType('logFileText',$this->dirLOG);
            $this->removeAssociatedFileForType('logFileHtml',$this->dirHTML);
        }
    }
    private function removeAssociatedFileForType($type,$dir) {
        foreach ($this->associatedFiles[$type] as $file) {
            $path = $dir.$file;
            if (ShopImportDataCheckHelper::CheckFile($path)) {
                unlink($path);
//                echo $path.'<br> ';
            }
        }
    }
    
    /**
     * Получаем данные, ассоциированые с файлом XML
     * @param type $file - файл XML
     * @return type - массив "привязанных" файлов
     */
    private function getAssociatedFiles($file) {
        $query = "SELECT `sqlFile`, `logFileText`, `logFileHtml` FROM `ShopImportLogs` WHERE `xmlFile` = '".$file."';" ;
        $rezult = $this->SQL_HELPER->select($query);
        $this->associatedFiles['sqlFile'] = array();
        $this->associatedFiles['logFileText'] = array();
        $this->associatedFiles['logFileHtml'] = array();
        foreach ($rezult as $data) {
            $this->addAssociatedFile('sqlFile',$data);
            $this->addAssociatedFile('logFileText',$data);
            $this->addAssociatedFile('logFileHtml',$data);
        }
    }
    
    private function addAssociatedFile($key,$data) {
        if(!in_array($data[$key], $this->associatedFiles[$key])) {
            $this->associatedFiles[$key][] = $data[$key];
        }
    }
    
    /**
     * Удаление из базы таблица ShopImportLogs
     * @param type $file - файл XML
     */
    private function cleaningLogs($file) {
        $query = "DELETE FROM `ShopImportLogs` WHERE `xmlFile`='".$file."';";
        $this->SQL_HELPER->insert($query);
    }

    /**
     * Запись в логи таблица `ShopLogs`
     */
    private function recordActionLog($file) {
        $id = ID_GENERATOR::generateID(4);
        $date = date("Y-m-d h:i:s");
        $query = "INSERT INTO `ShopLogs` SET ";
        $query .= "`id` = '".$id."', ";
        $query .= "`user` = '".$this->yourUserData['login']."', ";
        $query .= "`actionType` = 'removal_unloading', ";
        $query .= "`time` = '".$date."', ";
        $query .= "`title` = 'Удаление выгрузки через панель администрирования', ";
        $query .= "`logtext` = 'Удален файл - ".$file."';";
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
