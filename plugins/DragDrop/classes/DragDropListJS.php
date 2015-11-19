<?php

/*
 * НЕ ИЗМЕНЯТЬ И НЕ УДАЛЯТЬ АВТОРСКИЕ ПРАВА И ЗАГОЛОВОК ФАЙЛА
 * 
 * Копирайт © 2010-2016, CompuProject и/или дочерние компании.
 * Все права защищены.
 * 
 * CSystem это программное обеспечение предоставленное и разработанное 
 * CompuProject в рамках проекта CSystem без каких либо сторонних изменений.
 * 
 * Распространение, использование исходного кода в любой форме и/или его 
 * модификация разрешается при условии, что выполняются следующие условия:
 * 
 * 1. При распространении исходного кода должно оставатсья указанное выше 
 *    уведомление об авторских правах, этот список условий и последующий 
 *    отказ от гарантий.
 * 
 * 2. При изменении исходного кода должно оставатсья указанное выше 
 *    уведомление об авторских правах, этот список условий, последующий 
 *    отказ от гарантий и пометка о сделанных изменениях.
 * 
 * 3. Распространение и/или изменение исходного кода должно происходить
 *    на условиях Стандартной общественной лицензии GNU в том виде, в каком 
 *    она была опубликована Фондом свободного программного обеспечения;
 *    либо лицензии версии 3, либо (по вашему выбору) любой более поздней
 *    версии. Вы должны были получить копию Стандартной общественной 
 *    лицензии GNU вместе с этой программой. Если это не так, см. 
 *    <http://www.gnu.org/licenses/>.
 * 
 * CSystem распространяется в надежде, что она будет полезной,
 * но БЕЗО ВСЯКИХ ГАРАНТИЙ; даже без неявной гарантии ТОВАРНОГО ВИДА
 * или ПРИГОДНОСТИ ДЛЯ ОПРЕДЕЛЕННЫХ ЦЕЛЕЙ. Подробнее см. в Стандартной
 * общественной лицензии GNU.
 * 
 * НИ ПРИ КАКИХ УСЛОВИЯХ ПРОЕКТ, ЕГО УЧАСТНИКИ ИЛИ CompuProject НЕ 
 * НЕСУТ ОТВЕТСТВЕННОСТИ ЗА КАКИЕ ЛИБО ПРЯМЫЕ, КОСВЕННЫЕ, СЛУЧАЙНЫЕ, 
 * ОСОБЫЕ, ШТРАФНЫЕ ИЛИ КАКИЕ ЛИБО ДРУГИЕ УБЫТКИ (ВКЛЮЧАЯ, НО НЕ 
 * ОГРАНИЧИВАЯСЬ ПРИОБРЕТЕНИЕМ ИЛИ ЗАМЕНОЙ ТОВАРОВ И УСЛУГ; ПОТЕРЕЙ 
 * ДАННЫХ ИЛИ ПРИБЫЛИ; ПРИОСТАНОВЛЕНИЕ БИЗНЕСА). 
 * 
 * ИСПОЛЬЗОВАНИЕ ДАННОГО ИСХОДНОГО КОДА ОЗНАЧАЕТ, ЧТО ВЫ БЫЛИ ОЗНАКОЛМЛЕНЫ
 * СО ВСЕМИ ПРАВАМИ, СТАНДАРТАМИ И УСЛОВИЯМИ, УКАЗАННЫМИ ВЫШЕ, СОГЛАСНЫ С НИМИ
 * И ОБЯЗУЕТЕСЬ ИХ СОБЛЮДАТЬ.
 * 
 * ЕСЛИ ВЫ НЕ СОГЛАСНЫ С ВЫШЕУКАЗАННЫМИ ПРАВАМИ, СТАНДАРТАМИ И УСЛОВИЯМИ, 
 * ТО ВЫ МОЖЕТЕ ОТКАЗАТЬСЯ ОТ ИСПОЛЬЗОВАНИЯ ДАННОГО ИСХОДНОГО КОДА.
 * 
 * Данная копия CSystem используется для проекта Apelsin SHOP
 * 
 */

/**
 * Description of DragDropListJS
 *
 * @author Maxim Zaytsev
 * @copyright © 2010-2016, CompuProjec
 * @created 19.11.2015 9:30:31
 */
class DragDropListJS {
    
    private $list = "";
    private $listElements = "";
    private $listJSID = "";
    private $listElementsJSID = "";
    private $listClass = "";
    
    public function __construct($listClass = "") {
        $this->updateId();
        $this->listClass = $listClass;
        $this->clearList();
    }
    
    public function getList() {
        $this->updateId ();
        $this->generateList ();
        return $this->list;
    }
    
    public function get() {
        echo $this->getList();
    }

    public function addListElement ($content, $cssClass = "") {
        $this->listElements[] = array('content'=>$content, 'css'=>$cssClass);
    }
    
    private function updateId() {
        $this->listJSID = ID_GENERATOR::generateID(9, "DragDropList");
        $this->listElementsJSID = ID_GENERATOR::generateID(9, "DragDropListElement");
    }
    
    private function clearList() {
        $this->listElements = array();
    }

    private function generateList () {
        $this->list = "";
        $this->list .= "<div class='DragDropList ".$this->listJSID." ".$this->listClass."'>";
        foreach ($this->listElements as $element) {
            $this->list .= "<div class='DragDropListElement ".$this->listElementsJSID." ".$element['content']."'>";
            $this->list .= $element['content'];
            $this->list .= "</div>";
        }
        $this->list .= "</div>";
        $this->list .= $this->generateJavaScript();
    }
    
    private function generateJavaScript() {
        $out = '<script type="text/javascript">';
        $out .= "docReady( function() {";
        $out .= "    var slidesElem = document.querySelector('.DragDropList.".$this->listJSID."');";
        $out .= "    var slideSize = getSize( document.querySelector('.DragDropListElement.".$this->listElementsJSID."') );";
        $out .= "    var pckry = new Packery( slidesElem, {";
        $out .= "        rowHeight: slideSize.outerHeight";
        $out .= "    });";
        $out .= "    var itemElems = pckry.getItemElements();";
        $out .= "    for ( var i=0, len = itemElems.length; i < len; i++ ) {";
        $out .= "        var elem = itemElems[i];";
        $out .= "        var draggie = new Draggabilly( elem, {";
        $out .= "          axis: 'y'";
        $out .= "        });";
        $out .= "        pckry.bindDraggabillyEvents( draggie );";
        $out .= "    }";
        $out .= "    pckry.on( 'dragItemPositioned', function( _pckry, draggedItem ) {";
        $out .= "        var index = pckry.items.indexOf( draggedItem );";
        $out .= "        var nextItem = pckry.items[ index + 1 ];";
        $out .= "        if ( nextItem ) {";
        $out .= "            slidesElem.insertBefore( draggedItem.element, nextItem.element );";
        $out .= "        } else {";
        $out .= "            slidesElem.appendChild( draggedItem.element );";
        $out .= "        }";
        $out .= "    });";
        $out .= "});";
        $out .= '</script>';
        return $out;
    }
}
