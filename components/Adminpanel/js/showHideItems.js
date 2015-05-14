function setShowHideItems(id, item) { 
    var shown;
    var action = $("#actionShopImage" + id).attr("title");
    if (action === "Показывать") {
        $("#actionShopImage"+id).removeClass("showShopItems");
        $("#actionShopImage" + id).addClass("hideShopItems").text('Не показывать').attr("title",'Не показывать');
        shown = '0';
    } else {
        $("#actionShopImage"+id).removeClass("hideShopItems");
        $("#actionShopImage" + id).addClass("showShopItems").text('Показывать').attr("title",'Показывать');
        shown = '1';
    }

    $.ajax({
        type: "POST",
        url: "./components/Shop/admin/script/setShowHideItems.php",
        data: { "item":item,
            "shown":shown },
        cache: false
    });
    return false;
};

function setShowHideGroup(id, item) { 
    var shownGroup;
    var action = $("#actionShopGroup" + id).attr("title");
    if (action === "Показывать на сайте") {
        $("#actionShopGroup"+id).removeClass("showShopItems");
        $("#actionShopGroup" + id).addClass("hideShopItems").text('Не показывать на сайте').attr("title",'Не показывать на сайте');
        shownGroup = '0';
    } else {
        $("#actionShopGroup"+id).removeClass("hideShopItems");
        $("#actionShopGroup" + id).addClass("showShopItems").text('Показывать на сайте').attr("title",'Показывать на сайте');
        shownGroup = '1';
    }

    $.ajax({
        type: "POST",
        url: "./components/Shop/admin/script/setShowHideItems.php",
        data: { "item":item,
            "shownGroup":shownGroup },
        cache: false
    });
    return false;
};

function setShowHideGroupInHierarchy(id, item) { 
    var showInHierarchy;
    var action = $("#actionShopGroupInHierarchy" + id).attr("title");
    if (action === "Показывать в иерархии") {
        $("#actionShopGroupInHierarchy"+id).removeClass("showShopItems");
        $("#actionShopGroupInHierarchy" + id).addClass("hideShopItems").text('Не показывать в иерархии').attr("title",'Не показывать в иерархии');
        showInHierarchy = '0';
    } else {
        $("#actionShopGroupInHierarchy"+id).removeClass("hideShopItems");
        $("#actionShopGroupInHierarchy" + id).addClass("showShopItems").text('Показывать в иерархии').attr("title",'Показывать в иерархии');
        showInHierarchy = '1';
    }

    $.ajax({
        type: "POST",
        url: "./components/Shop/admin/script/setShowHideItems.php",
        data: { "item":item,
            "showInHierarchy":showInHierarchy },
        cache: false
    });
    return false;
};