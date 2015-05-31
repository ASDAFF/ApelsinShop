<?php

class ShopPropertiesFilterTypeJSGenerator {
    
    private $HTML;
    private $allGroupProperties;
    private $allGroupPropertiesData;
    
    public function __construct($allGroupProperties,$allGroupPropertiesData,$groupID) {
        $this->allGroupProperties = $allGroupProperties;
        $this->allGroupPropertiesData = $allGroupPropertiesData;
        $this->generateAjaxJS($groupID);
    }
    
    private function generateAjaxJS($groupID) {
        $this->HTML = '';
        if(!ShopPageInfoHelper::isShopPage()) {
            return;
        }
        
        if($groupID !== NULL && $groupID !== '' && $groupID !== 'root') {
            $urlGetData = "?groupID=".$groupID;
        } else {
            $urlGetData = '';
        }
        $this->HTML .= '<script type="text/javascript">';
        $this->HTML .= 'function getShopItemsList() {';
        $this->HTML .= '    var form_data = $("form.ShopPropertiesFilterForm").serialize() + "&ShopPropertiesFilterFormSubmit=ok";';
        $this->HTML .= '    $.ajax({';
        $this->HTML .= '        type: "POST",';
        $this->HTML .= '        url: "./components/Shop/script/shopItemSearchResult.php'.$urlGetData.'",';
        $this->HTML .= '        data: form_data,';
        $this->HTML .= '        cache: false,';
        $this->HTML .= '        success: function(result) {';
        $this->HTML .= '            $(".c_block.Shop").html(result);';
        $this->HTML .= '            getItemsFound();';
//        $this->HTML .= '            alert(result);';
        $this->HTML .= '        }';
        $this->HTML .= '    });';
        $this->HTML .= '    return true;';
        $this->HTML .= '};';
        $this->HTML .= 'function getItemsFound() {';
        $this->HTML .= '    $.ajax({';
        $this->HTML .= '        type: "POST",';
        $this->HTML .= '        url: "./components/Shop/script/ItemsFoundScript.php'.$urlGetData.'",';
        $this->HTML .= '        cache: false,';
        $this->HTML .= '        success: function(result) {';
        $this->HTML .= '            $("form.ShopPropertiesFilterForm .ItemsFoundFilterBlocks").html(result);';
//        $this->HTML .= '            alert(result);';
        $this->HTML .= '        }';
        $this->HTML .= '    });';
        $this->HTML .= '    return true;';
        $this->HTML .= '};';
        $this->HTML .= '</script>';
    }

    public function get() {
        echo $this->HTML;
    }
    public function getHtml() {
        return $this->HTML;
    }
}
