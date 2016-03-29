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
 * Генерирование общей страницы редактирования товаров
 *
 * @author Olga Rjabchikova
 * @copyright © 2010-2016, CompuProjec
 * @created 05.02.2016 12:28:39
 */
class AP_ListPanelNewItems {

    private $html;
    private $data;
    private $urlHelper;

    public function __construct($data) {
        $this->data = $data;
        $this->urlHelper = new UrlHelper();
    }

    public function getHtml() {
        $this->generationUI();
        return $this->html;
    }

    private function generationUI() {
        global $_URL_PARAMS;
        $params = $_URL_PARAMS['params'];
        $params[4] = 'workingWithShopNewItemsHandlerData';
        $this->html = '<div class="shopItemsNewEditWrapper">';
        $this->html .= '<form name="AP_FormShopItemsNew" id="AP_FormShopItemsNew" action="' . $this->urlHelper->chengeParams($params) . '" method="POST">';
        $this->html .= '<input type="hidden" name="shopItemsNewItemGroup" value="' . $this->data['groupId'] . '">';
        $panels[0] = new AP_WorkingWithShopItemsNewEditName($this->data);
        $panels[1] = new AP_WorkingWithShopItemsNewEditDescription($this->data);
        $panels[2] = new AP_WorkingWithShopItemsNewEditProperty($this->data);
        $panels[3] = new AP_WorkingWithShopItemsNewItemsCards($this->data);
        foreach ($panels as $panel) {
            if ($panel instanceof AP_AbstractPanelEditNewItems) {
                $this->html .= $this->getElementPanel($panel);
            } else {
                $this->html .= '';
            }
        }
        $this->html .= $this->generationJS();
        $this->html .= '<input type=submit name="AP_FormShopItemsNewSubmit" value="Применить">';
        $this->html .= '</form >';
        $this->html .= '</div>'; // ShopItemsNewEditWrapper
        return $this->html;
    }

    private function generationJS() {
        $out = '<script type="text/javascript">
                    $(document).ready(function(){
                        $(".shopItemsNewEditWrapper .shopItemsNewEditTitle").click(function() {
                            var isHide = true;
                            if ($(this).next().css("display") != "none") {
                                isHide = false;
                            }
                            $(".shopItemsNewEditContent").hide(); 
                            $(".shopItemsNewItemsCardsBlockItemCardWrapper").hide();
                            if (isHide) {
                                $(this).next().show();
                                $(this).addClass("active");
                            } else {
                                $(this).removeClass("active");
                            }
                            $(this).siblings(".shopItemsNewEditTitle").removeClass("active");
                        });
                    });
                </script>';
        return $out;
    }

    private function getElementPanel(AP_AbstractPanelEditNewItems $panel) {
        $html = '<div class="shopItemsNewEditTitle">';
        $html .= $panel->getNamePanel();
        $html .= '</div>';
        $html .= '<div class="shopItemsNewEditContent">';
        $html .= $panel->getContentPanel();
        $html .= '</div>';
        return $html;
    }

}
