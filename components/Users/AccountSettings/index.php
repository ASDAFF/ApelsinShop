<center>
<?php
include_once './components/Users/classes/AccountSettings.php';

global $_URL_PARAMS;
$params = $_URL_PARAMS['params'];
$urlHelper = new UrlHelper();
if(isset($params[0])) {
    $accountSettings = new AccountSettings();
    if($params[0]=='avatar') {
        echo $accountSettings->getChangeAvatar();
    } else if($params[0]=='data') {
        echo $accountSettings->getChangeUserDataForm();
    } else if($params[0]=='change_password') {
        echo $accountSettings->getChangePasswordForm();
//        echo 'тут вызываем функцию для обработки изменения паролья';
    }
    echo '<br><a href="'.$urlHelper->pageUrl('account_settings', null).'"><input type="button" value="К настрйокам"></a><br>';
} else {
    echo "Это панель настройки вашего профиля.<br><br>";
    $urlParam[0]="avatar";
    echo '<a href="'.$urlHelper->pageUrl('account_settings', $urlParam).'"><input type="button" value="Изменить аватар"></a>';
    $urlParam[0]="data";
    echo '<a href="'.$urlHelper->pageUrl('account_settings', $urlParam).'"><input type="button" value="Изменить данные"></a>';
    $urlParam[0]="change_password";
    echo '<a href="'.$urlHelper->pageUrl('account_settings', $urlParam).'"><input type="button" value="Изменить пароль"></a><br>';
}
?>
</center>