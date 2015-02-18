<?php
class UserData {
    private $SQL_HELPER;
    private $userData;
    private $localization;
    private $isAuthorization;
    private $error;
    private $_SITECONFIG;


    /**
     * Конструктор
     * @global type $_SQL_HELPER
     */
    public function __construct() {
        $this->error = null;
        $this->isAuthorization = false;
        $this->UserData = array();
        $this->UserData = array();
        $this->localization = new Localization();
        global $_SQL_HELPER;
        $this->SQL_HELPER = $_SQL_HELPER;
        global $_SITECONFIG;
        $this->_SITECONFIG = $_SITECONFIG;
        @session_start();
    }
    
    /**
     * Получаем даныне о пользователе
     * @param type $login - логин
     * @param type $pswd - пароль
     * @param type $md5 - true если пароль в md5 и false если нет
     */
    private function getDBUserData($login) {
        $query = "select * from `Users`
            where 
            `login`='".mb_strtolower($login, $this->_SITECONFIG->getCharset())."';";
        $this->userData = $this->SQL_HELPER->select($query,1);
    }
    
    /**
     * проверяем переменные $_SESSION['login'] и $_SESSION['password']
     * @return type
     */
    private function checkSessionVar() {
        return (
                isset($_SESSION['login']) && 
                isset($_SESSION['password']) &&
                $_SESSION['login']!=null &&
                $_SESSION['login']!="" &&
                $_SESSION['password']!=null &&
                $_SESSION['password']!=""
        );
    }
    
    /**
     * авторизация в системе
     * @param type $login - логин
     * @param type $password - пароль
     * @param type $md5 - true если пароль в md5 и false если нет
     */
    public function authorization($login,$password,$md5=false,$reloadPage=false) {
        if(!$md5) {
            $password = md5($password);
        }
        // отменяем авторизацию
        $this->isAuthorization = false;
        // получаем данные о пользователе по указанным логину и паролю
        $this->getDBUserData($login);
        // если запись найдена, то
        if($this->userData!=null) {
            if($this->userData['password']===$password) {
                // проверяем активирован ли пользователь
                if($this->userData['activated']) {
                    // проверяем не отключен ли пользователь
                    if(!$this->userData['disable']) {
                        if(!$this->userData['delete']) {
                            // указываем что авторизация пройдена успешно
                            $this->isAuthorization = true;
                            // сохраняем переменные сесии
                            $_SESSION['login'] = $this->userData['login'];
                            $_SESSION['password'] = $this->userData['password'];
                            if($reloadPage) {
                                $urlHelper = new UrlHelper();
                                echo '<script language="JavaScript">';
                                echo 'window.location.href = "'.$urlHelper->getThisPage().'"';
                                echo '</script>';
                            }
                        } else{
                            $this->error = $this->localization->getText("userIsDelete");
                        }
                    } else{
                        $this->error = $this->localization->getText("userIsDisable");
                    }
                } else {
                    $this->error = $this->localization->getText("userNoActivated");
                }
            // если пароль неверный
            } else {
                // пишем ошибку о том что пароль не верный
                $this->error = $this->localization->getText("wrongPSWD");
            }
        // если запись не найдена, то
        } else {
            // пишем ошибку о том что пользователь не зарегистрирован
            $this->error = $this->localization->getText("userNoReg");
        }
    }
    
    public function checkAuthorization() {
        @session_start();
        // проверяем окрыта ли сессия
        if($this->checkSessionVar()) {
            // првоеряем авторизацию
            $this->authorization($_SESSION['login'],$_SESSION['password'],true);
        } else {
            $this->isAuthorization = false;
        }
        return $this->isAuthorization;
    }
    
    public function getUserData() {
        return $this->isAuthorization ? $this->userData : null;
    }
    
    public function getError() {
        return $this->error;
    }
    
    public function isAdmin() {
        return $this->userData['group']=='Administrator';
    }
}
?>