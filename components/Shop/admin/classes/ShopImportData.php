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
    private $START_ERRORS = array();
    private $FILE_XML = './resources/Components/Shop/ImportFilesXML/';
    
    private $yourUser;
    private $yourUserData;
    
    private $reportText;
    private $reportHtml;
    private $fileName ;
    
    public function __construct($fileName) {
        $this->fileName = $fileName;
        global $_SQL_HELPER;
        $this->SQL_HELPER = $_SQL_HELPER;
        $this->getUserData();
        if($this->yourUser->checkAuthorization()) {
            if(ShopImportDataCheckHelper::CheckFile($this->FILE_XML.$fileName)) {
                if(ShopImportDataCheckHelper::CheckImportSuccess()) {
                    $this->DATA_MYSQL = new ShopImportData_MySQL($this->fileName);
                    $this->ERRORS = $this->DATA_MYSQL->get_ERRORS();
                    $this->WARNINGS = $this->DATA_MYSQL->get_WARNINGS();
                    $this->DATA_MYSQL->execMysqlScript();
                    $this->creatReportFile();
                } else {
                    $this->START_ERRORS[] = 'Предыдущая выгрузка еще не закончилась';
                }
            } else {
                $this->START_ERRORS[] = 'Не найден XML файл с выгрузкой';
            }
        } else {
            $this->START_ERRORS[] = 'Вы не авторизовались на сайте';
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
        var_dump($this->WARNINGS);
        echo '</pre>';
    }
    
    private function generateLogFileText($err,$war,$logDate) {
        $out = '';
        $out .= "-- Export Date: ".$logDate['exportDate2']."\r\n";
        $out .= "-- Export User: ".$logDate['exportUser']."\r\n";
        $out .= "-- Import Date: ".$logDate['importDate2']."\r\n";
        $out .= "-- Import User: ".$this->yourUserData['ferstName']." ".$this->yourUserData['lastName']." [".$this->yourUserData['nickname']."]\r\n";
        if(count($this->ERRORS) === 0 && count($this->START_ERRORS) === 0) {
            $out .= "-- Sql File: ".$logDate['sqlFile']."\r\n";
        }
        $out .= "-- Errors: (".$err.") & Warnings: (".$war.")\r\n";
        $out .= "\r\nERRORS (".$err."):\r\n\r\n";
        foreach ($this->ERRORS as $key => $error) {
            $out .= $this->getNumberString($key,$err).": ".strip_tags($error)."\r\n";
        }
        $out .= "\r\nWARNINGS (".$war."):\r\n\r\n";
        foreach ($this->WARNINGS as $key => $warning) {
            $out .= $this->getNumberString($key,$war).": ".strip_tags($warning)."\r\n";
        }
        $out .= "\r\nerrors: (".$err.") & warnings: (".$war.")\r\n";
        return $out;
    }
    
    private function generateLogFileHtml($err,$war,$logDate = null) {
        $out = '<div class="Import1cErrWarReport">';
            $out .= '<div class="Import1cErrWarReportInfo">';
                if($logDate !== null) {
                    $out .= "<div class='Import1cErrWarReportInfoElement'>Export Date: ".$logDate['exportDate2']."</div>";
                    $out .= "<div class='Import1cErrWarReportInfoElement'>Export User: ".$logDate['exportUser']."</div>";
                    $out .= "<div class='Import1cErrWarReportInfoElement'>Import Date: ".$logDate['importDate2']."</div>";
                    $out .= "<div class='Import1cErrWarReportInfoElement'>Import User: ".$this->yourUserData['ferstName']." ".$this->yourUserData['lastName']." [".$this->yourUserData['nickname']."]</div>";
                } else {
                    $out .= "<div class='Import1cErrWarReportInfoElement'>Import Date: ".date("Y-m-d h:i:s")."</div>";
                    $out .= "<div class='Import1cErrWarReportInfoElement'>Import User: ".$this->yourUserData['ferstName']." ".$this->yourUserData['lastName']." [".$this->yourUserData['nickname']."]</div>";
                }
                if(count($this->ERRORS) === 0 && count($this->START_ERRORS) === 0) {
                    $out .= "<div class='Import1cErrWarReportInfoElement'>Sql File: ".$logDate['sqlFile']."</div>";
                }
                $out .= "<div class='Import1cErrWarReportInfoElement ErrorsAndWarnings'>Errors: (".$err.") & Warnings: (".$war.")</div>";
            $out .= '</div>';
            $out .= '<h1>ERRORS ('.$err.'):</h1>';
            foreach ($this->ERRORS as $key => $error) {
                $out .= '<div class="Import1cErrWarReportElement"><span class="WarErrTextHead">error '.$this->getNumberString($key,$err)."</span> - ".$error.'</div>';
            }
            $out .= '<h1>WARNINGS ('.$war.'):</h1>';
            foreach ($this->WARNINGS as $key => $warning) {
                $out .= '<div class="Import1cErrWarReportElement"><span class="WarErrTextHead">warning '.$this->getNumberString($key,$war)."</span> - ".$warning.'</div>';
            }
        $out .= '</div>';
        return $out;
    }
    
    private function generateStartErrors() {
        $out = '<div class="Import1cErrWarReport">';
        foreach ($this->START_ERRORS as $error) {
            $out .= "<div class='Import1cErrWarReportElement'>".$error.'</div>';
        }
        $out .= '</div>';
        return $out;
    }
    private function generateLogHtmlFile($logDate,$html) {
        $out = "<!DOCTYPE html>";
        $out .= "<html>";
        $out .= "<head>";
        $out .= "<title>Лог файл от ".$logDate['importDate2']."</title>";
        $out .= "<meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>";
        $out .= "
        <style>
            .Import1cErrWarReport {
                font: 10px/12px monospace;
                color: #5f5f5f;
            }
            .Import1cErrWarReport h1 {
                font: bold 14px/16px monospace;
                margin-bottom: 5px;
            }
            .Import1cErrWarReport .Import1cErrWarReportElement {

            }
            .Import1cErrWarReport .Import1cErrWarReportElement .WarErrTextHead {
                color: #000;
                font-weight: bold;
            }
            .Import1cErrWarReport .Import1cErrWarReportElement .WarErrTextId {
                color: red;
                font-weight: bold;
            }
            .Import1cErrWarReport .Import1cErrWarReportElement .WarErrTextName {
                color: blue;
                font-weight: bold;
            }
        </style>
        ";
        $out .= "</head>";
        $out .= "<body>";
        $out .= $html;
        $out .= "</body>";
        $out .= "</html>";
        return $out;
    }
    
    private function creatReportFile() {
        $err = count($this->ERRORS);
        $war = count($this->WARNINGS);
        $logDate = $this->DATA_MYSQL->getLogDate();
        $this->reportText = $this->generateLogFileText($err,$war,$logDate);
        $this->reportHtml = $this->generateLogFileHtml($err,$war,$logDate);
        $fileHtml = $this->generateLogHtmlFile($logDate,$this->reportHtml);
        file_put_contents($logDate['logText'].$logDate['logFile'], $this->reportText);
        file_put_contents($logDate['logHtml'].$logDate['htmlFile'], $fileHtml);
    }
    
    public function getReport() {
        if(count($this->START_ERRORS) > 0) {
            return $this->generateStartErrors();
        } else {
            return $this->reportHtml;
        }
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
