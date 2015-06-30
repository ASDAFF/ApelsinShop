<script type="text/javascript">
jQuery(document).ready(function() {

    // обработка поля поиска (клавиатура)
    $(".searchModuleFormSearch").keyup(function() {
        var chars = $(this).val();
        if (chars !== "") {
            $.ajax({
                type: "POST",
                url: "./modules/Search/script/shopSearchItem.php",
                data: {chars:chars},
                cache: false,
                success: function(result) {
                    $("#searchModuleResult").html(result).show();
                }
            });
        } else {
            $("#searchModuleResult").hide();
        }
    return false;
    });

    // обработка поля поиска (мышь)
    $(".searchModuleFormSearch").mouseup(function() {
        var chars = $(this).val();
        if (chars !== "") {
            $.ajax({
                type: "POST",
                url: "./modules/Search/script/shopSearchItem.php",
                data: {chars:chars},
                cache: false,
                success: function(result) {
                    $("#searchModuleResult").html(result).show();
                }
            });
        } else {
            $("#searchModuleResult").hide();
        }
    return false;
    });

    // скрыть searchModuleResult по клику вне его
    $(document).click(function (event) {
        var container = $(".searchModuleResult");
        if (container.has(event.target).length === 0) {
            $("#searchModuleResult").hide();
        }
    });

    // обработка кнопки поиска
    $(".searchModuleFormSubmit").click(function() {
        var data = $('input').val();
        $.ajax({
            type: "POST",
            url: "./modules/Search/script/searchOneItem.php",
            data: {data:data},
            cache: false,
                success: function(result) {
                    $("#searchModuleResult").html(result).show();
                    $("form.ShopPropertiesFilterForm .FilterType_text").val(data);
                    getShopItemsList();
                }
        });
        return false;
    });
});
</script>
