<?php
/**
 * Класс для работы со страницами CMS
 */
class Pages {
    private $lang;
    private $page;
    private $errors;
    private $pageParam;
    private $pageData;
    private $componentPath;
    private $pageTitle;
    private $browserTitle;
    
    /**
     * Конструктор класса.
     * @global type $_URL_PARAMS - глобальный массив параметров URL
     */
    public function __construct() {
        global $_URL_PARAMS;
        $this->page = $_URL_PARAMS['page'];
        $this->lang = $_URL_PARAMS['lang'];
        $this->errors = null;
        $this->componentPath = "./components/";
        $this->getPageLangData();
        $this->getPagesDate();
        $this->getPageParam();
    }
        
    /**
     * Получение переведенной информации о странице
     */
    private function getPageLangData() {
        $pageLang = new LangHelper("Pages_Lang","lang","page",$this->page,$this->lang);
        $pageLangType = $pageLang->getLangType();
        if($pageLangType != -1){
            $pageLangData = $pageLang->getLangData();
            $this->pageData['browserTitle'] = $pageLangData['browserTitle'];
            $this->pageData['pageTitle'] = $pageLangData['pageTitle'];
            $this->pageData['description'] = $pageLangData['description'];
            $this->pageData['keywords'] = $pageLangData['keywords'];
            $this->pageTitle = $this->pageData['pageTitle'];
            $this->browserTitle = $this->pageData['browserTitle'];
        } else {
            $this->pageData['browserTitle'] = "";
            $this->pageData['pageTitle'] = "";
            $this->pageData['description'] = "";
            $this->pageData['keywords'] = "";
            $this->pageTitle = "";
            $this->browserTitle = "";
            $this->errors[] = "Ни одного языка не задано для этой страницы";
        }
    }
    
    /**
     * Получение параметров страницы
     */
    private function getPageParam() {
        $query = "Select * from `PageParam` where `page`='".$this->page."'";
        $mySqlHelper = new MySqlHelper($query);
        $this->pageParam = $mySqlHelper->getAllData();
    }

    /**
     * Получение информации о странице
     */
    private function getPagesDate() {
        $query = "
            Select
            PgCoEl.`alias`, 
            PgCoEl.`showTitle`, 
            PgCoEl.`cssClasses`, 
            PgCoEl.`componentElement`, 
            PgCoEl.`template`, 
            PgCoEl.`isMainPage`, 
            PgCoEl.`index`, 
            PgCoEl.`follow`, 
            PgCoEl.`archive`,
            PgCoEl.`componentElementName`,
            PgCoEl.`component`, 
            PgCoEl.`mainPage`, 
            PgCoEl.`printPage`, 
            PgCoEl.`mobilePage`, 
            PgCoEl.`head`, 
            PgCoEl.`bodyStart`, 
            PgCoEl.`bodyEnd`,
            Te.`main` as templateMain, 
            Te.`mobile` as templateMobile, 
            Te.`print` as templatePrint
            from (
                Select
                Pg.`alias`, 
                Pg.`showTitle`, 
                Pg.`cssClasses`, 
                Pg.`componentElement`, 
                Pg.`template`, 
                Pg.`isMainPage`, 
                Pg.`index`, 
                Pg.`follow`, 
                Pg.`archive`,
                CoEl.`alias` as componentElementName,
                CoEl.`component`, 
                CoEl.`mainPage`, 
                CoEl.`printPage`, 
                CoEl.`mobilePage`, 
                CoEl.`head`, 
                CoEl.`bodyStart`, 
                CoEl.`bodyEnd`
                from `Pages` as Pg left join `ComponentsElements` as CoEl
                on Pg.`componentElement` = CoEl.`id`
                where Pg.`alias` = '".$this->page."'
            ) as PgCoEl left join `Templates` as Te
            on PgCoEl.`template` = Te.`alias`;";
        $mySqlHelper = new MySqlHelper($query);
        $pageData = $mySqlHelper->getDataRow(0);
        $this->pageData['alias'] = $pageData['alias'];
        $this->pageData['showTitle'] = $pageData['showTitle']>0;
        $this->pageData['cssClasses'] = $pageData['cssClasses']!=null ? $pageData['cssClasses'] : "";
        $this->pageData['componentElement'] = $pageData['componentElement'];
        $this->pageData['template'] = $pageData['template'];
        $this->pageData['isMainPage'] = $pageData['isMainPage']>0;
        $this->pageData['index'] = $pageData['index']>0;
        $this->pageData['follow'] = $pageData['follow']>0;
        $this->pageData['archive'] = $pageData['archive']>0;
        $this->pageData['componentElementName'] = $pageData['componentElementName'];
        $this->pageData['component'] = $pageData['component'];
        $componentElementPath = $this->componentPath.$this->pageData['component']."/".$this->pageData['componentElementName']."/";
        $this->pageData['mainPage'] = $componentElementPath."/".$pageData['mainPage'];
        $this->pageData['printPage'] = $componentElementPath."/".$pageData['printPage'];
        $this->pageData['mobilePage'] = $componentElementPath."/".$pageData['mobilePage'];
        $this->pageData['head'] = $pageData['head']!=null ? $componentElementPath.$pageData['head'] : null;
        $this->pageData['bodyStart'] = $pageData['bodyStart']!=null ? $componentElementPath.$pageData['bodyStart'] : null;
        $this->pageData['bodyEnd'] = $pageData['bodyEnd']!=null ? $componentElementPath.$pageData['bodyEnd'] : null;
        $this->pageData['templatePath'] = "./templates/".$this->pageData['template']."/";
        $this->pageData['templateMain'] = $this->pageData['templatePath'].$pageData['templateMain'];
        $this->pageData['templateMobile'] = $this->pageData['templatePath'].$pageData['templateMobile'];
        $this->pageData['templatePrint'] = $this->pageData['templatePath'].$pageData['templatePrint'];
    }

    /**
     * Получить название компоненты.
     * @return String - Имя компоненты.
     */
    public function getComponent() {
        return $this->pageData['component'];
    }
    
    /**
     * Поулчить имя елемента компоненты.
     * @return String - Имя елемента компоненты.
     */
    public function getComponentElement() {
        return $this->pageData['componentElementName'];
    }
    
    /**
     * Получить заголовок страницы.
     * @return String - Заголовок страницы.
     */
    public function getPageTitle() {
        return $this->pageTitle;
    }
    
    public function setDefaultPageTitle() {
        $this->pageTitle = $this->pageData['pageTitle'];
    }
    
    public function setPageTitle($pageTitle) {
        $this->pageTitle = $pageTitle;
    }
    
    /**
     * Получить заголовок страницы для вкладки браузера.
     * @return String - Заголовок страницы для вкладки браузера.
     */
    public function getTitle() {
        return $this->browserTitle;
    }
    
    public function setDefaultTitle() {
        $this->browserTitle = $this->pageData['browserTitle'];
    }
    
    public function setTitle($browserTitle) {
        $this->browserTitle = $browserTitle;
    }

        /**
     * Получить опсиание.
     * @return String - Описание.
     */
    public function getDescription() {
        return $this->pageData['description'];
    }
    
    /**
     * Получить ключевые слова.
     * @return String - Ключевые слова.
     */
    public function getKeywords() {
        return $this->pageData['keywords'];
    }
    
    /**
     * Отображать ли заголовок страницы.
     * @return true | false
     */
    public function showTitle() {
        return $this->pageData['showTitle'];
    }
    
    /**
     * Css Class для контента.
     * @return String - Css Class.
     */
    public function getCssClass() {
        return $this->pageData['cssClasses'];
    }

    /**
     * Главная ли страница.
     * @return true | false
     */
    public function isMain() {
        return $this->pageData['isMainPage'];
    }

    /**
     * Строка инструкций для робота.
     * @return String - Robot String.
     */
    public function getRobotString() {
        $out = $this->pageData['index'] ? 'index' : 'noindex';
        $out .= $this->pageData['follow'] ? ', follow' : ', nofollow';
        $out .= $this->pageData['archive'] ? ', archive' : '';
        return $out;
    }
    
    /**
     * Подключение файлов
     * @global type $_PARAM - параметры страницы
     * @param type $path - путь к файлу
     */
    private function includePage($path) {
        global $_PARAM;
        $_PARAM = null;
        if($this->pageParam!=null) {
            foreach ($this->pageParam as $param) {
                $_PARAM[$param['param']] = $param['value'];
            }
        }
        include_once $path;
        $_PARAM = null;
    }


    /**
     * Подключить основной файл
     */
    public function includContent() {
        $this->includePage($this->pageData['mainPage']);
    }
    
    /**
     * Подключить страницу для печати
     */
    public function includPrintPage() {
        $this->includePage($this->pageData['printPage']);
    }
    
    /**
     * Подключить мобильную версию
     */
    public function includMobilePage() {
        $this->includePage($this->pageData['mobilePage']);
    }
    
    /**
     * Подключить файл заголовка
     */
    public function includHead() {
        $this->includePage($this->pageData['head']);
    }
    
    /**
     * Подключить префиксный файл
     */
    public function includBodyStart() {
        $this->includePage($this->pageData['bodyStart']);
    }
    
    /**
     * Подключить постфиксный файл
     */
    public function includBodyEnd() {
        $this->includePage($this->pageData['bodyEnd']);
    }
    
    /**
     * Подключить основной шаблон
     */
    public function includeTemplate() {
        include_once $this->pageData['templateMain'];
    }
    
    /**
     * Подключить шаблон версии для печати
     */
    public function includePrintTemplate() {
        include_once $this->pageData['templatePrint'];
    }
    
    /**
     * Подключить шаблон мобильной версии
     */
    public function includeMobileTemplate() {
        include_once $this->pageData['templateMobile'];
    }
    
    /**
     * Подключить путь к папке шаблона
     */
    public function getTemplatePath() {
        return $this->pageData['templatePath'];
    }
}
?>