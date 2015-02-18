<?php
/**
 * Класс для работы с модулями размещенными в конкретном блоке шаблона.
 */
class ModulesInBlock {
    private $page;
    private $block;
    private $lang;
    private $modulesData;
    private $modulesLangType;
    private $langHelper;
    private $modulePath;
    private $data;
    
    /**
     * Конструктор класса.
     * @global type $_URL_PARAMS - глобальный массив параметров URL.
     * @param type $block - alias блока.
     */
    public function __construct($block) {
        global $_URL_PARAMS;
        $this->page = $_URL_PARAMS['page'];
        $this->lang = $_URL_PARAMS['lang'];
        $this->block = $block;
        $this->modulePath = "./modules/";
        $this->getModulesData();
        $this->getFinalData();
    }
    
    /**
     * Получение данных о модулях из базы.
     */
    private function getModulesData() {
        $query = "select
            Mo.`alias`,
            Mo.`main`,
            Mo.`head`,
            Mo.`bodyStart`,
            Mo.`bodyEnd`,
            Mo.`includeOnceHead`,
            Mo.`includeOnceBodyStart`,
            Mo.`includeOnceBodyEnd`,
            CM.`moduleIdForLang`,
            CM.`block`,
            CM.`sequence`,
            CM.`showTitle`,
            CM.`cssClasses`,
            CM.`icon`,
            CM.`align`,
            CM.`width`,
            CM.`height`,
            CM.`createdModules`
            from (select
                MIB.`moduleIdForLang`,
                MIB.`block`,
                MIB.`sequence`,
                MIB.`showTitle`,
                MIB.`cssClasses`,
                MIB.`icon`,
                MIB.`align`,
                MIB.`width`,
                MIB.`height`,
                CM.`id` as createdModules,
                CM.`module`
                from (
                    select
                    MIB.`moduleIdForLang`,
                    MIB.`module`,
                    MIB.`block`,
                    MIB.`sequence`,
                    MIB.`showTitle`,
                    MIB.`cssClasses`,
                    MTI.`icon`,
                    MTI.`align`,
                    MTI.`width`,
                    MTI.`height`
                    from (
                        select
                        MIB.`id` as moduleIdForLang,
                        MIB.`module`,
                        MIB.`block`,
                        MIB.`sequence`,
                        MIB.`showTitle`,
                        MIB.`cssClasses`
                        from `ModulesOnPages` as MOP right join `ModulesInBlocks` as MIB
                            on MOP.`module` = MIB.`id`
                            where MIB.`display` = '1' and 
                                ((MOP.`page` = '$this->page' and MIB.`block` = '$this->block') 
                                or (MIB.`onAllPages`='1' and MIB.`block` = '$this->block'))
                    ) as MIB left join (
                        select
                        MTI.`module`,
                        MTI.`icon`,
                        MTIS.`align`,
                        MTIS.`width`,
                        MTIS.`height`
                        from `ModulesTitleIcon` as MTI 
                        left join `ModulesTitleIconStile` as MTIS
                            on MTI.`style` = MTIS.`style`
                    ) as MTI
                    on MTI.`module` = MIB.`moduleIdForLang`
                ) as MIB left join `CreatedModules` as CM
                on MIB.`module` = CM.`id`
            ) as CM left join `Modules` as Mo
            on CM.`module` = Mo.`alias`
            order by CM.`sequence` asc;";
        $mySqlHelper = new MySqlHelper($query);
        $this->modulesData = $mySqlHelper->getAllData();
    }
    
    /**
     * Получение параметров модуля.
     * @param String $createdModules - ID созданного модуля.
     * @return array - массив параметров.
     */
    private function getModulesParam ($createdModules) {
        $query = "Select * from `ModulesParam` where `module`='".$createdModules."';";
        $mySqlHelper = new MySqlHelper($query);
        return $mySqlHelper->getAllData();
    }
    
    /**
     * Получение заголовка для модуля.
     * @param String $moduleIdForLang - языковой ID для модуля.
     * @return string - заголовок.
     */
    private function getModulesLang($moduleIdForLang) {
        $this->langHelper = new LangHelper("ModulesInBlock_Lang","lang","module",$moduleIdForLang,$this->lang);
        $this->modulesLangType = $this->langHelper->getLangType();
        if($this->modulesLangType != -1){
            $title = $this->langHelper->getLangValue("title");
        } else {
            $title = "";
        }
        return $title;
    }
    
    /**
     * Функция сбора результирующего массива с данными о модулях.
     */
    private function getFinalData() {
        $this->data = null;
        $i=0;
        foreach ($this->modulesData as $row) {
            $modulePath = $this->modulePath.$row['alias']."/";
            $this->data[$i]['alias'] = $row['alias'];
            $this->data[$i]['main'] = $modulePath.$row['main'];
            $this->data[$i]['head'] = $modulePath.$row['head'];
            $this->data[$i]['bodyStart'] = $modulePath.$row['bodyStart'];
            $this->data[$i]['bodyEnd'] = $modulePath.$row['bodyEnd'];
            $this->data[$i]['includeOnceHead'] = $row['includeOnceHead']>0;
            $this->data[$i]['includeOnceBodyStart'] = $row['includeOnceBodyStart']>0;
            $this->data[$i]['includeOnceBodyEnd'] = $row['includeOnceBodyEnd']>0;
            $this->data[$i]['block'] = $row['block'];
            $this->data[$i]['sequence'] = $row['sequence'];
            $this->data[$i]['showTitle'] = $row['showTitle']>0;
            $this->data[$i]['cssClasses'] = $row['cssClasses'];
            $this->data[$i]['icon'] = $row['icon'];
            $this->data[$i]['align'] = $row['align'];
            $this->data[$i]['width'] = $row['width'];
            $this->data[$i]['height'] = $row['height'];
            $this->data[$i]['title'] = $this->getModulesLang($row['moduleIdForLang']);
            $this->data[$i]['param'] = $this->getModulesParam ($row['createdModules']);
            $i++;
        }
    }
    
    /**
     * Получитьм ассив с данными о модулях.
     * @return array - результирующий массив с данными о модулях.
     */
    public function getData() {
        return $this->data;
    }
    
    /**
     * Получение тестовой эхопечати.
     */
    public function getTestEcho() {
        foreach ($this->data as $value) {
            echo "-----------------------------";
            foreach ($value as $key => $v) {
                echo $key." - ".$v."<br>";
            }
        }
    }
}
?>
