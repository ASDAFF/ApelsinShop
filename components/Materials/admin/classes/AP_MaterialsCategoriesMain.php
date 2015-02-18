<?php
/**
 * Description of AP_MaterialsCategoriesMain
 *
 * @author olga
 */
class AP_MaterialsCategoriesMain extends AdminPanel_ComponentPanelUI_Element  {
    
    /* Переопределенные функции */
    
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
        $html .= $dataElement['list'];
        $html .= '</div>';
        return $html;
    }
    
    protected function getData() {
        parent::getData();
        $query = "SELECT * FROM `MaterialsCategories` order by `lastChange` desc;";
        $this->data = $this->SQL_HELPER->select($query);
        foreach ($this->data as $key => $category) {
            $this->data[$key]['title'] = $this->getMaterialCategoriesDataText($category['alias']);
            $this->data[$key]['list'] = $this->getMaterialsCategoriesInListData($category['alias']);
        }
    }
    
    /**
     * UI для добавления
     */
    protected function generateAddUI() {
        parent::generateAddUI();
        $ap_CategoryAdd = new AP_MaterialsCategoriesAdd();
        $this->html = $ap_CategoryAdd->getForm();
    }
    
    /**
     * UI для редактирования
     */
    protected function generateEditUI() {
        parent::generateAddUI();
        $ap_CategoryEdit = new AP_MaterialsCategoriesEdit($this->URL_PARAMS[5]);
        $this->html = $ap_CategoryEdit->getForm();
    }
    
    /**
     * UI для удаления (удаление подтверждено)
     */
    protected function generateDeleteYesUI() {
        parent::generateDeleteYesUI();
        $ap_CategoryDelete = new AP_MaterialsCategoriesDelete($this->URL_PARAMS[5]);
        $this->html = $ap_CategoryDelete->delete(true);
    }
    
    /**
     * UI для удаления (удаление не подтверждено)
     */
    protected function generateDeleteNoUI() {
        parent::generateDeleteNoUI();
        $ap_CategoryDelete = new AP_MaterialsCategoriesDelete($this->URL_PARAMS[5]);
        $this->html = $ap_CategoryDelete->delete(false);
    }
    
    /* Новые функции */
    
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
    
    private function getMaterialsCategoriesInListData($category) {
        $categories = "";
        $query = "SELECT * FROM `MaterialsCategoriesInList` WHERE `category`='".$category."';";
        $materialCategoriesData = $this->SQL_HELPER->select($query);
        if($materialCategoriesData != null) {
            foreach ($materialCategoriesData as $category) {
                $categories .= $this->getMaterialsCategoriesList_LangDataText($category['list']).", ";
            }
        }
        return $categories;
    }
    
    private function getMaterialsCategoriesList_LangDataText($list) {
        $title = "";
        $this->langHelper = new LangHelper("MaterialsCategoriesList_Lang","lang","list",$list,$this->thisLang);
        $this->langType = $this->langHelper->getLangType();
        if($this->langType != -1){
            $langData = $this->langHelper->getLangData();
            $title = $langData["name"];
        }
        return $title;
    }
}