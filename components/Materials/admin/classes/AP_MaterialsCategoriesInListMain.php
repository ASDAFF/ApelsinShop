<?php
/**
 * Description of AP_MaterialsCategoriesInListMain
 *
 * @author olga
 */
class AP_MaterialsCategoriesInListMain  extends AdminPanel_ComponentPanelUI_Element  {
    
    /* Переопределенные функции */
    
    protected function getData() {
        parent::getData();
        $query = "SELECT * FROM `MaterialsCategoriesList` ;";
        $this->data = $this->SQL_HELPER->select($query);
        foreach ($this->data as $key => $list) {
            $this->data[$key]['title'] = $this->getListDataText($list['name']);
            $this->data[$key]['category'] = $this->getMaterialCategoriesData($list['name']);
        }
    }
    
    protected function setElementAliasID($dataElement) {
        $this->elementAliasID = $dataElement['name'];
    }
    
    protected function getHtmlUI($dataElement) {
        $html = '';
        $html .= '<div class="ElementBlock Alias">';
        $html .= $dataElement['name'];
        $html .= '</div>';
        $html .= '<div class="ElementBlock Title">';
        $html .= $dataElement['title'];
        $html .= '</div>';
        $html .= '<div class="ElementBlock Category">';
        $html .= $dataElement['category'];
        $html .= '</div>';
        return $html;
    }
    
    /**
     * UI для добавления
     */
    protected function generateAddUI() {
        parent::generateAddUI();
        $ap_ListAdd = new AP_MaterialsCategoriesInListAdd();
        $this->html = $ap_ListAdd->getForm();
    }
    
    /**
     * UI для редактирования
     */
    protected function generateEditUI() {
        parent::generateAddUI();
        $ap_ListEdit = new AP_MaterialsCategoriesInListEdit($this->URL_PARAMS[5]);
        $this->html = $ap_ListEdit->getForm();
    }
    
    /**
     * UI для удаления (удаление подтверждено)
     */
    protected function generateDeleteYesUI() {
        parent::generateDeleteYesUI();
        $ap_ListDelete = new AP_MaterialsInListCategoriesDelete($this->URL_PARAMS[5]);
        $this->html = $ap_ListDelete->delete(true);
    }
    
    /**
     * UI для удаления (удаление не подтверждено)
     */
    protected function generateDeleteNoUI() {
        parent::generateDeleteNoUI();
        $ap_MaterialDelete = new AP_MaterialsInListCategoriesDelete($this->URL_PARAMS[5]);
        $this->html = $ap_MaterialDelete->delete(false);
    }
    
    /* Новые функции */
    private function getListDataText($list) {
        $title = "";
        $this->langHelper = new LangHelper("MaterialsCategoriesList_Lang","lang","list",$list,$this->thisLang);
        $this->langType = $this->langHelper->getLangType();
        if($this->langType != -1){
            $langData = $this->langHelper->getLangData();
            $title = $langData["name"];
        }
        return $title;
    }
    
    private function getMaterialCategoriesData($category) {
        $categories = "";
        $query = "SELECT * FROM `MaterialsCategoriesInList` WHERE `list`='".$category."';";
        $materialCategoriesData = $this->SQL_HELPER->select($query);
        if($materialCategoriesData != null) {
            foreach ($materialCategoriesData as $category) {
                $categories .= $this->getMaterialCategoriesDataText($category['category']).", ";
            }
        }
        return $categories;
    }
    
    private function getMaterialCategoriesDataText($category) {
        $title = "";
        $this->langHelper = new LangHelper("MaterialsCategories_Lang","lang","category",$category,$this->thisLang);
        $this->langType = $this->langHelper->getLangType();
        if($this->langType != -1){
            $langData = $this->langHelper->getLangData();
            $title = $langData["name"];
        }
        return $title;
    }
}