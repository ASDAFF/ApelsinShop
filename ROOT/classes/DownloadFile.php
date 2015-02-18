<?php
/**
 * Description of DownloadFile
 * Класс для загрузки любых файлов
 *
 * @author olga
 */
class DownloadFile {
    
    protected $dirUpload;      // директория загрузки
    protected $newNameFile;    //  mixed новое название файла
    protected $nameIdInputFile;  
    protected $idFile;         // номер файла, полученного при загрузке
    protected $access;         // строка доступных расширений через setAccess()
    protected $fileSize;       // допустимый размер загружаемого файла setFileSize()
    protected $extension;      //новое расширение через setExtension()
    protected $saveNameFile;   // название сохраненного файлa
    protected $blacklist;
    protected $file;           // название загружаемого файла (в $_FILES)
    protected $type;           // мим-тип загружаемого файла (в $_FILES)
    protected $tmp_name;       // временное название загружаемого файла (в $_FILES)
    protected $size;           // размер загружаемого файла (в $_FILES) 
    protected $error;          // код ошибки загружаемого файла (в $_FILES)
    protected $filesInfo;      // содержит инф-цию о загруженном файле
    protected $errors;         // сообщение об ошибке
    
    /**
     * 
     * @param type $dirUpload - директория загрузки
     */
    public function __construct($dirUpload) {
        $this->dirUpload = $dirUpload;
        $this->blacklist = array(".php", ".phtml", ".php3", ".php4");
    }
    
    /**
     * Инициализировать поддерживаемые типы расширений
     * @param string $access - строка с поддерживаемыми типами расширений
     */
    public function setAccess( $access) {
        $this->access = $access;
    }
    
    /**
     * Сброс поддерживаемых типов расширений
     */
    public function unsetAccess() {
        $this->access = null;
    }
    
    /**
     * Инициализировать допустимый размер загружаемого файла
     * @param string $fileSize - строка 
     */
    public function setFileSize( $fileSize) {
        $this->fileSize = $fileSize;
    }
    
    /**
     * Сброс допустимого размера загружаемого файла
     */
    public function unsetFileSize() {
        $this->fileSize = null;
    }
    
    /**
     * Инициализировать конкретный тип расширения
     * @param string $extension - строка с типом расширения
     */
    public function setExtension($extension) {
        $this->extension = $extension;
    }
    
    /**
     * Сброс конкретного типа расширения
     */
    public function unsetExtension() {
        $this->extension = null;
    }
    
    /**
     * Инф-ция о загруженном файле
     * @return type - двумерный массив с инф-цией о загруженном файле
     */
    public function getInfoFileUpload() {
        $this->filesInfo = array();
        $this->filesInfo['dir'] = $this->dirUpload;
        $this->filesInfo['file'] = $this->saveNameFile;
        $this->filesInfo['baseFile'] = basename($this->file);
        $this->filesInfo['type'] = $this->type;
        return $this->filesInfo;
    }
    
    /**
     * Загрузка файлов
     * @param type $newNameFile -     1) новое имя файла
     * @param type $nameIdInputFile - 2) id name input
     * @param type $idFile -          3) id файла, если загружено больше одного
     * @param type $access -          4) строка разрешенных расширений
     * @param type $fileSize -        5) допустимый размер файла
     * @param type $extension -       6) новое расширение
     */
    public function uploadFile($newNameFile, $nameIdInputFile, $idFile = null, 
                        $access = null, $fileSize = null, $extension = null) {
        // инициализация входных переменных
        $this->errors = array();
        $this->newNameFile = $newNameFile;
        $this->nameIdInputFile = $nameIdInputFile;
        $idFile !== null ? $this->idFile = $idFile - 1 : $this->idFile = null;
        // пришел ли файл
        if (isset($_FILES[$this->nameIdInputFile]['name'])) {
            // инициализация параметров загружаемого файла
            $this->determineParametersFile($idFile);
            // проверяем допустимость загрузки файлов
            if ($this->checkBlackList()) {
                // проверяем допустимость названия файла
                if ($this->checkNewName()) {
                    // eсли директории для загрузки нет - создать
                    $this->createdDir();
                    if ($this->checkType($this->getAccess($access))) {
                        // новое название
                        $this->saveNameFile = $this->dirUpload.$this->newNameFile.".".$this->getExtensionType($extension);
                        // загрузка
                        if ($this->checkSizeFile($fileSize)) {
                            $this->upload();
                        } 
                    }
                } 
            } 
        }
    }

    /**
     * Инициализация параметров загружаемого файла
     * @return type
     */
    protected function determineParametersFile() { 
        if ($this->idFile !== null) {
            $this->file = $_FILES[$this->nameIdInputFile]['name'][$this->idFile];
            $this->type = $_FILES[$this->nameIdInputFile]['type'][$this->idFile];
            $this->tmp_name = $_FILES[$this->nameIdInputFile]['tmp_name'][$this->idFile];
            $this->size = $_FILES[$this->nameIdInputFile]['size'][$this->idFile];
            $this->error = $_FILES[$this->nameIdInputFile]['error'][$this->idFile];
        } else {
            $this->file = $_FILES[$this->nameIdInputFile]['name'];
            $this->type = $_FILES[$this->nameIdInputFile]['type'];
            $this->tmp_name = $_FILES[$this->nameIdInputFile]['tmp_name'];
            $this->size = $_FILES[$this->nameIdInputFile]['size'];
            $this->error = $_FILES[$this->nameIdInputFile]['error'];
        }
        return;
    }
    
   /**
    * Проверяем допустимость загрузки файлов
    * @return boolean
    */
    protected function checkBlackList() {
        foreach ($this->blacklist as $item) {
            if(preg_match("/$item\$/i", $this->file)) {
                $this->errors[] = "Мы не поддерживаем загрузку PHP скриптов";
                return false;
            } else {
                return true;
            }
        }
    }
    
    /**
     * Проверка соответствия нового имени файла шаблону
     * @return boolean
     */
    protected function checkNewName() {
        $checkNewName = true;
        if($this->newNameFile != null && $this->newNameFile != "") {
            if (!preg_match("/[a-zA-Z0-9-_\.]$/",$this->newNameFile)) {
                $this->errors[] = "Неподдерживаемыe символы в названии файла. ";
                $this->errors[] = "Допускаются: латиница, цифры, тире, нижнее подчеркивание и точка"; 
                $checkNewName = false;
            } 
        } else {
            $this->errors[] = "Не задано имя файла"; 
        }
        return $checkNewName;
    }
    
    /**
     * Если директории для загрузки нет - создать
     */
    protected function createdDir() {
        if (!file_exists($this->dirUpload)) { 
            mkdir($this->dirUpload, 0777, true);
            chmod($this->dirUpload, 0777);
        }
    }
    
    /**
     * Если необходимо проверить тип файла
     * @param type $accessArray
     * @return boolean
     */
    protected function checkType($accessArray) {
        $access = true;
        if (!empty($accessArray)) {
            foreach ($accessArray as $type) {
                if($this->type === $type) {
                    $access = true;
                } else {
                    $this->errors[] = "Не поддерживаемый тип файла";
                    $access = false;
                }
            }
        }
        return $access;
    }
    
    /**
     * Получить массив поддерживаемых типов расширений
     * @param type $access
     * @return type string
     */
    protected function getAccess($access) {
        if ($access == null && $this->access == null) {
           $accessArray = array();
        } else {
            if ($access != null) {
                $accessArray = explode(",", $access);
            } elseif ($this->access != null) {
                $accessArray = explode(",", $this->access);
            } 
        }
        return $accessArray;
    }
    
    /**
     * Получить расширение
     * @param type $extension
     * @return type string
     */
    protected function getExtensionType($extension) {
        if ($extension == null && $this->extension == null) {
           $extensionType = substr(strrchr($this->file, "."), 1);
            if ($extensionType == 'jpeg') {
                $extensionType = 'jpg';
            }
        } else {
            if ($extension != null) {
                $extensionType = $extension;
            } else {
                if ($this->extension != null) {
                $extensionType = $this->extension; 
                }
            } 
        }
        return strtolower($extensionType);
    }

    /**
     * Проверка допустимого размера файла
     * @param type $fileSize
     * @param type $newName
     * @return boolean
     */
    protected function checkSizeFile($fileSize) {
        $loadFile = $this->causeOne($fileSize);
        $uploadMaxFilesize = $this->getFileSize($fileSize);
        if ($loadFile > $uploadMaxFilesize) {
            $this->errors[] = 'Размер принятого файла превысил максимально допустимый размер - '.$uploadMaxFilesize;
            if (file_exists($this->saveNameFile)) {
                unlink($this->saveNameFile);
            }
            return false;
        }
        return true;
    }
    
    /**
     * Получить допустимый размер файла
     * @param type $fileSize
     * @return type string
     */
    protected function getFileSize($fileSize) {
        if ($fileSize == null && $this->fileSize == null) {
           $uploadMaxFilesize = get_cfg_var('upload_max_filesize');
        } else {
            if ($fileSize != null && $fileSize != '') {
                $uploadMaxFilesize = $fileSize;
            } elseif ($this->fileSize != null && $this->fileSize != '') {
                $uploadMaxFilesize = $this->fileSize;
            } 
        } 
        return $uploadMaxFilesize;
    }
    
    /**
     * Приводим к заданной единице измерения размер загружаемого файла
     * @param type $fileSize
     * @return type
     */
    protected function causeOne($fileSize) {
        $loadFile = $this->size; 
        $allowableЫize = $this->getFileSize($fileSize);
        // единица измерения (по литере)
        $tmp = str_word_count($allowableЫize,1);
        $tmp1 = array_pop($tmp);
        $unitMeasurement = strtolower($tmp1[0]);
        // приводим к общей единице измерения
        if ($unitMeasurement == 'k' || $unitMeasurement == 'к') {
           $loadFile = round($loadFile / 1024, 2);
        }
        elseif ($unitMeasurement == 'm' || $unitMeasurement == 'м') {
            $loadFile = round($loadFile / 1024/1024, 2);
        }
        elseif ($unitMeasurement == 'g' || $unitMeasurement == 'г') {
            $loadFile = round($loadFile / 1073741824, 2);
        }
        return $loadFile;
    }

    /**
     * Подготовка к загрузке
     * @param type $id
     * @param type string
     */
    protected function upload() {
        if (move_uploaded_file($this->tmp_name, $this->saveNameFile)) {
            if ($this->error == 0) {
//                $this->errors[] = 'Файл успешно загружен';
            }
        } else {
            $this->errors[] = 'Непредвиденная ошибка';
        }
    }

    /**
    * Возвращает текст сообщения (ошибки)
    * @return type string
    */
    public function getError() {
        for ($i = 0; $i < count($this->errors); $i++) {
            echo $this->errors[$i].'<br>';  
        }
    }
}
