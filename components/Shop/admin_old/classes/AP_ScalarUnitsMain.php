<?php
/**
 * Работа с скалярными единицами
 *
 * @author olga
 */
class AP_ScalarUnitsMain extends AdminPanel_ComponentPanelUI_Element {
    
    protected function getData() {
        parent::getData();
        $query = "SELECT * FROM `ShopItemsPropertiesMeasure` ;";
        $data = $this->SQL_HELPER->select($query);
        foreach ($data as $key=>$measure) {
            $this->data[$key]['measureF'] = $measure['measureF'];
            $this->data[$key]['prefix'] = $this->getPrefix($measure['measureF']);
        }
    }
    
    protected function setElementAliasID($dataElement) {
        $this->elementAliasID = $dataElement['measureF'];
    }
    
    protected function getHtmlUI($dataElement) {
        $html = '';
        $html .= '<div class="ElementBlock Alias">';
        $html .= $dataElement['prefix'];
        $html .= '</div>';
        $html .= '<div class="ElementBlock Title">';
        $html .= $dataElement['measureF'];
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
        $ap_scalarUnitsAdd = new AP_ScalarUnitsAdd();
        $this->html = $ap_scalarUnitsAdd->getForm();
    }
    
    /**
     * UI для редактирования
     */
    protected function generateEditUI() {
        parent::generateAddUI();
        $ap_scalarUnitsEdit = new AP_ScalarUnitsEdit($this->URL_PARAMS[5]);
        $this->html = $ap_scalarUnitsEdit->getForm();
    }
    
    /**
     * UI для удаления (удаление подтверждено)
     */
    protected function generateDeleteYesUI() {
        parent::generateDeleteYesUI();
        $ap_scalarUnitsDelite = new AP_ScalarUnitsDelite($this->URL_PARAMS[5]);
        $this->html = $ap_scalarUnitsDelite->delete(true);
    }
    
    /**
     * UI для удаления (удаление не подтверждено)
     */
    protected function generateDeleteNoUI() {
        parent::generateDeleteNoUI();
        $ap_scalarUnitsDelite = new AP_ScalarUnitsDelite($this->URL_PARAMS[5]);
        $this->html = $ap_scalarUnitsDelite->delete(false);
    }
    
    private function getPrefix($data) {
        $prefix = "";
        $query = "SELECT * FROM `ShopItemsPropertiesMeasureScaling` WHERE `measure` = '".$data."';";
        $prefixData = $this->SQL_HELPER->select($query);
        if ($prefixData != null) {
            foreach ($prefixData as $elem) {
                $prefix .= $elem['prefix'].", &nbsp;&nbsp;";
            }
        }
        return $prefix;
    }
}
