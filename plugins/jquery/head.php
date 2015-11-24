<?php
global $_PARAM;
$query = "select * from `Jquery` where version='".$_PARAM['version']."' and min='".$_PARAM['min']."'";
$mySqlHelper = new MySqlHelper($query);
$data = $mySqlHelper->getDataRow(0);
$insertString = "<script type='text/javascript' src='./plugins/jquery/lib/".$data['fileName']."'></script>";
echo $insertString;
//echo $data['fileName'];
?>
<script type="text/javascript" src="./plugins/jquery/lib/jquery-ui.1.10.4.js"></script>

