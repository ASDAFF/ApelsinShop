<?php
function includeSistemClasses() {
    include_once './ROOT/configure.php';
    include_once './ROOT/classes/SiteConfig.php';
    
    include_once './ROOT/classes/MySqlHelper.php';
    include_once './ROOT/classes/MysqliHelper.php';
    include_once './ROOT/classes/LangHelper.php';
    include_once './ROOT/classes/UrlHelper.php';
    include_once './ROOT/classes/InputHelper.php';
    include_once './ROOT/classes/InputValueHelper.php';
    
    include_once './ROOT/classes/UrlParams.php';
    include_once './ROOT/classes/ModulesInBlock.php';
    include_once './ROOT/classes/Modules.php';
    include_once './ROOT/classes/Plugins.php';
    include_once './ROOT/classes/Pages.php';
    include_once './ROOT/classes/Root.php';
    include_once './ROOT/classes/Localization.php';
    include_once './ROOT/classes/XML.php';
    
    include_once './ROOT/classes/UserData.php';
    include_once './ROOT/classes/CMSIMG.php';
    include_once './ROOT/classes/SafeLoadingImages.php';
    include_once './ROOT/classes/SafeLoadingFiles.php';
    
    include_once './ROOT/classes/ErrorHelper.php';
    include_once './ROOT/classes/SiteMap.php';
    include_once './ROOT/classes/HtmlTemplate.php';
}
?>
