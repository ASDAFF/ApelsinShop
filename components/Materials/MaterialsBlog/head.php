<?php
include_once './components/Materials/classes/MaterialsBlog.php';
global $MATERIAL_BLOG;
$MATERIAL_BLOG = new MaterialsBlog();
?>

<link rel="stylesheet" href="./components/Materials/css/materials.css" type="text/css" />
<?php
if($MATERIAL_BLOG->isList()) {
    echo '<link rel="stylesheet" href="./components/Materials/css/materialsBlog.css" type="text/css" />';
}
?>
<script>
function show_hide(idName,arr) {
    if(document.getElementById(idName).style.display=='none') {
        document.getElementById(idName).style.display = '';
    } else {
        document.getElementById(idName).style.display = 'none';
    }
    for(var i=0; i<arr.length; i++) {
        document.getElementById(arr[i]).style.display = 'none';
    }
    return true;
}
</script>