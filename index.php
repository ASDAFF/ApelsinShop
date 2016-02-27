<?php
//$mtime = microtime();
//$mtime = explode(" ",$mtime);
//$mtime = $mtime[1] + $mtime[0];
//$tstart = $mtime;
ini_set("memory_limit", "1024M");
ini_set('max_execution_time', 1200);
@session_start();
// Включить отображение ошибок
ini_set("display_errors",1);
error_reporting(E_ALL);
// Подключение библиотек ядра
include_once './ROOT/functions/includeSistemClasses.php';
includeSistemClasses();
// Инициализация параметров
global $_PARAM;
$_PARAM = null;
// Инициализация конфигурации
global $_SITECONFIG;
$_SITECONFIG = new SiteConfig();
// Создание помошника базы данных
global $_SQL_HELPER;
$_SQL_HELPER = new MysqliHelper();
// Поулчение параметров ссылки
$urlParams = new UrlParams();
global $_URL_PARAMS;
$_URL_PARAMS = $urlParams->getUrlParam();
$urlHelper = new UrlHelper();
// Получение карты сайта
global $SITE_MAP;
$SITE_MAP = new SiteMap();

// Работа со страницей
if(!$_SITECONFIG->getSiteClosed()) {
    if($_URL_PARAMS['isRedirect']) {
        // Перенаправить если необходимо изменить URL
        header('Location: '.$urlHelper->createUrlWithHTTP($_URL_PARAMS['page'], 
                $_URL_PARAMS['lang'], $_URL_PARAMS['params']));
    } else {
        // Инициализация локали
        global $LOCAL;
        $LOCAL = new Localization();
        // Инициализация ядра
        global $ROOT;
        $ROOT= new Root();
        // Подключение шаблона
        $ROOT->includeTemplate();
        
//        for($i=0; $i < 10000; $i++) {
//            echo $i.' &#'.$i.';<br>';
//        }
        
        
    }
} else {
    // Перенаправить в случае если сайт закрыт
    header('Location: ./sistem/closedPage.php');
}
//$mtime = microtime(); 
//$mtime = explode(" ",$mtime); 
//$mtime = $mtime[1] + $mtime[0]; 
//$tend = $mtime; 
//$total = ($tend - $tstart);
//echo $total;
?>
