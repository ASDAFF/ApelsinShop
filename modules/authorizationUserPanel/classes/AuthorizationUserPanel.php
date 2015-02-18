<?php
class AuthorizationUserPanel {
    private $form;
    private $userData;
    private $urlHelper;
    
    private $avatarDir="./resources/Components/Users/";
    
    public function __construct() {
        $this->inputHelper = new InputHelper();
        $this->localization = new Localization("AuthorizationUserPanel");
        $this->userData = new UserData();
        $this->getAuthorizationUserForm();
        $this->urlHelper = new UrlHelper();
    }
    
    private function getAuthorizationUserForm() {
        $urlHelper = new UrlHelper();
        $this->form = '';
        $this->form .= '<form class="AuthorizationForm" name="AuthorizationForm" action="'.$urlHelper->getThisPage().'" 
            method="post" accept-charset="UTF-8" autocomplete="on">';
        $this->form .= '<center>';
        $this->form .= "<div class='AuthorizationFormBlock'>";
        
        
        $this->form .= '<table class="AuthorizationFormTable" >';
        $this->form .= '<tr>';
            $this->form .= '<td>';
                $this->form .= "<div class='AuthorizationFormLogin'></div>";
            $this->form .= '</td>';
            $this->form .= '<td>';
                $this->form .= $this->inputHelper->paternTextBox("login", "login", "login", 25, true, $this->localization->getText("login"), "[A-Za-z0-9]{3,20}", null);
            $this->form .= '</td>';
            //$this->form .= '<td rowspan="2">';
                
            //$this->form .= '</td>';
        $this->form .= '</tr>';
        $this->form .= '<tr>';
            $this->form .= '<td>';
                $this->form .= "<div class='AuthorizationFormPassword'></div>";
            $this->form .= '</td>';
            $this->form .= '<td>';
                $this->form .= $this->inputHelper->paternPasswordBox("password", "password", "password", 25, true, $this->localization->getText("password"), "[A-Za-z0-9]{3,20}", null);
            $this->form .= '</td>';
        $this->form .= '</tr>';
        $this->form .= '</tr>';
        $this->form .= '</table>';
        
        $this->form .= '<input class="AuthorizationFormButton" type="submit" name="AuthorizationFormSubmit" value="in" title="'.$this->localization->getText("authorizationFormText").'">';
        
        
        
        $this->form .= "</div>";
        $this->form .= '</center>';
        $this->form .= '</form>';
    }
    
    public function get() {
        $this->authorization();
        if($this->userData->checkAuthorization()) {
            echo $this->getUserPanel();
        } else {
            if($this->userData->getError()!=null) {
                echo '<div id="LoginPanelBlockError" 
                    class="LoginPanelBlockError" 
                    style="display: block">';
                    echo '<div class="Error">';
                        echo '<center>';
                        echo $this->userData->getError();
                        echo '<br><br>';
                        echo '<button type="button" onclick="UserPanelHideElements(\'LoginPanelBlockError\')">Закрыть</button>';
                        echo '</center>';
                    echo '</div>';
                echo '</div>';
            }
            echo '<div class="LoginPanelBlock" id="LoginPanelBlock">';
            echo '    <div id="LoginPanelButon" class="LoginPanelTextButon">'.$this->localization->getText("entry").'</div>';
            echo '    <div id="LoginPanel" class="LoginPanel">';
            echo $this->form;
            echo '    </div>';
            echo '</div>';  
            //echo '<div class="LoginPanelBlock RegButon">';
            //echo '    <div class="LoginPanelTextButon RegButon"><a href="'.$this->urlHelper->pageUrl("registration", null).'">Зарегистрироваться</a></div>';
            //echo '</div>';     
        }
    }
    
    private function authorization() {
        if(isset($_POST['AuthorizationFormSubmit']) 
                && $_POST['AuthorizationFormSubmit']!=null 
                && $_POST['AuthorizationFormSubmit']!="") {
            if(isset($_POST['login']) && $_POST['login']!=null 
                    && $_POST['login']!="" && isset($_POST['password']) 
                    && $_POST['password']!=null && $_POST['password']!="") {
                //echo $_POST['login']." ".$_POST['password'];
                $this->userData->authorization($_POST['login'], $_POST['password'],false,true);
            }
        }
        
    }
    
    private function getUserPanel() {
        $user = $this->userData->getUserData();
        $file = $this->avatarDir.$user['login']."/30_av.png";
        if(!is_file($file)) {
            $file = $this->avatarDir."30_noAV.png";
        }
        $out = '';
        $notifications = new AuthorizationUserPanelNotifications($user['login']);
        $out .= $notifications->get();
        $out .= '<div class="UserPanelLoginBlock" 
            onmouseover="UserPanelShowElements(\'UserPanelLoginBlockElementMenu\')"
            onmouseout="UserPanelHideElements(\'UserPanelLoginBlockElementMenu\')">';
            $out .= '<div class="UserPanelLoginBlockElement">';
                $out .= $user['login'];
            $out .= '</div>';
            $out .= '<div class="UserPanelLoginBlockElementMenuBlock">';
                $out .= '<div id="UserPanelLoginBlockElementMenu" 
                    class="UserPanelLoginBlockElementMenu" 
                    style="display: none">';
                    $out .= '<div class="UserPanelLoginBlockElementMenuElement"><a href="'.$this->urlHelper->pageUrl('accounts', null).'">Перейти к профилю</a></div>';
                    $out .= '<div class="UserPanelLoginBlockElementMenuElement"><a href="'.$this->urlHelper->pageUrl('account_settings', null).'">Настроить профиль</a></div>';
                    $urlParam[0]="avatar";
                    $out .= '<div class="UserPanelLoginBlockElementMenuElement"><a href="'.$this->urlHelper->pageUrl('account_settings', $urlParam).'">Сменить аватар</a></div>';
                    $urlParam[0]="data";
                    $out .= '<div class="UserPanelLoginBlockElementMenuElement"><a href="'.$this->urlHelper->pageUrl('account_settings', $urlParam).'">Изменить данные</a></div>';
                    $urlParam[0]="change_password";
                    $out .= '<div class="UserPanelLoginBlockElementMenuElement"><a href="'.$this->urlHelper->pageUrl('account_settings', $urlParam).'">Изменить пароль</a></div>';
//                    $out .= '<div class="UserPanelLoginBlockElementMenuElement">Сообщения [12]</div>';
//                    $out .= '<div class="UserPanelLoginBlockElementMenuElement">Публикации</div>';
//                    $out .= '<div class="UserPanelLoginBlockElementMenuElement">Друзья</div>';
//                    $out .= '<div class="UserPanelLoginBlockElementMenuElement">Настройка</div>';
//                    $out .= '<div class="UserPanelLoginBlockElementMenuElement"><a href="'.$this->urlHelper->pageUrl('requests', null).'">Заявки и фестивали</a></div>';
                    if($this->userData->isAdmin()) {
                        $out .= '<div class="UserPanelLoginBlockElementMenuElement"></div>';
                        $out .= '<div class="UserPanelLoginBlockElementMenuElement"><a href="'.$this->urlHelper->pageUrl('adminpanel', null).'">Админпанель</a></div>';
                        $urlParam[0]="components";
                        $out .= '<div class="UserPanelLoginBlockElementMenuElement"><a href="'.$this->urlHelper->pageUrl('adminpanel', $urlParam).'">Админпанель компонент</a></div>';
                        $urlParam[0]="modules";
                        $out .= '<div class="UserPanelLoginBlockElementMenuElement"><a href="'.$this->urlHelper->pageUrl('adminpanel', $urlParam).'">Админпанель модулей</a></div>';
                        $urlParam[0]="plugins";
                        $out .= '<div class="UserPanelLoginBlockElementMenuElement"><a href="'.$this->urlHelper->pageUrl('adminpanel', $urlParam).'">Админпанель плагинов</a></div>';
                    }
                    $out .= '<div class="UserPanelLoginBlockElementMenuElement"></div>';
                    $out .= '<div class="UserPanelLoginBlockElementMenuElement">';
                        $out .= '<a href="./out.php?backURL='.$this->urlHelper->getThisPage().'">Выйти</a>';
                    $out .= '</div>';
                $out .= '</div>';
            $out .= '</div>';
        $out .= '</div>';
        $out .= '<div class="UserPanelAvatarBlock"><img src="'.$file.'?r='.rand().'" class="UserPanelAvatar" /></div>';
        return $out;
    }
}
?>
