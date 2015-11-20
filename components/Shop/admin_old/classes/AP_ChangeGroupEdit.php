<?php
/**
 * Description of AP_ChangeGroupEdit
 *
 * @author olga
 */
class AP_ChangeGroupEdit extends AdminPanel_ComponentPanelUI_Element_Edit {

    private $dir = './resources/Components/Shop/Image/GroupsIcons/';
    private $yourUser;
    private $resoursFilesArray = [];

    public function getHtml() {
        return $this->form;
    }
    
    /**
     * Генерация формы
     */
    protected function getInputBlocks() { 
        $html = parent::getInputBlocks();
        $html .= $this->inputHelper->createFormRow_RowText('Группа');
        // id
        $html .= InputHelper::createFormRow($this->originalInsertValue['alias'], false, 'ID группы');
        // groupName
        $groupName = InputHelper::textBox('groupName', 'groupName', 'groupName', 100, true, $this->originalInsertValue['groupName']);
        $html .= InputHelper::createFormRow($groupName, true, 'Название группы');
        // imageOld
        $imageOld = '<img src="'.$this->getImageData().'?rel='.rand(1,999).'" style="max-height:300px; max-width:300px;" />';
        $html .= InputHelper::createFormRow($imageOld, false, 'Загруженное изображение');
        // image
        $image = '<input type="file" class="fileImage" name="fileImage" id="fileImage">';
        $html .= InputHelper::createFormRow($image, false, 'Изменить изображение');
        // shown
        $html .= $this->getFieldsSelect('shown', 'Показывать на сайте');
        // showInHierarchy	
        $html .= $this->getFieldsSelect('showInHierarchy', 'Показывать в иерархии');
        return $html;
    }

    /**
     * Получение данных
     */
    protected function getData() {
        parent::getData();
        $query = "SELECT * FROM `ShopGroups` WHERE `id` = '".$this->editElement."';";
        $this->data = $this->SQL_HELPER->select($query,1);
    }
    
    /**
     * Установка значений ввода по умолчанию
     */
    protected function setDefaltInput() {
        parent::setDefaltInput();
        $this->insertValue['alias'] = $this->data['id'];
        $this->insertValue['groupName'] = $this->data['groupName'];
        $this->insertValue['shown'] = $this->data['shown'];
        $this->insertValue['showInHierarchy'] = $this->data['showInHierarchy'];
        $this->originalInsertValue = $this->insertValue;
    }

    /**
     * Получение значений
     */
    protected function getAllValue() {
        parent::getAllValue();
        $this->insertValue['alias'] = $this->data['id'];
        $this->insertValue['groupName'] = parent::getPostValue('groupName');
        $this->insertValue['shown'] = parent::getPostValue('shown');
        $this->insertValue['showInHierarchy'] = parent::getPostValue('showInHierarchy');
    } 
    
    /**
     * Проверка значений
     */
    protected function checkAllValue() {                 
        parent::checkAllValue();
        $error = false;
        if (!$this->checkValue('shown',"/^[0-1]{1}$/")) {
            $error = true;
            $this->checkAllValueErrors[] = "Выберите значение";
        }
        if (!$this->checkValue('showInHierarchy',"/^[0-1]{1}$/")) {
            $error = true;
            $this->checkAllValueErrors[] = "Выберите значение";
        }
        return !$error;
    }
    
    /**
     * Выполнение изменения в таблице
     */
    protected function updateExecute() {
        parent::updateExecute();
        $query = "UPDATE `ShopGroups` SET ";
        $query .= "`groupName` = '".$this->insertValue['groupName']."', ";
        $query .= "`shown` = '".$this->insertValue['shown']."', ";
        $query .= "`showInHierarchy` = '".$this->insertValue['showInHierarchy']."' ";
        $query .= "WHERE `id` = '".$this->editElement."';";
        
        $this->SQL_HELPER->insert($query);
        $this->uploadFile();
        // делаем запись в логи 
        $this->getUserData();
        $this->recordActionLog();
    }
    
    /**
     * Проверить редактируемый элемент
     * @return type
     */
    protected function checkEditElement() {
        $query = "SELECT * FROM `ShopGroups` WHERE `id`='".$this->editElement."';";
        $result = $this->SQL_HELPER->select($query,1);
        return $result != null;
    }
    
    /**
     * Получить новый элемент для редактирования
     * @return type
     */
    protected function getNewEditElementID() {
        return $this->insertValue['alias'];
    }
    
    /**
     * Генерация полей Select 
     * @param type $key
     * @param type $text
     * @return type
     */
    private function getFieldsSelect($key, $text) {
        $select = InputHelper::select($key, $key, $this->yes_no, true, $this->originalInsertValue[$key]);
        $html = InputHelper::createFormRow($select, true, $text);
        return $html;
    }
    
    
    /**
     * Получить изображение
     * @return type
     */
    private function getImageData() {
        $desiredValue = $this->getImage($this->data['id']);
        if (file_exists($desiredValue)) {
            if ($desiredValue != null && $desiredValue != '') { 
                return $desiredValue; 
            }
        } else {
            echo 'Файла с таким названием не существует';
        }
    }
    
    /**
     * Уточнить расширение
     * @param type $item
     * @return type
     */
    private function getImage($item) {
        // если есть - jpg
        if (file_exists($this->dir.$item.'.jpg'))  {
            $image = $item.'.jpg';
        // если нет - посмотреть png
        } elseif (file_exists($this->dir.$item.'.png'))  {
            $image = $item.'.png';
        } else {
            $image = '';
        }
        return $this->dir.$image;
    } 
    
    /**
     * Проверка на дубликаты
     */
    private function cleanDirectoryOfDuplicates() {
        $this->scanDirResours();
        if ($this->resoursFilesArray !== null )  {
            $this->deleteDuplicates();
        } 
    }
    
    /**
     * Удаление дубликата
     */
    private function deleteDuplicates() {
        $pattern = $this->insertValue['alias'];
        foreach ($this->resoursFilesArray as $item) {
            if (preg_match('/^'.$pattern.'/', $item)) {
                if (file_exists($this->dir.$item)) {
                    // удалить дубликат 
                    unlink($this->dir.$item);
                }
            }
        }  
    }   
    
    /**
     * Получение списка файлов директории
     */
    private function scanDirResours() {
        //если директория существует и точно директория
        if (file_exists($this->dir) && is_dir($this->dir)) {
            // сканируем и считываем в массив
            $all = scandir($this->dir);
            foreach ($all as $file) {
                if (!is_dir($this->dir.$file)) {
                    $this->resoursFilesArray[] = $file;
                }
            }
        }
        return $this->resoursFilesArray;
    }
    
    /**
     * Загрузить новое изображение и сделать миниатюры
     */
    private function uploadFile() {
        if (isset($_POST['AP_Submit']) && $_POST['AP_Submit'] != '' && $_POST['AP_Submit'] != null && $_FILES['fileImage']['error'] == 0) {
            $this->cleanDirectoryOfDuplicates();
            $image = new DownloadFile($this->dir);
            $image->uploadFile($this->insertValue['alias'], 'fileImage');
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
        $query .= "`actionType` = 'change_group', ";
        $query .= "`time` = '".$date."', ";
        $query .= "`title` = 'Изменение группы через панель администрирования', ";
        $query .= "`logtext` = 'Измененa группa - ".$this->insertValue['alias']."';";
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
