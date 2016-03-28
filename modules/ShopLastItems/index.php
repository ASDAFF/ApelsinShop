<?php 
include_once './modules/ShopLastItems/classes/ShopLastItems.php';
$shopLastItems = new ShopLastItems();
$shopLastItems->get();


//global $_SITECONFIG;
//$_SITECONFIG = new SiteConfig();
////setCookie('hash', 'test me, please', time() + 3600, '/', $_SITECONFIG->getHostName());
//echo $_COOKIE["ShopLastItemsCookies"];