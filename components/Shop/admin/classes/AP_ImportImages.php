<?php

/*
 * НЕ ИЗМЕНЯТЬ И НЕ УДАЛЯТЬ АВТОРСКИЕ ПРАВА И ЗАГОЛОВОК ФАЙЛА
 * 
 * Копирайт © 2010-2016, CompuProject и/или дочерние компании.
 * Все права защищены.
 * 
 * CSystem это программное обеспечение предоставленное и разработанное 
 * CompuProject в рамках проекта CSystem без каких либо сторонних изменений.
 * 
 * Распространение, использование исходного кода в любой форме и/или его 
 * модификация разрешается при условии, что выполняются следующие условия:
 * 
 * 1. При распространении исходного кода должно оставатсья указанное выше 
 *    уведомление об авторских правах, этот список условий и последующий 
 *    отказ от гарантий.
 * 
 * 2. При изменении исходного кода должно оставатсья указанное выше 
 *    уведомление об авторских правах, этот список условий, последующий 
 *    отказ от гарантий и пометка о сделанных изменениях.
 * 
 * 3. Распространение и/или изменение исходного кода должно происходить
 *    на условиях Стандартной общественной лицензии GNU в том виде, в каком 
 *    она была опубликована Фондом свободного программного обеспечения;
 *    либо лицензии версии 3, либо (по вашему выбору) любой более поздней
 *    версии. Вы должны были получить копию Стандартной общественной 
 *    лицензии GNU вместе с этой программой. Если это не так, см. 
 *    <http://www.gnu.org/licenses/>.
 * 
 * CSystem распространяется в надежде, что она будет полезной,
 * но БЕЗО ВСЯКИХ ГАРАНТИЙ; даже без неявной гарантии ТОВАРНОГО ВИДА
 * или ПРИГОДНОСТИ ДЛЯ ОПРЕДЕЛЕННЫХ ЦЕЛЕЙ. Подробнее см. в Стандартной
 * общественной лицензии GNU.
 * 
 * НИ ПРИ КАКИХ УСЛОВИЯХ ПРОЕКТ, ЕГО УЧАСТНИКИ ИЛИ CompuProject НЕ 
 * НЕСУТ ОТВЕТСТВЕННОСТИ ЗА КАКИЕ ЛИБО ПРЯМЫЕ, КОСВЕННЫЕ, СЛУЧАЙНЫЕ, 
 * ОСОБЫЕ, ШТРАФНЫЕ ИЛИ КАКИЕ ЛИБО ДРУГИЕ УБЫТКИ (ВКЛЮЧАЯ, НО НЕ 
 * ОГРАНИЧИВАЯСЬ ПРИОБРЕТЕНИЕМ ИЛИ ЗАМЕНОЙ ТОВАРОВ И УСЛУГ; ПОТЕРЕЙ 
 * ДАННЫХ ИЛИ ПРИБЫЛИ; ПРИОСТАНОВЛЕНИЕ БИЗНЕСА). 
 * 
 * ИСПОЛЬЗОВАНИЕ ДАННОГО ИСХОДНОГО КОДА ОЗНАЧАЕТ, ЧТО ВЫ БЫЛИ ОЗНАКОЛМЛЕНЫ
 * СО ВСЕМИ ПРАВАМИ, СТАНДАРТАМИ И УСЛОВИЯМИ, УКАЗАННЫМИ ВЫШЕ, СОГЛАСНЫ С НИМИ
 * И ОБЯЗУЕТЕСЬ ИХ СОБЛЮДАТЬ.
 * 
 * ЕСЛИ ВЫ НЕ СОГЛАСНЫ С ВЫШЕУКАЗАННЫМИ ПРАВАМИ, СТАНДАРТАМИ И УСЛОВИЯМИ, 
 * ТО ВЫ МОЖЕТЕ ОТКАЗАТЬСЯ ОТ ИСПОЛЬЗОВАНИЯ ДАННОГО ИСХОДНОГО КОДА.
 * 
 * Данная копия CSystem используется для проекта Apelsin SHOP
 * 
 */

/**
 * Description of AP_ImportImages
 *
 * @author Olga Rjabchikova
 * @copyright © 2010-2016, CompuProjec
 * @created 09.10.2015 11:20:26
 */
class AP_ImportImages {

    protected $dirFileExport = './resources/Components/Shop/ImportData/IMAGES/';        // откуда
    protected $dirFileTEMP = './resources/Components/Shop/ImportData/TEMP/';            // временная
    protected $dirFileImport = './resources/Components/Shop/Image/';                    // куда
    protected $dirFinal;            // конечная директория импорта/экспорта
    protected $statistic;           // хранит объект StatisticsFiles()
    protected $info;                // массив инфы о статистике
    protected $importImage;         // массив обрабатываемых файлов
    protected $import;              // хранит объект ImportImage()
    protected $sizeMiniature;       // массив необходимых ресайзов
    protected $accessExtFile;              // массив доступных расширений файла
    protected $accessTypeFile;              // массив доступных расширений файла
    private $html;
    private $SQL_HELPER;
    private $urlHelper;
    private $yourUser;              // пользователь
    private $yourUserData;
    private $errors;

    public function __construct() {
        global $_SQL_HELPER;
        $this->SQL_HELPER = $_SQL_HELPER;
        $this->urlHelper = new UrlHelper();
        $this->getUserData();
        $this->yourUser->checkAuthorization();
        $this->errors = [];
    }

    public function getHtml() {
        $this->initialization();
        $this->importImage();
        $this->generateUI();
        return $this->html;
    }

    /**
     * Установка размера миниатюры
     * @param type $width - ширина миниатюры
     * @param type $height - высота миниатюры
     */
    protected function setSizeMiniature($width, $height = null) {
        if ($height == null || $height == '') {
            $height = $width;
        }
        $newElement = array('w' => $width, 'h' => $height);
        $this->sizeMiniature[] = $newElement;
    }

    /**
     *  Сброс размера миниатюры
     */
    protected function unsetSizeMiniature() {
        $this->sizeMiniature = null;
    }

    /**
     * Инициализировать поддерживаемые типы расширений
     * @param string $access - массив с поддерживаемыми типами расширений
     */
    protected function setAccessExtFile(array $access) {
        $this->accessExtFile = $access;
    }

    /**
     * Сброс поддерживаемых типов расширений
     */
    protected function unsetAccessExtFile() {
        $this->accessExtFile = [];
    }

    /**
     * Инициализировать поддерживаемые типы файла
     * @param string $access - массив с поддерживаемыми типами расширений
     */
    protected function setAccessTypeFile(array $access) {
        $this->accessTypeFile = $access;
    }

    /**
     * Сброс поддерживаемых типов файла
     */
    protected function unsetAccessTypeFile() {
        $this->accessTypeFile = [];
    }

    /**
     * Переопределить конечную директорию
     * @param type $dir
     * @return type
     */
    protected function getDirName($dir) {
        return $this->dirFinal = $dir;
    }

    /**
     *  Импорт изображений
     */
    protected function importImage() {
        if (isset($_POST['AP_Submit'])) {
            $this->import->importImage();
            $this->initialization();
        }
    }

    /**
     * Инициализация
     */
    protected function initialization() {
        if ($this->dirFinal != null) {
            $pathExport = $this->dirFileExport . $this->dirFinal;
            $pathTemp = $this->dirFileTEMP . $this->dirFinal;
            $pathImport = $this->dirFileImport . $this->dirFinal;
            $path['export'] = $pathExport;
            $path['temp'] = $pathTemp;
            $path['import'] = $pathImport;
            if (!empty($this->accessExtFile) && !empty($this->accessTypeFile)) {
                $access = array_merge($this->accessExtFile, $this->accessTypeFile);
                $this->statistic = new StatisticsFiles($pathExport, $access);
                $this->info = $this->statistic->getStatistics();
                $this->importImage = $this->statistic->getDataImport();
                $this->import = new ImportImage($this->importImage, $path, $this->sizeMiniature);
            } else {
                $this->errors = 'Не установлен формат соответствия расширению';
            }
        } else {
            $this->errors = 'Необходимо определить конечную директорию для импорта/экспорта<br />';
        }
    }

    /**
     * Данные о пользователе
     */
    private function getUserData() {
        $this->yourUser = new UserData();
        $this->yourUser->checkAuthorization();
        $this->yourUserData = $this->yourUser->getUserData();
    }

    /**
     *  UI
     */
    protected function generateUI() {
        $this->html = "";
        $this->displayInfo();
        $this->generationForm();
        $this->generationInfoBlock();
        $this->getFullList();
    }

    /**
     *  Вывод инфы
     */
    protected function displayInfo() {
        $this->generationReport();
    }

    /**
     * Генерим форму
     */
    protected function generationForm() {
        $this->html .= '<form class="AP_Form" name="AP_Form" action="' . $this->urlHelper->getThisPage() . '" method="POST" accept - charset="UTF-8" required >';
        $this->html .= '<center>';
        $this->html .= '<input class="AP_Submit grey" type="button" onclick="listImagesItems(\'infoStaistik\');" title="Смотреть список файлов" name="" value="Смотреть полный список">';
        $this->html .= '<input class="AP_Submit grey" type="submit" name="AP_Submit" value="Импорт">';
        $this->html .= '</center>';
        $this->html .= '</form>';
    }

    /**
     * Генерим инфо-блок
     */
    protected function generationInfoBlock() {
        $this->html .= '<div id="infoInformation" class="listImagesItemsAndIconsShop informationImportImage">';
        $this->html .= '<table clas="tableInformationImportImage">';
        $this->html .= $this->getBlockTable('Доступное расширение файла', $this->getStringAccessExtFile());
        $this->html .= $this->getBlockTable('Доступный тип файла', $this->getStringAccessTypeFile());
        $this->html .= $this->getBlockTable('Единовременный импорт', $this->import->getMaxFilesImport() . ' файла(ов)');
        $this->html .= $this->getBlockTable('Директория размещения эспорта', $this->dirFileExport . $this->dirFinal);
        $this->html .= '</table>';
        $this->html .= '</div>';
    }

    /**
     * Генерим один элемент
     * @param type $td1
     * @param type $td2
     */
    protected function getBlockTable($td1, $td2) {
        $this->html .= '<tr>';
        $this->html .= '<td>';
        $this->html .= $td1;
        $this->html .= '</td>';
        $this->html .= '<td>';
        $this->html .= $td2;
        $this->html .= '</td>';
        $this->html .= '</tr>';
    }

    /**
     * Генерируем отчет
     */
    protected function generationReport() {
        $this->html .= '<div class="uploadImagesItemsShop">';

        $this->html .= '<div>';
        $this->html .= '<p>Изображения товаров</p>';
        $this->html .= '<p class="viewLogsShopImage" onclick="listImagesItems(\'infoInformation\');" title="Информация"></p>';
        $this->html .= '</div>';
        $this->html .= '<div class="clear"></div>';

        $this->html .= '<div>';
        $this->html .= '<p>Найдено ';
        $this->html .= '<span class="blueExportViewLogsShop">' . count($this->info['allFile']) . '</span>';
        $this->html .= ' файлa(ов)</p>';
        $this->html .= '</div>';
        $this->html .= '<div class="clear"></div>';

        $this->html .= '<div>';
        $this->html .= '<p> Будет экспортировано ';
        $this->html .= '<span class="aquaExportViewLogsShop">' . count($this->info['export']) . '</span> файлa(ов):  ';
        $this->html .= ' Не соответствует заявленному расширению ';
        $this->html .= '<span class="purplUploadImagesItemsShop">' . count($this->info['nonComply']) . '</span>;';
        $this->html .= ' Отсутствуют в БД ';
        $this->html .= '<span class="pinkUploadImagesItemsShop">' . count($this->info['missing']) . '</span>;';
        $this->html .= '</p>';
        $this->html .= '</div>';
        $this->html .= '<div class="clear"></div>';

        $this->html .= '</div>';
    }

    /**
     * Полный список
     */
    protected function getFullList() {
        $this->html .= '<div id="infoStaistik" class="listImagesItemsAndIconsShop">';
        $this->html .= '<p>Список всех файлов</p>';
        $this->html .= '<div class="collumnsUploadImagesItemsShop">';
        $this->generationBlocklistFile($this->info['export'], "warningExportViewLogsShop", "Импортировано", true);
        $this->generationBlocklistFile($this->info['nonComply'], "purplUploadImagesItemsShop", "Не соответствует заявленному формату", false);
        $this->generationBlocklistFile($this->info['missing'], "pinkUploadImagesItemsShop", "Отсутствуют в БД", false);
        $this->html .= '</div>';
        $this->html .= '</div>';
    }

    /**
     * Генерирование блока с инфой в списке
     * @param type $info
     * @param type $class
     * @param type $text
     * @param type $flag
     */
    protected function generationBlocklistFile($info, $class, $text, $flag) {
        if (count($info)) {
            $this->html .= '<p><span class="' . $class . '">' . $text . ': </span></p>';
            $this->html .= '<ol>';
            foreach ($info as $file) {
                if ($flag) {
                    $nameFile = $this->getTextNameImage($file);
                    $this->html .= '<li>' . $nameFile . '</li>';
                } else {
                    $this->html .= '<li>' . $file . '</li>';
                }
            }
            $this->html .= '</ol>';
        }
    }

    /**
     * Обрезает строку после заданного символа ( $needle )
     */
    private function reverse_strrchr($haystack, $needle) {
        return strrpos($haystack, $needle) ? substr($haystack, 0, strrpos($haystack, $needle) + 1) : false;
    }

    /**
     * Получить название файла БЕЗ его расширения
     * @param type $file
     * @return type
     */
    private function getFileNameWithoutExtension($file) {
        $fileNameExtension = $this->reverse_strrchr($file, '.');
        $name = substr($fileNameExtension, 0, strlen($fileNameExtension) - 1);
        return $name;
    }

    /**
     * Получить название файла из базы по его id
     * @param type $file - название id
     * @return type - текстовое название файла
     */
    private function getTextNameImage($file) {
        $id = $this->getFileNameWithoutExtension($file);
        $query = "SELECT `groupName` as name FROM `ShopGroups` WHERE `id` = '" . $id . "';";
        $name = $this->SQL_HELPER->select($query, 1);
        if ($name === null || empty($name)) {
            $query = "SELECT `itemName` as name FROM `ShopItems` WHERE `id` = '" . $id . "';";
            $name = $this->SQL_HELPER->select($query, 1);
        }
        return $name['name'];
    }

    /**
     * Получить стороковое значение для визуализации
     * @return string
     */
    private function getStringAccessExtFile() {
        $out = '';
        foreach ($this->accessExtFile as $value) {
            $out .= $value . ', ';
        }
        return $out;
    }

    /**
     * Получить стороковое значение для визуализации
     * @return string
     */
    private function getStringAccessTypeFile() {
        $out = '';
        foreach ($this->accessTypeFile as $value) {
            $out .= $value . ', ';
        }
        return $out;
    }

    /**
     * Возвращает ошибкy
     * @return type string
     */
    private function getError() {
        if ($this->errors !== null) {
            for ($i = 0; $i < count($this->errors); $i++) {
                return $this->errors[$i] . '<br>';
            }
        }
    }

    /**
     * Возвращает текст сообщения (ошибки)
     * @return type string
     */
    private function getErrorHtml() {
        if ($this->errors !== null) {
            for ($i = 0; $i < count($this->errors); $i++) {
                echo $this->errors[$i] . '<br>';
            }
        }
    }

}
