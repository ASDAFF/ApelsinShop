<script type="text/javascript">
$(document).ready(function() {
    $(".fancybox-doc").fancybox();
});
</script>
<!--<script type="text/javascript" src="./components/Shop/js/shopBasket.js"></script>-->
<script type="text/javascript" src="./components/Shop/js/shopBasketNew.js"></script>

<!-- пример для списков START -->
<style>
    ul.TestList {
        display: block;
        background: #e2e2e2;
        list-style: none;
        padding: 10px;
    }
    ul.TestList li {
        display: block;
        border: 1px #B8B8B8 solid;
        padding: 5px;
        margin: 5px;
        cursor: move;
    }
    ul.TestList.SecondList .SecondElement span.del {
        display: none;
    }
    ul.TestList.FerstList .SecondElement span.add {
        display: none;
    }
    .SecondElement span {
        cursor: pointer;
    }
</style>
<!-- пример для списков END -->


<?php
include_once './components/Shop/classes/ShopIncludeClasses.php';
ShopIncludeClasses::includeAllClasses();
include_once './components/Shop/pdfCreator/tcpdf.php';
include_once './components/Shop/pdfCreator/PDFcreator.php';
