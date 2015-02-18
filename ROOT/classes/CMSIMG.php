<?php
class CMSIMG {
    protected $srcImage=false;  //  дескриптор созданного изображения
    protected $coordinate=4; // 1-верхний, левый, 2-правый, верхний, 3-нижний, правый...
    protected $coord=array();
    protected $namefile='000.png';
    protected $tmp='000.png';
    public $image_type=3;

    // Передаем дефолтное название картинки, если оно в дальнейшем не будет указано и тип создаваемого изображения
    function __construct($tmp='000.png',$image_type=3,$namefile='000.png') {
        $this->image_type=$image_type;
        $this->namefile=$namefile;
        $this->tmp=$tmp;
    }


    // Произвести принудительную замену типа изображения? доступные значение:
    // 1=GIF ; 2=JPEG; 3=PNG
    protected function set_type($type) {
        $type=strtr($type,array("gif"=>1,"jpeg"=>2,"jpg"=>2,"png"=>3,"GIF"=>1,"JPEG"=>2,"JPG"=>2,"PNG"=>3));
        if($type==1||$type==2||$type==3){
            $this->image_type=$type;
        }
    }


    // Метод для получения dst_x и dst_y  функции  imagecopy
    protected function coordinat($srcWidth, $srcHeight, $logoWidth, $logoHeight){
        if($this->coordinate==1){
            $this->coord['dst_x']=0;
            $this->coord['dst_y']=0;
        } elseif($this->coordinate==2){
            $this->coord['dst_x']=$srcWidth - $logoWidth;
            $this->coord['dst_y']=0;
        } elseif($this->coordinate==3){
            $this->coord['dst_x']=$srcWidth - $logoWidth;
            $this->coord['dst_y']=$srcHeight - $logoHeight;
        } else {
            $this->coord['dst_x']=0;
            $this->coord['dst_y']=$srcHeight - $logoHeight;
        }
    }

    // создаёт новое изображение из файла
    // $filename адрес исхизображения
    protected function imagecreatefrom($filename) {
        $image_info = getimagesize($filename);
        $this->image_type=$image_info[2];
        if($this->image_type==2 ) {
            return imagecreatefromjpeg($filename);
        } elseif($this->image_type==1 ) {
            return imagecreatefromgif($filename);
        } elseif($this->image_type==3 ) {
            return imagecreatefrompng($filename);
        } else {
          return false;
        }
    }

    // загрузка изображения из файла  аргумент
    // $img от куда читаем
    public function load($img){
        $this->namefile=$img;
        if($this->imagecreatefrom($this->namefile)!=false){
            $this->srcImage = $this->imagecreatefrom($this->namefile);
        } else {
            return false;
        }
    }

    // Вывод изображения на экран
    public function output(){
        if($this->image_type==2){
            header("Content-Type: image/jpg");
            ImageJPEG($this->srcImage);
        } elseif($this->image_type==1){
            header("Content-Type: image/gif");
            ImageGIF($this->srcImage);
        } else {
            header("Content-Type: image/png");
            ImagePNG($this->srcImage);
        }
    }


    // Получаем расширение файла, метод необходим для автоматическом добавлении расширения файла используемом в методе save()
    public function extension(){
        if($this->image_type==2){
            return "jpg";
        } elseif($this->image_type==1){
            return "gif";
        } else {
            return "png";
        }
    }

    // Сохранение изображения в файл  аргумент $namefile - куда сохранять
    public function save($namefile=false,$type=false){
        $this_namefile=$namefile?$namefile:$this->namefile;
        $type==1?$this_namefile.'.'.$this->extension():$this_namefile;
        if($this->image_type==2) {
            ImageJPEG($this->srcImage, $this_namefile, 100);
        } elseif($this->image_type==1 ) {
            ImageGIF($this->srcImage, $this_namefile);
        } else {
            ImagePNG($this->srcImage, $this_namefile);
        }
    }

    // Получение ширины и высоты текущего изображения
    public function sxy(){
        $this->srcWidth  = ImageSX($this->srcImage);
        $this->srcHeight = ImageSY($this->srcImage);
        return  array("w"=>$this->srcWidth,"h"=>$this->srcHeight);
    }

    // Установка логотипа на изображение
    // $logosrc - адрес логотипа, $coordinate = угол изображения:
    // 1-верхний, левый, 2-правый, верхний, 3-нижний, правый...
    public function setlogo($logosrc,$coordinate=false)
    {
        $this->coordinate=$coordinate!=false&&filter_var($coordinate,FILTER_VALIDATE_INT)?$coordinate:$this->coordinate;
        $logoImage = $this->imagecreatefrom($logosrc);

        $srcWidth  = ImageSX($this->srcImage);
        $srcHeight = ImageSY($this->srcImage);

        $logoWidth  = ImageSX($logoImage);
        $logoHeight = ImageSY($logoImage);

        imageAlphaBlending($logoImage, false);
        imageSaveAlpha($logoImage, true);

        $trcolor = ImageColorAllocate($logoImage, 255, 255, 255);
        ImageColorTransparent($logoImage , $trcolor);

        $this->coordinat($srcWidth, $srcHeight, $logoWidth, $logoHeight);
        imagecopy($this->srcImage, $logoImage, $this->coord['dst_x'], $this->coord['dst_y'],0,0, $logoWidth, $logoHeight);

        unset($logoImage);
    }

    // Изменение размера изображения
    // $width - ширина,  $height высота,
    // если не указать $height , то аргумент $width будет считать процентным соотношением во сколько процентов изменять масштаб
    public function resize($width,$height=false){

        // Проверяем корректность введения ширины и высоты
        $width=filter_var($width,FILTER_VALIDATE_INT)?$width:false;
        $height=filter_var($height,FILTER_VALIDATE_INT)?$height:false;

        // Если ширина не указана или указана некорректно, то будет игнорироватся изменение масштаба изображения
        if(($width!='100'&&$height==false) or ($width!=false&&$height!=false)){
        $w_src = ImageSX($this->srcImage);
        $h_src = ImageSY($this->srcImage);

        // Если не указана высота, то по процентному соотношению вычисляем новый масштаб
            if($height==false){
            $height=($h_src/100)*$width;
            $width=($w_src/100)*$width;
            }

        $dest = imagecreatetruecolor($width,$height);

        if($height==$width){
            if ($w_src>$h_src) {
                imagecopyresized($dest, $this->srcImage, 0, 0, round((max($w_src,$h_src)-min($w_src,$h_src))/2), 0, $width, $height, min($w_src,$h_src), min($w_src,$h_src));
            } else {
                imagecopyresized($dest, $this->srcImage, 0, 0, 0, round((max($w_src,$h_src)-min($w_src,$h_src))/2), $width, $height, min($w_src,$h_src), min($w_src,$h_src));
            }
        } else {
        imagecopyresized($dest, $this->srcImage, 0, 0, 0, 0, $width, $height, $w_src, $h_src);
        }

        $this->srcImage=$dest;
        unset($dest);

        }
    }
    
    public function imageCut($X, $Y, $w, $h) {
        $this->srcImage;
        $dst_r = ImageCreateTrueColor($w, $h);
        imagecopyresampled($dst_r,$this->srcImage,0,0,$X,$Y,$w,$h,$w,$h);
        $this->srcImage = $dst_r;
    }

    // освобождает память, ассоциированную с изображением
    public function destroy(){
        ImageDestroy($this->srcImage);
    }

    // Наложение текста на изображение
    // $text - текст, $fontfile - путь к файлу со шрифтами, $color цвет в виде #000000, по умолчанию #000000
    // $size - размер шрифта , $angle - угол в градусах , $x - координата x - от куда печатать, $y - координата y, от куда печатать,
    // $pr - прозрачность от 0-непрозрачно до 127 - обсалютно прозрачно
    public function text($text,$fontfile,$color='#000000',$size=20,$angle=0,$x=10,$y=10,$pr=0){
        $col=$this->htmltorgb($color);
        $color = imagecolorallocatealpha($this->srcImage, $col[0],$col[1], $col[2],$pr);
        imagettftext ($this->srcImage,$size,$angle,$x,$y,$color,$fontfile,$text);
    }

    // Метод для получения цвета из html в rgb
    // $color - цвет в html
    protected function htmltorgb($color)
    {
        if ($color[0] == '#'){
            $color = substr($color, 1);
        }
        if (strlen($color)==6){
            list($r,$g,$b)=array($color[0].$color[1], $color[2].$color[3], $color[4].$color[5]);
        } elseif (strlen($color) == 3){
            list($r, $g, $b) = array($color[0].$color[0], $color[1].$color[1], $color[2].$color[2]);
        } else {
            return false;
        }
        $r = hexdec($r); $g = hexdec($g); $b = hexdec($b);
        return array($r, $g, $b);
    }

    // Создает новое изображение шириной $width и высотой $height
    // цветом $color (в html виде , по умолчанию #ffffff)
    // Если нужна прозрачность то 4 аргумент $pr указывать $pr=1
    public function create($width,$height,$color='#ffffff',$pr=false) {
        $width=filter_var($width,FILTER_VALIDATE_INT)?$width:200;
        $height=filter_var($height,FILTER_VALIDATE_INT)?$height:200;
        $col=$this->htmltorgb($color);
        $this->srcImage = imagecreatetruecolor($width,$height);
        $color = imagecolorallocate($this->srcImage, $col[0],$col[1], $col[2]);
        imagefilledrectangle($this->srcImage, 0, 0, ($width-1), ($height-1), $color);
        if($pr==1){
            imagetruecolortopalette($this->srcImage, true, 1);
            imagecolortransparent($this->srcImage,$color);
        }
    }

    // Возвращает идентификатор изображения для работы с ним вне класса
    public function return_img(){
            return $this->srcImage;
    }

    // Передаем идентификатор изображения для работы с ним внутри класса
    // $img - идентификатор загружаемого изображения
    public function set_img($img){
        $this->srcImage=$img;
    }

    // освобождает память, ассоциированную с изображением
    function __destruct() {
        ImageDestroy($this->srcImage);
    }

    // метод получения изображения по URL
    // $url - урл изображения, $tmp - временное место хранения
    public function load_url($url,$tmp){
        if(filter_var($url,FILTER_VALIDATE_URL)){
            $ch = curl_init($url);
            $fp = fopen($tmp, "w");
            curl_setopt ($ch,CURLOPT_USERAGENT,'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8.1.1) Gecko/20061204 Firefox/2.0.0.1');
            curl_setopt($ch, CURLOPT_HEADER, 0);
            curl_setopt($ch, CURLOPT_FILE, $fp);
            curl_exec($ch);
            curl_close($ch);
            fclose($fp);
            if(file_exists($tmp)&&$this->load($tmp)==false){
                unlink($tmp);
                return false;
            } else {
                    unlink($tmp);
                return true;
            }
        } else {
            return false;
        }
    }    
}
?>