<?php
class AP_MaterialMain extends AdminPanel_ComponentPanelUI_Element {
    
/* Переопределенные функции */
    protected function getData() {
        parent::getData();
        $query = "SELECT * FROM `Materials` order by `created` desc;";
        $this->data = $this->SQL_HELPER->select($query);
        foreach ($this->data as $key => $material) {
            $this->data[$key]['title'] = $this->getMaterialDataText($material['alias']);
            $this->data[$key]['category'] = $this->getMaterialCategoriesData($material['alias']);
        }
    }
    
    protected function setElementAliasID($dataElement) {
        $this->elementAliasID = $dataElement['alias'];
    }
    
    protected function getHtmlUI($dataElement) {
        $createdDate = new DateTime($dataElement['created']);
        $lastChangeDate = new DateTime($dataElement['lastChange']);
        $html = '';
        $html .= '<div class="ElementBlock Alias">';
        $html .= $dataElement['alias'];
        $html .= "<div class='Date'>";
        $html .= $createdDate->format('d.m.Y h:i')." | ".$lastChangeDate->format('d.m.Y h:i');
        $html .= '</div>';
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
        $ap_MaterialAdd = new AP_MaterialAdd();
        $this->html = $ap_MaterialAdd->getForm();
    }
    
    /**
     * UI для редактирования
     */
    protected function generateEditUI() {
        parent::generateAddUI();
        $ap_MaterialEdit = new AP_MaterialEdit($this->URL_PARAMS[5]);
        $this->html = $ap_MaterialEdit->getForm();
    }
    
    /**
     * UI для удаления (удаление подтверждено)
     */
    protected function generateDeleteYesUI() {
        parent::generateDeleteYesUI();
        $ap_MaterialDelete = new AP_MaterialDelete($this->URL_PARAMS[5]);
        $this->html = $ap_MaterialDelete->delete(true);
    }
    
    /**
     * UI для удаления (удаление не подтверждено)
     */
    protected function generateDeleteNoUI() {
        parent::generateDeleteNoUI();
        $ap_MaterialDelete = new AP_MaterialDelete($this->URL_PARAMS[5]);
        $this->html = $ap_MaterialDelete->delete(false);
    }
    
/* Новые функции */
    private function getMaterialDataText($material) {
        $title = "";
        $this->langHelper = new LangHelper("Materials_Lang","lang","material",$material,$this->thisLang);
        $this->langType = $this->langHelper->getLangType();
        if($this->langType != -1){
            $langData = $this->langHelper->getLangData();
            $title = $langData["title"];
        }
        return $title;
    }
    
    private function getMaterialCategoriesData($material) {
        $categories = "";
        $query = "SELECT * FROM `MaterialsInCategories` WHERE `material`='".$material."';";
        $materialCategoriesData = $this->SQL_HELPER->select($query);
        if($materialCategoriesData != null) {
            foreach ($materialCategoriesData as $material) {
                $categories .= $this->getMaterialCategoriesDataText($material['category']).", ";
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
