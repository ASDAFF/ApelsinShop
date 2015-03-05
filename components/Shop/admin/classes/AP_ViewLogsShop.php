<?php
/**
 * Просмотр логов
 *
 * @author olga
 */
class AP_ViewLogsShop {
    
    private $html;
    private $data;
    
    private $dirXML = './resources/Components/Shop/ImportFilesXML/';
    private $dirMySQL = './resources/Components/Shop/ImportFilesMySQL/';
    private $dirLOG = './resources/Components/Shop/ImportLogsText/';
    private $dirHTML = './resources/Components/Shop/ImportLogsHtml/';

    private $SQL_HELPER;
    private $yourUser;
    private $yourUserData;
    
    public function __construct() {
        global $_SQL_HELPER;
        $this->SQL_HELPER = $_SQL_HELPER;
        $this->getUserData();
        if($this->yourUser->checkAuthorization()) {
            $this->generateUI();
        }
    }

    public function getHtml() {
        return $this->html;
    }
    
    /**
     * Генерирование ссылки для просмотра файла
     */
    private function generateA($name, $href, $class) {
        $this->html .= '<a class="rightMiddleSmallViewLogsShop '.$class.' href="'.$href.'" target="_blank" title="'.$name.'">';
            $this->html .= '<span class="viewLogsShopImage"></span>';
        $this->html .= '</a>';
    }
    
    /**
     * Генерирование блока инф-ции
     */
    private function generateMainBlock($row) {
        $this->html .= '<div class="middleViewLogsShop">Импортировано:  &nbsp;'.$row['importDate'].'</div>';
        $this->html .= '<div class="middleViewLogsShop">'.$row['user'].'</div>';
        $this->html .= '<div class="middleViewLogsShop"> Экспортировано:   &nbsp;'.$row['exportDate'].'</div>';
        $this->html .= '<div class="middleViewLogsShop">'.$row['exportUser'].'</div>';
        $this->html .= '<div class="middleViewLogsShop"></div>';
        if ($row['fullExport'] == 1) {
            $fullExport = ' полная; ';
            $color = 'greenExportViewLogsShop';
        } else {
            $fullExport = ' частичная; ';
            $color = 'orangeExportViewLogsShop';
        }
        $this->html .= '<div class="middleViewLogsShop">
            Error (<span class="errorExportViewLogsShop">0</span>); &nbsp;&nbsp;&nbsp;
            Warning (<span class="warningExportViewLogsShop">20</span>);&nbsp;&nbsp;&nbsp;
            Выгрузка: <span class="'.$color.'">полная</span>';
        $this->html .= '</div>';
    }
    
    /**
     * Генерирование блока с ссылками
     */
    private function generateRightBlock($row) {
        $this->html .= '<div class="rightMiddleViewLogsShop">SQL '.$row['sqlFile'].'</div>';
        $this->generateA('Файл SQL '.$row['sqlFile'] , $this->dirMySQL.$row['sqlFile'], 'rightMiddleViewLogsShop');
        $this->html .= '<div class="rightMiddleViewLogsShop">LOG '.$row['logFileText'].'</div>';
        $this->generateA('Файл LOG '.$row['logFileText'], $this->dirLOG.$row['logFileText'], 'rightMiddleViewLogsShop');
        $this->html .= '<div class="rightMiddleViewLogsShop">HTML '.$row['logFileHtml'].'</div>';
        $this->generateA('Файл HTML '.$row['logFileHtml'], $this->dirHTML.$row['logFileHtml'], 'rightMiddleViewLogsShop');
    }
    
    /**
     * Генерирование цвета левого блока
     */
    private function generateColor($row) {
        if ($row['success'] === '0' && $row['errors'] === '0') {
            $class = 'blueViewLogsShop';
            $classWrap = 'blueViewLogsShopWrapper';
            $text = 'Выполняется';
        } elseif ($row['success'] === '0') {
            $class = 'redViewLogsShop';
            $classWrap = 'redViewLogsShopWrapper';
            $text = 'Провален';
        } else {
            $class = 'greenViewLogsShop';
            $classWrap = 'greenViewLogsShopWrapper';
            $text = 'Успешно';    
        }
        $color['block'] = $class;
        $color['border'] = $classWrap;
        $color['text'] = $text;
        return $color;
    }

    /**
     * Генерирование UI
     */
    private function generateUI() {
        $this->getData();
        $this->html = '';
        foreach ($this->data as $row) {
            $color = $this->generateColor($row);
            $this->html .= '<div class="viewLogsShopWrapper '.$color['border'].'" >';
                $this->html .= '<div class="leftViewLogsShopContent '.$color['block'].'">';
                    $this->html .= '<div class="helpViewLogsShop">';
                        $this->html .= '<span>';
                            $this->html .= $color['text'];
                        $this->html .= '</span>';
                    $this->html .= '</div>';
                $this->html .= '</div>';
                $this->html .= '<div class="topViewLogsShopContent">';
                    $this->html .= '<div class="topViewLogsShopHeader">Файл XML apelsin 23.45.6789 23:12:56.xml</div>';
                    $this->generateA('Файл XML '.$row['xmlFile'], $this->dirXML.$row['xmlFile'], '');
                $this->html .= '</div>';
                $this->html .= '<div class="mainViewLogsShopContent">';
                    $this->generateMainBlock($row);
                $this->html .= '</div>';
                $this->html .= '<div class="rightViewLogsShopContent">';
                    $this->generateRightBlock($row);
                $this->html .= '</div>';  
            $this->html .= '</div>';
        }  
    }
    
    /**
     * Получение данных
     */
    private function getData() {
        $query = "SELECT * FROM `ShopImportLogs` ORDER BY `importDate` DESC; ";
        $this->data = $this->SQL_HELPER->select($query);
    }

    /**
     * Данные о пользователе
     */
    private function getUserData() {
        $this->yourUser = new UserData();
        $this->yourUser->checkAuthorization();
        $this->yourUserData = $this->yourUser->getUserData();
    }
}
