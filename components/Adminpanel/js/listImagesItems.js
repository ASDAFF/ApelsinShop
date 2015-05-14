function listImagesItems(id) {    
    var d = $('#'+id).css('display');
    if (d === 'none') {
        $('#'+id).css({"display":"block"});
    } else { 
        $('#'+id).css({"display":"none"});
    }
    return false;
};