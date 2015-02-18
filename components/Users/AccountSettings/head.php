<script type="text/javascript">
$(function(){
    $('#AccountAvatarImageJcrop').Jcrop({ 
        setSelect: [ 0, 0, 200, 200 ],
        aspectRatio:  1,
        onChange: updateCoords,
        onSelect: updateCoords,
        bgColor: 'black',
        bgOpacity: .2,
        sideHandles: true,
//        addClass: 'jcrop_custom',
        minSize: [ 200, 200 ],
        maxSize: [500, 500]
    });

});
function updateCoords(c)
{
    $('#x').val(c.x);
    $('#y').val(c.y);
    $('#w').val(c.w);
    $('#h').val(c.h);

    var rx = 200 / c.w;
    var ry = 200 / c.h;
    var rh = $('#AccountAvatarImageJcrop').first().height();
    var rw = $('#AccountAvatarImageJcrop').first().width();
    $('#avprev200').css({
        width: Math.round(rx * rh) + 'px',
        height: Math.round(ry * rw) + 'px',
        marginLeft: '-' + Math.round(rx * c.x) + 'px',
        marginTop: '-' + Math.round(ry * c.y) + 'px'
    });
   
    rx = 50 / c.w;
    ry = 50 / c.h;
    rh = $('#AccountAvatarImageJcrop').first().height();
    rw = $('#AccountAvatarImageJcrop').first().width();
    $('#avprev50').css({
        width: Math.round(rx * rh) + 'px',
        height: Math.round(ry * rw) + 'px',
        marginLeft: '-' + Math.round(rx * c.x) + 'px',
        marginTop: '-' + Math.round(ry * c.y) + 'px'
    }); 
   
    rx = 30 / c.w;
    ry = 30 / c.h;
    rh = $('#AccountAvatarImageJcrop').first().height();
    rw = $('#AccountAvatarImageJcrop').first().width();
    $('#avprev30').css({
        width: Math.round(rx * rh) + 'px',
        height: Math.round(ry * rw) + 'px',
        marginLeft: '-' + Math.round(rx * c.x) + 'px',
        marginTop: '-' + Math.round(ry * c.y) + 'px'
    }); 
    
};
  
function changeImageBox_show() {
    document.getElementById('changeImageBox').style.display = '';
    return true;
}
function changeImageBox_hide() {
    document.getElementById('changeImageBox').style.display = 'none';
    return true;
}
</script>