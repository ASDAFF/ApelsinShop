<?php
/**
 * Распаковка zip - архива
 *
 * @author olga
 */
class Unpacking {

    private $zip;                     // объект PclZip($archive)
    private $zipArchive;              // информация об объекте PclZip($archive)
    private $pathExtract;             // путь для извлечения
    private $access;                  // допустимые расширения
    private $errors;                  // сообщение об ошибке
    private $SQL_HELPER;
    
    private $resoursFilesArray;       // массив файлов директории resours
    private $archiveFilesArray;       // массив файлов archive
    private $newUnzippedFiles;        // новые распакованные файлы
    private $updatedUnzippedFiles;    // обновленные распакованные файлы
    private $notImage;                // не изображения
    private $undefinedFiles;          // нет совпадений

    // для изображения
    // Если эта переменная задана (setSizeMiniature($width, $height = null)), то миниатюры будут 
    private $sizeMiniature;           // массив заданных размеров для миниатюры;
    private $image;                   // файл архива
    private $getimagesize;            // инфа об изображении
    private $originalWidth;           // ширина оригинала
    private $originalHeight;          // длина оригинала
    private $dimensionsResize;        // размер ресайза
    
    /**
     * Конструктор
     * @param type $archive - путь архива
     * @param type $pathExtract - путь для извлечения
     */
    public function __construct($archive, $pathExtract = null) {
        if (file_exists($archive) ) {
            global $_SQL_HELPER;
            $this->SQL_HELPER = $_SQL_HELPER;
            $this->pathExtract = $pathExtract;
            $this->zip = new PclZip($archive);
            $this->zipArchive = array();
            $this->archiveFilesArray = array();
            $this->updatedUnzippedFiles = array();
            $this->newUnzippedFiles = array();
            $this->undefinedFiles = array();
            $this->notImage = array();
            $this->access = array( 'image/jpeg', 'image/png', 'image/gif');
        } else {
            $this->errors[] = 'Архив не найден.';
            $this->zip = null;
        }
    }
    
    /**
     * Распаковка архива
     */
    public function zipExtract() {
        $this->errors = array();
        // существует ли папка для извлечения
        if ($this->pathExtract !== null && $this->pathExtract !== '') {  
            $this->dirIsExists($this->pathExtract); 
        }
        // перед извлечением удаляем дубликаты из директории resours
        $this->preExtract();
        // извлечение
        $this->zipArchive = $this->zip->extract(PCLZIP_OPT_PATH, $this->pathExtract, PCLZIP_OPT_REMOVE_ALL_PATH, PCLZIP_OPT_SET_CHMOD, 0777);
        if ($this->getErrorZipArchive()) {
            // если необходимы какие - либо манипуляции над извлеченными файлами
            foreach ($this->zipArchive as $image) {
                $this->image = $image;
                if (!is_dir($this->image['filename']) ) {
                    // если изображениe
                    if ($this->isImage()) {
                        $nameFile = $this->getTextNameImage($this->image['stored_filename']);
                        if ($nameFile == null) {
                            $this->undefinedFiles[] = $this->image['stored_filename'];
                            unlink($this->image['filename']);
                        } 
                        // если необходимо изменить размер изображения
                        if ($this->sizeMiniature !== null) {
                            foreach ($this->sizeMiniature as $value) { 
                                $this->makeMiniature($value['w'], $value['h']);
                            }  
                        } 
                    } else {
                        // удалить файл
                        $this->notImage[] = $this->image['stored_filename'];
                        unlink($this->image['filename']);
                    }
                }
            }
        }
    }
    
    /**
     * Установка размера миниатюры
     * @param type $width - ширина миниатюры
     * @param type $height - высота миниатюры
     */
    public function setSizeMiniature($width, $height = null) {
        if ($height == null || $height == '') {
            $height = $width;
        }
        $newElement = array('w'=>$width, 'h'=>$height);
        $this->sizeMiniature[] = $newElement;
    }
    
    /**
     *  Сброс размера миниатюры
     */
    public function unsetSizeMiniature() {
        $this->sizeMiniature = null;
    }
    
    /**
     * Установка размера ресайза
     * @param type $paramResize - параметр ресайза
     */
    public function setDimensionsResize($paramResize) {
        if ($paramResize !== null && $paramResize != '') {
           $this->dimensionsResize = $paramResize;
        } 
    }
    
    /**
     * Установка размера ресайза
     * @param type $paramResize - параметр ресайза
     */
    public function unsetDimensionsResize() {
        $this->dimensionsResize = null;
    }
    
    /**
     * Инициализировать поддерживаемые типы расширений
     * @param string $access - строка с поддерживаемыми типами расширений
     */
    public function setAccess($access) {
        $this->access = $access;
    }
    
    /**
     * Сброс поддерживаемых типов расширений
     */
    public function unsetAccess() {
        $this->access = '';
    }
    
    /**
     * Директория для извлечения
     * @param string $pathExtract - папка для извлечения
     */
    public function setPathExtract($pathExtract) {
        if ($pathExtract !== null && $pathExtract !== '') {
           $this->pathExtract = $pathExtract;
        }
    }
    
    /**
     * Информация о распакованных файлах
     * @return type 
     */
    public function getInfoUnzippedFiles() {
        $unzippedFiles = array(); 
//        $this->newUnzippedFile = array_diff($this->archiveFilesArray, $this->updatedUnzippedFiles, $this->notImage, $this->undefinedFiles);
        $unzippedFiles['countAllFileArchive'] = count($this->zipArchive);
        $unzippedFiles['countNotImage'] = count($this->notImage);
        $unzippedFiles['countUndefinedFiles'] = count($this->undefinedFiles);
        $unzippedFiles['countUnpaсking'] = count($this->archiveFilesArray) - $unzippedFiles['countNotImage'] - $unzippedFiles['countUndefinedFiles'];
        $unzippedFiles['countUpdateFile'] = count($this->updatedUnzippedFiles);
        $unzippedFiles['countNewFile'] = count($this->archiveFilesArray) - $unzippedFiles['countNotImage'] - $unzippedFiles['countUndefinedFiles'] - $unzippedFiles['countUpdateFile'];
        
        $unzippedFiles['allFileArchive'] = $this->archiveFilesArray;
        $unzippedFiles['newFile'] = $this->newUnzippedFiles;
        $unzippedFiles['updateFile'] = $this->updatedUnzippedFiles;
        $unzippedFiles['notImage'] = $this->notImage;
        $unzippedFiles['undefinedFiles'] = $this->undefinedFiles;
        return $unzippedFiles;
    }

    /**
    * Возвращает ошибкy
    * @return type string
    */
    public function getErrorMessage() {
        if ($this->errors !== null) {
            foreach ($this->errors as $value) {
                return $value.'<br />';
            }
        }
    }
    
    /**
    * Возвращает текст сообщения (ошибки)
    * @return type string
    */
    public function getErrorMessageHtml() {
        if ($this->errors !== null) {
            foreach ($this->errors as $value) {
                echo $value.'<br />';
            }
        } 
    }
    
    /**
     * Получить название файла по его id
     * @param type $file - название id
     * @return type - текстовое название файла
     */
    private function getTextNameImage($file) {
        $nameWitheExtension = $this->reverse_strrchr($file, '.');
        $id = substr($nameWitheExtension, 0, strlen($nameWitheExtension) - 1);
        $query = "SELECT `itemName` FROM `ShopItems` WHERE `id` = '".$id."';";
        $itemName = $this->SQL_HELPER->select($query,1);
        return $itemName['itemName'];
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
     * Подготовка директории выгрузки
     */
    private function preExtract() {
        $this->returnListArchive();
        $this->scanDirResours();
        if ($this->resoursFilesArray !== null )  {
            $this->cleanDirectoryOfDuplicates();
        } 
    }
    
    /**
     * Получение списка файлов архива
     */
    private function returnListArchive() {
        $this->zipArchive = $this->zip->listContent();
        if ($this->getErrorZipArchive()) {
            for ($i = 0; $i < count($this->zipArchive); $i++) {
                $this->archiveFilesArray[] = $this->zipArchive[$i]['stored_filename'];
            }
        } 
        return $this->archiveFilesArray;
    }
    
    /**
     * Получение списка файлов директории выгрузки
     */
    private function scanDirResours() {
        //если директория существует и точно директория
        if (file_exists($this->pathExtract) && is_dir($this->pathExtract)) {
            // сканируем и считываем в массив
            $all = scandir($this->pathExtract);
            foreach ($all as $file) {
                if (!is_dir($this->pathExtract.$file)) {
                    $this->resoursFilesArray[] = $file;
                }
            }
        }
        return $this->resoursFilesArray;
    }
    
    /**
     * Удаление дубликата
     */
    private function cleanDirectoryOfDuplicates() {
        foreach ($this->archiveFilesArray as $value) {
            $tmp = $this->reverse_strrchr($value, '.');
            $pattern = substr($tmp, 0, -1);
            foreach ($this->resoursFilesArray as $img) {
                if (preg_match('/^'.$pattern.'/', $img)) {
                    if (file_exists($this->pathExtract.$img)) {
                        // удалить дубликат (оригинал - удаляется, копии - затираются)
                        unlink($this->pathExtract.$img);
                    }
                    if (preg_match('/^'.$pattern.'\.[a-z]{3,4}/', $img)) {
                        $this->updatedUnzippedFiles[] = $img;
                    }
                }
            } 
        } 
    }
    
    //-------------- Для изображения --------------------------------------
    /**
     * Является ли изображением и получение размеров оригинала
     * @return boolean 
     */
    private function isImage() {
        if (is_file($this->image['filename'])) {
            // получаем информацию о файле
            $this->getimagesize = getimagesize($this->image['filename']);
            $this->originalWidth = $this->getimagesize[0];
            $this->originalHeight = $this->getimagesize[1];
            // если изображение
            return (in_array($this->getimagesize['mime'], $this->access)) ? true : false;
        }
    }   
    
    /**
     * Сделать миниатюру
     * @param type $nameMiniature -  название будущей миниатюры 
     * @param type $m_width -        новая ширина 
     * @param type $m_height -       новая высота 
     * @param type $m_dir          - другая директория для миниатюры
     */
    private function makeMiniature($m_width, $m_height, $m_dir = null) {
        // если файл существует
        if (file_exists($this->image['filename'])) {
            // проверяем, что размеры миниатюры заданы корректно (меньше оригинала)
            if ($this->originalWidth > $m_width || $this->originalHeight > $m_height) {
            // генерируем новое имя
            $newNameMiniature = $this->getNameMiniature($m_width, $m_height);
                // получаем копию
                if (copy($this->image['filename'], $newNameMiniature)) {
                // делаем ресайз
                    $this->resizeImages($newNameMiniature, $m_width, $m_height);
                    // если в другую директорию 
                    if ($m_dir != null) {
                        // перемещаем
                        $this->renameImage($newNameMiniature, $m_dir);
                    }
                }
            } else {
                $this->errors[] = 'Размеры миниатюры заданы некорректно (больше оригинала)';
            }
        }
    }

    /**
     * Генерируем новое имя
     * @return type
     */
    private function getNameMiniature($w, $h) {
        // директория
        $dir = $this->reverse_strrchr($this->image['filename'], '/');
        // расширение
        $extension = strtolower(strrchr($this->image['filename'], '.')); 
        // новое имя
        $oldNameImage = $this->reverse_strrchr($this->image['stored_filename'], '.');
        $nameMiniature = substr($oldNameImage, 0, -1);
        // генерируем полное имя
        $newNameMiniature = $dir.$nameMiniature.'_'.$w.'x'.$h.$extension;
        return $newNameMiniature;
    }
    
    /**
     * Обрезает строку после заданного символа ( $needle )
     */
    private function reverse_strrchr($haystack, $needle) {
        return strrpos($haystack, $needle) ? substr($haystack, 0, strrpos($haystack, $needle) + 1) : false;
    }
     
    /**
     * Ресайз и сохранение
     * @param type $saveNameFile -   изображение
     * @param type $width -          новая ширина 
     * @param type $height -         новая высота 
     * @param type $parameterImage - принцип ресайза
     */
    private function resizeImages($saveNameFile, $width, $height) {
        // если надо, ресайзим загруженное изображение
        if ($this->originalWidth !== $width || $this->originalHeight !== $height) {
            $resize = new ResizeImage($saveNameFile);
            $resize->resizeTo($width, $height, $this->dimensionsResize);
            // меняем у image/jpeg расширение на jpg
            $this->getExtension();
            $resize->saveImage($saveNameFile, 100);
        } 
    }
    
    /**
     * Меняем у image/jpeg расширение на jpg
     * @return type
     */
    private function getExtension() {
        $extensionType = substr(strrchr($this->image['filename'], "."), 1);
        if ($extensionType == 'jpeg') {
            $extensionType = 'jpg';
            $tmp = $this->reverse_strrchr($this->image['filename'], '.');
            $this->image['filename'] = $tmp.$extensionType; 
        }
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
        $newDir = $dir.$name;
        rename($image, $newDir);
    } 
    
    // ----------------- Ошибки ------------------------
    /**
     * Отчет об ошибках "с картинками"
     * @return string html
     */
    public function getErrorShowImage() {
        if ($this->image['status'] == 'ok') {
            echo $this->showImage('извлечен в '.  $this->pathExtract);
        } else {
            $this->getErrorImage();
        } 
    }
    
    /**
     * Формирует сообщение о неизвлеченных файлах
     * @return string html
     */
    private function getErrorImage() {
        // если ошибке соответствует текст 
        if (array_key_exists($this->image['status'], $this->getTextError())) {
            //формируем сообщение с изображением 
            foreach ($this->getTextError() as $key => $value) {
                if ($this->image['status'] == $key) {
                    echo $this->showImage($value);
                } 
            }
        }
    }

    /**
     * Массив с текстом возможных ошибок при извлечении файлов
     * @return string
     */
    private function getTextError() {
        $errorsStatus = array(
            'filtered'=>' Файл/папка не извлечен (отфильтрован пользователем).',
            'already_a_directory' => ' Файл не был извлечен, потому что файл или папка с таким же названием уже существует.',
            'newer_exist' => ' Файл не был извлечен, потому что такой же файл уже существует и защищен от записи.',
            'write_protect' => ' Файл не был извлечен, потому что существует более новый файл.',
            'path_creation_fail' => ' Файл не был извлечен – произошла ошибка создания каталога.',
            'write_error' => ' Файл не был извлечен – произошла ошибка записи.',
            'read_error' => ' Файл не был извлечен – ошибка чтения.',
            'invalid_header' => ' Файл не был извлечен – ошибка заголовка.',
            'skipped' => ' Файл не был извлечен или добавлен, потому что пользовательская функция просит пропустить его.',
            'filename_to_long' => ' Файл не добавлен в архив – слишком длинное имя файла (максимум 255 символов).',
        );
        return $errorsStatus;
    }
    
    /**
     * Визуальное отображение отчета
     * @param type $error
     * @return type
     */
    private function showImage($error) {
        $html = '<div style="border: 1px solid grey; float: left; width: 200px; height: 200px; padding: 10px;">';
        if ($this->isImage()) {
            $html .= '<img src="'.$this->image['filename'].'" style="max-height:120px; max-width:120px; margin: 10px 40px; overflow: hidden;"/><br>';
        }
        $html .= 'Файл <span style="color:#559d61;"> ./'.$this->image['filename']."</span> <br>".$error.". ";
        $html .= '</div>';
        return $html;
    }
    
    /**
     * Ошибка работы с архивом
     * @return boolean
     */
    private function getErrorZipArchive() {
        if ($this->zipArchive == null) {
            $this->errors[] = "ERROR : ".$this->zip->errorInfo(true);
        } else {
            return true;
        }
    }

    // --------------------- Другие функции для работы с архивом ------------------------
     
    /**
     * Добавление в архив
     * Будте осторожны, если такой файл в архиве уже существует, то он добавится в конец архива, но не заменит существующий.
     * Если архив не существует, он будет автоматически создан.
     * Можно добавлять часть пути (напр., поместить в папку или две): PCLZIP_OPT_ADD_PATH, $pathAdd,
     * @param type $filelist - массив с названиями файлов (директорий) или строка с названием файла (директории) 
     *      или строка с названиями файлов (директорий), разделенными запятыми.  
     * @param type $pathAdd - отсекает лишнюю часть пути до картинки 
     * @return string
     */
    public function addFileInZip($filelist, $pathAdd = null) {
        $this->errors = array();
        $this->zipArchive = $this->zip->add($filelist, PCLZIP_OPT_REMOVE_PATH, $pathAdd);
        if ($this->getErrorZipArchive()) {
            foreach ($this->zipArchive as $value) {
                $this->image = $value;
                if (!is_dir($this->image['filename']) ) {
                    // если необходимо изменить размер изображения
                    if ($this->isImage()) {
                        $this->extractImage();
                    }
                }
                if ($this->image['status'] == 'ok') {
                    $this->errors[] = $this->showImage('добавлен ');
                } else {
                    $this->errors[] = $this->getError();
                }
            }
        }
    }
    
    /**
     * Удаление из архива
     * можно удалять по индексу: напр., delete(PCLZIP_OPT_BY_INDEX, '1-3,5,8-10');
     * @param type $fileName
     */
    public function deleteFileInZip($fileName) {
        $this->errors = array();
        $this->zipArchive = $this->zip->delete(PCLZIP_OPT_BY_NAME, $fileName);
        if ($this->getErrorZipArchive()) {
            $this->errors[] = 'Файл <span style="color:#ef7f1a;"> ./'.$fileName."</span>  -  удален. ";
        }
    }
    
    /**
     *  Список файлов архива
     */
    public function getListArchive() {
        $this->errors = array();
        $this->zipArchive = $this->zip->listContent();
        if ($this->getErrorZipArchive()) {
            for ($i = 0; $i < count($this->zipArchive); $i++) {
                $this->errors[] = '<p>Файл  ./'.$this->zipArchive[$i]['stored_filename'].' индекс - '.$this->zipArchive[$i]['index'].'</p><hr>';
            }
        } 
    }
}
