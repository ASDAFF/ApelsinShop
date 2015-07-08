<?php
/**
 *Генерирует форму для получения инфы о заказчике.
 *
 * @author olga
 */
class ShopOrderForm {

    private $html;
    private $inputHelper;
    private $urlHelper;
    private $orderID;
    private $dir = './resources/Components/Shop/Orders/FilesPDF/';
    private $img = './templates/apelsinShop/img/logoForPDF.jpg';

    public function __construct() {
        $this->inputHelper = new InputHelper();
        $this->urlHelper = new UrlHelper();
        $this->orderID = ShopOrderManagementHelper::getThisOrderID();
        $this->generationForm();
    }

    private function generationForm() {
        $this->html = '<div class="shopOrderFormWrapper">';
        $this->html .= '<div class="shopOrderFormInfo">';
            $this->html .= 'Вы можете оставить контактную информацию и наши менеджеры свяжутся с Вами.';
        $this->html .= '</div>';
        $this->html .= '<form class="shopOrderFormMain" id="shopOrderFormMain" name="shopOrderFormMain" action="'.$this->urlHelper->getThisPage().'" enctype="multipart/form-data" method="post" accept-charset="UTF-8"  autocomplete="on">';
        $this->html .= '<table class="shopOrderFormTable" >';
        $fio = $this->inputHelper->textBox('fio', 'fio', 'shopOrderFormInput', 200, false, "");
        $this->html .= $this->inputHelper->createFormRow($fio, false, 'ФИО');
        $phone = $this->inputHelper->paternTextBox('phone', 'phone', 'shopOrderFormInput', 100, false, "+7(XXX)XXX-XX-XX", "^((8|\+7)-?)?\(?\d{3,5}\)?-?\d{1}-?\d{1}-?\d{1}-?\d{1}-?\d{1}((-?\d{1})?-?\d{1})?$", "");
        $this->html .= $this->inputHelper->createFormRow($phone, false, 'Номер телефона');
        $email = $this->inputHelper->paternTextBox('email', 'email', 'shopOrderFormInput', 200, false, "user@domen.zone", "^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$", "");
        $this->html .= $this->inputHelper->createFormRow($email, false, 'E-mail');
        $unit = $this->inputHelper->select('unit', 'unit', $this->getUnits(), true, "");
        $this->html .= $this->inputHelper->createFormRow($unit, false, 'Магазин');
        $this->html .= '</table>';
        $this->html .= '</form>';
        $adres = $this->dir.$this->orderID.'.pdf';
        $this->html .= '<div id="shopOrderPrint" class="shopOrderPrint">';
        $this->html .= '<a href="'.$adres.'" target="_blanck" id="openFilePDF" class="shopOrderFormSubmit">Печать</a>';
        $this->html .= '</div>';
        $this->html .= '<div class="clear"></div>';
        $this->html .= '</div>';
    }

    private function getUnits() {
        $unit = array();
        $units = ['0' => 'Выберите магазин', '1' => 'Есенина, 13', '2' => 'Верхняя, 50', '3' => ' Новоселов, 12',
            '4' => 'Шабулина, 24Б',  '5' => 'Бутырки 3, 1В', '6' => 'Зубковой, 27Б', '7' => 'Островского, 109',
            '8' => 'Чкалова, 70Б', '9' => 'Черновицкая, 5', '10' => 'Соколовка, Связи, 10Б', '11' => 'ТЦ на Окружной',
            '12' => 'Новаторов, 2 к.7', '13' => 'Окружная, 185 км (Ангар)', '14' => 'Луховицы, Пушкина, 170 В'];
        foreach ($units as $key => $value) {
            $unit[$key]['text'] = $value;
            $unit[$key]['value'] = $value;
        }
        return $unit;
    }

    public function getFile() {
        // проверяем наличие папки
        if (!file_exists($this->dir)) {
            mkdir ($this->dir, 0777, true);
            chmod($this->dir, 0777);
        }
        // получаем данные о товаре в корзине
        $basket = ShopBasketHelper::getAllItemsFromShopBasket();
        // получаем итог
        $total = ShopBasketHelper::getTotal();
        // PDF
        $pdf = new PDFcreator($this->orderID, $basket, $total, $this->img, PDF_PAGE_ORIENTATION, PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false);
        $pdf->generationPDF();
        file_put_contents($this->dir.$this->orderID.'.pdf', $pdf->getPDFData());
        // XML
        ShopBasketGenerateXML::generateXML($this->orderID, $basket);
    }

    public function getHtml() {
        return $this->html;
    }
}
