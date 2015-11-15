<?php

class ShopItemsPropertiesMeasureScaling {

    static private $SQL_HELPER;
    static private $object;
    static private $defaultScalingFactor = 1000;
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
        $query = "SELECT `measureF`, `measureS` FROM `ShopMeasure`;";
        $rezult = self::$SQL_HELPER->select($query);
        foreach ($rezult as $measure) {
            self::$scalingMeasure[$measure['measureF']]['measureS'] = $measure['measureS'];
            self::$scalingMeasure[$measure['measureF']]['measureF'] = $measure['measureF'];
            self::$scalingMeasure[$measure['measureF']]['scaling'] = self::getMeasureScalingData($measure['measureF']);
        }
    }

    private static function getMeasureScalingData($measure) {
        $query = "SELECT
            SIPMP.`prefixF`, 
            SIPMP.`prefixS`, 
            SIPMP.`factor`, 
            SIPMP.`reverseFactor`, 
            SIPMS.`alias` 
            FROM `ShopMeasureScaling` as SIPMS
            LEFT JOIN `ShopMeasurePrefix` as SIPMP
            on SIPMS.`prefix` = SIPMP.`prefixF`
            WHERE SIPMS.`measure` = '" . $measure . "';";
        return self::$SQL_HELPER->select($query);
    }

    private static function NewScalingValueArray($value, $prefixF = '', $prefixS = '', $alias = '') {
        return array('value' => (float) $value, 'roundvalue' => round($value, 2), 'prefixF' => $prefixF, 'prefixS' => $prefixS, 'alias' => $alias);
    }

    private static function ScalingMeasure_integer($scalingValue, $мeasure, $value) {
        foreach (self::$scalingMeasure[$мeasure]['scaling'] as $scalingElement) {
            if ($scalingElement['factor'] > 1 && ($tempValue = $value * $scalingElement['reverseFactor']) >= 1 && $tempValue < $scalingValue['value']) {
                $scalingValue = self::NewScalingValueArray($tempValue, $scalingElement['prefixF'], $scalingElement['prefixS'], $scalingElement['alias']);
            }
        }
        return $scalingValue;
    }

    private static function ScalingMeasure_fractional($scalingValue, $мeasure, $value) {
        $scalingFactor = array();
        foreach (self::$scalingMeasure[$мeasure]['scaling'] as $scaling) {
            if ($scaling['factor'] < 1) {
                $scalingFactor[] = $scaling['reverseFactor'];
            }
        }
        if (empty($scalingFactor)) {
            $scalingFactor[] = self::$defaultScalingFactor;
        }
        foreach (self::$scalingMeasure[$мeasure]['scaling'] as $scalingElement) {
            if ($scalingElement['factor'] < 1 && ($tempValue = $value * $scalingElement['reverseFactor']) >= 1 && $tempValue < min($scalingFactor)) {
                $scalingValue = self::NewScalingValueArray($tempValue, $scalingElement['prefixF'], $scalingElement['prefixS'], $scalingElement['alias']);
            }
        }
        return $scalingValue;
    }

    public static function ScalingMeasure($мeasure, $value) {
        self::createObject();
        $scalingValue = self::NewScalingValueArray($value);
        if (isset(self::$scalingMeasure[$мeasure]['scaling'])) {
            if ($value > 1) {
                $scalingValue = self::ScalingMeasure_integer($scalingValue, $мeasure, $value);
            } else if ($value < 1) {
                $scalingValue = self::ScalingMeasure_fractional($scalingValue, $мeasure, $value);
            }
        }
        return $scalingValue;
    }

    public static function ScalingMeasureString($мeasure, $value) {
        $scalingValue = self::ScalingMeasure($мeasure, $value);
        if ($scalingValue['alias'] === NULL || $scalingValue['alias'] === '') {
            $мeasureString = $scalingValue['prefixS'] . $мeasure;
        } else {
            $мeasureString = $scalingValue['alias'];
        }
        return $scalingValue['roundvalue'] . " " . $мeasureString;
    }

    public static function getOriginalMeasure() {
        self::createObject();
    }

}
