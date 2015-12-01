<?php
echo '<div id="TestListWrapper">';
$list1 = new InteractiveListsPlugin('TestListBlock','TestList FerstList');
$list1->addListElement("Тип", "FerstListElement");
$list1->addListElement("Вид", "FerstListElement");
$list1->addListElement("Вес", "FerstListElement");
$list1->setOption_connectWith('#'.$list1->getListJSID());
$list1->setOption_containment('#'.$list1->getListJSID());
$list1->setOption_placeholder('PlaceholderClass');
$list1->setOption_dropOnEmpty('true');
$list1->setOption_opacity('0.6');
$list1->setOption_cursor('pointer');
$list1->setOption_revert('true');
$list1->addEvent_start("$('#trash-for-app').css('display', 'block');");
$list1->addEvent_stop("$('#trash-for-app').css('display', 'none');");
$listID1 = $list1->getListJSID();
$list1->get();
$list1->setListCssClass('TestList SecondList');
$list1->clearList();
$list1->updateId();
$list1->addListElement("Класс прочности <span class='del'>x</span> <span class='add'>add</span>", "SecondElement");
$list1->addListElement("Внутренний диаметр <span class='del'>x</span> <span class='add'>add</span>", "SecondElement");
$list1->addListElement("Теплопроводность <span class='del'>x</span> <span class='add'>add</span>", "SecondElement");
$list1->addListElement("Электропроводность <span class='del'>x</span> <span class='add'>add</span>", "SecondElement");
$list1->addListElement("Внешний диаметр <span class='del'>x</span> <span class='add'>add</span>", "SecondElement");
$list1->setOption_containment('#TestListWrapper');
$list1->searchBox();
$listID2 = $list1->getListJSID();
$list1->get();
echo '</div>';
// события на кнопки
echo '<script type="text/javascript">';
echo '    $(function() {';
echo '        $( "#'.$listID2.' span.del" ).click(function(i,elem) {';
echo '            $( "#'.$listID2.'" ).prepend($(this).parent());';
echo '        });';
echo '    });';
echo '</script>';
echo '<script type="text/javascript">';
echo '    $(function() {';
echo '        $( "#'.$listID2.' span.add" ).click(function(i,elem) {';
echo '            $( "#'.$listID1.'" ).prepend($(this).parent());';
echo '        });';
echo '    });';
echo '</script>';

// магазин
$shopMainClass = new ShopMainClass();
$shopMainClass->get();