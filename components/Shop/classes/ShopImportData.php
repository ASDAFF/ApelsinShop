<?php
/**
 * Description of ShopImportData
 *
 * @author maxim
 */
class ShopImportData {
    private $SQL_HELPER;
    private $DATA_MYSQL;
    private $ERRORS = array();
    private $WARNINGS = array();
    
    private $yourUser;
    private $yourUserData;
    
    public function __construct() {
        global $_SQL_HELPER;
        $this->SQL_HELPER = $_SQL_HELPER;
        $this->getUserData();
        if($this->yourUser->checkAuthorization()) {
            $this->DATA_MYSQL = new ShopImportData_MySQL();
            $this->ERRORS = $this->DATA_MYSQL->get_ERRORS();
            $this->WARNINGS = $this->DATA_MYSQL->get_WARNINGS();
//            $this->DATA_MYSQL->execMysqlScript();
        } else {
            $this->ERRORS[] = 'Вы не авторизовались на сайте';
        }
    }
    
    private function getUserData() {
        $this->yourUser = new UserData();
        $this->yourUser->checkAuthorization();
        $this->yourUserData = $this->yourUser->getUserData();
    }
    
    public function getError() {
        return $this->DATA_MYSQL->get_ERRORS();
    }
    
    public function getWarnings() {
        return $this->DATA_MYSQL->get_WARNINGS();
    }
    
    public function TEST_DATA() {
        echo '<pre>';
        var_dump($this->ERRORS);
//        var_dump($this->WARNINGS);
        echo '</pre>';
    }
    public function getReport() {
        $err = count($this->ERRORS);
        $war = count($this->WARNINGS);
        $out = '<div class="Import1cErrWarReport">';
//        $out .= 'errors: ('.$err.') & warnings: ('.$war.')';
        $out .= '<h1>ERRORS ('.$err.'):</h1>';
        foreach ($this->ERRORS as $key => $error) {
            $out .= '<div class="Import1cErrWarReportElement"><span class="WarErrTextHead">error '.$this->getNumberString($key,$err)."</span> - ".$error.'</div>';
        }
        $out .= '<h1>WARNINGS ('.$war.'):</h1>';
        foreach ($this->WARNINGS as $key => $warning) {
            $out .= '<div class="Import1cErrWarReportElement"><span class="WarErrTextHead">warning '.$this->getNumberString($key,$war)."</span> - ".$warning.'</div>';
        }
        $out .= '<h1>errors: ('.$err.') & warnings: ('.$war.')</h1>';
        $out .= '</div>';
        return $out;
    }
    public function getNumberString($number,$max) {
        $maxlen = strlen($max);
        $numberlen = strlen($number);
        $len = $maxlen-$numberlen;
        $str = '#';
        for ($i=0; $i<$len; $i++) {
            $str .= '0';
        }
        $str .= $number;
        return $str;
    }
}
