<?php
/**
 *  Редактирование скаляров
 *
 * @author olga
 */
class AP_ScalarUnitsEdit extends AdminPanel_ComponentPanelUI_Element_Edit  {

    protected function checkAllValue() {         
        parent::checkAllValue();
        $error = false;
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
    
    protected function getAllValue() {
        parent::getAllValue();
        $this->insertValue['alias'] = $this->editElement;
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
    
    protected function getData() {
        parent::getData();
        $this->data = [];
        $query = "SELECT * FROM `ShopItemsPropertiesMeasureScaling` WHERE `measure` = '".$this->editElement."';";
        $this->data = $this->SQL_HELPER->select($query);
    }
    
    protected function getInputBlocks() { 
        $html = parent::getInputBlocks();
        $alias = '<div class="changeProductShopEdit">'.$this->originalInsertValue['alias'].'</div>';
        $html .= $this->inputHelper->createFormRow($alias, false, 'Единица измерения');
        $html .= $this->getChekBoxAndInputGroup();
        return $html;
    }
    
    protected function setDefaltInput() { 
        parent::setDefaltInput();
        $this->insertValue['alias'] = $this->editElement;
        $this->insertValue['prefixs'] = [];
        $this->insertValue['aliasMeasure'] = [];
        if ($this->data != null) {
            foreach ($this->data as $key => $value) {
                $this->insertValue['prefixs'][$key] = $value['prefix'];
                $this->insertValue['aliasMeasure'][$value['prefix']] = $value['alias'];
            }
        }
        $this->originalInsertValue = $this->insertValue;
    }
    
    protected function updateExecute() {
        parent::updateExecute();
        $delete = "DELETE FROM `ShopItemsPropertiesMeasureScaling` WHERE `measure`='".$this->editElement."';";
        $this->SQL_HELPER->insert($delete);
        
        $queryPrefixs = [];
        if ($this->insertValue['prefixs'] != null) {
            foreach ($this->insertValue['prefixs'] as $prefix) {
                $query = "INSERT INTO `ShopItemsPropertiesMeasureScaling` SET ";
                $query .= "`measure` = '".$this->editElement."', ";
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
        return ((isset($this->originalInsertValue['aliasMeasure'][$key])) ? $this->originalInsertValue['aliasMeasure'][$key] : null);
    }
    
    private function checkPrefixEmpty($prefix) {
        return ((in_array($prefix, $this->originalInsertValue['prefixs'])) ? $prefix : null);
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
        $query .= "`actionType` = 'edit_scalar', ";
        $query .= "`time` = '".$date."', ";
        $query .= "`title` = 'Редактирование скаляра через панель администрирования', ";
        $query .= "`logtext` = 'Изменен скаляр - ".$this->insertValue['alias']."';";
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
