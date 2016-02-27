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
 * Description of ImportImage
 *
 * @author Olga Rjabchikova
 * @copyright © 2010-2016, CompuProjec
 * @created 30.09.2015 15:06:14
 */
class ImportImage {

    private $importImage;       // массив обрабатываемых файлов
    private $dirExport;
    private $dirTemp;
    private $dirImport;
    private $miniature;         // массив необходимых ресайзов
    private $maxFilesImport;    // ограничитель единовременного импорта
    private $errors;
    private $counter;           // итератор импорта

    public function __construct($importImage, $path, $miniature) {
        $this->importImage = $importImage;
        $this->dirExport = $path['export'];
        $this->dirTemp = $path['temp'];
        $this->dirImport = $path['import'];
        $this->miniature = $miniature;
        $this->errors = [];
        $this->maxFilesImport = 10000;
    }

    /**
     * Получение maxFilesImport
     * @return type
     */
    public function getMaxFilesImport() {
        return $this->maxFilesImport;
    }

    /**
     * Получение counter
     * @return type
     */
    public function getCounter() {
        return $this->counter;
    }

    /**
     * Сообщение опрерванном импорте
     */
    private function messageInfoMaxFilesImport() {
        echo '<br />Импортировано ' . $this->counter . ' файла(ов). Для продолжения активируйте кнопку "Импорт"';
    }

    /**
     * Импортирование и удаление мусора
     */
    public function importImage() {
        $this->counter = 0;
        foreach ($this->importImage as $image) {
            set_time_limit(60);
            if ($image['status'] == 'export') {
                $this->execute($image['name']);
                $this->counter++;
                if ($this->counter >= $this->maxFilesImport) {
                    $this->messageInfoMaxFilesImport();
                    break;
                }
            }
        }
    }

    /**
     * Непосредственно импорт
     * @param type $image
     */
    private function execute($image) {
        // импортируем в dirTemp
        $pathTemp = $this->dirTemp . $image;
        rename($this->dirExport . $image, $pathTemp);
        // копируем и делаем миниатюры
        $mini = new MakeMiniature($pathTemp);
        // если необходимо создать изображения разного размера
        if ($this->miniature !== null) {
            foreach ($this->miniature as $value) {
                $mini->makeMiniature($value['w'], $value['h'], $pathTemp);
            }
            // перемещаем в dirImport
            $rename = $this->scanDir($this->dirTemp);
            foreach ($rename as $file) {
                $this->renameImage($this->dirTemp . $file, $this->dirImport);
            }
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

    /**
     * Перемещение в другую директорию
     * @param type $image
     * @param type $dir
     */
    private function renameImage($image, $dir) {
        $this->dirIsExists($dir);
        $tmp = explode('/', $image);
        $name = array_pop($tmp);
        $newDir = $dir . $name;
        rename($image, $newDir);
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

}
