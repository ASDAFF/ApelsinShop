<?php

class AdminPanel_ROOT {
    private $SQL_HELPER;
    private $URL_PARAMS;
    private $thisLang;
    private $urlHelper;
    
    private $adminFilePath;
    private $backButton;
    
    private $elementsDataList;
    private $adminPaneComponentsData;
    
    private $UI;
    
    private $yourUser;
    private $checkAuthorization;
    private $yourUserData;
    private $isAdmin;
    
    
    public function __construct() {
        $this->adminFilePath = null;
        global $_SQL_HELPER;
        $this->SQL_HELPER = $_SQL_HELPER;
        global $_URL_PARAMS;
        $this->thisLang = $_URL_PARAMS['lang'];
        $this->urlHelper = new UrlHelper();
        $this->URL_PARAMS = $_URL_PARAMS['params'];
        $this->getUserData();
        if($this->isAdmin) {
            $this->getDate();
            $this->ChekGeneratorUI();
        } else {
            $this->UI = "<p>Только администраторы имеют доступ к этой странице</p>";
        }
    }
    
    private function getUserData() {
        $this->yourUser = new UserData();
        $this->checkAuthorization = $this->yourUser->checkAuthorization();
        $this->isAdmin = $this->yourUser->isAdmin();
        $this->yourUserData = $this->yourUser->getUserData();
    }
    
    private function getDate() {
        $adminPaneComponents = new AdminPanel_Components();
        $this->adminPaneComponentsData = $adminPaneComponents->getComponents();
    }


    private function ChekGeneratorUI() {
        $this->elementsDataList = array();
        $this->backButton = "";
        if(isset($this->URL_PARAMS[0]) && !isset($this->URL_PARAMS[1])) {
        // Раздел выбран
            $this->generateButton_ToMainPanel();
            if($this->URL_PARAMS[0]=='components') {
                // Выбран раздел компонент
                $this->generateComponentsListUI();
            } else if($this->URL_PARAMS[0]=='modules') {
                $this->generateButton_ToMainPanel();
            } else if($this->URL_PARAMS[0]=='plugins') {
                $this->generateButton_ToMainPanel();
            } else {
                $this->generateUI();
            }
        } else if (isset($this->URL_PARAMS[0]) && $this->URL_PARAMS[0]=='components' && isset($this->URL_PARAMS[1]) && 
                (!isset($this->URL_PARAMS[2]) || $this->URL_PARAMS[2]!='component_element')) {
            // Выбран конкретный компонент
            $this->generateButton_ToComponents();
            $this->generateComponentUI($this->URL_PARAMS[1]);
        } else if(isset($this->URL_PARAMS[0]) && $this->URL_PARAMS[0]=='components' && isset($this->URL_PARAMS[1]) && 
                isset($this->URL_PARAMS[2]) && $this->URL_PARAMS[2]=='component_element' && isset($this->URL_PARAMS[3])) {
            // Выбран конкретный елемент компоненты
            $this->generateButton_ToComponent($this->URL_PARAMS[1]);
            $this->generateComponentElementUI($this->URL_PARAMS[1],$this->URL_PARAMS[3]);
        } else {
            $this->generateUI();
        }
        $this->UI .= $this->backButton;
    }


    private function generateUI() {
        $params = array();
        $this->UI = "";
        $this->UI .= '<div class="AdminPanelListUI ElementsListUI">';
        $params[0]='components';
        $this->UI .= '<div class="AdminPanelListElementUI ElementUI"><a href="'.$this->urlHelper->chengeParams($params).'"><div class="ElementUIText">Компоненты</div></a></div>';
        $params[0]='modules';
        $this->UI .= '<div class="AdminPanelListElementUI ElementUI"><a href="'.$this->urlHelper->chengeParams($params).'"><div class="ElementUIText">Модули</div></a></div>';
        $params[0]='plugins';
        $this->UI .= '<div class="AdminPanelListElementUI ElementUI"><a href="'.$this->urlHelper->chengeParams($params).'"><div class="ElementUIText">Плагины</div></a></div>';
        $this->UI .= '</div>';
    }
    
    private function generateComponentsListUI() {
        $params = array();
        $params[0]='components';
        $this->UI = "";
        $this->UI .= '<h1>Компоненты</h1>';
        $this->UI .= '<div class="AdminPanelListUI ComponentsListUI">';
        foreach ($this->adminPaneComponentsData as $component => $componentData) {
            $params[1]=$component;
            $this->UI .= '<div class="AdminPanelListElementUI ComponentElementUI AP_'.$component.'">';
                $this->UI .= '<a href="'.$this->urlHelper->chengeParams($params).'">';
                    $this->UI .= '<div class="ElementName ComponentElementName">';
                    $this->UI .= $componentData->getName();
                    $this->UI .= " [v".$componentData->getVersion()."]";
                    $this->UI .= '</div>';
                    $this->UI .= '<div class="ElementDescription ComponentElementDescription">';
                    $this->UI .= $componentData->getDesription();
                    $this->UI .= '</div>';
                    $this->UI .= '<div class="ElementInfo ComponentElementInfo">';
                    $this->UI .= "Автор: ".$componentData->getAuthor();
                    $this->UI .= '</div>';
                $this->UI .= '</a>';
            $this->UI .= '</div>';
        }
        $this->UI .= '</div>';
    }
    
    private function generateComponentUI($component) {
        $this->UI = "";
        if(!isset($this->adminPaneComponentsData[$component])) {
            $this->UI .= '<p>Выбранная компонента не найдена</p>';
            return;
        }
        $componentsElements = $this->adminPaneComponentsData[$component]->getComponentsElements();
        $this->adminFilePath=$this->adminPaneComponentsData[$component]->getAdminFilePath();
        $params = array();
        $params[0]='components';
        $params[1]=$component;
        $params[2]='component_element';
        $this->UI .= '<h1>Компонента: '.$this->adminPaneComponentsData[$component]->getName().' [v'.$this->adminPaneComponentsData[$component]->getVersion().']</h1>';
        $this->UI .= '<div class="MainAdminElementDescription">';
        $this->UI .= $this->adminPaneComponentsData[$component]->getDesription();
        $this->UI .= '</div>';
        $this->UI .= '<h1>Элементы компоненты</h1>';
        $this->UI .= '<div class="AdminPanelListUI ComponentsElementsListUI">';
        foreach ($componentsElements as $element => $componentsElementsData) {
            $params[3]=$element;
            $this->UI .= '<div class="AdminPanelListElementUI ComponentElementElementUI AP_'.$element.'">';
                $this->UI .= '<a href="'.$this->urlHelper->chengeParams($params).'">';
                    $this->UI .= '<div class="ElementUIText">';
                    $this->UI .= $componentsElementsData->getAlias();
                    $this->UI .= '</div>';
                $this->UI .= '</a>';
            $this->UI .= '</div>';
        }
        $this->UI .= '</div>';
    }
    
    private function generateComponentElementUI($component,$element) {
        $this->UI = "";
        if(!isset($this->adminPaneComponentsData[$component])) {
            $this->UI .= '<p>Выбранная компонента не найдена</p>';
            return;
        }
        $componentsElements = $this->adminPaneComponentsData[$component]->getComponentsElements();
        if(!isset($componentsElements[$element])) {
            $this->UI .= '<p>Выбранный элемент компоненты не найден</p>';
            return;
        }
        $this->UI .= '<h1>Компонента: '.$this->adminPaneComponentsData[$component]->getName().' [v'.$this->adminPaneComponentsData[$component]->getVersion().']</h1>';
        $this->UI .= '<div class="MainAdminElementDescription">';
        $this->UI .= $this->adminPaneComponentsData[$component]->getDesription();
        $this->UI .= '</div>';
        $this->UI .= '<h1>Элемент: '.$this->adminPaneComponentsData[$component]->getComponentsElement($element)->getName().'</h1>';
        $this->UI .= '<div class="MainAdminElementDescription">';
        $this->UI .= $this->adminPaneComponentsData[$component]->getComponentsElement($element)->getDesription();
        $this->UI .= '</div>';
        $this->adminFilePath=$this->adminPaneComponentsData[$component]->getComponentsElement($element)->getAdminFilePath();
    }
    
    private function generateButton_ToMainPanel() {
        $this->backButton = '<center><div class="buttonBack"><a href="'.$this->urlHelper->getThisParentPage().'">На главную страницу панели<div class="buttonBackIcon"></div></a></div></center>';
    }
    private function generateButton_ToComponents() {
        $params = array();
        $params[0]='components';
        $this->backButton = '<center><div class="buttonBack"><a href="'.$this->urlHelper->chengeParams($params).'">К списку компонетов<div class="buttonBackIcon"></div></a></div></center>';
    }
    
    private function generateButton_ToComponent($component) {
        $params = array();
        $params[0]='components';
        $params[1]=$component;
        $this->backButton = '<center><div class="buttonBack"><a href="'.$this->urlHelper->chengeParams($params).'">Перейти к компоненте<div class="buttonBackIcon"></div></a></div></center>';
    }
    
    public function getComponentsListUI() {
        return $this->UI;
    }
    
    public function includAdminFile() {
        if($this->adminFilePath!=null) {
//            echo '<h1>Панель администрирования</h1>';
            if(file_exists($this->adminFilePath)) {
                include_once $this->adminFilePath;
            } else {
                echo "<p>Извините. Произошол сбой. Необходимый для подключения файл отсутствует.</p>";
            }
            echo $this->backButton;
        }
    }
}
