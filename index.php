<?php
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

    }
} else {
    // Перенаправить в случае если сайт закрыт
    header('Location: ./sistem/closedPage.php');
}

?>
