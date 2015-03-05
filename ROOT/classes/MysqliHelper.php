<?php
/**
 * Класс для работы с MySql по средством библиотеки MySqli
 */
class MysqliHelper {
    private $mysqli;
    private $error;
    
    /**
     * Конструктор класса.
     * @global array $_DBSETTINGS - глобальный массив с настройками для бд:
     *      host - Хост.
     *      user - Пользователь.
     *      password - Пароль.
     *      db_name - Имя Базы Данных.
     *      charset - Кодировка.
     */
    public function __construct() {
        $this->error = null;
        $this->mysqli = MySqliConnectHelper::getConection();
        if (mysqli_connect_errno()) {
            $this->error = "Ошибка подключения к базе данных : ".mysqli_connect_error();
            $this->error .= "<br>Обратитесь к администратору.";
            echo $this->error;
            exit();
        }
    }
    
    /**
     * Функция получения данных из MySql SELECT запроса.
     * @param String $query - MySql SELECT запрос.
     * @param int $rowNumber - необязательный параметр. 
     *      Указывается если надо получить данные из конкретной строки таблицы.
     *      Важно: Нумирация начинается с 1!
     * @return 
     *  1) вернет null если данных нет.
     *  2) вернет таблицу в формате 
     *      $data[<номер строки>][<имя столбца>] 
     *      если не указана строка.
     *  3) вернет строку из таблицы формата 
     *      $data[<имя столбца>] 
     *      если была указана строка. 
     */
    public function select($query, $rowNumber=null) {
        if($this->error!=null) {
            echo $this->error;
            return array();
        }
        $result = $this->mysqli->query($query);
        $i=0;
        $data = array();
        if($result==null) {
            return array();
        }
        while($row = $result->fetch_assoc()){
            foreach (array_keys($row) as $key) {
                $data[$i][$key] = $row[$key];
            }
            $i++;
        }
        if(count($data)<1) {
            $data=array();
        }
        if($rowNumber!=null && !isset($data[$rowNumber-1])) {
            $data[$rowNumber-1]=null;
        }
        return $rowNumber==null ? $data : $data[$rowNumber-1];
    }
    
    /**
     * Функция выполнения MySql INSERT запроса.
     * @param type $query
     */
    public function insert($query) {
        if($this->error!=null) {
            echo $this->error;
            return;
        }
        $this->mysqli->query($query);
        return $this->mysqli->error==null;
    }
    
    public function escapeString($string) {
        return mysqli_real_escape_string($this->mysqli,$string);
    }
    
    /**
     * получить ID последней записи
     * @return type ID последней записи
     */
    public function lastInsertID() {
        return  mysqli_insert_id($this->mysqli);
    }

    /**
     * Деструктор класса который разрывает соединение с БД.
     */
    public function __destruct() {
        $this->mysqli->close();
    }
}

?>
