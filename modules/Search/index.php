<?php
include_once 'classes/ShopSearchModule.php';
$search = new ShopSearchModule();
echo $search->getHtml();
