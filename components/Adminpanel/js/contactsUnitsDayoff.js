function changeContactsUnitsDayoff(idName) {    
    var d = $('#'+idName).css('display');
    if (d === 'none') {
        $('#'+idName).css({"display":"block"});
        $('#'+idName+'H_s').val("");
        $('#'+idName+'H_e').val("");
        $('#'+idName+'M_s').val("");
        $('#'+idName+'M_e').val("");
    } else { 
        $('#'+idName).css({"display":"none"});
        $('#'+idName+'H_s').val("");
        $('#'+idName+'H_e').val("");
        $('#'+idName+'M_s').val("");
        $('#'+idName+'M_e').val("");
    }
    return false;
};