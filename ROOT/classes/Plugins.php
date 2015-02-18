<?php
/**
 * Обработка плагинов дял сайта.
 */
class Plugins {
    private $page;
    private $pluginsDate = array();
    private $pluginsParam = array();
    private $pluginsPath;
    
    /**
     * Конструктор класса.
     * @global type $_URL_PARAMS - глобальный массив параметров URL.
     */
    public function __construct() {
        global $_URL_PARAMS;
        $this->page = $_URL_PARAMS['page'];
        $this->pluginsPath = "./plugins/";
        $this->getPluginsDate();
        foreach ($this->pluginsDate as $pd){
            $this->getPluginParam($pd['id'],$pd['alias']);
        }
    }
    
    /**
     * Получение данных о плагине из базы.
     */
    private function getPluginsDate() {
        $query = "Select
            PlOnPg.`id`, 
            Pl.`alias`, 
            PlOnPg.`page`, 
            Pl.`main`, 
            Pl.`head`,  
            Pl.`bodyEnd`,
            Pl.`sequence`
            from `PluginOnPage` as PlOnPg right join `Plugins` as Pl
            on PlOnPg.`plugin` = Pl.`alias`
            where PlOnPg.`page` = '$this->page' 
            or  Pl.`onAllPages`='1'
            order by Pl.`sequence` asc";
        $mySqlHelper = new MySqlHelper($query);
        $this->pluginsDate = $mySqlHelper->getAllData();
    }
    
    /**
     * Получение списка параметров для плагина.
     * @param type $id - id плагина.
     * @param type $plugin - имя плагина.
     */
    private function getPluginParam($id,$plugin) {
        $query = "Select * from `PluginDefaultParam` where `plugin`='".$plugin."'";
        $mySqlHelper = new MySqlHelper($query);
        $this->pluginsParam[$plugin]['default'] = $mySqlHelper->getAllData();
        $query = "Select * from `PluginParam` where `plugin`='".$id."'";
        $mySqlHelper = new MySqlHelper($query);
        $this->pluginsParam[$plugin]['page'] = $mySqlHelper->getAllData();
    }
    
    /**
     * Подключение файлов.
     * @global type $_PARAM - глобальный массив параметров.
     * @param type $key - ключ.
     */
    private function includeFile($key) {
        foreach ($this->pluginsDate as $plugin) {
            global $_PARAM;
            $_PARAM = null;
            $params = $this->pluginsParam[$plugin['alias']]['default'];
            if($params!=null) {
                foreach ($params as $param) {
                    $_PARAM[$param['param']] = $param['value'];
                }
            }
            $params = $this->pluginsParam[$plugin['alias']]['page'];
            if($params!=null) {
                foreach ($params as $param) {
                    $_PARAM[$param['param']] = $param['value'];
                }
            }
            if(isset($plugin[$key]) && $plugin[$key]!=null && $plugin[$key]!="") {
                include_once $this->pluginsPath.$plugin['alias']."/".$plugin[$key];
            }
            $_PARAM = null;
        }
    }
    
    /**
     * Подключение заголовка.
     */
    public function includeHead() {
        $this->includeFile('head');
    }
    
    /**
     * Подключение основного файла.
     */
    public function includePlugin() {
        $this->includeFile('main');
    }
    
    /**
     * Подключение основного файла.
     */
    public function includeBodyEnd() {
        $this->includeFile('bodyEnd');
    }
}
?>
