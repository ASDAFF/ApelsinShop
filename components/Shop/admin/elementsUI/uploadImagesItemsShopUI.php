<?php
include_once './components/Shop/admin/classes/AP_UploadImagesItemsShop.php';
include_once './components/Shop/admin/classes/Unpacking.php';
$uploadImagesItemsShopUI = new AP_UploadImagesItemsShop();
echo $uploadImagesItemsShopUI->getHtml();

