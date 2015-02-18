<?php
class Account {
    private $SQL_HELPER;
    private $urlHelper;
    private $params;
    private $login;
    private $avatarDir="./resources/Components/Users/";
    private $avatarFile="/200_av.png";
    private $accountData;
    private $yourUser;
    private $yourUserData;
    private $social;
    private $NotFound = false;
    private $noReg = false;
    
    public function __construct() {
        $this->social = array();
        $this->social['vk'] = 'http://vk.com/';
        $this->social['odnoklasniki'] = 'http://odnoklassniki.ru/';
        $this->social['google'] = 'https://plus.google.com/u/0/';
        $this->social['facebook'] = 'http://facebook.com/';
        $this->social['twitter'] = 'https://twitter.com/';
        $this->social['instagram'] = 'http://instagram.com/';
        $this->social['youtube'] = 'https://www.youtube.com/user/';
        $this->social['livejournal'] = 'livejournal.com';
        $this->social['blogger'] = 'http://www.blogger.com/profile/';
        global $_SQL_HELPER;
        $this->SQL_HELPER = $_SQL_HELPER;
        global $_URL_PARAMS;
        $this->urlHelper = new UrlHelper();
        $this->params = $_URL_PARAMS['params'];
        $this->yourUser = new UserData();
        $this->yourUser->checkAuthorization();
        $this->yourUserData = $this->yourUser->getUserData();
        if(isset($this->params[0])) {
            $this->login = $this->params[0];
        } else {
            if(count($this->yourUserData)==0) {
                $this->noReg = true;
            } else {
                $this->login = $this->yourUserData['login'];
            }
        }
        $this->getAccountData();
    }
    
    private function isYou() {
        return $this->yourUserData['login']==$this->login;
    }
    
    private function isAdministrator() {
        return $this->yourUserData['group']=='Administrator';
    }
    
    private function getAccountData() {
        $query = "Select * from `Users` where `login`='".$this->login."';";
        $this->accountData = $this->SQL_HELPER->select($query,1);
        if(count($this->accountData)==0) {
            $this->NotFound = true;
            return;
        }
        global $ROOT;
        if($this->isYou()) {
            $setting = '<div class="AccountSettingsIcon" title="Настрйоки пользователя"><a href="'.$this->urlHelper->pageUrl('account_settings', null).'"></a></div>';
        } else {
            $setting = "";
        }
        $title = $this->login;
        if($this->isYou() || $this->isAdministrator()) {
            $title .= " (".$this->accountData['ferstName']." ".$this->accountData['lastName'].")";
        }
        $title .= $setting;
        $ROOT->setPageTitle($title);
        $ROOT->setTitle($title);
    }
    
    public function generateUI() {
        $out = "";
        if($this->NotFound) {
            if($this->noReg) {
                $out .= 'Для работы со своим профилем, вам необходимо войти в систему под своим логином и паролем.<br>';
            } else {
                $out .= 'Bзвините, но пользователь '.$this->login.' не зарегистрирован в системе.<br>';
                $out .= 'Если вы уверены, что такой пользователь существует или это ваш пользователь, но '
                        . 'вы всеравно видите эту страницу, тогда обратитесь '
                        . 'к администрации сайта<br>';
            }
        } else {
            $out .= '<div class="accountUserPanel">';
            $out .= '<div class="accountUserPanelLeft">';
            $out .= $this->generateAvatar();
            $out .= $this->generateLogin();
            $out .= $this->generateContacts();
            $out .= '</div>';
            $out .= '<div class="accountUserPanelRight">';
            $out .= $this->generateStatus();
            $out .= $this->getSearchUserpanel();
            $out .= $this->generateAboutYourself();
            $out .= $this->generateSocial();
            $out .= '</div>';
            $out .= '</div>';
        }
        
        
        return $out;
    }
    
    private function getSearchUserpanel() {
        $out = "";
        $inputHelper = new InputHelper();
        $out .= '<div class="searchUserPanel">';
        $out .= '<form action="UserSearch.php" method="post" name="form" onsubmit="return false;">';
        $out .= "Поиск пользователей<br>";
        $searchTextBox = $inputHelper->paternTextBox("search", "search", "search", 25, false, "Начните вводить login", "[A-Za-z0-9%]{3,25}", false);
        $out .= $searchTextBox;
        $out .= '</form>';
        $out .= '<div id="resSearch" class="UserSearchResult"></div>';
        $out .= '</div>';
        return $out;
    }

    private function generateStatus() {
        $out = "";
        if(isset($this->accountData['status']) && $this->accountData['status']!=null && $this->accountData['status']!="") {
            $out .= '<div class="statusBox">';
            $out .= $this->accountData['status'];
            $out .= '</div>';
        }
        return $out;
    }
    
    private function generateAboutYourself() {
        $out = "";
        if(isset($this->accountData['aboutYourself']) && $this->accountData['aboutYourself']!=null && $this->accountData['aboutYourself']!="") {
            $out .= '<div class="aboutYourselfBox">';
            $out .= '<div class="aboutYourselfBlock">';
            $out .= nl2br($this->accountData['aboutYourself']);
            $out .= '</div>';
            $out .= '</div>';
        }
        return $out;
    }
    
    private function generateAvatar() {
        $img = $this->avatarDir.$this->login.$this->avatarFile;
        if(!file_exists($img)) {
            $img = $this->avatarDir."noAV.png";
        }
        $out = "";
        $out .= '<div class="AccountGroup">';
            $out .= '<div class="'.$this->accountData['group'].'">';
            $out .= '</div>';
        $out .= '</div>';
        $out .= '<div class="avatarBox">';
            $out .= '<div class="avatarBlock">';
                $out .= '<img src="'.$img.'?r='.rand().'" class="avatarIMG">';
            $out .= '</div>';
        $out .= '</div>';
        return $out;
    }
    
    private function generateLogin() {
        if($this->accountData['sex']==0) {
            $sex = "Госпожа";
        } else {
            $sex = "Господин";
        }
        $out = "";
        $out .= '<div class="loginBox">';
            $out .= '<div class="sex">';
                $out .= $sex;
            $out .= '</div>';
            $out .= '<div class="login">';
//                $out .= $this->login;
                $out .= $this->accountData['nickname'];
            $out .= '</div>';
            if($this->isYou() || $this->isAdministrator()) {
                $out .= '<div class="fio">';
                    $out .= $this->accountData['ferstName'];
                    $out .= " ";
                    $out .= $this->accountData['lastName'];
                $out .= '</div>';
            }
            $out .= '<div class="city"><span>[';
                $out .= '<a href="http://maps.yandex.ru/?text='.$this->accountData['city'].'" target="_blank" title="Показать город на карте">';
                    $out .= $this->accountData['city'];
                $out .= '</a>';
            $out .= ']</span></div>';
        $out .= '</div>';
        return $out;
    }
    
    private function generateContacts() {
        $out = "";
        $out .= '<div class="contactsBox">';
        $out .= '<table class="accountContacts">';
        if($this->isYou() || $this->isAdministrator()) {
            $out .= '<tr>';
            $out .= '<td class="lable">Email:</td>';
            $out .= '<td class="contact"><a href="mailto:'.$this->accountData['email'].'">'.$this->accountData['email'].'</a></td>';
            $out .= '</tr>';
            $out .= '<tr>';
            $out .= '<td class="lable">Телефон:</td>';
            $out .= '<td class="contact">'.$this->accountData['phone'].'</td>';
            $out .= '</tr>';
        }
        if($this->accountData['icq']!=null && $this->accountData['icq']!="") {
            $out .= '<tr>';
            $out .= '<td class="lable">ICQ:</td>';
            $out .= '<td class="contact">'.$this->accountData['icq'].'</td>';
            $out .= '</tr>';
        }
        if($this->accountData['skype']!=null && $this->accountData['skype']!="") {
            $out .= '<tr>';
            $out .= '<td class="lable">Skype:</td>';
            $out .= '<td class="contact">'.$this->accountData['skype'].'</td>';
            $out .= '</tr>';
        }
        $out .= '</table>';
        $out .= '</div>';
        return $out;
    }
    
    private function getSocialLink($key) {
        $out = "";
        if(isset($this->accountData[$key]) && isset($this->social[$key]) && $this->accountData[$key]!=null && $this->accountData[$key]!="") {
            $out .= '<li class="icon '.$key.'" title="'.$key.'">';
            if($key=='livejournal') {
                $url = 'http://'.$this->accountData[$key].".".$this->social[$key];
            } else {
                $url = $this->social[$key].$this->accountData[$key];
            }
            $out .= '<a href="'.$url.'" target="_BLANCK">';
            $out .= '</a>';
            $out .= '</li>';
        }
        return $out;
    }
    
    private function getSiteUrl() {
        $out = "";
        $out .= '<li class="icon siteUrl" title="'.$this->accountData['siteName'].'">';
        $out .= '<a href="'.$this->accountData['siteUrl'].'" target="_BLANCK">';
        $out .= '</a>';
        $out .= '</li>';
        return $out;
    }


    private function generateSocial() {        
        $out = "";
        $out .= "<div class='socialBox'>";
        $out .= "<ul class='accountSocial'>";
        $out .= $this->getSocialLink('vk');
        $out .= $this->getSocialLink('odnoklasniki');
        $out .= $this->getSocialLink('google');
        $out .= $this->getSocialLink('facebook');
        $out .= $this->getSocialLink('twitter');
        $out .= $this->getSocialLink('instagram');
        $out .= $this->getSocialLink('youtube');
        $out .= $this->getSocialLink('livejournal');
        $out .= $this->getSocialLink('blogger');
        $out .= $this->getSiteUrl();
        $out .= "</ul>";
        $out .= "</div>";

        return $out;
    }
}
?>