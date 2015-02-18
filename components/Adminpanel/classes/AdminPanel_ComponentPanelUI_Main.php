<?php
class AdminPanel_ComponentPanelUI_Main {
    private $elements;
    private $URL_PARAMS;
    private $SQL_HELPER;
    private $thisLang;
    private $urlHelper;
    private $component;
    private $UI;
    private $adminFilePath;
    private $backButton;


    public function __construct() {
        $this->elements = array();
        global $_SQL_HELPER;
        $this->SQL_HELPER = $_SQL_HELPER;
        global $_URL_PARAMS;
        $this->thisLang = $_URL_PARAMS['lang'];
        $this->urlHelper = new UrlHelper();
        $this->URL_PARAMS = $_URL_PARAMS['params'];
        $this->component = $this->URL_PARAMS[1];
        $this->getComponentFilePath();
    }
    
    private function getComponentFilePath() {
        $query = "SELECT `adminDir` FROM `Components` WHERE `alias`='".$this->component."';";
        $result = $this->SQL_HELPER->select($query,1);
        $this->adminFilePath = './components/'.$this->component."/".$result['adminDir']."/elementsUI/";
    }


    public function addElement($alias,$elementName,$fileName) {
        $this->elements[$alias]['elementName'] = $elementName;
        $this->elements[$alias]['fileName'] = $fileName;
    }
    
    public function deletElement($alias) {
        unset($this->elements[$alias]);
    }
    
    private function getElementList() {
        $params = array();
        $params[0]='components';
        $params[1]=$this->component;
        $params[2]='element';
        $this->UI = '';
        $this->UI = '<h1>Панель администрирования</h1>';
        $this->UI .= '<div class="AdminPanelListUI ComponentsElementsListUI">';
        foreach ($this->elements as $alias => $element) {
            $params[3]=$alias;
            $this->UI .= '<div class="AdminPanelListElementUI ComponentElementElementUI AP_element_'.$alias.'">';
                $this->UI .= '<a href="'.$this->urlHelper->chengeParams($params).'">';
                    $this->UI .= '<div class="ElementUIText">';
                    $this->UI .= $element['elementName'];
                    $this->UI .= '</div>';
                $this->UI .= '</a>';
            $this->UI .= '</div>';
        }
        $this->UI .= '</div>';
    }
    
    private function includeAdminFile($alias) {
        if($this->adminFilePath!=null) {
            $this->generateBackButton();
            $filePath = $this->adminFilePath.$this->elements[$alias]['fileName'];
            echo '<h2>'.$this->elements[$alias]['elementName'].'</h2>';
            echo $this->backButton;
            if(file_exists($filePath)) {
                include_once $filePath;
            } else {
                echo "<p>Извините. Произошол сбой. Необходимый для подключения файл отсутствует.</p>";
            }
            $params = array();
            $params[0]='components';
            $params[1]=$this->component;
            echo $this->backButton;
        }
    }
    
    private function generateBackButton() {
        $params = array();
        $params[0]='components';
        $params[1]=$this->component;
        $this->backButton = '<center><div class="buttonBack"><a href="'.$this->urlHelper->chengeParams($params).'">Завершить редактирование<div class="buttonBackIcon"></div></a></div></center>';
    }
    
    public function getUI() {
        if(isset($this->URL_PARAMS[0]) && $this->URL_PARAMS[0]=='components' && isset($this->URL_PARAMS[1]) && 
                isset($this->URL_PARAMS[2]) && $this->URL_PARAMS[2]=='element' && isset($this->URL_PARAMS[3])) {
//            echo $this->UI;
            $this->includeAdminFile($this->URL_PARAMS[3]);
        } else {
//            echo $this->UI;
        }
        $this->getElementList();
            echo $this->UI;
    }
}
