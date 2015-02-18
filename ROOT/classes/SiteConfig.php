<?php
class SiteConfig {
    private $conf;
    private $hostName;
    private $hostIp;
    private $remoteIp;
    
    public function __construct() {
        $query = "Select * from `ROOT_SETTINGS` where `activated`='1' limit 0,1;";
        $mySqlHelper = new MySqlHelper($query);
        $this->conf = $mySqlHelper->getDataRow(0);
        $this->hostName = $_SERVER["SERVER_NAME"];
        $this->hostIp = $_SERVER["SERVER_ADDR"];
        $this->remoteIp = $_SERVER["REMOTE_ADDR"];
    }
    
    public function getHostName() {
        return $this->hostName;
    }
    
    public function getHostIp() {
        return $this->hostIp;
    }
    
    public function getRemoteIp() {
        return $this->remoteIp;
    }
    
    public function getSuperKey() {
        return $this->conf['superKey'];
    }
    
    public function getMultilanguage() {
        return $this->conf['multilanguage']>0;
    }
    
    public function getSiteClosed() {
        return $this->conf['siteClosed']>0;
    }
    
    public function getCharset() {
        return $this->conf['charset'];
    }
    
    public function getCompanyName() {
        return isset($this->conf['companyName']) ? $this->conf['companyName'] : "";
    }
    
    public function getSiteName() {
        return $this->conf['siteName'];
    }
}
?>
