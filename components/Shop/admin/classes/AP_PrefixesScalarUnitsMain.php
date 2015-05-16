<?php
/**
 * Главная страница "Префиксы скаляров".
 *
 * @author olga
 */
class AP_PrefixesScalarUnitsMain extends AdminPanel_ComponentPanelUI_Element {
    
    protected function getData() {
        parent::getData();
        $query = "SELECT * FROM `ShopItemsPropertiesMeasurePrefix` ;";
        $this->data = $this->SQL_HELPER->select($query);
    }
    
    protected function setElementAliasID($dataElement) {
        $this->elementAliasID = $dataElement['prefixF'];
    }
    
    protected function getHtmlUI($dataElement) {
        $html = '';
        $html .= '<div class="ElementBlock Alias">';
        $html .= $dataElement['factor'];
        $html .= '</div>';
        $html .= '<div class="ElementBlock Title">';
        $html .= $dataElement['prefixF'].' ('.$dataElement['prefixS'].')';
        $html .= '</div>';
        $html .= '<div class="ElementBlock Category">';
        $html .= '</div>';
        return $html;
    }
    
    /**
     * UI для добавления
     */
    protected function generateAddUI() {
        parent::generateAddUI();
        $ap_prefixesScalarUnitsAdd = new AP_PrefixesScalarUnitsAdd();
        $this->html = $ap_prefixesScalarUnitsAdd->getForm();
    }
    
    /**
     * UI для редактирования
     */
    protected function generateEditUI() {
        parent::generateAddUI();
        $ap_prefixesScalarUnitsEdit = new AP_PrefixesScalarUnitsEdit($this->URL_PARAMS[5]);
        $this->html = $ap_prefixesScalarUnitsEdit->getForm();
    }
    
    /**
     * UI для удаления (удаление подтверждено)
     */
    protected function generateDeleteYesUI() {
        parent::generateDeleteYesUI();
        $ap_prefixesScalarUnitsDelite = new AP_PrefixesScalarUnitsDelite($this->URL_PARAMS[5]);
        $this->html = $ap_prefixesScalarUnitsDelite->delete(true);
    }
    
    /**
     * UI для удаления (удаление не подтверждено)
     */
    protected function generateDeleteNoUI() {
        parent::generateDeleteNoUI();
        $ap_prefixesScalarUnitsDelite = new AP_PrefixesScalarUnitsDelite($this->URL_PARAMS[5]);
        $this->html = $ap_prefixesScalarUnitsDelite->delete(false);
    }
}
