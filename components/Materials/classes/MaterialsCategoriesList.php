<?php
class MaterialsCategoriesList {
    private $thisPage;
    private $thisLang;
    private $params;
    private $langType;
    private $listName;
    private $groupByCategoty;
    private $listData;
    private $noData;
    private $materialsData;
    private $materialsDataOnCategory;
    private $materialsCategorias;
    private $html;
    
    public function __construct() {
        $this->noData = false;
        global $_URL_PARAMS;
        global $_PARAM;
        $this->thisPage = $_URL_PARAMS['page'];
        $this->thisLang = $_URL_PARAMS['lang'];
        $this->params = $_URL_PARAMS['params'];
        $this->listName = $_PARAM['name'];
        if($this->params != null && count($this->params)>0) {
            $material = new MaterialForGroup($this->params[0],$this->thisPage);
            $this->getListText();
            echo "<h1>";
            echo $this->listData['title'];
            echo "</h1>";
            echo $this->listData['description'];
            echo "<hr>";
            $material->getHtml();
        } else {
            if(isset($_PARAM['groupByCategoty'])) {
                $_PARAM['groupByCategoty'] == 0 ? $this->groupByCategoty = false : $this->groupByCategoty = true;
            } else {
                $this->groupByCategoty = false;
            }
            $this->getListData();
            $this->generateHTML();
        }
    }
    
    private function getListData() {
        $query = "select * from `MaterialsCategoriesList` where `name`='".$this->listName."'";
        $mySqlHelper = new MySqlHelper($query);
        $this->listData = $mySqlHelper->getDataRow(0);
        if(count($this->listData) == 0) {
            $this->noData = true;
            return;
        }
        if($this->groupByCategoty) {
            $this->getListText();
            $this->getCategoriasInList();
            foreach ($this->materialsCategorias as $category) {
                $this->getMaterialsDataOnCategory($category['category']);
            }
        } else {
            $this->getMaterialsData();
        }
    }
    
    private function getListText() {
        $langHelper = new LangHelper("MaterialsCategoriesList_Lang","lang","list",$this->listName,$this->thisLang);
        $this->langType = $langHelper->getLangType();
        if($this->langType != -1){
            $this->listData['title'] = $langHelper->getLangValue("name");
            $this->listData['description'] = $langHelper->getLangValue("description");
        } else {
            $this->listData['title'] = "";
            $this->listData['description'] = "";
        }
        return $materialData;
    }
    
    private function getCategoriasInList() {
        $query = "select MCL.`category`, MCL.`list`, MC.`created`
                    from `MaterialsCategoriesInList` as MCL 
                    left join `MaterialsCategories` as MC
                    on MCL.`category` = MC.`alias`
                    where MCL.`list`='".$this->listName."'
                    order by MCL.`sequence` asc";
        $mySqlHelper = new MySqlHelper($query);
        $this->materialsCategorias = $mySqlHelper->getAllData(); 
        $i = 0;
        foreach ($this->materialsCategorias as $category) {
            $this->materialsCategorias[$i++]['text'] = $this->getMaterialCategoryDataText($category['category']);
        }
    }
    
    private function getMaterialsData() {
        $query = "select 
            MIC.`material`, Ma.`created` as m_created, Ma.`lastChange`, Ma.`showTitle`, 
            Ma.`showCreated`, Ma.`showChange`,MIC.`category`, MIC.`list`, MIC.`created` as c_created
            from (
                    Select MIC.`material`, MCL.`category`, MCL.`list`, MCL.`created` 
                    from (
                            select MCL.`category`, MCL.`list`, MC.`created`
                            from `MaterialsCategoriesInList` as MCL 
                            left join `MaterialsCategories` as MC
                            on MCL.`category` = MC.`alias`
                            where MCL.`list`='".$this->listName."'
                    ) as MCL
                    left join `MaterialsInCategories` as MIC
                    on MCL.`category` = MIC.`category`
            ) as MIC
            left join `Materials` as Ma
            on MIC.`material` = Ma.`alias`
            order by m_created desc";
        $mySqlHelper = new MySqlHelper($query);
        $this->materialsData = $mySqlHelper->getAllData();
    }
    
    private function getMaterialsDataOnCategory($category) {
        $query = "select 
            MIC.`material`, Ma.`created` as m_created, Ma.`lastChange`, Ma.`showTitle`, 
            Ma.`showCreated`, Ma.`showChange`,MIC.`category`, MIC.`list`, MIC.`created` as c_created
            from (
                    Select MIC.`material`, MCL.`category`, MCL.`list`, MCL.`created` 
                    from (
                            select MCL.`category`, MCL.`list`, MC.`created`
                            from `MaterialsCategoriesInList` as MCL 
                            left join `MaterialsCategories` as MC
                            on MCL.`category` = MC.`alias`
                            where MCL.`category`='".$category."'
                    ) as MCL
                    left join `MaterialsInCategories` as MIC
                    on MCL.`category` = MIC.`category`
            ) as MIC
            left join `Materials` as Ma
            on MIC.`material` = Ma.`alias`
            order by m_created desc";
        $mySqlHelper = new MySqlHelper($query);
        $this->materialsDataOnCategory[$category] = $mySqlHelper->getAllData();
    }
    
    private function getMaterialDataText($malerial) {
        $langHelper = new LangHelper("Materials_Lang","lang","material",$malerial,$this->thisLang);
        $this->langType = $langHelper->getLangType();
        if($this->langType != -1){
            $materialData['title'] = $langHelper->getLangValue("title");
            $materialData['text'] = $langHelper->getLangValue("text");
        } else {
            $materialData['title'] = "";
            $materialData['text'] = "";
        }
        return $materialData;
    }
    
    private function getMaterialCategoryDataText($category) {
        $langHelper = new LangHelper("MaterialsCategories_Lang","lang","category",$category,$this->thisLang);
        $langType = $langHelper->getLangType();
        if($langType != -1){
            $categoryData['name'] = $langHelper->getLangValue("name");
            $categoryData['description'] = $langHelper->getLangValue("description");
        } else {
            $categoryData['name'] = $category;
            $categoryData['description'] = "";
        }
        return $categoryData;
    }
    
    private function getDate($malerialData) {
        $out = "";
        if($malerialData['showCreated']>0) {
            if($malerialData['showChange']>0) {
                $date = new DateTime($malerialData['lastChange']);
            } else {
                $date = new DateTime($malerialData['m_created']);
            }
            $out .= "<div class='materials_date'>".$date->format('d M Y')."</div>";
        }
        return $out;
    }
    
    private function generateHTML() {
        $out = "";
        if($this->groupByCategoty) {
            $out .= "<h1>";
            $out .= $this->listData['title'];
            $out .= "</h1>";
            $out .= $this->listData['description'];
            $out .= "<hr>";
            $out .= "<table class='materialsCategoriasTable'>";
            $f=1;
            foreach ($this->materialsCategorias as $category) {
                if($f==1) {
                    $out .= "<tr>";
                    $out .= $this->generateCategoryElementHTML($category);
                    $f = 2;
                } else {
                    $out .= $this->generateCategoryElementHTML($category);
                    $out .= "</tr>";
                    $f = 1;
                }
            }
            $out .= "</table>";
        } else {
            foreach ($this->materialsData as $material) {
                $out .= $this->generateElementHTML($material);
            }
        }
        $this->html = $out;
    }
    
    private function generateCategoryElementHTML($category) {
        $out = "<td>";
        $out .= "<h4>";
        $img = "./components/Materials/images/material_components_img_icon/".$category['category'].".png";
        if(file_exists ($img)) {
            $out .= "<img src='$img' class='material_components_img_icon' align='left'>";
        }
        $out .= $category['text']['name'];
        $out .= "</h4>";
        $out .= "<ul class='materials_list'>";
        foreach ($this->materialsDataOnCategory[$category['category']] as $material) {
            $materialData = $this->getMaterialDataText($material['material']);
            $out .= "<a href='".$this->thisPage."/".$material['material']."'>";
            $out .= "<li>";
            $out .= $materialData['title'];
            $out .= "</li>";
            $out .= "</a>";
        }
        $out .= "</ul>";
        $out .= "</td>";
        return $out;
    }
    
    public function generateElementHTML($material) {
        $materialData = $this->getMaterialDataText($material['material']);
        $out = "<div class='material_element'>";
        $out .= "<h2>";
        $out .= "<a id='".$material['material']."'></a>";
        $out .= $materialData['title'];
        $out .= "</h2>";
        $out .= "<div class='text'>";
        $img = "./components/Materials/images/material_img_icon/".$material['material'].".png";
        if(file_exists ($img)) {
            $out .= "<img src='$img' class='material_img_icon' align='right'>";
        }
        $out .= $materialData['text'];
        $out .= "</div>";
        $out .= $this->getDate($material);
        $out .= "</div>";
        return $out;
    }
    
    public function getHtml() {
        echo $this->html;
    }
}

class MaterialForGroup {
    private $thisLang;
    private $parentPage;
    private $malerial;
    private $malerialData;
    private $langType;
    private $html;
    private $noData;
    
    public function __construct($materialId,$page) {
        $this->noData = false;
        $this->parentPage = $page;
        global $_URL_PARAMS;
        $this->thisLang = $_URL_PARAMS['lang'];
        $this->malerial = $materialId;
        $this->generateHtml();
    }
    
    private function getMaterialData() {
        $query ="select * from `Materials` where `alias`='$this->malerial'";
        $mySqlHelper = new MySqlHelper($query);
        $this->malerialData = $mySqlHelper->getDataRow(0);
        if(count($this->malerialData) == 0) {
            $this->noData = true;
            return;
        }
        $this->getMaterialDataText();
        $this->getCategories();
    }
    
    private function getMaterialDataText() {
        $this->langHelper = new LangHelper("Materials_Lang","lang","material",$this->malerial,$this->thisLang);
        $this->langType = $this->langHelper->getLangType();
        if($this->langType != -1){
            $this->malerialData['title'] = $this->langHelper->getLangValue("title");
            $this->malerialData['text'] = $this->langHelper->getLangValue("text");
        } else {
            $this->malerialData['title'] = "";
            $this->malerialData['text'] = "";
        }
    }
    
    private function getCategories() {
        $query ="select * from `MaterialsInCategories` where `material`='$this->malerial'";
        $mySqlHelper = new MySqlHelper($query);
        $this->malerialData['categories'] = $mySqlHelper->getAllData();
    }


    private function generateHtml() {
        $this->getMaterialData();
        if($this->noData) {
            $this->html = "404 - Страница не найдена";
            return;
        }
        $out = "";
        if($this->malerialData['showTitle']>0) {
            $out .= "<h1 class='material_group_title'>".$this->malerialData['title']."</h1><hr>\n";
        }
        $out .= "<div class='text'>";
        $out .= $this->malerialData['text'];
        $out .= "</div>";
        $out .= $this->getDate();
        
        $urlHelper = new UrlHelper();
        $url = $urlHelper->pageUrl($this->parentPage, null);
        $out .= '<center><div class="no_ie"><a href="'.$url.'"><button type="button" class="apelsin_button">Завершить просмотр</button></a></div></center>';
        $out .= '<center><div class="ie"><a href="'.$url.'">Завершить просмотр</a></div></center>';
        $this->html = $out;
    }
    
    private function getDate() {
        $out = "";
        if($this->malerialData['showCreated']>0) {
            if($this->malerialData['showChange']>0) {
                $date = new DateTime($this->malerialData['lastChange']);
            } else {
                $date = new DateTime($this->malerialData['created']);
            }
            $out .= "<div class='materials_info_panel'><span class='date'>".$date->format('d M Y')."</span></div>";
        }
        return $out;
    }
    
    public function getHtml() {
        if(!$this->noData) {
            echo $this->html;
        } else {
            include_once './error/404.php';
        }
    }
}
?>
