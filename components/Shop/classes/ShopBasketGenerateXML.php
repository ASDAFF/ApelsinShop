<?php
/**
 * Генератор XML файла заказа
 */
class ShopBasketGenerateXML {

    static private $object;
    static private $xmlDir = './resources/Components/Shop/Orders/FilesXML/';

    /**
     * Конструктор класса ShopBasketGenerateXML
     */
    private function __construct() {
        self::createDir();
    }

    /**
     * Класс для создания объекта.
     * Необходимо вызывать во всех публичных функциях.
     */
    private static function createObject() {
        if(!isset(self::$object)) {
            self::$object = new ShopBasketGenerateXML();
        }
    }

    /**
     * создаем дирректорию для заливки заказов
     */
    private static function createDir() {
        if (!file_exists(self::$xmlDir)) { 
            mkdir(self::$xmlDir, 0777, true);
            chmod(self::$xmlDir, 0777);
        }
    }

    /**
     * Возвращает полный путь к файлу заказа
     * @param string $orderId - ID заказа
     * @return string - путь к XML файлу заказа
     */
    private static function getFileName($orderId) {
        return self::$xmlDir.$orderId.".xml";
    }

    /**
     * Генерируем и создаем XML файл с заказом
     * Массив с товарами обязательно должен иметь следующие пары "ключ" - "значение" для каждого товара в массиве:
     *  id - идентификатор товара
     *  itemName - название товара
     *  priceValue - цена одной единицы товара
     *  allPriceValue - цена товара за заказанное количество
     *  amount - количество товара в заказе
     *  note - пояснение по товару
     * Данная переменная полностью совместима с масиивом, 
     * возвращаемым статической функцией ShopBasketHelper::getAllItemsFromShopBasket();
     * @param string $orderId - идентификатор заказа
     * @param array $items - список товаров записанный в определенном формате
     * @param string $user - имя заказчика. Может отсутствовать.
     * @param string $phone - Телефонынй номер заказчика. Может отсутствовать.
     * @return boolean - вернет true если XML сгенерирован и создан успешно иначе false
     */
    public static function generateXML($orderId, $items, $user = NULL, $phone = NULL) {
        self::createObject();
        if(!empty($items)) {
            $xml = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n";
            $xml .= "<BodyUpload>\r\n";
            $xml .= "\t<SystemInformation>\r\n";
            $xml .= "\t\t<orderId>".$orderId."</orderId>\r\n";
            $xml .= "\t\t<year>".date("Y")."</year>\r\n";
            $xml .= "\t\t<month>".date("m")."</month>\r\n";
            $xml .= "\t\t<day>".date("d")."</day>\r\n";
            $xml .= "\t\t<hours>".date("h")."</hours>\r\n";
            $xml .= "\t\t<minutes>".date("i")."</minutes>\r\n";
            if ($user !== NULL) {
                $xml .= "\t\t<user>".$user."</user>\r\n";
            }
            if ($phone !== NULL) {
                $xml .= "\t\t<phone>".$phone."</phone>\r\n";
            }
            $xml .= "\t</SystemInformation>\r\n";
            $xml .= "\t<Items>\r\n";
            foreach ($items as $item) {
                $xml .= "\t\t<Item>\r\n";
                $xml .= "\t\t\t<id>".$item['id']."</id>\r\n";
                $xml .= "\t\t\t<itemName>".$item['itemName']."</itemName>\r\n";
                $xml .= "\t\t\t<priceValue>".$item['priceValue']."</priceValue>\r\n";
                $xml .= "\t\t\t<allPriceValue>".$item['allPriceValue']."</allPriceValue>\r\n";
                $xml .= "\t\t\t<amount>".$item['amount']."</amount>\r\n";
                $xml .= "\t\t\t<note>".$item['note']."</note>\r\n";
                $xml .= "\t\t</Item>\r\n";
            }
            $xml .= "\t</Items>\r\n";
            $xml .= "</BodyUpload>\r\n";
            $file = self::getFileName($orderId);
            file_put_contents($file, $xml);
            return file_exists($file);
        } else {
            return false;
        }
    }

    /**
     * Возвращает путь к XML файлу заказа по ID заказа
     * @param string $orderId - ID заказа
     * @return string - путь к XML файлу заказа или NULL если такой файл не найден
     */
    public static function getFileByID($orderId) {
        self::createObject();
        $file = self::getFileName($orderId);
        if(file_exists($file)) {
            return $file;
        } else {
            return NULL;
        }
    }

    /**
     * Удаляем файл с заказом
     * @param string $orderId - ID заказа
     */
    public static function deleteFileByID($orderId) {
        self::createObject();
        $file = self::getFileName($orderId);
        if(file_exists($file)) {
            unlink($file);
        }
    }

    /**
     * Вызывать в первую очередь если надо указать другой путь
     * @param type $path
     */
    public static function setDirPath($path) {
        self::$xmlDir = $path;
        self::createObject();
    }
}
