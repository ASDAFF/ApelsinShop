<?php
/**
 * Description of AP_MaterialsCategoriesDelete
 *
 * @author olga
 */
class AP_MaterialsCategoriesDelete extends AdminPanel_ComponentPanelUI_Element_Delete {
    
    protected function setDeleteQuery() {
        $this->deleteQuery = "DELETE FROM `MaterialsCategories` WHERE `alias`='".$this->alias."';";
    }

    protected function checkAlias() {
        $query = "SELECT * FROM `MaterialsCategories` WHERE `alias`='".$this->alias."';";
        $result = $this->SQL_HELPER->select($query,1);
        return count($result)>0;
    }
}