<?php
/**
 * Description of AP_MaterialsCategoriesInListEdit
 *
 * @author olga
 */
class AP_MaterialsCategoriesInListEdit extends AdminPanel_ComponentPanelUI_Element_Edit {
    
    private $listLangData;
    private $listCategoriesData;
    
    /**
     * Получение значений
     */
    protected function getAllValue() {
        parent::getAllValue();
        $this->insertValue['alias'] = parent::getPostValue('alias');
        $this->insertValue['showFullMaterialsText'] = parent::getPostValue('showFullMaterialsText');
        $this->insertValue['showShortMaterialsText'] = parent::getPostValue('showShortMaterialsText');
        $this->insertValue['showCategories'] = parent::getPostValue('showCategories');
        $this->insertValue['showCreated'] = parent::getPostValue('showCreated');
        $this->insertValue['showChange'] = parent::getPostValue('showChange');
        $this->insertValue['categorialsAsURL'] = parent::getPostValue('categorialsAsURL');
        $this->insertValue['titleAsURL'] = parent::getPostValue('titleAsURL');
        $this->insertValue['showAllOnPage'] = parent::getPostValue('showAllOnPage');
        $this->insertValue['onPage'] = parent::getPostValue('onPage');
        $this->insertValue['maxPages'] = parent::getPostValue('maxPages');
        $this->insertValue['categories'] = parent::getOriginalPostValue('categories');
        
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
        
        if(isset($_POST['categories']) && $_POST['categories']!=null && $_POST['categories']!="") {
            foreach ($_POST['categories'] as $category => $sequence) {
                if ($sequence != null && $sequence != '') {
                    $key = parent::getMysqlText($category);    
                    $this->insertValue['categories'][$key] = parent::getMysqlText($sequence);
                }  
            }
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
        if(!$this->checkValue('showFullMaterialsText',"/^[0-1]{1}$/")) {
            $error = true;
            $this->checkAllValueErrors[] = "Выберите значение";
        }
        if(!$this->checkValue('showShortMaterialsText',"/^[0-1]{1}$/")) {
            $error = true;
            $this->checkAllValueErrors[] = "Выберите значение";
        }
        if(!$this->checkValue('showCategories',"/^[0-1]{1}$/")) {
            $error = true;
            $this->checkAllValueErrors[] = "Выберите значение";
        }
        if(!$this->checkValue('showCreated',"/^[0-1]{1}$/")) {
            $error = true;
            $this->checkAllValueErrors[] = "Выберите значение";
        }
        if(!$this->checkValue('showChange',"/^[0-1]{1}$/")) {
            $error = true;
            $this->checkAllValueErrors[] = "Выберите значение";
        }
        if(!$this->checkValue('categorialsAsURL',"/^[0-1]{1}$/")) {
            $error = true;
            $this->checkAllValueErrors[] = "Выберите значение";
        }
        if(!$this->checkValue('titleAsURL',"/^[0-1]{1}$/")) {
            $error = true;
            $this->checkAllValueErrors[] = "Выберите значение";
        }
        if(!$this->checkValue('showAllOnPage',"/^[0-1]{1}$/")) {
            $error = true;
            $this->checkAllValueErrors[] = "Выберите значение";
        }
        if(!$this->checkValue('onPage',"/^[0-9_-]{1,5}+$/u")) {
            $error = true;
            $this->checkAllValueErrors[] = "Разрешены цифры";
        }
        if(!$this->checkValue('maxPages',"/^[0-9_-]{1,5}+$/u")) {
            $error = true;
            $this->checkAllValueErrors[] = "Разрешены цифры";
        }
        if(!$this->checkSequence($_POST['categories'])) {
            $error = true;
            $this->checkAllValueErrors[] = "Значение приоритета показа должно быть уникально";
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
    
    protected function getData() {
        parent::getData();
        $query = "SELECT * FROM `MaterialsCategoriesList` WHERE `name`='".$this->editElement."';";
        $this->data = $this->SQL_HELPER->select($query,1);
        $query = "SELECT * FROM `MaterialsCategoriesList_Lang` WHERE `list`='".$this->editElement."';";
        $this->listLangData = $this->SQL_HELPER->select($query);
        $query = "SELECT * FROM `MaterialsCategoriesInList` WHERE `list`='".$this->editElement."';";
        $this->listCategoriesData = $this->SQL_HELPER->select($query);
    } 
    
    /**
     * Установка значений ввода по умолчанию
     */
    protected function setDefaltInput() { 
        parent::setDefaltInput();
        $this->insertValue['alias']= $this->data['name'];
        $this->insertValue['showFullMaterialsText']=$this->data['showFullMaterialsText'];
        $this->insertValue['showShortMaterialsText']=$this->data['showShortMaterialsText'];
        $this->insertValue['showCategories']=$this->data['showCategories'];
        $this->insertValue['showCreated']=$this->data['showCreated'];
        $this->insertValue['showChange']=$this->data['showChange'];
        $this->insertValue['categorialsAsURL']=$this->data['categorialsAsURL'];
        $this->insertValue['titleAsURL']=$this->data['titleAsURL'];
        $this->insertValue['showAllOnPage']=$this->data['showAllOnPage'];
        $this->insertValue['onPage']=$this->data['onPage'];
        $this->insertValue['maxPages']=$this->data['maxPages'];
        $this->insertValue['name']=array();
        $this->insertValue['description']=array();
        foreach ($this->langArray as $langData) {
            $this->insertValue['name'][$langData['lang']]='';
            $this->insertValue['description'][$langData['lang']]='';
        }
        foreach ($this->listLangData as $langData) {
            $this->insertValue['name'][$langData['lang']]=$langData['name'];
            $this->insertValue['description'][$langData['lang']]=$langData['description'];
        }
        $this->insertValue['categories']=array();
        if($this->listCategoriesData!=null) {
            foreach ($this->listCategoriesData as $key => $categoriesData) {
                $key = $categoriesData['category'];
                $this->insertValue['categories'][$key]= $categoriesData['sequence'];
            }
        }
        $this->originalInsertValue = $this->insertValue;
    }  
    
    /**
     * Генерация форм ввода не зависимых от языка
     */
    protected function getInputBlocks() { 
        $html = parent::getInputBlocks();
        // alias
        $name = $this->inputHelper->paternTextBox('alias', 'alias', 'alias', 200, true, 'Латиница, цифры и знаки - и _', '[A-Za-z0-9_-]{3,200}', $this->originalInsertValue['alias']);
        $html .= $this->inputHelper->createFormRow($name, true, 'Alias');
        // showFullMaterialsText
        $showFullMaterialsText = $this->inputHelper->select('showFullMaterialsText', 'showFullMaterialsText', $this->yes_no, true, $this->originalInsertValue['showFullMaterialsText']);
        $html .= $this->inputHelper->createFormRow($showFullMaterialsText, true, 'Показывать текст предпросмотра материала');
        // showShortMaterialsText
        $showShortMaterialsText = $this->inputHelper->select('showShortMaterialsText', 'showShortMaterialsText', $this->yes_no, true, $this->originalInsertValue['showShortMaterialsText']);
        $html .= $this->inputHelper->createFormRow($showShortMaterialsText, true, 'Показывать короткий текст материала');
        // showCategories
        $showCategories = $this->inputHelper->select('showCategories', 'showCategories', $this->yes_no, true, $this->originalInsertValue['showCategories']);
        $html .= $this->inputHelper->createFormRow($showCategories, true, 'Показывать категории');
        // showCreated
        $showCreated = $this->inputHelper->select('showCreated', 'showCreated', $this->yes_no, true, $this->originalInsertValue['showCreated']);
        $html .= $this->inputHelper->createFormRow($showCreated, true, 'Показывать дату создания');
        // showChange
        $showChange = $this->inputHelper->select('showChange', 'showChange', $this->yes_no, true, $this->originalInsertValue['showChange']);
        $html .= $this->inputHelper->createFormRow($showChange, true, 'Показывать дату изменения');
        // categorialsAsURL
        $categorialsAsURL = $this->inputHelper->select('categorialsAsURL', 'categorialsAsURL', $this->yes_no, true, $this->originalInsertValue['categorialsAsURL']);
        $html .= $this->inputHelper->createFormRow($categorialsAsURL, true, 'Показывать URL категории');
        // titleAsURL
        $titleAsURL = $this->inputHelper->select('titleAsURL', 'titleAsURL', $this->yes_no, true, $this->originalInsertValue['titleAsURL']);
        $html .= $this->inputHelper->createFormRow($titleAsURL, true, 'Показывать URL заголовка');
        // showAllOnPage
        $showAllOnPage = $this->inputHelper->select('showAllOnPage', 'showAllOnPage', $this->yes_no, true, $this->originalInsertValue['showAllOnPage']);
        $html .= $this->inputHelper->createFormRow($showAllOnPage, true, 'Все материалы на одной странице');
        // onPage
        $onPage = $this->inputHelper->paternTextBox('onPage', 'onPage', 'onPage', 11, true, 'Цифры ', '[0-9_-]{1,5}', $this->originalInsertValue['onPage']);
        $html .= $this->inputHelper->createFormRow($onPage, true, 'Количество материалов на странице');
        // maxPages
        $maxPages = $this->inputHelper->paternTextBox('maxPages', 'maxPages', 'maxPages', 11, true, 'Цифры ', '[0-9_-]{1,5}', $this->originalInsertValue['maxPages']);
        $html .= $this->inputHelper->createFormRow($maxPages, true, 'Максимальное количество страниц');
        // categories
        $html .= $this->inputHelper->createFormRow_RowText('Категории');
        $html .= $this->getCategories();
        return $html;
    }
    
    /**
     * Генерация форм ввода зависимых от языка
     */
    protected function getInputLangBlocks($lang) {
        $html = parent::getInputLangBlocks($lang);
        // name
        $name = $this->inputHelper->textBox('name['.$lang.']', 'name', 'name', 200, false, $this->originalInsertValue['name'][$lang]);
        $html .= $this->inputHelper->createFormRow($name, false, 'Название');
        // description
        $description = $this->inputHelper->textarea('description['.$lang.']', 'description', 'description', 50000, false, $this->originalInsertValue['description'][$lang]);
        $html .= $this->inputHelper->createFormRow($description, false, 'Описание');
        return $html;
    } 
        
    /**
     * Выполнение изменения в таблице
     */
    protected function updateExecute() {
        parent::updateExecute();
        $querylist = "UPDATE `MaterialsCategoriesList` SET ";
        $queryList .= "`name`='".$this->insertValue['alias']."', ";
        $queryList .= "`showFullMaterialsText`='".$this->insertValue['showFullMaterialsText']."', ";
        $queryList .= "`showShortMaterialsText`='".$this->insertValue['showShortMaterialsText']."', ";
        $queryList .= "`showCategories`='".$this->insertValue['showCategories']."', ";
        $queryList .= "`showCreated`='".$this->insertValue['showCreated']."', ";
        $queryList .= "`showChange`='".$this->insertValue['showChange']."',";
        $queryList .= "`categorialsAsURL`='".$this->insertValue['categorialsAsURL']."', ";
        $queryList .= "`titleAsURL`='".$this->insertValue['titleAsURL']."', ";
        $queryList .= "`showAllOnPage`='".$this->insertValue['showAllOnPage']."', ";
        $queryList .= "`onPage`='".$this->insertValue['onPage']."', ";
        $queryList .= "`maxPages`='".$this->insertValue['maxPages']."'";
        $querylist .= "WHERE `name`='".$this->editElement."';";
         $queryList_Lang = array();
        foreach ($this->langArray as $langData) {
            if(isset($this->insertValue['name'][$langData['lang']]) && $this->insertValue['name'][$langData['lang']]!=null && 
                    $this->insertValue['name'][$langData['lang']]!="" && isset($this->insertValue['description'][$langData['lang']]) && 
                    $this->insertValue['description'][$langData['lang']]!=null && $this->insertValue['description'][$langData['lang']]!="") {
                $query = "INSERT INTO `MaterialsCategoriesList_Lang` SET ";
                $query .= "`list`='".$this->insertValue['alias']."', ";
                $query .= "`lang`='".$langData['lang']."', ";
                $query .= "`name`='".$this->insertValue['name'][$langData['lang']]."', ";
                $query .= "`description`='".$this->insertValue['description'][$langData['lang']]."';";
                $queryList_Lang[] = $query;
            }
        }
        $queryCategoriesInList = array();
            foreach ($this->insertValue['categories'] as $category => $sequence) {
                if ($sequence != null && $sequence != '') {
                    $queryInList = "INSERT INTO `MaterialsCategoriesInList` SET ";
                    $queryInList .= "`category`='".$category."', ";
                    $queryInList .= "`list`='".$this->insertValue['alias']."', ";
                    $queryInList .= "`sequence`='".$sequence."' ";
                    $queryInList .= ";";
                $queryCategoriesInList[] = $queryInList;  
                }        
            }
        $queryList_LangDel = "DELETE FROM  `MaterialsList_Lang` WHERE  `list` =  '".$this->editElement."';";
        $this->SQL_HELPER->insert($queryList_LangDel);
        $queryCategoriesInListDel = "DELETE FROM `MaterialsCategoriesInList` WHERE `list` =  '".$this->editElement."';";
        $this->SQL_HELPER->insert($queryCategoriesInListDel);
        
        $this->SQL_HELPER->insert($querylist);
        foreach($queryList_Lang as $queryList_Lg) {
            $this->SQL_HELPER->insert($queryList_Lg);
        }
        foreach($queryCategoriesInList as $queryCategoriesInL) {
            $this->SQL_HELPER->insert($queryCategoriesInL);
        }
    }
    
    protected function checkEditElement() {
        $query = "SELECT * FROM `MaterialsCategoriesList` WHERE `name`='".$this->editElement."';";
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
            $query = "SELECT * FROM `MaterialsCategoriesList` WHERE `name`='".$_POST['alias']."';";
            $result = $this->SQL_HELPER->select($query,1);
        }
        return $result == null;
    }

    private function checkSequence($arrSequence) {
        foreach ($arrSequence as $category => $sequence) {
            if($sequence == null) {
                unset($arrSequence[$category]);
            }
        }
        foreach ($arrSequence as $category => $sequence) {
            if(!preg_match("/^[0-9_-]{1,5}+$/u", $sequence)) {
                return false;
            }
        }
        // $value = частота повторения значений $arrSequence
        $arrDel = array_count_values($arrSequence);
        foreach (array_values($arrDel) as $value ) {
            if ($value > 1) {
                return false;
            }
        }
        return true;
    } 
    
    private function getCategories() {
        $html = "";
        $categories = array();
        $query = "SELECT * FROM  `MaterialsCategories`;";
        $result = $this->SQL_HELPER->select($query);

        foreach ($result as $categy) {
            $categories = $this->getCategoriesDataText($categy['alias']);
            // sequence
            $sequence = $this->inputHelper->paternTextBox('categories['.$categy['alias'].']', 'categories', 'categories', 5, false, 'sequence', '[0-9_-]{1,5}', $this->getSequenceInputValue($categy['alias']));
            $html .= $this->inputHelper->createFormRow($sequence, false, $categories);
        }
        return $html;
    }
    
    private function getSequenceInputValue($category) {
        if(isset($this->insertValue['categories'][$category])) {
            return $this->insertValue['categories'][$category];
        } else {
            return "";
        }
    }

    private function getCategoriesDataText($category) {
        $name = "";
        $this->langHelper = new LangHelper("MaterialsCategories_Lang","lang","category",$category,$this->thisLang);
        $this->langType = $this->langHelper->getLangType();
        if($this->langType != -1){
            $langData = $this->langHelper->getLangData();
            $name = $langData["name"];
        }
        return $name;
    }
}