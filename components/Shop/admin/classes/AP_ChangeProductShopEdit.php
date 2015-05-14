<?php
/**
 * Description of AP_ChangeProductShopEdit
 *
 * @author olga
 */
class AP_ChangeProductShopEdit extends AdminPanel_ComponentPanelUI_Element_Edit {

    private $costData;
    private $dir = './resources/Components/Shop/Image/ItemsImage/';
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
        // Генерация полей для товара
        $html .= $this->inputHelper->createFormRow_RowText('Товар');
        // ---------- в виде инфы
        // itemName
        $itemName = '<div class="changeProductShopEdit">'.$this->originalInsertValue['itemName'].'</div>';
        $html .= InputHelper::createFormRow($itemName, false, 'Название товара');
        // id
        $html .= InputHelper::createFormRow($this->originalInsertValue['alias'], false, 'ID товара');
        // group
        $html .= InputHelper::createFormRow($this->originalInsertValue['group'], false, 'ID группы');
        // ---------- image
        // imageOld
        $imageOld = '<img src="'.$this->getImageData().'?rel='.rand(1,999).'" style="max-height:300px; max-width:300px;" />';
        $html .= InputHelper::createFormRow($imageOld, false, 'Загруженное изображение');
        // image
        $image = '<input type="file" class="fileImage" name="fileImage" id="fileImage">';
        $html .= InputHelper::createFormRow($image, false, 'Изменить изображение');
        // ---------- поля ввода
        // action
        $html .= $this->getFieldsSelect('action', 'Участие в акции');
        // shown
        $html .= $this->getFieldsSelect('shown', 'Показывать на сайте');
        // amount
        $html .= $this->getFieldsAmount('amount', 'Количество');
        // minAmount
        $html .= $this->getFieldsAmount('minAmount', 'Минимальное количество');
        // description
        $description = InputHelper::textarea('description', 'description', 'description', 5000, false, $this->originalInsertValue['description']);
        $html .= InputHelper::createFormRow($description, false, 'Описание');
        // Генерация полей для стоимости 
        $html .= InputHelper::createFormRow_RowText('Cтоимость');
        $html .= $this->getFieldsCosts();
        return $html;
    }

    /**
     * Получение данных
     */
    protected function getData() {
        parent::getData();
        $query = "SELECT * FROM `ShopItems` WHERE `id` = '".$this->editElement."';";
        $this->data = $this->SQL_HELPER->select($query,1);
        $query1 = "SELECT *
                    FROM (
                        SELECT *
                        FROM `ShopItemsPrices` WHERE `item` = '".$this->editElement."'
                        ) AS SIP
                    RIGHT JOIN `ShopPricesTypes` AS SPT
                    ON SPT.`id` = SIP.`price`;";
        $this->costData = $this->SQL_HELPER->select($query1);
    }
    
    /**
     * Установка значений ввода по умолчанию
     */
    protected function setDefaltInput() {
        parent::setDefaltInput();
        $this->insertValue['alias'] = $this->data['id'];
        $this->insertValue['itemName'] = $this->data['itemName'];
        $this->insertValue['group'] = $this->data['group'];
        $this->insertValue['action'] = $this->data['action'];
        $this->insertValue['amount'] = $this->data['amount'];
        $this->insertValue['minAmount'] = $this->data['minAmount'];
        $this->insertValue['description'] = $this->data['description'];
        $this->insertValue['shown'] = $this->data['shown'];
        if ($this->costData != null) {
            foreach ($this->costData as $costs) {
                $this->insertValue['item'][$costs['item']] = $costs['item'];
                $this->insertValue['price'][$costs['price']] = $costs['price'];
                $this->insertValue['value'][$costs['value']] = $costs['value'];
                $this->insertValue['id'][$costs['id']] = $costs['id'];
                $this->insertValue['typeName'][$costs['typeName']] = $costs['typeName'];
                $this->insertValue['default'][$costs['default']] = $costs['default'];
            }
        }
        $this->originalInsertValue = $this->insertValue;
    }

    /**
     * Получение значений
     */
    protected function getAllValue() {
        parent::getAllValue();
        $this->insertValue['alias'] = $this->data['id'];
        $this->insertValue['action'] = parent::getPostValue('action');
        $this->insertValue['amount'] = parent::getPostValue('amount');
        $this->insertValue['minAmount'] = parent::getPostValue('minAmount');
        $this->insertValue['description'] = parent::getPostValue('description');
        $this->insertValue['shown'] = parent::getPostValue('shown');
        foreach ($this->costData as $costs) {
            if (isset($_POST[$costs['id']]) && $_POST[$costs['id']] != null && $_POST[$costs['id']] != "") {
                $this->insertValue['value'][$costs['value']] = parent::getPostValue($costs['id']);
                $this->insertValue['id'][$costs['id']] = $costs['id'];
            }
        }
    } 
    
    /**
     * Проверка значений
     */
    protected function checkAllValue() {                 
        parent::checkAllValue();
        $error = false;
        if (!$this->checkValue('action',"/^[0-1]{1}$/")) {
            $error = true;
            $this->checkAllValueErrors[] = "Выберите значение";
        }
        if (!$this->checkValue('amount',"/^[\d]+$/")) {
            $error = true;
            $this->checkAllValueErrors[] = "Разрешены только цифры";
        }
        if (!$this->checkValue('minAmount',"/^[\d]+$/")) {
            $error = true;
            $this->checkAllValueErrors[] = "Разрешены только цифры";
        }
        if (!$this->checkValue('shown',"/^[0-1]{1}$/")) {
            $error = true;
            $this->checkAllValueErrors[] = "Выберите значение";
        }
        foreach ($this->costData as $costs) {
            if (isset($_POST[$costs['id']]) && $_POST[$costs['id']] != null && $_POST[$costs['id']] != "") {
                if (!$this->checkValue($costs['id'],"/^[\d\.]+$/")) {
                    $error = true;
                    $this->checkAllValueErrors[] = "Разрешены только цифры и точка";
                }
            } 
        }
        return !$error;
    }
    
    /**
     * Выполнение изменения в таблице
     */
    protected function updateExecute() {
        parent::updateExecute();
        $queryItems = "UPDATE `ShopItems` SET ";
        $queryItems .= "`action` = '".$this->insertValue['action']."', ";
        $queryItems .= "`amount` = '".$this->insertValue['amount']."', ";
        $queryItems .= "`minAmount` = '".$this->insertValue['minAmount']."', ";
        $queryItems .= "`shown` = '".$this->insertValue['shown']."' ";
        $queryItems .= "WHERE `id` = '".$this->editElement."';";
        
        $queryCostDel = "DELETE FROM `ShopItemsPrices` WHERE `item` = '".$this->editElement."';";
        $this->SQL_HELPER->insert($queryCostDel);
        
        foreach ($this->costData as $costs) {
            if (isset($this->insertValue['value'][$costs['value']]) && $this->insertValue['value'][$costs['value']] != null && $this->insertValue['value'][$costs['value']] != "" && 
                    isset($this->insertValue['id'][$costs['id']]) && $this->insertValue['id'][$costs['id']] != null && $this->insertValue['id'][$costs['id']] != "") {
                $query = "INSERT INTO `ShopItemsPrices` SET ";
                $query .= "`value`='".$this->insertValue['value'][$costs['value']]."', ";
                $query .= "`item` = '".$this->editElement."', ";
                $query .= "`price` = '".$this->insertValue['id'][$costs['id']]."';";
                $this->SQL_HELPER->insert($query);
            }
        }
        $this->SQL_HELPER->insert($queryItems);
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
        $query = "SELECT * FROM `ShopItems` WHERE `id`='".$this->editElement."';";
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
     * Генерация полей Amount
     * @param type $key
     * @param type $text
     * @return type
     */
    private function getFieldsAmount($key, $text) {
        $amount = InputHelper::paternTextBox($key, $key, $key, 10, true, "Только цифры", "^[\d]+$", $this->originalInsertValue[$key]);
        $html = InputHelper::createFormRow($amount, true, $text);
        return $html;
    }
    
    /**
     * Генерация полей Costs
     * @return type
     */
    private function getFieldsCosts() {
        $html = '';
        if ($this->costData != null) {
            foreach ($this->costData as $costs) {
                if ($this->originalInsertValue['default'][$costs['default']] == 1) {
                    $colorInput = 'colorInput';
                    $mandatory = true;
                } else {
                    $colorInput = 'cost';
                    $mandatory = false;
                }
                $cost = InputHelper::paternTextBox($this->originalInsertValue['id'][$costs['id']], 'cost', $colorInput, 50, $mandatory, "Только цифры и точка", "^[\d\.]+$", $this->originalInsertValue['value'][$costs['value']]);
                $html .= InputHelper::createFormRow($cost, $mandatory, $this->originalInsertValue['typeName'][$costs['typeName']]);
            }
        }
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
                    // удалить дубликат (оригинал и копии)
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
            $imageName = $image->getInfoFileUpload();
            $miniature = new MakeMiniature($imageName['file']);
            $miniature->setSizeMiniature(200);
            $miniature->setSizeMiniature(150);
            $miniature->setSizeMiniature(100);
            $miniature->setSizeMiniature(50);
            $miniature->makeMiniature();
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
        $query .= "`actionType` = 'change_product', ";
        $query .= "`time` = '".$date."', ";
        $query .= "`title` = 'Изменение товара через панель администрирования', ";
        $query .= "`logtext` = 'Изменен товар - ".$this->insertValue['alias']."';";
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
