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