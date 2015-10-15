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
 * Производство миниатюр
 *
 * @author Olga Rjabchikova
 * @copyright © 2010-2016, CompuProjec
 * @created 29.09.2015 14:48:08
 */
class MakeMiniature {

    private $image;             // полный путь
    private $originalHeight;
    private $originalWidth;
    private $getimagesize;

    public function __construct($image) {
        $this->image = $image;
    }

    /**
     * Сделать миниатюру
     * @param type $nameMiniature   - название будущей миниатюры 
     * @param type $m_width         - новая ширина 
     * @param type $m_height        - новая высота 
     * @param type $m_dir           - другая директория для миниатюры
     */
    public function makeMiniature($m_width, $m_height, $m_dir) {
        // если файл существует
        if (file_exists($this->image)) {
            // получаем информацию о файле
            $this->getimagesize = getimagesize($this->image);
            $this->originalWidth = $this->getimagesize[0];
            $this->originalHeight = $this->getimagesize[1];
            // проверяем, что размеры миниатюры заданы корректно (меньше оригинала)
            if ($this->originalWidth > $m_width || $this->originalHeight > $m_height) {
                // генерируем новое имя
                $newNameMiniature = $this->getNameMiniature($m_width, $m_height);
                // получаем копию
                if (copy($this->image, $newNameMiniature)) {
                    // делаем ресайз
                    $this->resizeImages($newNameMiniature, $m_width, $m_height);
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
        $newNameMiniature = $nameMiniature . '_' . $w . 'x' . $h . $extension;
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
            $this->image = $tmp . $extensionType;
        }
    }

    /**
     * Обрезает строку после заданного символа ( $needle )
     */
    private function reverse_strrchr($haystack, $needle) {
        return strrpos($haystack, $needle) ? substr($haystack, 0, strrpos($haystack, $needle) + 1) : false;
    }

}
