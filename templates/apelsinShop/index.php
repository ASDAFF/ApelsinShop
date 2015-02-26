<!DOCTYPE html>
<?php global $ROOT;?>
<html>
<head>
    <style>
        .test {
            height: 200px;
            width: 100%;
            background: blue;
            display: none;
        }
        .test .m_block{
            float: right;
        }
        .content {
            clear: both;
        }
    </style>
    <?php $ROOT->head();?>
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
