<?php

/**
 * Description of AP_MaterialsCategoriesEdit
 *
 * @author olga
 */
class AP_MaterialsCategoriesEdit extends AdminPanel_ComponentPanelUI_Element_Edit {
    
    private $categoryLangData;
    private $categoryListsData;
    
    /**
     * Получение значений
     */
    protected function getAllValue() {
        parent::getAllValue();
        $this->insertValue['alias'] = parent::getPostValue('alias');
        $this->insertValue['created'] = parent::getPostValue('created');
        $this->insertValue['lastChange'] = parent::getPostValue('lastChange');
        if(isset($_POST['name']) && $_POST['name']!=null && $_POST['name']!="") {
            foreach ($_POST['name'] as $key => $value) {
                $this->insertValue['name'][$key] = parent::getMysqlText($value);
            }
        }
        if(isset($_POST['description']) && $_POST['description']!=null && $_POST['description']!="") {
            foreach ($_POST['description'] as $key => $value) {
                $this->insertValue['description'][$key] = parent::getMysqlText($value);
            }
        }
        if(isset($_POST['list']) && $_POST['list']!=null && $_POST['list']!="") {
            $this->insertValue['list'] = $_POST['list'];
        } else {
            $this->insertValue['list'] = array();
        }
    }
    
    /**
     * Проверка значений
     */
    protected function checkAllValue() {                 
        parent::checkAllValue();
        $error = false;
        if(!$this->checkValue('alias',"/^[A-Za-z0-9_-]{3,200}+$/u")) {
            $error = true;
            $this->checkAllValueErrors[] = "Разрешены латинские буквы, цифры и щаник тире и нижнее подчеркивание";
        }
        if(!$this->checkAlias()) {
            $error = true;
            $this->checkAllValueErrors[] = "Такой псевдоним уже используется";
        }
        if(!$this->checkValue('created',"/^[0-9]{4}-[0-9]{2}-[0-9]{2} [0-9]{2}:[0-9]{2}:[0-9]{2}$/")) {
            $error = true;
            $this->checkAllValueErrors[] = "Заполните поле в формате ГГГГ-ММ-ДД чч:мм:сс";
        }
        if(!$this->checkValue('lastChange',"/^[0-9]{4}-[0-9]{2}-[0-9]{2} [0-9]{2}:[0-9]{2}:[0-9]{2}$/")) {
            $error = true;
            $this->checkAllValueErrors[] = "Заполните поле в формате ГГГГ-ММ-ДД чч:мм:сс";
        }
        $local = false;
        foreach ($this->langArray as $langData) {
            if(isset($_POST['name'][$langData['lang']]) && $_POST['name'][$langData['lang']]!=null && $_POST['name'][$langData['lang']]!="" &&
                isset($_POST['description'][$langData['lang']]) && $_POST['description'][$langData['lang']]!=null && $_POST['description'][$langData['lang']]!="") {
                $local = true;
            }
        }
        if(!$local){
            $error = true;
            $this->checkAllValueErrors[] = "Хотя бы для одного языка должны быть заполнены текстовые поля";
        }
        return !$error;
    }
    
    /**
     * Установка значений ввода по умолчанию
     */
    protected function setDefaltInput() {
        parent::setDefaltInput();
        $this->insertValue['alias']=$this->data['alias'];
        $this->insertValue['created']=$this->data['created'];
        $this->insertValue['lastChange']=date("Y-m-d h:i:s");
        $this->insertValue['name']=array();
        $this->insertValue['description']=array();
        foreach ($this->langArray as $langData) {
            $this->insertValue['name'][$langData['lang']]='';
            $this->insertValue['description'][$langData['lang']]='';
        }
        if($this->categoryLangData != null) {
            foreach ($this->categoryLangData as $langData) {
                $this->insertValue['name'][$langData['lang']]=$langData['name'];
                $this->insertValue['description'][$langData['lang']]=$langData['description'];
            }
        }
        $this->insertValue['list']=array();
        if($this->categoryListsData!=null) {
            foreach ($this->categoryListsData as $key => $categoriesData) {
                $this->insertValue['list'][$key] = $categoriesData['list'];
            }
        }
        $this->originalInsertValue = $this->insertValue;
    }
    
    /**
     * Выполнение изменения в таблице
     */
    protected function updateExecute() {
        parent::updateExecute();
        $queryCategories = "UPDATE `MaterialsCategories` SET ";
        $queryCategories .= "`alias`='".$this->insertValue['alias']."', ";
        $queryCategories .= "`created`='".$this->insertValue['created']."', ";
        $queryCategories .= "`lastChange`='".$this->insertValue['lastChange']."' ";
        $queryCategories .= "WHERE `alias`='".$this->editElement."';";

        $queryCategories_Lang = array();
        foreach ($this->langArray as $langData) {
            if(isset($this->insertValue['name'][$langData['lang']]) && $this->insertValue['name'][$langData['lang']]!=null && 
                    $this->insertValue['name'][$langData['lang']]!="" && isset($this->insertValue['description'][$langData['lang']]) && 
                    $this->insertValue['description'][$langData['lang']]!=null && $this->insertValue['description'][$langData['lang']]!="") {
                $query = "INSERT INTO `MaterialsCategories_Lang` SET ";
                $query .= "`category`='".$this->insertValue['alias']."', ";
                $query .= "`lang`='".$langData['lang']."', ";
                $query .= "`name`='".$this->insertValue['name'][$langData['lang']]."', ";
                $query .= "`description`='".$this->insertValue['description'][$langData['lang']]."';";
                $queryCategories_Lang[] = $query;
            }
        }

        $queryCategoriesInLists = array();
        if($this->insertValue['list']!=null) {
            $querySequence = "SELECT `sequence` FROM `MaterialsCategoriesInList` ;";
            $sequence = $this->SQL_HELPER->select($querySequence);
            $count = array();
            foreach ($sequence as $seq) {
                $count[] = $seq['sequence'];
            }
            if($count != null) {
                $sequenceFinal = max($count)+1;
            } 
            foreach ($this->insertValue['list'] as $list) {
                $query = "INSERT INTO `MaterialsCategoriesInList` SET ";
                $query .= "`category`='".$this->insertValue['alias']."', ";
                $query .= "`list`='".$list."',";
                $query .= "`sequence`='".$sequenceFinal."';";
                $queryCategoriesInLists[]=$query;
            }
        }

        $queryCategories_LangDel = "DELETE FROM  `MaterialsCategories_Lang` WHERE  `category` =  '".$this->editElement."'";
        $this->SQL_HELPER->insert($queryCategories_LangDel);
        $queryCategoriesInListDel = "DELETE FROM `MaterialsCategoriesInList` WHERE `category` =  '".$this->editElement."'";
        $this->SQL_HELPER->insert($queryCategoriesInListDel);
        
        $this->SQL_HELPER->insert($queryCategories);
        foreach($queryCategories_Lang as $queryCategories_Lg) {
            $this->SQL_HELPER->insert($queryCategories_Lg);
        }
        foreach($queryCategoriesInLists as $queryCategoriesInList) {
            $this->SQL_HELPER->insert($queryCategoriesInList);
        }
    }
    
    /**
     * Генерация форм ввода не зависимых от языка
     */
    protected function getInputBlocks() { 
        $html = parent::getInputBlocks();
        // alias
        $alias = $this->inputHelper->paternTextBox('alias', 'alias', 'alias', 200, true, 'Латиница, цифры и знаки - и _', '[A-Za-z0-9_-]{3,200}', $this->originalInsertValue['alias']);
        $html .= $this->inputHelper->createFormRow($alias, true, 'Alias');
        // created
        $created = $this->inputHelper->paternTextBox('created', 'created', 'created', 25, true, 'ГГГГ-ММ-ДД чч:мм:сс', '[0-9]{4}-[0-9]{2}-[0-9]{2} [0-9]{2}:[0-9]{2}:[0-9]{2}', $this->originalInsertValue['created']);
        $html .= $this->inputHelper->createFormRow($created, true, 'Создано');
        // created
        $lastChange = $this->inputHelper->paternTextBox('lastChange', 'lastChange', 'lastChange', 25, true, 'ГГГГ-ММ-ДД чч:мм:сс', '[0-9]{4}-[0-9]{2}-[0-9]{2} [0-9]{2}:[0-9]{2}:[0-9]{2}', $this->originalInsertValue['lastChange']);
        $html .= $this->inputHelper->createFormRow($lastChange, true, 'Изменено');
        // list
        $list = $this->inputHelper->getChekBoxGroup('list', 'list', $this->MaterialsCategoriesList(), false, $this->originalInsertValue['list']);
        $html .= $this->inputHelper->createFormRow($list, false, 'Списки');
        return $html;
    }
    
    /**
     * Генерация форм ввода зависимых от языка
     */
    protected function getInputLangBlocks($lang) {
        $html = parent::getInputLangBlocks($lang);
        // name
        $title = $this->inputHelper->textBox('name['.$lang.']', 'name', 'name', 200, false, $this->originalInsertValue['name'][$lang]);
        $html .= $this->inputHelper->createFormRow($title, false, 'Название');
        // description
        $text = $this->inputHelper->textarea('description['.$lang.']', 'description', 'description', 50000, false, $this->originalInsertValue['description'][$lang]);
        $html .= $this->inputHelper->createFormRow($text, false, 'Описание');
        return $html;
    }
    
    protected function getData() {
        parent::getData();
        $query = "SELECT * FROM `MaterialsCategories` WHERE `alias`='".$this->editElement."';";
        $this->data = $this->SQL_HELPER->select($query,1);
        $query = "SELECT * FROM `MaterialsCategories_Lang` WHERE `category`='".$this->editElement."';";
        $this->categoryLangData = $this->SQL_HELPER->select($query);
        $query = "SELECT * FROM `MaterialsCategoriesInList` WHERE `category`='".$this->editElement."';";
        $this->categoryListsData = $this->SQL_HELPER->select($query);
    }
    
    protected function checkEditElement() {
        $query = "SELECT * FROM `MaterialsCategories` WHERE `alias`='".$this->editElement."';";
        $result = $this->SQL_HELPER->select($query,1);
        return $result != null;
    }
    
    protected function getNewEditElementID() {
        return $this->insertValue['alias'];
    }
    
    /* Новые функции */
    
    private function checkAlias() {
        if($this->editElement == $_POST['alias']) {
            return true;
        }
        $result = array();
        if(isset($_POST['alias']) && $_POST['alias']!=null && $_POST['alias']!="") {
            $query = "SELECT * FROM `MaterialsCategories` WHERE `alias`='".$_POST['alias']."';";
            $result = $this->SQL_HELPER->select($query,1);
        }
        return $result == null;
    }
    
    private function MaterialsCategoriesList() {
        $categories = array();
        $query = "SELECT * FROM  `MaterialsCategoriesList`;";
        $result = $this->SQL_HELPER->select($query);
        foreach ($result as $key => $value) {
            $categories[$key]['text']=$this->getMaterialCategoriesDataText($value['name']);
            $categories[$key]['value']=$value['name'];
            $categories[$key]['checked']="0";
        }
        return $categories;
    }
    
    private function getMaterialCategoriesDataText($list) {
        $title = "";
        $this->langHelper = new LangHelper("MaterialsCategoriesList_Lang","lang","list",$list,$this->thisLang);
        $this->langType = $this->langHelper->getLangType();
        if($this->langType != -1){
            $langData = $this->langHelper->getLangData();
            $title = $langData["name"];
        }
        return $title;
    }
    
}