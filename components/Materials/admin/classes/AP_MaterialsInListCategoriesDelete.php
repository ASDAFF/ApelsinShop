<?php
/**
 * Description of AP_MaterialsInListCategoriesDelete
 *
 * @author olga
 */
class AP_MaterialsInListCategoriesDelete extends AdminPanel_ComponentPanelUI_Element_Delete {
    
    protected function setDeleteQuery() {
        $this->deleteQuery = "DELETE FROM `MaterialsCategoriesList` WHERE `name`='".$this->alias."';";
    }

    protected function checkAlias() {
        $query = "SELECT * FROM `MaterialsCategoriesList` WHERE `name`='".$this->alias."';";
        $result = $this->SQL_HELPER->select($query,1);
        return count($result)>0;
    }
}