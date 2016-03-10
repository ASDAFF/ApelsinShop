<?php

class ShopItemAmountScale {
    
    public static function getAmountScale($amount, $minAmount) {
        if($minAmount == 0) { $minAmount = 1; }
//        if($amount <= 0 || $amount == 1) {
        if($amount <= 0) {
            $scaleValue = 0;
            $text = "Товара нет в наличии.";
            $css = "";
        } else if (($amount >= 0 && $amount < $minAmount) || $amount <= 1 ) {
            $scaleValue = 25;
            $text = "Очень мало.\nУточняйте наличие в магазине у менеджеров.";
            $css = "VeryFew";
        } else if ($amount >= $minAmount && $amount < 2 * $minAmount) {
            $scaleValue = 50;
            $text = "Мало.";
            $css = "Few";
        } else if ($amount >= 2 * $minAmount && $amount < 3 * $minAmount) {
            $scaleValue = 75;
            $text = "Достаточно.";
            $css = "Suffice";
        } else if ($amount >= 3 * $minAmount) {
            $scaleValue = 100;
            $text = "Много.";
            $css = "Many";
        }
        $out = "<div class='ShopItemAmount' title='".$text."'>";
        $out .= "<div class='ShopItemAmountScale ".$css."' style='width: ".$scaleValue."%;'></div>";
        $out .= "</div>";
        return $out;
    }
    
    public static function getAmountScaleForShops($amount, $totalAmount) {
        if($totalAmount == 0) { $totalAmount = 1; }
        if($amount <= 0) {
            $scaleValue = 0;
            $text = "Товара нет в наличии.";
            $css = "";
        } else if (($amount >= 0 && $amount < $totalAmount/4) || $amount <= 1 ) {
            $scaleValue = 25;
            $text = "Очень мало.\nУточняйте наличие в магазине у менеджеров.";
            $css = "VeryFew";
        } else if ($amount >= $totalAmount/4 && $amount < $totalAmount/3) {
            $scaleValue = 50;
            $text = "Мало.";
            $css = "Few";
        } else if ($amount >= $totalAmount/3 && $amount < $totalAmount/2) {
            $scaleValue = 75;
            $text = "Достаточно.";
            $css = "Suffice";
        } else if ($amount >= $totalAmount/2) {
            $scaleValue = 100;
            $text = "Много.";
            $css = "Many";
        }
        $out = "<div class='ShopItemAmount' title='".$text."'>";
        $out .= "<div class='ShopItemAmountScale ".$css."' style='width: ".$scaleValue."%;'></div>";
        $out .= "</div>";
        return $out;
    }
}
