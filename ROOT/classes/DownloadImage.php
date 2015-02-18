<?php
/**
 * Загрузка и ресайз изображения
 * 
 * @author olga
 */
class DownloadImage extends DownloadFile {
    
    private $minWidth;        // допустимая минимальная ширина
    private $minHeight;       // допустимая минимальная высота
    private $maxWidth;        // допустимая максимальная ширина
    private $maxHeight;       // допустимая максимальная высота
    private $width;           // новая ширина загружаемого изображения
    private $height;          // новая высота загружаемого изображения
    private $parameterImage;  // параметры ресайзa изображения 
    private $m_width;         // ширина миниатюры
    private $m_height;        // высота миниатюры
    private $newNameMiniature;// имя для сохранения миниатюры

    /**
     * Конструктор
     * @param type $dirUpload - директория загрузки
     * @param type $minWidth -  допустимая минимальная ширина
     * @param type $minHeight - допустимая минимальная высота
     * @param type $maxWidth -  допустимая максимальная ширина
     * @param type $maxHeight - допустимая максимальная высота
     */
    public function __construct($dirUpload, $minWidth = null, $minHeight = null, $maxWidth = null, $maxHeight = null) {
        parent::__construct($dirUpload);
        $this->minWidth = $minWidth;
        $this->minHeight = $minHeight;
        $this->maxWidth = $maxWidth;
        $this->maxHeight = $maxHeight;
    }

    /**
     * Установка минимальной ширины
     * @param type $minWidth - минимальная ширина
     */
    public function setMinWidth($minWidth) {
        $this->minWidth = $minWidth;
    }
    
    /**
     * Сброс  минимальной ширины
     * @param type $minWidth - минимальная ширина
     */
    public function unsetMinWidth() {
        $this->minWidth = null;
    }

    /**
     * Установка минимальной высоты
     * @param type $minHeight - минимальная высота
     */
    public function setMinHeight($minHeight) {
        $this->minHeight = $minHeight;
    }
    
    /**
     * Сброс  минимальной высоты
     * @param type $minHeight - минимальная высота
     */
    public function unsetMinHeight() {
        $this->minHeight = null;
    }
    
    /**
     * Установка максимальной ширины
     * @param type $maxWidth - максимальная ширина
     */
    public function setMaxWidth($maxWidth) {
        $this->maxWidth = $maxWidth;
    }
    
    /**
     * Сброс  максимальной ширины
     * @param type $maxWidth - максимальная ширина
     */
    public function unsetMaxWidth() {
        $this->maxWidth = null;
    }
    
    /**
     * Установка максимальной высоты
     * @param type $maxHeight - максимальная высота
     */
    public function setMaxHeight($maxHeight) {
        $this->maxHeight = $maxHeight;
    }
    
    /**
     * Сброс  максимальной высоты
     * @param type $maxHeight - максимальная высота
     */
    public function unsetMaxHeight() {
        $this->maxHeight = null;
    }
    
    /**
     * Установка размера миниатюры
     * @param type $width - ширина миниатюры
     * @param type $height - высота миниатюры
     */
    public function setSizeMiniature($width, $height) {
        $this->m_width = $width;
        $this->m_height = $height;
    }
    
    /**
     * Сброс размера миниатюры
     */
    public function unsetSizeMiniature() {
        $this->m_width = null;
        $this->m_height = null;
    }
    
    /**
     * Загрузка изображений
     * @param type $newNameFile -    1) новое имя изображения
     * @param type $nameIdInputFile -2) id name input
     * @param type $idFile -         3) id изображения, если загружено больше одного
     * @param type $access -         4) строка разрешенных расширений
     * @param type $fileSize -       5) допустимый размер файла
     * @param type $extension -      6) новое расширение
     * @param type $width -          7) ширина изображения
     * @param type $height -         8) высота изображения
     * @param type $parameterImage - 9) параметры ресайзa изображения 
     *              Может быть: exact - точно по заданным размерам; maxwidth - Ш-неизменна, Д-сохраняет соотношение; 
     *              maxheight - Д-неизменна, Ш-сохраняет соотношение; crop - обрезка; по умолчанию - default (авто) 
     */
    public function uploadFile($newNameFile, $nameIdInputFile,  $idFile = null,
                            $access = null, $fileSize = null, $extension = null, 
                            $width = null, $height = null, $parameterImage = null) {
        parent::uploadFile($newNameFile, $nameIdInputFile, $idFile, $access, $fileSize, $extension);
        // если файл существует
        if(file_exists($this->saveNameFile)) {
            // если допустимые размеры норм
            if ($this->checkImageSize($this->saveNameFile)) {
                // если задана только ширина, ресайз будет по ширине с сохранением пропорций
                if ($width !== null || $height !== null) {
                    if ($width !== null && $height === null) {
                        $this->width = $width;
                        $this->parameterImage = 'maxwidth';
                    // если задана только высота, ресайз будет по высотe с сохранением пропорций
                    } elseif ($height !== null && $width === null) {
                        $this->height = $height;
                        $this->parameterImage = 'maxheight';
                    } else {
                        // если задана и ширина и высота
                        if ($width !== null && $width != ''  && $height !== null && $height != '') {
                            $this->width = $width;
                            $this->height = $height;
                            // и параметр ресайзa, ресайз будет по значению $parameterImage
                            if ($parameterImage !== null) {
                                $this->parameterImage = $parameterImage;
                            } else {
                                // ресайз будет по default
                                $this->parameterImage = 'default';
                            }
                        }
                    }
                    $this->resizeImages($this->saveNameFile, $this->width, $this->height, $this->parameterImage);
                }
            } else {
                // если максимальные или минимальные размеры не проходят, сообщаем об ошибке
                $this->errors[] = ' Файл не загружен';
                if (file_exists($this->saveNameFile)) {
                    unlink($this->saveNameFile);
                }
            }
        } else {
            $this->errors[] = ' Файл не найден';
        }
    }

    /**
     * Сделать миниатюру
     * @param type $nameMiniature -  название будущей миниатюры 
     * @param type $m_width -        новая ширина 
     * @param type $m_height -       новая высота 
     * @param type $parameterImage - принцип ресайза
     * @param type $m_dir          - другая директория для миниатюры
     */
    public function makeMiniature($nameMiniature, $m_width, $m_height, $parameterImage = null, $m_dir = null) {
        // если файл существует
        if (file_exists($this->saveNameFile)) {
            // получаем размеры загруженного файла
            $this->getOriginalSize($this->saveNameFile);
            // проверяем, что размеры миниатюры заданы корректно (меньше оригинала)
            if ($this->originalWidth > $m_width || $this->originalHeight > $m_height) {
                // генерируем новое имя
                $this->getNameMiniature($nameMiniature);
                // получаем копию
                if (copy($this->saveNameFile, $this->newNameMiniature)) {
                    if ($parameterImage !== null) {
                        $this->parameterImage = $parameterImage;
                        // делаем ресайз
                        $this->resizeImages($this->newNameMiniature, $m_width, $m_height, $parameterImage);
                    }
                }
                // если в другую директорию 
                if ($m_dir != null) {
                    // перемещаем
                    $this->renameImage($this->newNameMiniature, $m_dir);
                }
            } else {
                $this->errors[] = 'Размеры миниатюры заданы некорректно (больше оригинала)';
            }
        }
    }
    
    /**
     * Проверяем допустимость размеров (min/max)
     * @param type $saveNameFile
     * @return boolean
     */
    private function checkImageSize($saveNameFile) {
        $executionFlag = true;
        $this->getOriginalSize($saveNameFile);
        if($this->minWidth !== null  && $this->minWidth !== null) {
            if ($this->originalWidth < $this->minWidth) {
                $this->errors[] = "Минимальная ширина изображения - ".$this->minWidth;
                $executionFlag = false;
            }
        }
        if($this->minHeight !== null  && $this->minHeight !== null) {
            if ($this->originalHeight < $this->minHeight) {
                $this->errors[] = "Минимальная высота изображения - ".$this->minHeight;
                $executionFlag = false;
            }
        }
        if($this->minWidth !== null  && $this->maxWidth !== null) {
            if ($this->originalWidth > $this->maxWidth) {
                $this->errors[] = "Максимальная ширина изображения - ".$this->maxWidth;
                $executionFlag = false;
            }
        }
        if($this->minHeight !== null  && $this->maxHeight !== null) {
            if ($this->originalHeight > $this->maxHeight) {
                $this->errors[] = "Максимальная высота изображения - ".$this->maxHeight;
                $executionFlag = false;
            }
        }
        return $executionFlag;
    }

    /**
     * Получение размеров загруженного файла
     * @param type $saveNameFile
     */
    private function getOriginalSize($saveNameFile) {
        if (file_exists($saveNameFile)) {
            $size = getimagesize($saveNameFile);
            $this->originalWidth = $size[0];
            $this->originalHeight = $size[1];
        }
    }

    /**
     * Перемещение в другую директорию
     * @param type $image
     * @param type $dir
     */
    private function renameImage($image, $dir) {
        if (!file_exists($dir)) { 
            mkdir($dir, 0777, true);
            chmod($dir, 0777);
        }
        $tmp = explode('/', $image);
        $name = array_pop($tmp);
        $newDir = $dir.$name;
        rename($image, $newDir);
    }

    /**
     * Ресайз и сохранение
     * @param type $saveNameFile -   изображение
     * @param type $width -          новая ширина 
     * @param type $height -         новая высота 
     * @param type $parameterImage - принцип ресайза
     */
    private function resizeImages($saveNameFile, $width, $height, $parameterImage) {
        // получаем размеры загруженного файла
        $this->getOriginalSize($saveNameFile);
        // если надо, ресайзим загруженное изображение
        if ($this->originalWidth !== $width || $this->originalHeight !== $height) {
            $resize = new ResizeImage($saveNameFile);
            $resize->resizeTo($width, $height, $parameterImage);
            $resize->saveImage($saveNameFile, 100);
        } 
    }
    
    /**
     * Генерируем новое имя
     * @return type
     */
    private function getNameMiniature($nameMiniature) {
        // обрезаем до "/"
        $tmp = $this->reverse_strrchr($this->saveNameFile, '/');
        // обрезаем после "."
        $extension = strtolower(strrchr($this->saveNameFile, '.')); 
        // генерируем новое имя
        $this->newNameMiniature = $tmp.$nameMiniature.$extension;
        return;
    }
      
    /**
     * Обрезает строку после заданного символа ($char)
     */
    private function reverse_strrchr($string, $char) {
        return strrpos($string, $char) ? substr($string, 0, strrpos($string, $char) + 1) : false;
    }
}
