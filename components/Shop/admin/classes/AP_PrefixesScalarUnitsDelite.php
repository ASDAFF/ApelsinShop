<?php
/**
 * Удаление префикса
 *
 * @author olga
 */
class AP_PrefixesScalarUnitsDelite extends AdminPanel_ComponentPanelUI_Element_Delete {

    private $yourUser;
    private $yourUserData;

    protected function setDeleteQuery() {
        $this->deleteQuery = "DELETE FROM `ShopItemsPropertiesMeasurePrefix` WHERE `prefixF` = '".$this->alias."';";
    }
    
    protected function clearResours() {
        parent::clearResours();
        // делаем запись в логи 
        $this->getUserData();
        $this->recordActionLog();
    }
    
    protected function checkAlias() {
        $query = "SELECT * FROM `ShopItemsPropertiesMeasurePrefix` WHERE `prefixF` = '".$this->alias."';";
        $result = $this->SQL_HELPER->select($query,1);
        return count($result) > 0;
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
        $query .= "`actionType` = 'delete_prefix', ";
        $query .= "`time` = '".$date."', ";
        $query .= "`title` = 'Удаление префикса через панель администрирования', ";
        $query .= "`logtext` = 'Удален префикс - ".$this->alias."';";
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