<?php
session_start();
session_destroy();
if(isset($_GET['backURL'])) {
    header('Location: '.$_GET['backURL']);
} else {
    header('Location: ./');
}
?>
