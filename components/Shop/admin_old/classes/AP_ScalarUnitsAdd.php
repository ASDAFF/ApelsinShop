<?php
/**
 * Добавить скаляр
 *
 * @author olga
 */
class AP_ScalarUnitsAdd extends AdminPanel_ComponentPanelUI_Element_Add {
    
    protected function getInputBlocks() { 
        $html = parent::getInputBlocks();
        $measureF = $this->inputHelper->paternTextBox('measureF', 'measureF', 'measureF', 50, true, 'Кирилица', '[а-яА-ЯЁё]+', $this->originalInsertValue['alias']);
        $html .= $this->inputHelper->createFormRow($measureF, true, 'Полное название единицы измерения');
        $measureS = $this->inputHelper->paternTextBox('measureS', 'measureS', 'measureS', 50, true, 'Кирилица', '[а-яА-ЯЁё]+', $this->originalInsertValue['measureS']);
        $html .= $this->inputHelper->createFormRow($measureS, true, 'Сокращенное название единицы измерения');
        $html .= $this->getChekBoxAndInputGroup();
        return $html;
    }
    
    protected function getElementID() {
        return $this->insertValue['alias'];
    }
    
    protected function getAllValue() {
        parent::getAllValue();
        $this->insertValue['alias'] = parent::getPostValue('measureF');
        $this->insertValue['measureS'] = parent::getPostValue('measureS');
        if (isset($_POST['prefixs']) && $_POST['prefixs'] != null && $_POST['prefixs'] != "") {
            $this->insertValue['prefixs'] = $_POST['prefixs'];
        } else {
            $this->insertValue['prefixs'] = [];
        }
        if (isset($_POST['aliasMeasure']) && $_POST['aliasMeasure'] != null && $_POST['aliasMeasure'] != "") {
            $this->insertValue['aliasMeasure'] = $_POST['aliasMeasure'];
        } else {
            $this->insertValue['aliasMeasure'] = [];
        }
    }
    
    protected function checkAllValue() {         
        parent::checkAllValue();
        $error = false;
        if (!$this->checkValue('measureF', "/[а-яА-ЯЁё]+/")) {
            $error = true;
            $this->checkAllValueErrors[] = "Кирилица";
        }
        if (!$this->checkAlias('measureF')) {
            $error = true;
            $this->checkAllValueErrors[] = "Эта единица уже существует.";
        }
        if (!$this->checkValue('measureS', "/[а-яА-ЯЁё]+/")) {
            $error = true;
            $this->checkAllValueErrors[] = "Кирилица";
        }
        if(isset($_POST['prefixs']) && $_POST['prefixs']!=null && $_POST['prefixs']!="") {
            $this->insertValue['prefixs'] = $_POST['prefixs'];
        } else {
            $this->insertValue['prefixs'] = [];
        }
        if(isset($_POST['aliasMeasure']) && $_POST['aliasMeasure']!=null && $_POST['aliasMeasure']!="") {
            $this->insertValue['aliasMeasure'] = $_POST['aliasMeasure'];
        } else {
            $this->insertValue['aliasMeasure'] = [];
        }
        return !$error;
    }
    
    protected function setDefaltInput() { 
        parent::setDefaltInput();
        $this->insertValue['alias'] = parent::getOriginalPostValue('measureF');
        $this->insertValue['measureS'] = parent::getOriginalPostValue('measureS');
        if (isset($_POST['prefixs']) && $_POST['prefixs'] != null && $_POST['prefixs'] != "") {
            $this->insertValue['prefixs'] = $_POST['prefixs'];
        } else {
            $this->insertValue['prefixs'] = [];
        }
        if (isset($_POST['aliasMeasure']) && $_POST['aliasMeasure'] != null && $_POST['aliasMeasure'] != "") {
            $this->insertValue['aliasMeasure'] = $_POST['aliasMeasure'];
        } else {
            $this->insertValue['aliasMeasure'] = [];
        }
        $this->originalInsertValue = $this->insertValue;
    }
    
    protected function insertExecute() {
        parent::insertExecute();
        
        $query = "INSERT INTO `ShopItemsPropertiesMeasure` SET ";
        $query .= "`measureF` = '".$this->insertValue['alias']."', ";
        $query .= "`measureS` = '".$this->insertValue['measureS']."'; ";
//        echo var_dump($query). '<br>';
        $this->SQL_HELPER->insert($query);
        
        $queryPrefixs = [];
        if ($this->insertValue['prefixs'] != null) {
            foreach ($this->insertValue['prefixs'] as $prefix) {
                $query = "INSERT INTO `ShopItemsPropertiesMeasureScaling` SET ";
                $query .= "`measure` = '".$this->insertValue['alias']."', ";
                $query .= "`prefix`='".$prefix."',";
                $query .= "`alias` = ".InputValueHelper::mayByNull($this->insertValue['aliasMeasure'][$prefix])."; ";
                $queryPrefixs[] = $query;
            }
        }
        foreach($queryPrefixs as $queryPrefix) {
            $this->SQL_HELPER->insert($queryPrefix);
        }
        // делаем запись в логи 
        $this->getUserData();
        $this->recordActionLog();
    }
    
    private function checkAlias($key) {
        $result = array();
        if (isset($_POST[$key]) && $_POST[$key] != null && $_POST[$key] != "") {
            $query = "SELECT * FROM ` ShopItemsPropertiesMeasureScaling` WHERE `".$key."` = '".$_POST[$key]."';";
            $result = $this->SQL_HELPER->select($query,1);
        }
        return $result == null;
    }
    
    private function getPrefix() {
        $query = "SELECT * FROM  `ShopItemsPropertiesMeasurePrefix`;";
        $result = $this->SQL_HELPER->select($query);
        return $result;
    }
    
    private function getChekBoxAndInputGroup() {
        $html = '';
        $result = $this->getPrefix();
        if ($result != null) {
            foreach ($result as $value) {
                $pref = $value['prefixF'];
                $prefixs = $this->inputHelper->checkbox('prefixs[]', 'prefixs', 'prefixs', false, $pref, $this->checkPrefixEmpty($pref)); 
                $text = '<div class="prefixText">'.$prefixs.'<p>'.$pref.'</p></div>'; 
                $aliasMeasure = $this->inputHelper->paternTextBox('aliasMeasure['.$pref.']', 'aliasMeasure', 'aliasMeasure', 50, false, 'Кирилица', '[а-яА-ЯЁё]+', $this->checkAliasMeasureEmpty($pref));
                $html .= $this->inputHelper->createFormRow($text.$aliasMeasure, false, 'Префикс');   
            }
        }
        return $html;
    }
    
    private function checkAliasMeasureEmpty($key) {
        return ((isset($this->originalInsertValue['aliasMeasure'][$key] )) ? $this->originalInsertValue['aliasMeasure'][$key] : null);
    }
    
    private function checkPrefixEmpty($prefix) {
        return ((in_array($prefix, $this->originalInsertValue['prefixs'])) ? $prefix : null);
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
        $query .= "`actionType` = 'add_scalar', ";
        $query .= "`time` = '".$date."', ";
        $query .= "`title` = 'Добавление скаляра через панель администрирования', ";
        $query .= "`logtext` = 'Добавлен скаляр - ".$this->insertValue['alias']."';";
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
