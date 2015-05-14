<?php
header("Content-type: text/html; charset=UTF-8");
if (isset($_POST['item']) && $_POST['item'] != "" && $_POST['item'] != null) {
    include_once '../classes/ShowHideItem.php';
    if (isset($_POST['shown']) && $_POST['shown'] != "" && $_POST['shown'] != null) {
        $action = new ShowHideItem($_POST['item'], $_POST['shown']);
        echo $action->getData();
    } elseif (isset($_POST['shownGroup']) && $_POST['shownGroup'] != "" && $_POST['shownGroup'] != null) {
        $action = new ShowHideGroup($_POST['item'], $_POST['shownGroup']);
        echo $action->getData();
    } elseif (isset($_POST['showInHierarchy']) && $_POST['showInHierarchy'] != "" && $_POST['showInHierarchy'] != null) {
        $action = new ShowHideInHierarchy($_POST['item'], $_POST['showInHierarchy']);
        echo $action->getData();
    }
}
