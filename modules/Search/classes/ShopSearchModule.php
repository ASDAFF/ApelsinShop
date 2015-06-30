<?php
/**
 * Description of ShopSearchModule
 *
 * @author olga
 */
class ShopSearchModule {

    private $html;

    public function generationHtml() {
        $this->html = '<div class="searchModuleWrapper">';
            $this->html .= '<form class="searchModuleForm" name="searchModuleForm" action="./" method="post" autocomplete="off">';
            $this->html .= '<input type="search" name="searchModuleFormSearch" class="searchModuleFormSearch" maxlength="200">';
            $this->html .= '<div class="searchModuleFormSubmit"></div>';
            $this->html .= '</form>';
            $this->html .= '<div id="searchModuleResult" class="searchModuleResult"></div>';
        $this->html .= '</div>';
    }

    public function getHtml() {
        $this->generationHtml();
        return $this->html;
    }
}
