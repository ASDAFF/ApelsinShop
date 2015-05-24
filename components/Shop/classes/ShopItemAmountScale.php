<?php

class ShopItemAmountScale {
    
    public static function getAmountScale($amount, $minAmount) {
        if($minAmount == 0) { $minAmount = 1; }
        if($amount <= 0 || $amount == 1) {
            $scaleValue = 0;
            $text = "Товара нет в наличии.";
        } else if ($amount >= 0 && $amount < $minAmount) {
            $scaleValue = 25;
            $text = "Очень мало.\nУточняйте наличие в магазине у менеджеров.";
        } else if ($amount >= $minAmount && $amount < 2 * $minAmount) {
            $scaleValue = 50;
            $text = "Мало.";
        } else if ($amount >= 2 * $minAmount && $amount < 3 * $minAmount) {
            $scaleValue = 75;
            $text = "Достаточно.";
        } else if ($amount >= 3 * $minAmount) {
            $scaleValue = 100;
            $text = "Многою";
        }
//        $text .= "\n\nTEST BLOCK\namount=".$amount." | minAmount=".$minAmount;
        $out = "<div class='ShopItemAmount' title='".$text."'>";
        $out .= "<div class='ShopItemAmountScale' style='width: ".$scaleValue."%;'></div>";
        $out .= "</div>";
        return $out;
    }
}
