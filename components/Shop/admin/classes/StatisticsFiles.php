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
 * Description of StatisticsFiles
 *
 * @author Olga Rjabchikova
 * @copyright © 2010-2016, CompuProjec
 * @created 09.10.2015 9:35:29
 */
class StatisticsFiles {

    private $dirExport;                 // директория экспорта
    private $allFileExport;             // ВСЕ файлы экспорта
    private $exportStatus;              // массив статусов всех файлов для возможной дальнейшей обработки
    private $info;                      // массив с информацией по статистике
    private $SQL_HELPER;
    private $image;                     // файл экспорта
    private $access;                    // расширение файла, доступного для импорта

    public function __construct($path, $access) {
        global $_SQL_HELPER;
        $this->SQL_HELPER = $_SQL_HELPER;
        $this->dirExport = $path;
        $this->access = $access;
        $this->allFileExport = [];
        $this->exportStatus = [];
        $this->info = [];
        $this->createdDirs();
        $this->getDataImport();
    }

    public function getStatistics() {
        (isset($this->info['missing']) && $this->info['missing'] !== null) ? $this->info['missing'] : $this->info['missing'] = [];
        (isset($this->info['export']) && $this->info['export'] !== null) ? $this->info['export'] : $this->info['export'] = [];
        (isset($this->info['nonComply']) && $this->info['nonComply'] !== null) ? $this->info['nonComply'] : $this->info['nonComply'] = [];
        $this->info['allFile'] = $this->allFileExport;
        return $this->info;
    }

    /**
     * Массив файлов для импорта
     * @return type array
     */
    public function getDataImport() {
        $this->allFileExport = $this->scanDir($this->dirExport);
        $i = 0;
        foreach ($this->allFileExport as $this->image) {
            set_time_limit(60);
            $pathImage = $this->dirExport . $this->image;
            // если есть в БД
            if ($this->getTextNameImage($this->image)) {
                // проверка соответствия расширения и типа файла
                if ($this->isImage($pathImage)) {
                    $this->info['export'][$i] = $this->image;
                    $this->exportStatus[$i]['name'] = $this->image;
                    $this->exportStatus[$i++]['status'] = 'export';
                } else {
                    $this->info['nonComply'][$i++] = $this->image;
                }
            } else {
                $this->info['missing'][$i] = $this->image;
                $this->exportStatus[$i]['name'] = $this->image;
                $this->exportStatus[$i++]['status'] = 'missing';
            }
        }
        return $this->exportStatus;
    }

    /**
     * Проверка соответствия расширения и типа файла
     * @return boolean 
     */
    private function isImage($pathImage) {
        if (filesize($pathImage) != 0) {
            if (is_file($pathImage)) {
                $getimagesize = getimagesize($pathImage);
                $extensionType = substr(strrchr($this->image, "."), 1);
                $ext = strtolower($extensionType);
                return (in_array($ext, $this->access) && in_array($getimagesize['mime'], $this->access)) ? true : false;
            }
        }
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
     * Создание директорий
     */
    private function createdDirs() {
        // проверка существования необходимых директорий
        $this->dirIsExists($this->dirExport);
    }

    /**
     * Если директория не существует - создать
     */
    private function dirIsExists($dir) {
        if (!file_exists($dir)) {
            mkdir($dir, 0777, true);
            chmod($dir, 0777);
        }
    }

    /**
     * Получение списка файлов директории
     */
    private function scanDir($dir) {
        $filesArray = [];
        //если директория существует и точно директория
        if (file_exists($dir) && is_dir($dir)) {
            // сканируем и считываем в массив
            $all = scandir($dir);
            foreach ($all as $file) {
                if (!is_dir($dir . $file) && $file !== '.' && $file !== '..') {
                    $filesArray[] = $file;
                }
            }
        }
        return $filesArray;
    }

}
