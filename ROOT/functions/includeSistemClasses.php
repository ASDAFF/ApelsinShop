<?php
function includeSistemClasses($path = './ROOT/') {
    include_once $path.'configure.php';
    include_once $path.'classes/SiteConfig.php';
    
    include_once $path.'classes/MySqliConnectHelper.php';
    include_once $path.'classes/MySqlHelper.php';
    include_once $path.'classes/MysqliHelper.php';
    include_once $path.'classes/LangHelper.php';
    include_once $path.'classes/UrlHelper.php';
    include_once $path.'classes/InputHelper.php';
    include_once $path.'classes/InputValueHelper.php';
    
    include_once $path.'classes/UrlParams.php';
    include_once $path.'classes/ModulesInBlock.php';
    include_once $path.'classes/Modules.php';
    include_once $path.'classes/Plugins.php';
    include_once $path.'classes/Pages.php';
    include_once $path.'classes/Root.php';
    include_once $path.'classes/Localization.php';
    include_once $path.'classes/XML.php';
    
    include_once $path.'classes/UserData.php';
    include_once $path.'classes/CMSIMG.php';
    include_once $path.'classes/SafeLoadingImages.php';
    include_once $path.'classes/SafeLoadingFiles.php';
    
    include_once $path.'classes/ErrorHelper.php';
    include_once $path.'classes/SiteMap.php';
    include_once $path.'classes/HtmlTemplate.php';
    include_once $path.'classes/DownloadFile.php';
    include_once $path.'classes/DownloadImage.php';
    
    include_once $path.'classes/ID_GENERATOR.php';
    include_once $path.'classes/BackgroundGeneratorHelper.php';
    
    include_once $path.'classes/TextGenerator.php';
}
?>
