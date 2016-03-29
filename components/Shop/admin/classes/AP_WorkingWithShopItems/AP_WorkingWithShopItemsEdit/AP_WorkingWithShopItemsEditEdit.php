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
 * Description of AP_WorkingWithShopItemsEditEdit
 *
 * @author Olga Rjabchikova
 * @copyright © 2010-2016, CompuProjec
 * @created 15.03.2016 12:17:50
 */
class AP_WorkingWithShopItemsEditEdit {

    private $html;
    private $items;
    private $dataForEdit;
    private $params;
    private $urlHelper;

    public function __construct($group) {
        global $_URL_PARAMS;
        $this->params = $_URL_PARAMS['params'];
        $this->urlHelper = new UrlHelper();
        $this->dataForEdit['groupId'] = $group;
        if (isset($_POST['AP_SubmitWorkingWithShopItemsEditSelectItemsEditForm'])) {
            if (isset($_POST['editItem']) && !empty($_POST['editItem'])) {
                $this->items = $_POST['editItem'];
                $this->goEdit();
            } else {
                $this->html = "В указанном каталоге нет данных для редактирования. Выберите другой.";
                $this->html .= $this->getButtonBack();
            }
        } else {
            // РЕШИЛИ ОСТАВИТЬ ПОКА ТАК, НАПОМНИТЬ МАКСИМУ
            $this->html = "Объем данных для обработки превышен. Выберите только необходимые товары для редактирования.";
        }
    }

    /**
     * Генерирование кнопки
     * @return string
     */
    private function getButtonBack() {
        $params[0] = $this->params[0];
        $params[1] = $this->params[1];
        $params[2] = $this->params[2];
        $params[3] = $this->params[3];
        $html = '<a href="' . $this->urlHelper->chengeParams($params) . '"><input type="button" class="addGroupCatalogReportButtonBack" id="addGroupCatalogReportButtonBack" value="Назад"></a>';
        return $html;
    }

    private function getDataForEdit($data) {
        foreach ($data as $unit) {
            $this->dataForEdit['itemId'][] = $unit;
        }
    }

    private function goEdit() {
        $this->getDataForEdit($this->items);
        $edit = new AP_ListPanelNewItems($this->dataForEdit);
        echo $edit->getHtml();
    }

    public function getHtml() {
        return $this->html;
    }

}
