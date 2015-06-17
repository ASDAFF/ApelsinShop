<?php

class ShopPropertiesFilterTypeJSGenerator {
    
    private $HTML;
    private $allGroupProperties;
    private $allGroupPropertiesData;
    private $amauntOfPage;
    
    public function __construct($allGroupProperties,$allGroupPropertiesData,$groupID) {
        $this->allGroupProperties = $allGroupProperties;
        $this->allGroupPropertiesData = $allGroupPropertiesData;
        $this->amauntOfPage = ShopPropertiesFilterSerchArray::getArrayGroupAmauntOfPage($groupID);
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
        if($groupID !== NULL && $groupID !== '' && $groupID !== 'root') {
            $urlPageData = "?groupID=".$groupID."&noPostData=yes&page=";
        } else {
            $urlPageData = "?noPostData=yes&page=";
        }
        $this->HTML .= '<script type="text/javascript">';
        $this->HTML .= 'var shopItemsListFerstPage = 1;';
        $this->HTML .= 'var shopItemsListThisPage = 1;';
        $this->HTML .= 'var shopItemsListLastPage = '.$this->amauntOfPage.';';
        $this->HTML .= '';
        $this->HTML .= '';
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
        $this->HTML .= '            resetPageCounter();';
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
        $this->HTML .= '        }';
        $this->HTML .= '    });';
        $this->HTML .= '    return true;';
        $this->HTML .= '};';
        $this->HTML .= 'function getShopItemListPage() {';
//        $this->HTML .= '    alert(shopItemsListThisPage + " - " + shopItemsListLastPage);';
        $this->HTML .= '    if(shopItemsListThisPage < shopItemsListLastPage) {';
        $this->HTML .= '        shopItemsListThisPage++;';
        $this->HTML .= '        $.ajax({';
        $this->HTML .= '            type: "POST",';
        $this->HTML .= '            url: "./components/Shop/script/shopItemSearchResult.php'.$urlPageData.'" + shopItemsListThisPage,';
        $this->HTML .= '            cache: false,';
        $this->HTML .= '            success: function(result) {';
//        $this->HTML .= '                alert(shopItemsListThisPage + " - " + shopItemsListLastPage);';
        $this->HTML .= '                $(".c_block.Shop").append(result);';
        $this->HTML .= '            }';
        $this->HTML .= '        });';
        $this->HTML .= '        return true;';
        $this->HTML .= '    }';
        $this->HTML .= '    return false;';
        $this->HTML .= '};';
        $this->HTML .= 'function resetPageCounter() {';
        $this->HTML .= '    shopItemsListThisPage = shopItemsListFerstPage;';
        $this->HTML .= '};';
        $this->HTML .= 'function setAmountOfPage(amount) {';
        $this->HTML .= '    shopItemsListLastPage = amount;';
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