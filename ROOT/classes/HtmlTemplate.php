<?php
/**
 * Oбрабатывает TPL шаблоны.
 */
class HtmlTemplate {
    
    private static $html;       // html
    private static $errors = array();     // массив сообщений
    private static $path;       // путь к файлу
    private static $startSimbol = '{%';
    private static $endSimbol = '%}';

    /**
     * Функция обрабатывает TPL шаблоны.
     * @param string $file - путь к файлу TPL - шаблона, который содержит ключ
     * @param array $inser - массив соответствия типа: ключ - значение (замещает ключ в шаблоне)
     * @return 
     *      1)вернет false, если не верный формат входящих данных
     *      2)вернет false, если файл не найден или нет прав на открытие файла
     *      3)вернет false если файл не содержит данных или формат данных невозможно обработать.
     *      4)вернет false если нет полного соответствия ключей в массиве $inser, найдены не все совпадения.
     *      5)вернет собранный шаблон
     */
    public static function getTemplate($file, $inser) {
        self::unsetError();
        self::$path = $file;
        if(self::checkDataArray($inser)){
            return (self::checkArrayKeysInTemplate(self::readFileBufer(self::$path), $inser));
        }
    }
    
    /**
     * Проверка массива
     * @param type $inser - массив соответствия типа: ключ - значение (замещает ключ в шаблоне)
     * @return false, если не верный формат входящих данных
     */
    private static function checkDataArray($inser) {
        if ($check = !(count($inser) > 0 && is_array($inser))) {
            $inser = array();
            self::setError(__METHOD__, self::$path, "Не верный формат входящих данных");
        }
        return !$check; 
    }
    
    /**
     * Считывает файл в буфер
     * @param type $file - $file - путь к файлу
     * @return false, если 
     *      1) файл не содержит данных или формат данных невозможно обработать
     *      2) файл не найден или нет прав на открытие файла
     */
    private static function readFileBufer($file) {
        if (file_exists($file)) {
            ob_start();
            include_once($file);
            $data = ob_get_contents();
            ob_end_clean();
            if ($data == null) {  
                self::setError(__METHOD__, $file, "Файл не содержит данных или формат данных невозможно обработать");
            } else {    
                return $data;
            }
        } else {
            self::setError(__METHOD__, $file, "Файл не найден или нет прав на открытие файла");
        }
        return '';
    }
    
    /**
     * Проверка соответствия ключей массива с шаблоном
     * @param type $data - шаблон
     * @param type $inser - массив
     * @return type - готовый шаблон
     */
    private static function checkArrayKeysInTemplate($data, $inser) {
        foreach ($inser as $key => $value) {
            if (($pos = strpos($data, $key))!== false) {
                $data = str_replace(self::$startSimbol.$key.self::$endSimbol, $value, $data);
            }
        }
        if (preg_match('/'.self::$startSimbol.'[a-zA-Z0-9_-]{1,}'.self::$endSimbol.'/', $data)) {
            self::setError(__METHOD__, self::$path, "Нет полного соответствия ключей в массиве, найдены не все совпадения");     
        }
        return $data;
    }

    /**
    * Возвращает текст сообщения (ошибки)
    * @return type
    */
    public static function getError() {
        $out = '';
        for ($i = 0; $i < count(self::$errors); $i++) {
            $out .= self::$errors[$i];  
        }
        return $out;
    }
    
    /**
     * Генерирует  текст сообщения (ошибки)
     * @param type $metod - имя выполняемого метода 
     * @param type $file - имя выполняемого файла
     * @param type $error - текст сообщения (ошибки)
     */
    public static function setError($metod, $file, $error) {
        self::$html = '';
        self::$html .= '<div class="getError ">';
            self::$html .= '<p>';
                self::$html .= '<span style="color: blue; font-weight: bold;">'.$metod.'</span>';
                self::$html .= ' ( <span style="font-weight: bold;">'.$file.'</span> ) ';
                self::$html .= '<span style="font-weight: bold; color: red;">'.$error.'</span><br>';
            self::$html .= '</p>';
        self::$html .= '</div>';
        self::$errors[] = self::$html;
    }

    /**
     * Очищение массива сообщений
     */
    public static function unsetError() {
        self::$errors = array();
    }
}