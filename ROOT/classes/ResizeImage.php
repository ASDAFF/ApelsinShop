<?php
/**
 * Изменение размера изображения
 *
 * Можно изменять размер точно
 * Максимальная ширина при сохранинии соотношения сторон
 * Максимальная высота при сохранинии соотношения сторон
 * Авто при сохранинии соотношения сторон
 * Обрезка
 *
 * @author olga
 */
class ResizeImage {
     
    private $image;        // дескриптор загруженного изображения 
    private $origWidth;    // ширина загруженного изображения
    private $origHeight;   // высота загруженного изображения
    private $resizeWidth;  // новая ширина 
    private $resizeHeight; // новая высота
    private $ext;          // расширение
    private $newImage;     //для измененного изображения
    
    /**
     * Конструктор
     * @param type $fileName - изображение
     */
    public function __construct($fileName) {  
        if (file_exists($fileName)) {
            // открываем изображение 
            $this->openImage($fileName); 
        } else {
            echo 'Изображение не найденo, выберите другое';
        }  
    } 
    
    /**
     * Ресайз
     * @param  int $newWidth -  максимальная ширина изображения
     * @param  int $newHeight - максимальная высота изображения
     * @param  string $option - соотношение длины-ширины
     */
    public function resizeTo($newWidth, $newHeight, $option = 'default' ) {  
        // получаем оптимальную ширину и высоту (зависит от параметра $option) 
        $this->getDimensions($newWidth, $newHeight, strtolower($option)); 
        // создаем холст изображения с измененными сторонами
        $this->newImage = imagecreatetruecolor($newWidth, $newHeight);
        if ($this->ext == 'image/png') {
            // отключаем режим сопряжения цветов (убираем черный фон)
            imagealphablending($this->newImage, false);
            // сохраняем альфа канал в выходной файл
            imagesavealpha($this->newImage, true);
        }
        if ($this->ext == 'image/gif') {
            // получаем прозрачный цвет
            $transparent_source_index = imagecolortransparent($this->image);
            // проверяем наличие прозрачности
            if ($transparent_source_index !== -1) {
                // получаем цвет, соответствующий заданному индексу.
                $transparent_color = imagecolorsforindex($this->image, $transparent_source_index);
                //Добавляем цвет в палитру нового изображения 
                $transparent_destination_index = imagecolorallocate($this->newImage, $transparent_color['red'], $transparent_color['green'], $transparent_color['blue']);
                 // устанавливаем его как прозрачный
                imagecolortransparent($this->newImage, $transparent_destination_index);
                //На всякий случай заливаем фон этим цветом
                imagefill($this->newImage, 0, 0, $transparent_destination_index);
            }
        }    
        // Если параметр $option = 'crop'(обрезка), то создаем соответствующий холст
        if ($option == 'crop') {
            // Находим центр - это необходимо для обрезки
            $cropStartX = ( $this->resizeWidth / 2) - ( $newWidth /2 );  
            $cropStartY = ( $this->resizeHeight/ 2) - ( $newHeight/2 );  
            imagecopyresampled($this->newImage, $this->image , 0, 0, $cropStartX, $cropStartY, $this->resizeWidth, $this->resizeHeight, $this->origWidth, $this->origHeight);
        } else {
            imagecopyresampled($this->newImage, $this->image, 0, 0, 0, 0, $this->resizeWidth, $this->resizeHeight, $this->origWidth, $this->origHeight);  
        }
    }
    
    /**
     * Сохранить изображение
     * @param  String[type] $savePath - путь для сохранения нового изображения
     * @param  string $imageQuality -   качество сохраняемого нового изображения
     * @return сохраненное изображение
     */
    public function saveImage($savePath, $imageQuality="100", $download = false) {  
        // получаем расширение
        switch ($this->ext) {  
            case 'image/jpeg':   
                if (imagetypes() & IMG_JPG) {  
                    imagejpeg($this->newImage, $savePath, $imageQuality);  
                }  
                break;   
            case 'image/png':  
                // переводим шкалу качества с 0 - 100 в 0 - 9  
                $scaleQuality = round(($imageQuality/100) * 9); 
                // инвертируем качество.   
                $invertScaleQuality = 9 - $scaleQuality;  
                if (imagetypes() & IMG_PNG) {  
                    imagepng($this->newImage, $savePath, $invertScaleQuality);  
                }  
                break;  
            case 'image/gif':    
                if (imagetypes() & IMG_GIF) {
                    imagegif($this->newImage, $savePath, $imageQuality);
                }
                break; 
            default:  
                echo 'Выбранный файл не является изображением'; 
                break;  
        } 
        if ($download) {
            header('Content-Description: File Transfer');
            header("Content-type: application/octet-stream");
            header("Content-disposition: attachment; filename= ".$savePath."");
            readfile($savePath);
        } 
        // освобождаем память, уничтожая переменную с изображением
        imagedestroy($this->newImage);
    }
    
    /**
     * Открыть файл. Получить дескриптор, ширину и высоту   
     * @param string $file
     */
    private function openImage($file) {  
        // получаем расширение файла  
        $size = getimagesize($file);
        $this->ext = $size['mime'];
        switch($this->ext) {  
            case 'image/jpeg':   
                $this->image = @imagecreatefromjpeg($file);  
                break;   
            case 'image/png':  
                $this->image = @imagecreatefrompng($file);  
                break; 
            case 'image/gif': 
                $this->image = @imagecreatefromgif($file);  
                break; 
            default:  
                echo 'Выбранный файл не является изображением'; 
                break;  
        }  
        // сохраняем ширину и высоту 
        $this->origWidth = imagesx($this->image);
        $this->origHeight = imagesy($this->image);  
    }
    
    /**
     * Получить параметры ресайза
     * @param  int $newWidth -  максимальная ширина изображения
     * @param  int $newHeight - максимальная высота изображения
     * @param  string $option - соотношение длины-ширины
     */
    private function getDimensions($newWidth, $newHeight, $option = 'default' ) {  
        switch ($option) {  
            case 'exact':  
                $this->resizeWidth = $newWidth;  
                $this->resizeHeight = $newHeight;  
                break;  
            case 'maxheight':  
                $this->resizeWidth = $this->getSizeByFixedHeight($newHeight);  
                $this->resizeHeight = $newHeight;  
                break;  
            case 'maxwidth':  
                $this->resizeWidth = $newWidth;  
                $this->resizeHeight = $this->getSizeByFixedWidth($newWidth);  
                break;  
            case 'crop':  
                $this->getOptimalCrop($newWidth, $newHeight);  
                break; 
            default:  
                $this->getSizeByAuto($newWidth, $newHeight);  
                break;   
        }    
    }
    
    /**
     * Вычисление новой высоты
     * @param type $newHeight
     * @return type
     */
    private function getSizeByFixedHeight($newHeight) {  
        return floor(($this->origWidth/$this->origHeight) * $newHeight);
    }

    /**
     * Вычисление новой ширины
     * @param type $newWidth
     * @return type
     */
    private function getSizeByFixedWidth($newWidth) {  
        return floor(($this->origHeight/$this->origWidth) * $newWidth);
    }  

    /**
     * Автоподгонка размеров
     * @param type $newWidth
     * @param type $newHeight
     */
    private function getSizeByAuto($newWidth, $newHeight) { 
        if($this->origWidth > $newWidth || $this->origHeight > $newHeight) {
            if ( $this->origWidth > $this->origHeight ) {
             $this->resizeHeight = $this->getSizeByFixedWidth($newWidth);
                $this->resizeWidth  = $newWidth;
            } else if( $this->origWidth < $this->origHeight ) {
                $this->resizeWidth  = $this->getSizeByFixedHeight($newHeight);
                $this->resizeHeight = $newHeight;
            } else {
                $this->resizeWidth = $newWidth;
                $this->resizeHeight = $newHeight;	
            }
        } else {
            $this->resizeWidth = $newWidth;
            $this->resizeHeight = $newHeight;
        }
    }  

    /**
     * Вычисление размеров для обрезки
     * @param type $newWidth
     * @param type $newHeight
     */
    private function getOptimalCrop($newWidth, $newHeight) {  
        $heightRatio = $this->origHeight / $newHeight;  
        $widthRatio  = $this->origWidth /  $newWidth;  
        if ($heightRatio < $widthRatio) {  
            $optimalRatio = $heightRatio;  
        } else {  
            $optimalRatio = $widthRatio;  
        }  
        $this->resizeHeight = $this->origHeight / $optimalRatio;  
        $this->resizeWidth  = $this->origWidth  / $optimalRatio;   
    }
}