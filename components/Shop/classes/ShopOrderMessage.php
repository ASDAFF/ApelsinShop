<?php
/**
 * После оформления заказа отправляет оповещение менеджеру
 *
 * @author olga
 */
class ShopOrderMessage {

    private $msg = [];
    private $error;
    private $orderID;
    private $email = 'mail@apelsin.ru';

    public function __construct($msg, $orderID) {
        if (isset($msg) && $msg !== null && !empty($msg)) {
            $this->msg = $msg;
        }
        $this->orderID = $orderID;
    }

    private function getMessage() {
        $headers = "Content-Type: text/plain; charset=UTF-8\r\n";
        $message = "На сайте интернет магазина \"Апельсин \" создан заказ \r\n";
        $message .= $this->orderID."\r\n";
        $message .= "от ".date("d.m.Y h:i");
        if (isset($this->msg['unit']) && $this->msg['unit'] !== null && $this->msg['unit'] !== '' && $this->msg['unit'] !== 'Выберите магазин') {
            $message .= "\r\nдля магазина: ".$this->msg['unit'];
        }
        if (isset($this->msg['phone']) && $this->msg['phone'] !== null && $this->msg['phone'] !== '' ||
                isset($this->msg['email']) && $this->msg['email'] !== null && $this->msg['email'] !== '') {
            $message .= "\r\n\r\nНеобходимо связаться с заказчиком:";
            if (isset($this->msg['fio']) && $this->msg['fio'] !== null && $this->msg['fio'] !== '') {
                $message .= "ФИО: ".$this->msg['fio']."\r\n";
            }
            if (isset($this->msg['phone']) && $this->msg['phone'] !== null && $this->msg['phone'] !== '') {
                $message .= "тел: ".$this->msg['phone']."\r\n";
            }
            if (isset($this->msg['email']) && $this->msg['email'] !== null && $this->msg['email'] !== '') {
                $message .= "еmail: ".$this->msg['email']."\r\n";
            }
        }
//        if (!mail($this->email, 'Заказ '.$this->orderID, $message, $headers )) {
//            $this->error = 'Ошибка при отправке сообщения<br>';
//        }
    }

    public function get() {
        $this->getMessage();
        return $this->error;
    }
}
