<?php
class SESSION_OBJECT {
    
    public function __construct(){
        session_start();
    }
    
    /**
     * Возвращает HTML код формы авторизации
     * @return string
     */
    public function getAuthorizationFormHtml() {
        $out = '';
        $out .= '<form class="loginForm" name="loginForm" action="./" 
            method="post" accept-charset="UTF-8" autocomplete="on">';
        $out .= '<table class="loginTable">';
        $out .= '<tr>';
            $out .= '<td class="loginTableLable">';
            $out .= 'Login';
            $out .= '</td>';
            $out .= '<td class="loginTableInput">';
            $out .= '<input type="text" name="login" id="login" maxlength="30" autocomplete="off" required autofocus/>';
            $out .= '</td>';
        $out .= '</tr>';
        $out .= '<tr>';
            $out .= '<td class="loginTableLable">';
            $out .= 'Password';
            $out .= '</td>';
            $out .= '<td class="loginTableInput">';
            $out .= '<input type="password" name="password" id="password" maxlength="30" autocomplete="off" required/>';
            $out .= '</td>';
        $out .= '</tr>';
        $out .= '</table>';
        $out .= '<input type="submit" name="submit" value="вход">';
        $out .= '</form>';
        return $out;
    }
}
?>
