<?php
/**
 * Импорт выгрузки
 *
 * @author olga
 */
class AP_ShopImportXMLtoMYSQL {
    
    private $form;
    private $saveName = 'apelsin1c';
    private $dirName = './resources/Components/Shop/ImportFilesXML/';
    
    private $SQL_HELPER;
    private $yourUser;
    private $yourUserData;

    public function __construct() {
        global $_SQL_HELPER;
        $this->SQL_HELPER = $_SQL_HELPER;
        $this->getUserData();
        if($this->yourUser->checkAuthorization()) {
            $this->generateForm();
            $this->uploadFileXMLAndBackUpFiles();
        }
    }

    public function getHtml() {
        return $this->form;
    }
    
    /**
     * Данные о пользователе
     */
    private function getUserData() {
        $this->yourUser = new UserData();
        $this->yourUser->checkAuthorization();
        $this->yourUserData = $this->yourUser->getUserData();
    }
    
    /**
     *  Форма
     */
    private function generateForm() {
        $urlHelper = new UrlHelper();
        $this->form = "";
        $this->form .= '<form class="AP_Form" name="AP_Form" action="'.$urlHelper->getThisPage().'" enctype="multipart/form-data" method="post" accept-charset="UTF-8">';
        $this->form .= '<table class="AP_FormTable">';
                $file = InputHelper::loadFiles('uploadFile', 'uploadFile', 'uploadFileShopAdmin', true, false,'text/xml,application/xml');
                $this->form .= InputHelper::createFormRow($file, true, 'Выберите файл');
            $this->form .= '</table>';
            $this->form .= '<center><input class="AP_Submit" type="submit" name="AP_Submit" value="Импортировать"></center>';
        $this->form .= '</form>';
    }
    
    /**
     * Загрузка и бэкап файла XML и cоздание sql, log, html файлов
     */
    private function uploadFileXMLAndBackUpFiles() {
        if (isset($_POST['AP_Submit'])) {
            // загружаем файл
            $upload = new DownloadFile($this->dirName);
            $upload->setExtension('xml');
            $upload->uploadFile($this->saveName, 'uploadFile');
            $rename = $upload->getFileName();
            // делаем запись в логи 
            $this->recordActionLog();
            // делаем бэкап и получаем отчет
            if(ShopImportDataCheckHelper::CheckFile($this->dirName.$rename)) {
                if(ShopImportDataCheckHelper::CheckImportSuccess()) {
                    $shopImportData = new ShopImportData($rename);
                    $this->form .= $shopImportData->getReport();
                }
            }
        }
    }
    
    /**
     * Запись в логи таблица `ShopLogs`
     */
    private function recordActionLog() {
        $id = ID_GENERATOR::generateID();
        $date = date("Y-m-d h:i:s");
        $query = "INSERT INTO `ShopLogs` SET ";
        $query .= "`id` = '".$id."', ";
        $query .= "`user` = '".$this->yourUserData['login']."', ";
        $query .= "`actionType` = 'fill_unload_file', ";
        $query .= "`time` = '".$date."', ";
        $query .= "`title` = 'Заливка файла выгрузки', ";
        $query .= "`logtext` = 'Заливка файла выгрузки через панель администрирования';";
        $this->SQL_HELPER->insert($query);
    }
}