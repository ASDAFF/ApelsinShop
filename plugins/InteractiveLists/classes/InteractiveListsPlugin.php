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
 * Description of InteractiveLists
 *
 * @author Maxim Zaytsev
 * @copyright © 2010-2016, CompuProjec
 * @created 01.12.2015 9:05:38
 */
class InteractiveListsPlugin {

    private $list = "";
    private $listElements = array();
    private $blockCssClass = "";
    private $listCssClass = "";
    private $serchJSID;
    private $listJSID;
    private $listBlockJSID;
    private $serchShow = false;
    private $serchTop = true;
    private $serchCss = '';
    private $options = array();
    private $events = array();

    public function __construct($blockCssClass = "", $listCssClass = "") {
        $this->updateId();
        $this->blockCssClass = $blockCssClass;
        $this->listCssClass = $listCssClass;
    }

    public function clearList() {
        $this->listElements = array();
    }

    public function setBlockCssClass($blockCssClass) {
        $this->blockCssClass = $blockCssClass;
    }

    public function setListCssClass($listCssClass) {
        $this->listCssClass = $listCssClass;
    }

    public function getList() {
        $this->generateList();
        return $this->list;
    }

    public function get() {
        echo $this->getList();
    }

    public function getListBlockJSID() {
        return $this->listBlockJSID;
    }

    public function getSerchJSID() {
        return $this->serchJSID;
    }

    public function getListJSID() {
        return $this->listJSID;
    }

    public function updateId() {
        $this->listBlockJSID = ID_GENERATOR::generateID("SortsListBlock");
        $this->serchJSID = ID_GENERATOR::generateID("Serch");
        $this->listJSID = ID_GENERATOR::generateID("SortsList");
        foreach (array_keys($this->listElements) as $key) {
            $this->listElements[$key]['id'] = self::genereteElementId();
        }
    }

    public static function genereteElementId() {
        return ID_GENERATOR::generateID("SortsListElement");
    }

    public function addListElement($content, $cssClass = "") {
        $this->listElements[] = array(
            'id' => ID_GENERATOR::generateID("SortsListElement"),
            'content' => $content,
            'css' => $cssClass);
    }

    public function searchBox($show = true, $showTop = true, $cssClass = "") {
        $this->serchShow = $show;
        $this->serchTop = $showTop;
        $this->serchCss = $cssClass;
    }

    /**
     * Указывает элемент, к которому будет привязываться элемент помощник (элемент, который отображается во время перетаскивания). 
     * Значение по умолчанию: 'parent'.
     * @param type $value
     */
    public function setOption_appendTo($value = null) {
        $this->setOption('appendTo', $value);
    }

    /**
     * Позволяет задать ось, по которой можно перетаскивать элемент. 
     * Возможные значения: 'x' (элемент можно будет перетаскивать только по горизонтали) и 'y' (элемент можно будет перетаскивать только по вертикали). 
     * Значение по умолчанию: false. 
     * @param type $value
     */
    public function setOption_axis($value = null) {
        $this->setOption('axis', $value);
    }

    /**
     * Указывает элемент потомок сортируемого элемента, нажав на который нельзя перетащить сортируемый элемент. 
     * Значение по умолчанию: :input,option. 
     * @param type $value
     */
    public function setOption_cancel($value = null) {
        $this->setOption('cancel', $value);
    }

    /**
     * Позволяет связать группы сортируемых элементов. Элементы из одной связанной группы могут быть перенесены в другую и наоборот. 
     * Значение по умолчанию: false. 
     * @param type $value
     */
    public function setOption_connectWith($value = null) {
        $this->setOption('connectWith', $value);
    }

    /**
     * Ограничивает перетаскивание элемента границами указанного элемента. Возможные строковые значения: 'parent', 'window', 'document'. 
     * Значение по умолчанию: false. 
     * @param type $value
     */
    public function setOption_containment($value = null) {
        $this->setOption('containment', $value);
    }

    /**
     * Позволяет задать вид курсора мыши во время перетаскивания. 
     * Значение по умолчанию: auto. 
     * @param type $value
     */
    public function setOption_cursor($value = null) {
        $this->setOption('cursor', $value);
    }

    /**
     * Задает смещение положения элемента помощника (элемент, который отображается во время перетаскивания объекта) относительно курсора мыши в пикселях. 
     * Задается с помощью следующих свойств: left, right, top, bottom (смещение влево, вправо, вверх и вниз). 
     * Значение по умолчанию: auto.
     * @param type $value
     */
    public function setOption_cursorAt($top = null, $right = null, $bottom = null, $left = null) {
        if ($top != null || $right != null || $bottom != null || $left != null) {
            $value = "{";
            if ($top != null) {
                $value .= $top . ',';
            }
            if ($right != null) {
                $value .= $right . ',';
            }
            if ($bottom != null) {
                $value .= $bottom . ',';
            }
            if ($left != null) {
                $value .= $left . ',';
            }
            $value = mb_substr($value, 0, mb_strlen($value) - 1);
            $value .= "}";
        } else {
            $value = null;
        }
        $this->setOption('cursorAt', $value, false);
    }

    /**
     * Устанавливает задержку в миллисекундах перед тем, как элемент начнет перетаскиваться (может использоваться для предотвращения перетаскивания при случайном щелчке на элементе).  
     * Значение по умолчанию: 0. 
     * @param type $value
     */
    public function setOption_delay($value = null) {
        $this->setOption('delay', $value, false);
    }

    /**
     * Устанавливает количество пикселей, на которые должен быть перетащен элемент, прежде чем он начнет изменять свое местоположения (может использоваться для предотвращения перетаскивания при случайном щелчке на элементе). 
     * Значение по умолчанию: 1. 
     * @param type $value
     */
    public function setOption_distance($value = null) {
        $this->setOption('distance', $value, false);
    }

    /**
     * Если имеет значение true элементы из связанной группы не могут быть перемещены в данную если она пуста. 
     * Значение по умолчанию: false. 
     * @param type $value
     */
    public function setOption_dropOnEmpty($value = null) {
        $this->setOption('dropOnEmpty', $value, false);
    }

    /**
     * Устанавливает величину сетки, по которой будет перемещаться элемент помощник во время перетаскивания. 
     * С помощью координат x и y Вы можете установить размеры сетки. 
     * Значение по умолчанию: false. 
     * @param type $value
     */
    public function setOption_grid($x = null, $y = null) {
        if ($x != null && $y != null) {
            $value = "[" . $x . "," . $y . "]";
        } else {
            $value = null;
        }
        $this->setOption('grid', $value, false);
    }

    /**
     * Указывает элемент, при щелчке на который начнется перетаскивание. 
     * Значение по умолчанию: false. 
     * @param type $value
     */
    public function setOption_handle($value = null) {
        $this->setOption('handle', $value);
    }

    /**
     * Устанавливает вид элемента помощника (элемент, который отображается во время перетаскивания). 
     * Возможные значения: 
     *      'original' (сам элемент будет отображаться в качестве помощника), 
     *      'clone' ( будет отображена копия перетаскиваемого элемента), 
     *      функция (функция должна возвращать DOM элемент, который будет отображаться в качестве помощника). 
     * Значение по умолчанию: original. 
     * @param type $value
     */
    public function setOption_helper($value = null) {
        $this->setOption('helper', $value);
    }

    /**
     * Указывает какие элементы в группе могут быть отсортированы. 
     * Значение по умолчанию: > * (все элементы в выбранной группе). . 
     * @param type $value
     */
    public function setOption_items($value = null) {
        $this->setOption('items', $value);
    }

    /**
     * Устанавливает прозрачность элемента помощника (элемент, который отображается во время перетаскивания). 
     * Значение по умолчанию: false. 
     * @param type $value
     */
    public function setOption_opacity($value = null) {
        $this->setOption('opacity', $value, false);
    }

    /**
     * Указывает класс, с помощью которого Вы можете оформить заполнитель (место куда будет помещен сортируемый элемент). 
     * Значение по умолчанию: false. 
     * @param type $value
     */
    public function setOption_placeholder($value = null) {
        $this->setOption('placeholder', $value);
    }

    /**
     * Если имеет значение true перетаскиваемый элемент будет анимированно возвращаться (перемещаться) на свою начальную (новую) позицию при завершении перетаскивания. 
     * Значение по умолчанию: false. 
     * @param type $value
     */
    public function setOption_revert($value = null) {
        $this->setOption('revert', $value);
    }

    /**
     * Определяет функцию, код которой будет выполнен, когда группа сортируемых элементов будет создана.
     * @param type $js
     */
    public function addEvent_create($js = null) {
        $this->addEvent('create', $js);
    }

    /**
     * Определяет функцию, код которой будет выполнен, когда начнется сортировка.
     * @param type $js
     */
    public function addEvent_start($js = null) {
        $this->addEvent('start', $js);
    }

    /**
     * Определяет функцию, код которой будет выполнен во время сортировки.
     * @param type $js
     */
    public function addEvent_sort($js = null) {
        $this->addEvent('sort', $js);
    }

    /**
     * Определяет функцию, код которой будет выполнен во время сортировки, но только если положение элементов в группе изменится.
     * @param type $js
     */
    public function addEvent_change($js = null) {
        $this->addEvent('change', $js);
    }

    /**
     * Определяет функцию, код которой будет выполнен, когда сортировка завершиться.
     * @param type $js
     */
    public function addEvent_stop($js = null) {
        $this->addEvent('stop', $js);
    }

    /**
     * Определяет функцию, код которой будет выполнен, когда сортировка завершиться при условии, что положение элементов в группе изменится.
     * @param type $js
     */
    public function addEvent_update($js = null) {
        $this->addEvent('update', $js);
    }

    /**
     * Определяет функцию, код которой будет выполнен, когда один из связанный списков сортируемых элементов получит элемент из другого.
     * @param type $js
     */
    public function addEvent_receive($js = null) {
        $this->addEvent('receive', $js);
    }

    private function setOption($key, $value = null, $quoted = true) {
        if ($value !== null && $value !== "") {
            if ($quoted) {
                $value = "'" . $value . "'";
            }
            $this->options[$key] = $value;
        } else if (isset($this->options[$key])) {
            unset($this->options[$key]);
        }
    }

    private function addEvent($event, $js = null) {
        if ($js !== null && $js !== "") {
            $this->events[$event] = $js;
        } else if (isset($this->events[$event])) {
            unset($this->events[$event]);
        }
    }

    private function generateList() {
        $this->list = "<div id='" . $this->listBlockJSID . "' class='InteractiveListsPlugin SortsListBlock " . $this->blockCssClass . "'>";
        if ($this->serchTop) {
            $this->list .= $this->getSearchBox();
        }
        $this->list .= "<ul id='" . $this->listJSID . "' class='SortsList " . $this->listCssClass . "'>";
        foreach ($this->listElements as $element) {
            $this->list .= self::listElementHtml($element['content'], $element['id'], $element['css']);
        }
        $this->list .= "</ul>";
        if (!$this->serchTop) {
            $this->list .= $this->getSearchBox();
        }
        $this->list .= "</div>";
        $this->list .= $this->generateJavaScript();
    }

    public static function listElementHtml($elementContent, $elementId = null, $elementCss = "") {
        if ($elementId == null) {
            $elementId = self::genereteElementId();
        }
        $element = "<li class='SortsListElement " . $elementCss . "' id='" . $elementId . "'>";
        $element .= $elementContent;
        $element .= "</li>";
        return $element;
    }

    private function getSearchBox() {
        if ($this->serchShow) {
            return "<input type='text' id='" . $this->serchJSID . "' class='SortsListSearchBox " . $this->serchCss . "'>";
        }
        return '';
    }

    private function generateJavaScript() {
        $out = '<script type="text/javascript">';
        $out .= "$(function() {";
        if (empty($this->options) && empty($this->events)) {
            $out .= "    $( '#" . $this->listJSID . "' ).sortable();";
        } else {
            $out .= "    $( '#" . $this->listJSID . "' ).sortable({";
            $out .= $this->generateJavaScript_ALL();
            $out .= "    });";
        }
        $out .= "    $( '#" . $this->listJSID . "' ).disableSelection();";
        $out .= "});";
        $out .= $this->generateJavaScript_Serch();
        $out .= '</script>';
        return $out;
    }

    private function generateJavaScript_ALL() {
        $out = '';
        $out .= $this->generateJavaScript_Options();
        $out .= $this->generateJavaScript_Event();
        if (mb_strlen($out) > 1) {
            return mb_substr($out, 0, mb_strlen($out) - 1);
        } else {
            return '';
        }
    }

    private function generateJavaScript_Options() {
        $out = '';
        foreach ($this->options as $option => $optionValue) {
            $out .= $option . ': ' . $optionValue . ',';
        }
        return $out;
    }

    private function generateJavaScript_Event() {
        $out = '';
        foreach ($this->events as $event => $js) {
            $out .= $event . ': function(event,ui){' . $js . '},';
        }
        return $out;
    }

    private function generateJavaScript_Serch() {
        if ($this->serchShow) {
            $out = "$('#" . $this->serchJSID . "').keyup(function() {";
            $out .= "    var value = this.value;";
            $out .= "    $( '#" . $this->listJSID . "' ).children().each(function(i,elem) {";
            $out .= "        var regexp = new RegExp(value,'i');";
            $out .= "        if(regexp.test($(elem).text())) {";
            $out .= "            $(elem).show();";
            $out .= "        } else {";
            $out .= "            $(elem).hide();";
            $out .= "        }";
            $out .= "    });";
            $out .= "});";
            return $out;
        }
        return "";
    }

}
