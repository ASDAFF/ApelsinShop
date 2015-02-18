<?php
/**
 * Хелпер для поулчение локализаций для CMS
 */
class LangHelper {
    private $langType = 0;
    private $data = array();
    private $keys = array();
    
    /**
     * Конструктор.
     * @param type $tableName - название таблицы локализатора.
     * @param type $langColumn - название столбца хранящего информацию о языке.
     * @param type $selectionColumn - название столбца по которому производится отбор данных.
     * @param type $selectionValue - значение столбца по которому производится отбор данных.
     * @param type $lang - язык.
     */
    public function __construct($tableName,$langColumn,$selectionColumn,$selectionValue,$lang) {
        $query_ok = "select * from `Lang` as T1 left join `$tableName` as T2
            on T1.`lang` = T2.`$langColumn`
            where T1.`lang` = '$lang' and  T2.`$selectionColumn` = '$selectionValue'
            limit 0, 1;";

        $query_default = "select * from `Lang` as T1 left join `$tableName` as T2
            on T1.`lang` = T2.`$langColumn`
            where T1.`default` = '1' and T2.`$selectionColumn` = '$selectionValue' 
            limit 0, 1;";

        $query_else = "select * from `Lang` as T1 left join `$tableName` as T2
            on T1.`lang` = T2.`$langColumn`
            where T2.`$selectionColumn` = '$selectionValue'
            limit 0, 1;";
        $this->data = null;
        $this->keys = null;
        $mySqlHelper1 = new MySqlHelper($query_ok);
        $this->data = $mySqlHelper1->getDataRow(0);
        $this->keys = $mySqlHelper1->getDataKeys();
        if($this->data!=null && count($this->data)>0) {
            $this->langType = 1;
        } else {
            $this->data = null;
            $this->keys = null;
            $mySqlHelper2 = new MySqlHelper($query_default);
            $this->data = $mySqlHelper2->getDataRow(0);
            $this->keys = $mySqlHelper2->getDataKeys();
            if($this->data!=null && count($this->data)>0) {
                $this->langType = 0;
            } else {
                $this->data = null;
                $this->keys = null;
                $mySqlHelper3 = new MySqlHelper($query_else);
                $this->data = $mySqlHelper3->getDataRow(0);
                $this->keys = $mySqlHelper3->getDataKeys();
                if($this->data!=null && count($this->data)>0) {
                    $this->langType = 0;
                } else {
                    $this->langType = -1;
                }
            }
        }
    }
    
    /**
     * Получить локализацию.
     * @return array - массив локализованных данных из таблицы.
     */
    public function getLangData() {
        return $this->data;
    }
    
    /**
     * Получить локализацию конкретной записи из таблицы.
     * @param String $column - столбец для поулчение записи.
     * @return String - локализованная запись из таблицы.
     */
    public function getLangValue($column) {
        return $this->data[$column];
    }
    
    /**
     * Возвращает массив названия столбцов для локализации.
     * @return array - массив названия столбцов для локализации.
     */
    public function getLangKeys() {
        return $this->keys;
    }
    
    /**
     * Возвращает код о типе локализации
     * @return int - код о типе локализации [-1|0|1]
     */
    public function getLangType() {
        return $this->langType;
    }
}
?>
