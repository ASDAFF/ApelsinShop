<?php
class Menu {
    private $menuName;
    private $menuType;
    private $menuCssClass;
    private $thisLang;
    private $menuLangType;
    private $langHelper;
    private $menuData;
    private $menuItemsData;
    private $menuItems;
    private $menuTHML;
    
    public function __construct() {
        global $_PARAM;
        global $_URL_PARAMS;
        $this->thisLang = $_URL_PARAMS['lang'];
        $this->menuName = $_PARAM['name'];
        $this->getMenuData();
        $this->getMenuItemsData();
        $this->generateMenuHtml();
    }
    
    private function getMenuData() {
        $query = "select `name`, `type`, `cssClass` from `Menu`
            where `name` = '".$this->menuName."'";
        $mySqlHelper = new MySqlHelper($query);
        $this->menuData = $mySqlHelper->getDataRow(0);
        $this->menuType = $this->menuData['type'];
        $this->menuCssClass = $this->menuData['cssClass'];
    }
    
    private function getMenuItemsData() {
        $query = "select
            MeIt.`menuItem`, MeIt.`page`, MeIt.`postfix`,
            MeIt.`url`, MeIt.`sequence`, 
            MeIt.`target`, MeItPa.`parent`
            from (
                select
                MeItPa.`menuItem`, MeItPa.`page`, MeItPa.`postfix`,
                MeIt.`url`, MeIt.`sequence`, MeIt.`target`
                from (
                    select 
                    MeIt.`id`, MeIt.`url`, UrTa.`target`, MeIt.`sequence`
                    from `MenuItems` as MeIt left join `UrlTarget` as UrTa
                    on MeIt.`target` = UrTa.`id`
                    where MeIt.`menu` = '".$this->menuName."'
                ) as MeIt left join `MenuItemsPage` as MeItPa
                on MeIt.`id` = MeItPa.`menuItem`
            ) as MeIt left join `MenuItemParent` as MeItPa
            on MeIt.`menuItem` = MeItPa.`menuItem`
            order by MeIt.`sequence` asc";
        $mySqlHelper = new MySqlHelper($query);
        $this->menuItemsData = $mySqlHelper->getAllData();
        foreach ($this->menuItemsData as $menuItem) {
            //$this->menuItems['parent']['menuItem']['key'];
            $parent = 0;
            if($this->checkValue($menuItem['parent'])){
                $parent = $menuItem['parent'];
            }
            $this->menuItems[$parent][$menuItem['menuItem']]['menuItem']= $menuItem['menuItem'];
            $this->menuItems[$parent][$menuItem['menuItem']]['page']= $menuItem['page'];
            $this->menuItems[$parent][$menuItem['menuItem']]['postfix']= $menuItem['postfix'];
            $this->menuItems[$parent][$menuItem['menuItem']]['url']= $menuItem['url'];
            $this->menuItems[$parent][$menuItem['menuItem']]['target']= $menuItem['target'];
            $title = $this->getMenuLang($menuItem['menuItem']);
            $this->menuItems[$parent][$menuItem['menuItem']]['title'] = $title['title'];
        }
    }
    
    private function generateMenuHtml() {
        $out = $this->generateMenuLevelHtml(0);
        $this->menuTHML = $out;
    }
    
    public function getMenu() {
        echo $this->menuTHML;
    }
    
    private function generateMenuLevelHtml($parent) {
        $out = "";
        if(isset($this->menuItems[$parent]) && count($this->menuItems[$parent])>0) {
            if($parent!=0) {
                $javaID = $this->menuName."_child_".$parent;
                $out .= "<ul id='".$javaID."' style='display: none;' ";
                $out .= "class='menu child_menu ".$this->menuType." ";
                $out .= $this->menuCssClass." ".$this->menuName."' ";
                $out .= "onmouseover=\"showChildMenu('$javaID');\" ";
                $out .= "onmouseout=\"hideChildMenu('$javaID');\">";
            } else {
                $out .= "<ul id='".$this->menuName."' class='menu ";
                $out .= $this->menuType." ".$this->menuCssClass." ";
                $out .= $this->menuName."'>";
            }
            foreach ($this->menuItems[$parent] as $menuItem) {
                if($this->checkValue($menuItem['url'])) {
                    $url = $menuItem['url'];
                } else {
                    $urlHelper = new UrlHelper();
                    if($menuItem['postfix'][0]=="/") {
                        $menuItem['postfix'] = substr($menuItem['postfix'],1);
                    }
                    $url = $urlHelper->pageUrl($menuItem['page'], null).$menuItem['postfix'];
                }
                global $_URL_PARAMS;
                $thisPageClass = "";
                if($menuItem['page'] == $_URL_PARAMS['page']) {
                    $thisPageClass = "thisPage";
                }
                $javaChildID = $this->menuName."_child_".$menuItem['menuItem'];
//                $out .= "<a href='$url' target='".$menuItem['target']."'>";
                $out .= "<li onmouseover=\"showChildMenu('$javaChildID');\" onmouseout=\"hideChildMenu('$javaChildID');\" ";
                $out .= "class='$thisPageClass'>";
                $out .= "<a href='$url' target='".$menuItem['target']."'>";
                $out .= "<span text='text'>";
                $out .= $menuItem['title'];
                $out .= "</span>";
                $out .= "</a>";
                $out .= "</li>";
//                $out .= "</a>";
                $out .= $this->generateMenuLevelHtml($menuItem['menuItem']);
            }
            $out .= "</ul>";
        }
        return $out;
    }
    
    private function getMenuLang($id) {
        $this->langHelper = new LangHelper("MenuItems_Lang","lang","menuItem",$id,$this->thisLang);
        $this->menuLangType = $this->langHelper->getLangType();
        $langData = array();
        if($this->menuLangType != -1){
            $langData['title'] = $this->langHelper->getLangValue("title");
            $langData['noLocal'] = "";
        } else {
            $langData['noLocal'] = "";
            $langData['title'] = "";
        }
        return $langData;
    }
    
    private function checkValue($value) {
        if(isset($value) && $value!=null && $value!="") {
            return true;
        } else {
            return false;
        }
    }
}
?>
