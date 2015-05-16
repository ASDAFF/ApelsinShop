<?php
/**
 *  Редактирование префикса
 *
 * @author olga
 */
class AP_PrefixesScalarUnitsEdit extends AdminPanel_ComponentPanelUI_Element_Edit {
    
    protected function checkAllValue() {         
        parent::checkAllValue();
        $error = false;
        if (!$this->checkValue('prefixF',"/[а-яА-ЯЁё]+/")) {
            $error = true;
            $this->checkAllValueErrors[] = "Кирилица";
        }
        if (!$this->checkAlias('prefixF')) {
            $error = true;
            $this->checkAllValueErrors[] = "Такой псевдоним уже используется";
        }
        if (!$this->checkValue('prefixS',"/[а-яА-ЯЁё]+/")) {
            $error = true;
            $this->checkAllValueErrors[] = "Кирилица";
        }
        if (!$this->checkValue('factor',"/\d+(\.{1}\d{0,})?/")) {
            $error = true;
            $this->checkAllValueErrors[] = "Допускаются положительные целые и дробные числа.";
        }
        return !$error;
    }
    
    protected function getAllValue() {
        parent::getAllValue();
        $this->insertValue['alias'] = parent::getPostValue('prefixF');
        $this->insertValue['prefixS'] = parent::getPostValue('prefixS');
        $this->insertValue['factor'] = parent::getPostValue('factor');
    }
    
    protected function getInputBlocks() { 
        $html = parent::getInputBlocks();
        // prefixF
        $prefixF = $this->inputHelper->paternTextBox('prefixF', 'prefixF', 'prefixF', 50, true, 'Кирилица', '[а-яА-ЯЁё]+', $this->originalInsertValue['alias']);
        $html .= $this->inputHelper->createFormRow($prefixF, true, 'Полное название');
        // prefixS
        $prefixS = $this->inputHelper->paternTextBox('prefixS', 'prefixS', 'prefixS', 50, true, 'Кирилица', '[а-яА-ЯЁё]+', $this->originalInsertValue['prefixS']);
        $html .= $this->inputHelper->createFormRow($prefixS, true, 'Сокращенное название');
        // factor
        $factor = $this->inputHelper->paternTextBox('factor', 'factor', 'factor', 50, true, 'Целые и дробные числа.', '\d+(\.{1}\d{0,})?', $this->originalInsertValue['factor']);
        $html .= $this->inputHelper->createFormRow($factor, true, 'Фактор (множитель)');
        return $html;
    }
    
    protected function getData() {
        parent::getData();
        $this->data = array();
        $query = "SELECT * FROM `ShopItemsPropertiesMeasurePrefix` WHERE `prefixF` = '".$this->editElement."';";
        $this->data = $this->SQL_HELPER->select($query,1);
    }
    
    protected function setDefaltInput() {
        parent::setDefaltInput();
        $this->insertValue['alias'] = $this->data['prefixF'];
        $this->insertValue['prefixS'] = $this->data['prefixS'];
        $this->insertValue['factor'] = $this->data['factor'];
        $this->originalInsertValue = $this->insertValue;
    }
    
    protected function updateExecute() {
        parent::updateExecute();
        $query = "UPDATE `ShopItemsPropertiesMeasurePrefix` SET ";
        $query .= "`prefixF` = '".$this->insertValue['alias']."', ";
        $query .= "`prefixS` = '".$this->insertValue['prefixS']."', ";
        $query .= "`factor` = '".$this->insertValue['factor']."' ";
        $query .= " WHERE `prefixF` = '".$this->editElement."';";
        $this->SQL_HELPER->insert($query);
        // делаем запись в логи 
        $this->getUserData();
        $this->recordActionLog();
    }
    
    private function checkAlias() {
        if ($this->editElement == $_POST['prefixF']) {
            return true;
        }
        $result = array();
        if (isset($_POST['prefixF']) && $_POST['prefixF'] != null && $_POST['prefixF'] != "") {
            $query = "SELECT * FROM `ShopItemsPropertiesMeasurePrefix` WHERE `prefixF` = '".$_POST['prefixF']."';";
            $result = $this->SQL_HELPER->select($query,1);
        }
        return $result == null;
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
        $query .= "`actionType` = 'edit_prefix', ";
        $query .= "`time` = '".$date."', ";
        $query .= "`title` = 'Редактирование префикса через панель администрирования', ";
        $query .= "`logtext` = 'Изменен префикс - ".$this->insertValue['alias']."';";
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
