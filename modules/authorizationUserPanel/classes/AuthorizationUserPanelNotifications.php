<?php
class AuthorizationUserPanelNotifications {
    private $SQL_HELPER;
    private $localization;
    private $user;
    private $icons = array();
    private $icon;
    private $notifications = array();
    private $thisLang;
    
    public function __construct($user) {
        global $_SQL_HELPER;
        $this->SQL_HELPER = $_SQL_HELPER;
        global $_URL_PARAMS;
        $this->thisLang = $_URL_PARAMS['lang'];
        $this->localization = new Localization("AuthorizationUserPanel");
        $this->icon = 'NoInfo';
        $this->icons['notification'] = 'Info';
        $this->icons['alert'] = 'ImportantInfo';
        $this->icons['alarm'] = 'VeryImportantInfo';
        $this->user=$user;
        $this->getAllNotifications();
    }
    
    private function getAllNotifications() {
        $query = "SELECT * FROM `UsersNotifications` 
            WHERE `user`='".$this->user."' 
            ORDER BY `date` DESC;";
        $this->notifications = $this->SQL_HELPER->select($query);
        if(count($this->notifications)>0) {
            foreach ($this->notifications as $key => $value) {
                $langData = $this->getNotificationsLang($value['id']);
                $this->notifications[$key]['title'] = $langData['title'];
                $this->notifications[$key]['text'] = $langData['text'];
            }
            $this->getNotificationsIcon('notification');
            $this->getNotificationsIcon('alert');
            $this->getNotificationsIcon('alarm');
        }
        
        
    }


    private function getNotificationsIcon($type) {
        $query = "SELECT 'id' FROM `UsersNotifications` 
            WHERE `user`='".$this->user."' AND type='".$type."' 
            ORDER BY `date` DESC;";
        $notifications = $this->SQL_HELPER->select($query);        
        if($notifications!=null && count($notifications)>0) {
            $this->icon = $this->icons[$type];
        }
    }
    
    private function getNotificationsLang($id) {
        $this->langHelper = new LangHelper("UsersNotifications_Lang","lang","usersNotifications",$id,$this->thisLang);
        $LangType = $this->langHelper->getLangType();
        $langData = array();
        if($LangType != -1){
            $langData['title'] = $this->langHelper->getLangValue("title");
            $langData['text'] = $this->langHelper->getLangValue("text");
        } else {
            $langData['title'] = "";
            $langData['text'] = "";
        }
        return $langData;
    }
    
    public function get() {
        $out = '';
        if($this->icon == 'NoInfo') {
            $out .= '<div class="UserPanelInfoBlock NO_HOVER" title="'.$this->localization->getText($this->icon).'">';
                $out .= '<div class="'.$this->icon.'"></div>';
            $out .= '</div>';
        } else {
            $out .= '<div class="UserPanelInfoBlock" 
                onmouseover="UserPanelShowElements(\'UserPanelInfoBlockText\')"
                onmouseout="UserPanelHideElements(\'UserPanelInfoBlockText\')" 
                title="'.$this->localization->getText($this->icon).'">';
                $out .= '<div class="'.$this->icon.'"></div>';
                $out .= '<div id="UserPanelInfoBlockText" 
                    class="UserPanelInfoBlockText" 
                    style="display: none">';
                    $out .= $this->getNotificationsBlocks();
                $out .= '</div>';
            $out .= '</div>';
        }

        return $out;
    }
    
    private function getNotificationsBlocks() {
        $out = '';
        if(count($this->notifications)>0) {
            foreach ($this->notifications as $value) {
                $out .= '<div class="NotificationsBlockElements">';
                   $out .= '<div class="NotificationsBlockElementsTitle '.$value['type'].'">';
                        $out .= '<div class="icon '.$this->icons[$value['type']].'"></div>';
                        $out .= $value['title'];
                    $out .= '</div>';
                    $out .= '<div class="NotificationsBlockElementsContent">';
                        $out .= '<div class="NotificationsBlockElementsText">';
                            $out .= $value['text'];
                        $out .= '</div>';
                        $out .= '<div class="NotificationsBlockElementsDate">';
                            $date = new DateTime($value['date']);
                            $out .= $date->format('d.m.y');
                            $out .= '<br />';
                            $out .= $date->format('h:i');
                        $out .= '</div>'; 
                    $out .= '</div>';
                    $out .= '<div class="NotificationsBlockElementsEnd"></div>';
                $out .= '</div>';
            }
        }
        return $out;
    }
}
?>
