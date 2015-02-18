  <script type="text/javascript">
    /**
    * Функция Скрывает/Показывает блок 
    **/
//    function showHideChildMenu(element_id) {
//        if (document.getElementById(element_id)) { 
//            var obj = document.getElementById(element_id); 
//            if (obj.style.display != "block") { 
//                obj.style.display = "block";
//            }
//            else obj.style.display = "none";
//        }
//        else alert("Элемент с id: " + element_id + " не найден!"); 
//    }   
    
    function showChildMenu(element_id) {
        param=document.getElementById(element_id);
        param.style.display = "block";
    }     
    
    function hideChildMenu(element_id) {
        param=document.getElementById(element_id);
        param.style.display = "none";
    }    
</script>