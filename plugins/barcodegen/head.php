<?php
class BarCodeGenHelper {
    
    public static function BCGcode39_IMG($code) {
        return "<img src='./plugins/barcodegen/barcodefiles/BCGcode39.php?code=".$code."'>";
    }
    
    public static function BCGcode39_IMG_URL($code) {
        return "./plugins/barcodegen/barcodefiles/BCGcode39.php?code=".$code;
    }
        
}