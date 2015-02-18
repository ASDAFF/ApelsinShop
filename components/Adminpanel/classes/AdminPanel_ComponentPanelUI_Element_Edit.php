<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of AdminPanel_ComponentPanelUI_Element_Edit
 *
 * @author maxim
 */
class AdminPanel_ComponentPanelUI_Element_Edit {
    protected $SQL_HELPER;
    protected $URL_PARAMS;
    protected $thisLang;
    protected $urlHelper;
    protected $inputHelper;
    protected $insertValue;
    protected $originalInsertValue;
    protected $checkAllValueErrors;
    protected $form;
    protected $message;
    protected $langArray;
    protected $data;
    protected $editElement;
    protected $yes_no;


    public function __construct($editElement) {
        $this->yes_no = array();
        $this->yes_no[0]['value'] = '0';
        $this->yes_no[0]['text'] = 'НЕТ';
        $this->yes_no[1]['value'] = '1';
        $this->yes_no[1]['text'] = 'ДА';
        
        $this->editElement = $editElement;
        global $_SQL_HELPER;
        $this->SQL_HELPER = $_SQL_HELPER;
        global $_URL_PARAMS;
        $this->thisLang = $_URL_PARAMS['lang'];
        $this->URL_PARAMS = $_URL_PARAMS['params'];
        $this->urlHelper = new UrlHelper();
        $this->inputHelper = new InputHelper();
        $this->insertValue = array();
        $this->message="";
        if($this->checkEditElement()) {
            $this->getData();  
            $this->getLangArray();
            $this->setDefaltInput();
            if(isset($_POST['AP_Submit'])) {
                $this->update();
            } 
            $this->generateForm();
        } else {
            $this->form = "<div class='message'>Данные не найдены</div>";
        }
    }
    
    private function getLangArray() {
        $this->langArray = array();
        $query = "SELECT * FROM  `Lang`;";
        $this->langArray = $this->SQL_HELPER->select($query);
    }
    
    private function update() {
        $this->getAllValue();
        if($this->checkAllValue()) {
            $this->message = "Данные были отредактированы<br>";
            $this->updateExecute();
            $this->refreshPage();
        } else {
            if($this->checkAllValueErrors!=null) {
                $this->message = "Произошла ошибка";
                foreach ($this->checkAllValueErrors as $CVerror) {
                    $this->message .= "<br>".$CVerror;
                }
                $this->message .= "<br>";
            }
        }
        $this->form = $this->message;
    }
    
    private function refreshPage() {
        $params[0] = $this->URL_PARAMS[0];
        $params[1] = $this->URL_PARAMS[1];
        $params[2] = $this->URL_PARAMS[2];
        $params[3] = $this->URL_PARAMS[3];
        $params[4] = $this->URL_PARAMS[4];
        $params[5] = $this->getNewEditElementID();
        echo '<script language="JavaScript">';
        echo 'window.location.href = "'.$this->urlHelper->chengeParams($params).'"';
        echo '</script>';
    }

    private function generateForm() {        
        $this->form = '';
        $this->form .= '<form class="AP_Form" name="AP_Form" action="'.$this->urlHelper->getThisPage().'" method="post" enctype="multipart/form-data" accept-charset="UTF-8" autocomplete="on">';
        $this->form .= '<center>';
        $this->form .= "<div class='message'>$this->message</div>";
        $this->form .= '<table class="AP_FormTable" >';
        $this->form .= $this->getInputBlocks();
        foreach ($this->langArray as $langData) {
            $langInputBlocks = $this->getInputLangBlocks($langData['lang']);
            if($langInputBlocks!=null && $langInputBlocks!='') {
                $this->form .= $this->inputHelper->createFormRow_RowText($langData['langName']);
                $this->form .= $langInputBlocks;
            }
        }
        $this->form .= '</table>';
        $this->form .= '<center>';
        $this->form .= '<input class="AP_Submit" type="submit" name="AP_Submit" value="Изменить">';
        $this->form .= '</center>';
        $this->form .= '</form>';
        $this->form .= $this->backButton();
    }
    
    private function backButton() {
        $params[0] = $this->URL_PARAMS[0];
        $params[1] = $this->URL_PARAMS[1];
        $params[2] = $this->URL_PARAMS[2];
        $params[3] = $this->URL_PARAMS[3];
        $backUrl = $this->urlHelper->chengeParams($params);
        return '<center><a href="'.$backUrl.'"><input class="AP_Submit" type="button" value="К списку"></a></center>';
    }
    
    /**
     * Получение значений
     */
    protected function getAllValue() {
        $this->insertValue = array();
    }
    
    /**
     * Проверка значений
     */
    protected function checkAllValue() {         
        $this->checkAllValueErrors = array();
    }
    
    /**
     * Установка значений ввода по умолчанию
     */
    protected function setDefaltInput() {
        $this->getData();
        $this->insertValue = array();
        $this->originalInsertValue = array();
    }
    
    /**
     * Выполнение изменения в таблице
     */
    protected function updateExecute() {
    }
    
    /**
     * Генерация форм ввода не зависимых от языка
     */
    protected function getInputBlocks() { 
        return "";
    }
    
    /**
     * Генерация форм ввода зависимых от языка
     */
    protected function getInputLangBlocks($lang) {
        return "";
    }
    
    protected function getData() {
        $this->data = array();
    }
    
    protected function checkEditElement() {
        return true;
    }
    
    /* Вспомогательыне функции не для переопределения */
    protected function checkValue($key,$preg=null) {
        return InputValueHelper::checkValue($key, $preg);
    }
    
    protected function getMysqlText($text) {
        return InputValueHelper::getMysqlText($text);
    }
    
    protected function getPostValue($key) {
        return InputValueHelper::getPostValue($key);
    }
    
    protected function getOriginalPostValue($key) {
        return InputValueHelper::getOriginalPostValue($key);
    }
    
    protected function getNewEditElementID() {
        return $this->insertValue['alias'];
    }
    
    /* Публичные функции */
    public function getForm() {
        return $this->form;
    }
}
