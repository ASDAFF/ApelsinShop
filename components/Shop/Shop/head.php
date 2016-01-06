<script type="text/javascript">
$(document).ready(function() {
    $(".fancybox-doc").fancybox();
});
</script>
<!--<script type="text/javascript" src="./components/Shop/js/shopBasket.js"></script>-->
<script type="text/javascript" src="./components/Shop/js/shopBasketNew.js"></script>
<?php
include_once './components/Shop/classes/ShopIncludeClasses.php';
ShopIncludeClasses::includeAllClasses();
include_once './components/Shop/pdfCreator/tcpdf.php';
include_once './components/Shop/pdfCreator/PDFcreator.php';
