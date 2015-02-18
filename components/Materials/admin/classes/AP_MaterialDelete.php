<?php
class AP_MaterialDelete extends AdminPanel_ComponentPanelUI_Element_Delete {
    
    private $dir = './resources/Components/Materials/';
    
    protected function setDeleteQuery() {
        $this->deleteQuery = "DELETE FROM `Materials` WHERE `alias`='".$this->alias."';";
    }
    
    protected function clearResours() {
        unlink($this->dir.$this->alias.".png");
    }
    
    protected function checkAlias() {
        $query = "SELECT * FROM `Materials` WHERE `alias`='".$this->alias."';";
        $result = $this->SQL_HELPER->select($query,1);
        return count($result)>0;
    }
}