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
 * Description of ShopItemsPropertiesMeasureScaling
 *
 * @author Maxim Zaitsev
 * @copyright © 2010-2016, CompuProjec
 * @created 28.01.2016 14:28:07
 */
class ShopItemsPropertiesMeasureScaling {

    static private $SQL_HELPER;
    static private $object;
    static private $scalingMeasure;

    private function __construct() {
        global $_SQL_HELPER;
        self::$SQL_HELPER = $_SQL_HELPER;
        self::getMeasureData();
    }

    private static function createObject() {
        if (!isset(self::$object)) {
            self::$object = new ShopItemsPropertiesMeasureScaling();
        }
    }
    
    private static function getMeasureData() {
        $query = "SELECT `measureF`, `measureS`,`upScalingLimit`, `downScalingLimit`, `round` FROM `ShopMeasure`;";
        $rezult = self::$SQL_HELPER->select($query);
        foreach ($rezult as $measure) {
            self::$scalingMeasure[$measure['measureF']]['measureS'] = $measure['measureS'];
            self::$scalingMeasure[$measure['measureF']]['measureF'] = $measure['measureF'];
            self::$scalingMeasure[$measure['measureF']]['upScalingLimit'] = $measure['upScalingLimit'];
            self::$scalingMeasure[$measure['measureF']]['downScalingLimit'] = $measure['downScalingLimit'];
            self::$scalingMeasure[$measure['measureF']]['round'] = $measure['round'];
            self::$scalingMeasure[$measure['measureF']]['scaling'] = self::getMeasureScalingData($measure['measureF']);
        }
    }
    
    private static function getMeasureScalingData($measure) {
        $query = "SELECT 
            SMS.`measure`,
            SMS.`aliasF`, 
            SMS.`aliasS`, 
            SMP.`prefixF` , 
            SMP.`prefixS` , 
            SMP.`factor` , 
            SMP.`reverseFactor` 
            FROM `ShopMeasureScaling` as SMS
            LEFT JOIN `ShopMeasurePrefix` as SMP
            on SMS.`prefix` = SMP.`prefixF`
            WHERE SMS.`measure` = '".$measure."';";
        return self::$SQL_HELPER->select($query);
    }
    
    private static function ScalingMeasure($measure, $value) {
        self::createObject();
        $scalingValue = $value;
        $scalingMeasurePrefix = array();
        foreach (self::$scalingMeasure[$measure]['scaling'] as $scalingData) {
            $rezultValue = $value*$scalingData['reverseFactor'];
            if(self::ScalingMeasureCheck($rezultValue, $scalingValue, $measure)) {
                $scalingValue = $rezultValue;
                $scalingMeasurePrefix = $scalingData;
            }
        }
        return array('value' => $scalingValue, 'roundValue' => round($scalingValue, self::$scalingMeasure[$measure]['round']), 'scaling' => $scalingMeasurePrefix);
    }
    
    private static function ScalingMeasureCheck($rezultValue, $scalingValue, $measure) {
        if($scalingValue >= 1) {
            return $rezultValue >= self::$scalingMeasure[$measure]['upScalingLimit'] && $rezultValue < $scalingValue;
        } else {
            return $rezultValue <= self::$scalingMeasure[$measure]['downScalingLimit'] && $rezultValue > $scalingValue;
        }
    }

    public static function ScalingMeasureString($measure, $value) {
        self::createObject();
        $scalingRezult = self::ScalingMeasure($measure, $value);
        if(!empty($scalingRezult['scaling'])) {
            if($scalingRezult['scaling']['aliasS'] == '') {
                $measureString = $scalingRezult['scaling']['prefixS'].self::$scalingMeasure[$measure]['measureS'];
            } else {
                $measureString = $scalingRezult['scaling']['aliasS'];
            }
        } else {
            $measureString = self::$scalingMeasure[$measure]['measureS'];
        }
        return $scalingRezult['roundValue']." ".$measureString;
    }
}