<?php
/**
 * Удаление скаляра
 *
 * @author olga
 */
class AP_ScalarUnitsDelite extends AdminPanel_ComponentPanelUI_Element_Delete {

    private $yourUser;
    private $yourUserData;

    protected function setDeleteQuery() {
        $this->deleteQuery = "DELETE FROM `ShopItemsPropertiesMeasure` WHERE `measureF` = '".$this->alias."';";
    }
    
    protected function clearResours() {
        parent::clearResours();
        // делаем запись в логи 
        $this->getUserData();
        $this->recordActionLog();
    }

    protected function checkAlias() {
        $query = "SELECT * FROM `ShopItemsPropertiesMeasure` WHERE `measureF` = '".$this->alias."';";
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
        $query .= "`actionType` = 'delete_scalar', ";
        $query .= "`time` = '".$date."', ";
        $query .= "`title` = 'Удаление скаляра через панель администрирования', ";
        $query .= "`logtext` = 'Удален скаляр - ".$this->alias."';";
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
