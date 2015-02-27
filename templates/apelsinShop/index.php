<!DOCTYPE html>
<?php global $ROOT;?>
<html>
<head>
    <style>
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
    </style>
    <?php $ROOT->head();?>
    <link rel="stylesheet" href="<?php $ROOT->templatePath();?>css/AdminPanel.css" type="text/css" />
</head>
<body>
<?php $ROOT->bodyStart();?>
<div class='test'><?php $ROOT->block('test');?></div>
<div class='content'>
<?php 
$ROOT->content();
?>
</div>
<?php $ROOT->bodyEnd();?>
</body>
</html>
