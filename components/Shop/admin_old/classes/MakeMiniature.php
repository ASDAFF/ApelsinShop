<?php
/**
 * Создать миниатюру c названием: name_widthxheight.extension
 *
 * @author olga
 */
class MakeMiniature {
    
    private $image;             // содержит название файла и путь до него
    private $sizeMiniature;
    private $originalHeight;
    private $originalWidth;
    private $access;

    public function __construct($image) {
        $this->image = $image;
        $this->access = ['image/jpeg', 'image/png'];  
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
        $newElement = ['w'=>$width, 'h'=>$height];
        $this->sizeMiniature[] = $newElement;
    } 
    
    /**
     *  Сброс размера миниатюры
     */
    public function unsetSizeMiniature() {
        $this->sizeMiniature = null;
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
     * Сделать миниатюру
     * @param type $m_dir - другая директория для миниатюры
     */
    public function makeMiniature($m_dir = null) {
        if ($this->getImageSize()) {  
            if ($this->sizeMiniature !== null) {  
                foreach ($this->sizeMiniature as $value) {  
                    $this->getMiniature($value['w'], $value['h'], $m_dir);  
                }  
            } 
        } else {
            echo 'Не является изображением или неподдерживаемый тип файла';
        }
    }

    /**
     * Сделать миниатюру
     * @param type $nameMiniature   - название будущей миниатюры 
     * @param type $m_width         - новая ширина 
     * @param type $m_height        - новая высота 
     * @param type $m_dir           - другая директория для миниатюры
     */
    private function getMiniature($m_width, $m_height, $m_dir) {
        // если файл существует
        if (file_exists($this->image)) {
            // проверяем, что размеры миниатюры заданы корректно (меньше оригинала)
            if ($this->originalWidth > $m_width || $this->originalHeight > $m_height) {
            // генерируем новое имя
            $newNameMiniature = $this->getNameMiniature($m_width, $m_height);
                // получаем копию
                if (copy($this->image, $newNameMiniature)) {
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
        // расширение
        $extension = strtolower(strrchr($this->image, '.')); 
        // новое имя
        $oldNameImage = $this->reverse_strrchr($this->image, '.');
        $nameMiniature = substr($oldNameImage, 0, -1);
        // генерируем полное имя
        $newNameMiniature = $nameMiniature.'_'.$w.'x'.$h.$extension;
        return $newNameMiniature;
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
            $resize->resizeTo($width, $height);
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
        $extensionType = substr(strrchr($this->image, "."), 1);
        if ($extensionType == 'jpeg') {
            $extensionType = 'jpg';
            $tmp = $this->reverse_strrchr($this->image, '.');
            $this->image = $tmp.$extensionType; 
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
    
    /**
     * Является ли изображением и получение размеров оригинала
     * @return boolean 
     */
    private function getImageSize() {
        if (is_file($this->image)) {
            // получаем информацию о файле
            $this->getimagesize = getimagesize($this->image);
            $this->originalWidth = $this->getimagesize[0];
            $this->originalHeight = $this->getimagesize[1];
            // если изображение
            return (in_array($this->getimagesize['mime'], $this->access)) ? true : false;
        }
    } 
    
    /**
     * Обрезает строку после заданного символа ( $needle )
     */
    private function reverse_strrchr($haystack, $needle) {
        return strrpos($haystack, $needle) ? substr($haystack, 0, strrpos($haystack, $needle) + 1) : false;
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
