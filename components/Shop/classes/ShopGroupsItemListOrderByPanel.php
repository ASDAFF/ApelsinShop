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
 * Description of ShopGroupsItemListOrderByPanel
 *
 * @author Maxim Zaitsev
 * @copyright © 2010-2016, CompuProjec
 * @created 18.02.2016 15:23:26
 */
class ShopGroupsItemListOrderByPanel {
    
    private $ui = "";
    private $javaScript = "";
    private $groupID;
    private $orderBy;
    private $orderByColumns = array();

    public function __construct($groupID) {
        $this->groupID = $groupID;
        $this->orderBy = ShopPropertiesFilterSerchArray::getOrderBy($this->groupID);
        if(empty($this->orderBy)) {
            $this->orderBy['COLUMN'] = ShopPropertiesFilterSerchArray::ORDER_BY_COLUMN;
            $this->orderBy['ASC_DESC'] = ShopPropertiesFilterSerchArray::ORDER_BY_ASC_DESC;
        }
        $this->setOrderByColumns();
        $this->generateJS();
        $this->generateHtml();
    }
    
    private function setOrderByColumns() {
        $this->addOrderByColumns(ShopPropertiesFilterSerchArray::ORDER_BY_COLUMN, ShopPropertiesFilterSerchArray::ORDER_BY_COLUMN);
        $this->addOrderByColumns('itemName', 'Имя');
        $this->addOrderByColumns('priceValue', 'Цена');
        $this->addOrderByColumns('totalAmount', 'Количество');
    }
    
    private function addOrderByColumns($name, $text) {
        $this->orderByColumns[$name]['name'] = $name;
        $this->orderByColumns[$name]['text'] = $text;
    }
    
    
    private function generateElement($column) {
        $out = '';
        $className = "ShopGroupsItemListOrderByPanelElement";
        if($column['name'] == $this->orderBy['COLUMN']) {
            $className .= " OrderByThis " . $this->orderBy['ASC_DESC'];
        }
        $out .= '<li class="'.$className.'" columnName="'.$column['name'].'">';
        $out .= '<div class="ShopGroupsItemListOrderByPanelElementText">'.$column['text'].'</div>';
        $out .= '<div class="ShopGroupsItemListOrderByPanelElementIcon_ASC"></div>';
        $out .= '<div class="ShopGroupsItemListOrderByPanelElementIcon_DESC"></div>';
        $out .= '<div class="clear"></div>';
        $out .= '</li>';
        return $out;
    }
    
    private function generateHtml() {
        $this->ui = '';
        $this->ui .= '<div class="ShopGroupsItemListOrderByPanelWrapper">';
        $this->ui .= '<ul class="ShopGroupsItemListOrderByPanel">';
        foreach ($this->orderByColumns as $column) {
            $this->ui .= $this->generateElement($column);
        }
        $this->ui .= '</ul>';
        $this->ui .= '<div class="clear"></div>';
        $this->ui .= '</div>';
        $this->ui .= $this->javaScript;
    }
    private function generateJS() {
        $this->javaScript = '<script type="text/javascript">
            jQuery(document).ready(function() {
                jQuery(".ShopGroupsItemListOrderByPanelElement").click(function(){
                    if($(this).hasClass("OrderByThis")) {
                        changeOrderByThis_ASC_DESC(this);
                    } else {
                        changeOrderByThisObject(this);
                    }
                });
                function changeOrderByThisObject(obj) {
                    if($(".ShopGroupsItemListOrderByPanelElement.OrderByThis").hasClass("ASC")) {
                        $(".ShopGroupsItemListOrderByPanelElement.OrderByThis").removeClass("ASC");
                    }
                    if($(".ShopGroupsItemListOrderByPanelElement.OrderByThis").hasClass("DESC")) {
                        $(".ShopGroupsItemListOrderByPanelElement.OrderByThis").removeClass("DESC");
                    }
                    $(".ShopGroupsItemListOrderByPanelElement.OrderByThis").removeClass("OrderByThis");
                    $(obj).addClass("OrderByThis");
                    $(obj).addClass("ASC");
                    changeOrderByForGroup($(obj).attr("columnName"), "ASC");
                }
                function changeOrderByThis_ASC_DESC(obj) {
                    if($(obj).hasClass("ASC")) {
                        $(obj).removeClass("ASC");
                        $(obj).addClass("DESC");
                        changeOrderByForGroup($(obj).attr("columnName"), "DESC");
                    } else {
                        $(obj).removeClass("DESC");
                        $(obj).addClass("ASC");
                        changeOrderByForGroup($(obj).attr("columnName"), "ASC");
                    }
                }
                function changeOrderByForGroup(column, ASC_DESC) {
                    var group = "'.$this->groupID.'";
                    $.ajax({
                        type: "POST",
                        url: "./components/Shop/script/ShopGroupsItemListOrderByScript.php",
                        data: {
                                "group":group,
                                "column":column,
                                "asc_desc":ASC_DESC
                            },
                        cache: false,
                        success: function(result) {
                            getShopItemsList();
                       }
                    });
                }
            });
        </script>';
    }
    
    
    public function getPanel() {
        return $this->ui;
    }
}
