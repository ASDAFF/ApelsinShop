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
 * Редактирование названия товара
 *
 * @author Olga Rjabchikova
 * @copyright © 2010-2016, CompuProjec
 * @created 29.01.2016 12:06:00
 */
class AP_WorkingWithShopItemsNewEditName extends AP_AbstractPanelEditNewItems {

    public function __construct($data) {
        parent::__construct($data);
        $this->setNamePanel('Редактирование названия');
    }

    public function getContentPanel() {
        $this->html .= '<div class="shopItemsNewEditNameWrapper">';
        foreach ($this->items as $item) {
            $dataItem = $this->getDataItem($item);
            $this->html .= $this->getElement($dataItem);
        }
        $this->html .= $this->generationJS();
        $this->html .= '</div>';
        return $this->html;
    }

    private function getElement($item) {
        $html = '<div class="shopItemsNewEditNameElement">';
        $html .= '<div class="shopItemsNewEditNameInput">';
//                $html .= '<input type="text" class="itemName" itemid="'.$item['id'].'" name="itemName['.$item['id'].']" value="'.htmlspecialchars($item['itemName']).'" id="itemName" maxlength="200" pattern="[A-Za-zА-Яа-я0-9][^@#$%&]{1,200}">';
        $html .= '<input type="text" class="itemName" itemid="' . $item['id'] . '" name="itemName[' . $item['id'] . ']" value="' . trim(htmlspecialchars(strip_tags($item['itemName']))) . '" id="itemName" maxlength="200">';
        $html .= '</div>';
        $html .= '<div class="shopItemsNewEditNameSelectBox">';
        $html .= InputHelper::select("shown[" . $item['id'] . "]", "shown", array(array('value' => "1", 'text' => "shown"), array('value' => "0", 'text' => "hide")), true, $item['shown']);
        $html .= '</div>';
        $html .= '<div class="clear"></div>';
        $html .= '</div>';
        return $html;
    }

    private function getDataItem($id) {
        $query = "SELECT `itemName`, `shown`, `id`  FROM `ShopItems` WHERE `id` = '" . $id . "';";
        $result = $this->SQL_HELPER->select($query, 1);
        return $result;
    }

    private function generationJS() {
        $out = '
            <script type="text/javascript">
            
                $(document).ready(function() { 
                    textNewAjax = {};

                    function changeNameItem() {
                        $(".itemName").change(function() {
                            textNew = $(this).val();
                            id = $(this).attr("itemid");
                            $("#descriptionItemId_" + id).text(textNew);
                            $("#propertyItemId_" + id).text(textNew);
                            $("#itemsCards_" + id).text(textNew);
                            textNewAjax[id] = textNew;
                        });
                    }
                    
                    $(function() {
                        changeNameItem();
                    });
                          
                });  
            </script>
        ';
        return $out;
    }

}
