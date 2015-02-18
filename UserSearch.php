<?php
header("Content-type: text/html; charset=UTF-8");
if(isset($_POST['search'])) {
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



    $search = $_POST['search'];
    $search = addslashes($search);
    $search = htmlspecialchars($search);
    $search = stripslashes($search);

    if($search == ''){
            exit("");
    }
    $sqlHelper = new MysqliHelper();
    $query = "SELECT * FROM `Users` WHERE `login` LIKE '$search%';";
    $result = $sqlHelper->select($query);

    'http://jiyuu-fest.ru/accounts/rus/Makson/';



    $page = 'accounts';
    if($result!=null) {
        foreach ($result as $user) {
            $params[0]= $user['login'];
            $url = $urlHelper->pageUrl($page,$params);
            echo "<div class='searchResultElement'><a href='$url'>".$user['login']."</a></div>";
        }
    } else {
        echo "Нет Результатов";
    }	
}
?>      	
