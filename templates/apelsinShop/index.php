<!DOCTYPE html>
<?php global $ROOT;?>
<html>
<head>
    <?php $ROOT->head();?>
    <link rel="stylesheet" href="<?php $ROOT->templatePath();?>css/AdminPanel.css" type="text/css" />
    <link rel="stylesheet" href="./templates/apelsinShop/css/FilterStyle.css" type="text/css" />
    <link rel="stylesheet" href="./templates/apelsinShop/css/Test.css" type="text/css" />
    <style>
        .Import1cErrWarReport {
            font: 10px/12px monospace;
            color: #5f5f5f;
        }
        .Import1cErrWarReport h1 {
            font: bold 14px/16px monospace;
            margin-bottom: 5px;
        }
        .Import1cErrWarReport .Import1cErrWarReportElement {

        }
        .Import1cErrWarReport .Import1cErrWarReportElement .WarErrTextHead {
            color: #000;
            font-weight: bold;
        }
        .Import1cErrWarReport .Import1cErrWarReportElement .WarErrTextId {
            color: red;
            font-weight: bold;
        }
        .Import1cErrWarReport .Import1cErrWarReportElement .WarErrTextName {
            color: blue;
            font-weight: bold;
        }
    
        .test {
            height: 30px;
            width: 100%;
            background: #ef7f1a;
            /*display: none;*/
        }
        .test .m_block{
            float: right;
        }
        .content {
            clear: both;
        }
/*        body {
            background: #ef7f1a;
        }*/
/*input[type=radio],
input[type=checkbox] {
	display: none;
}
.FilterType_groupSelect {
    width: 200px;
}*/
    </style>
</head>
<body>
<?php $ROOT->bodyStart();?>
<div class='test'><?php $ROOT->block('test');?></div>
<div class='ShopNavigationPanel'><?php $ROOT->block('ShopNavigationPanel');?></div>
<div class='content'>
<?php 
$ROOT->content();
?>
</div>
<?php $ROOT->bodyEnd();?>
</body>
</html>
