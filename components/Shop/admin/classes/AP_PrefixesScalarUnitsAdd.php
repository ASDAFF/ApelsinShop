<?php
/**
 *  extends AdminPanel_ComponentPanelUI_Element_Edit 
 *
 * @author olga
 */
class AP_PrefixesScalarUnitsAdd extends AdminPanel_ComponentPanelUI_Element_Add {
    
    protected function getElementID() {
        return $this->insertValue['alias'];
    }
    
    protected function getAllValue() {
        parent::getAllValue();
        $this->insertValue['alias'] = parent::getPostValue('prefixF');
        $this->insertValue['prefixS'] = parent::getPostValue('prefixS');
        $this->insertValue['factor'] = parent::getPostValue('factor');
    }
    
    protected function checkAllValue() {         
        parent::checkAllValue();
        $error = false;
        if (!$this->checkValue('prefixF', "/[а-яА-ЯЁё]+/")) {
            $error = true;
            $this->checkAllValueErrors[] = "Кирилица";
        }
        if (!$this->checkAlias('prefixF')) {
            $error = true;
            $this->checkAllValueErrors[] = "Такой псевдоним уже используется";
        }
        if (!$this->checkValue('prefixS', "/[а-яА-ЯЁё]+/")) {
            $error = true;
            $this->checkAllValueErrors[] = "Кирилица";
        }
        if (!$this->checkValue('factor', "/\d+(\.{1}\d{0,})?/")) {
            $error = true;
            $this->checkAllValueErrors[] = "Допускаются положительные целые и дробные числа.";
        }
        return !$error;
    }
    
    protected function setDefaltInput() { 
        parent::setDefaltInput();
        $this->insertValue['alias'] = parent::getOriginalPostValue('prefixF');
        $this->insertValue['prefixS'] = parent::getOriginalPostValue('prefixS');
        $this->insertValue['factor'] = parent::getOriginalPostValue('factor');
        $this->originalInsertValue = $this->insertValue;
    }
    
    protected function insertExecute() {
        parent::insertExecute();
        $query = "INSERT INTO `ShopItemsPropertiesMeasurePrefix` SET ";
        $query .= "`prefixF` = '".$this->insertValue['alias']."', ";
        $query .= "`prefixS` = '".$this->insertValue['prefixS']."', ";
        $query .= "`factor` = '".$this->insertValue['factor']."'; ";
        $this->SQL_HELPER->insert($query);
        // делаем запись в логи 
        $this->getUserData();
        $this->recordActionLog();
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
    
    private function checkAlias($key) {
        $result = array();
        if (isset($_POST[$key]) && $_POST[$key] != null && $_POST[$key] != "") {
            $query = "SELECT * FROM ` ShopItemsPropertiesMeasurePrefix` WHERE `".$key."` = '".$_POST[$key]."';";
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
        $query .= "`actionType` = 'add_prefix', ";
        $query .= "`time` = '".$date."', ";
        $query .= "`title` = 'Добавление префикса через панель администрирования', ";
        $query .= "`logtext` = 'Добавлен префикс - ".$this->insertValue['alias']."';";
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
