<?php
/**
 * Класс для работы с модулями.
 */
class Modules {
    private $page;
    private $lang;
    private $blocks;
    private $modules;
    private $moduleFile;
    
    /**
     * Конструктор класса.
     * @global type $_URL_PARAMS - глобальный массив параметров URL.
     */
    public function __construct() {
        global $_URL_PARAMS;
        $this->page = $_URL_PARAMS['page'];
        $this->lang = $_URL_PARAMS['lang'];
        $this->getTemplateBlocks();
        $this->getModulesInBlockData();
        $this->getModulesFiles();
    }
    
    /**
     * Получение из базы списка блоков шаблона указанной страницы.
     */
    private function getTemplateBlocks() {
        $query = "select
            TB.`id`,
            TB.`block` 
            from (select
                Te.`alias` as template
                from `Pages` as Pg left join `Templates` as Te
                    on Pg.`template` = Te.`alias`
                    where Pg.`alias` = '$this->page') 
                as Te left join `TemplateBlocks` as TB
                on Te.`template` = TB.`template`";
        $mySqlHelper = new MySqlHelper($query);
        $blocksData = $mySqlHelper->getAllData();
        $this->blocks = array();
        $i=0;
        foreach ($blocksData as $block) {
            $this->blocks[$i]['id'] = $block['id'];
            $this->blocks[$i++]['block'] = $block['block'];
        }
    }
    
    /**
     * Получение информации о модулях по блокам.
     */
    private function getModulesInBlockData() {
        foreach ($this->blocks as $block) {
            $modulesInBlock = new ModulesInBlock($block['id']);
            $this->modules[$block['block']] = $modulesInBlock->getData();
        }
    }
    
    /**
     * Возвращает массив всех модулей.
     * @return array - массив всех модулей.
     */
    public function getModules() {
        return $this->modules;
    }
    
    /**
     * Возвращает массив модулей указанного блока шаблона.
     * @param String $block - alias блока шаблона.
     * @return array - массив модулей указанного блока шаблона.
     */
    public function getModulesInBlock($block) {
        return $this->modules[$block];
    }
    
    /**
     * Получение списка подключаемых файлов.
     */
    private function getModulesFiles() {
        $this->moduleFile = null;
        $i = 0;
        foreach ($this->modules as $modulesInBlocks) {
            if(count($modulesInBlocks)>0) {
                foreach ($modulesInBlocks as $module) {
                    $this->moduleFile[$i]['head'] = $module['head'];
                    $this->moduleFile[$i]['bodyStart'] = $module['bodyStart'];
                    $this->moduleFile[$i]['bodyEnd'] = $module['bodyEnd'];
                    $this->moduleFile[$i]['includeOnceHead'] = $module['includeOnceHead'];
                    $this->moduleFile[$i]['includeOnceBodyStart'] = $module['includeOnceBodyStart'];
                    $this->moduleFile[$i]['includeOnceBodyEnd'] = $module['includeOnceBodyEnd'];
                    $this->moduleFile[$i++]['param'] = $module['param'];
                }
            }
        }
    }
    
    /**
     * Подключение файлов.
     * @global type $_PARAM - глобальный массив параметров.
     * @param type $key - ключ подключаемого файла.
     * @param type $key2 - ключ к переменной includeOnce для подключаемого файла.
     */
    private function includeFile($key,$key2) {
        if(count($this->moduleFile)>0) {
            foreach ($this->moduleFile as $modules) {
                global $_PARAM;
                $_PARAM = null;
                if($modules['param']!=null) {
                    foreach ($modules['param'] as $param) {
                        $_PARAM[$param['param']] = $param['value'];
                    }
                }
                if($modules[$key]!=null && $modules[$key]!="") {
                    if($modules[$key2]>0) {
                        include_once $modules[$key];
                    } else {
                        include $modules[$key];
                    }
                }
                $_PARAM = null;
            }
        }
    }
    
    /**
     * Подключение файлов заголовка
     */
    public function includeHead() {
        $this->includeFile('head','includeOnceHead');
    }
    
    /**
     * Подключение файлов префикса.
     */
    public function includeBodyStart() {
        $this->includeFile('bodyStart','includeOnceBodyStart');
    }
    
    /**
     * Подклчюение файлов постфикса.
     */
    public function includeBodyEnd() {
        $this->includeFile('bodyEnd','includeOnceBodyEnd');
    }
}
?>
