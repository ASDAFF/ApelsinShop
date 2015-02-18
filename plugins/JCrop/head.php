<script src="./plugins/JCrop/js/jquery.Jcrop.js"></script>
<link rel="stylesheet" href="./plugins/JCrop/css/jquery.Jcrop.css" type="text/css" />
<script src="./plugins/JCrop/js/jcrop_main.js"></script>

<script type="text/javascript">
$(function(){
    $('#cropbox1').Jcrop({
        aspectRatio:  0,
        onChange: updateCoords,
        onSelect: updateCoords,
        bgColor: 'black',
        bgOpacity: .2,
        sideHandles: true,
        // addClass: 'jcrop_custom',
        minSize: [ 200, 200 ],
        maxSize: [600, 600]
    });
});

function updateCoords(c)
{
    $('#x').val(c.x);
    $('#y').val(c.y);
    $('#w').val(c.w);
    $('#h').val(c.h);

    var rx = 200 / c.w; // 200 - размер окна предварительного просмотра
    var ry = 200 / c.h;
    $('#preview').css({
        width: Math.round(rx * 800) + 'px',
        height: Math.round(ry * 600) + 'px',
        marginLeft: '-' + Math.round(rx * c.x) + 'px',
        marginTop: '-' + Math.round(ry * c.y) + 'px'
    });
};

function checkCoords()
{
    if (parseInt($('#w').val())) return true;
    alert('Пожалуйста, выберите область для обрезки.');
    return false;
};
</script>