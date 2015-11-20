<?php
/**
 * Загрузка изображений товаров
 *
 * @author olga
 */
class AP_UploadImagesItemsShop {

    private $form;
    private $dir;
    private $archiveItemsImage = 'ItemsImage.zip';
    private $archiveGroupsIcons = 'GroupsIcons.zip';
    private $pathUnzipped = './resources/Components/Shop/Image/';
    private $dirTEMP = './resources/Components/Shop/TEMP/';
    private $errors;

    private $SQL_HELPER;
    private $yourUser;
    private $yourUserData;

    public function __construct() {
        global $_SQL_HELPER;
        $this->SQL_HELPER = $_SQL_HELPER;
        $this->getUserData();
        if($this->yourUser->checkAuthorization()) {
            $this->generateForm();
            $this->uploadArchive();
            $this->getErrorHtml();
        }
    }

    public function getHtml() {
        return $this->form;
    }

    /**
     * Данные о пользователе
     */
    private function getUserData() {
        $this->yourUser = new UserData();
        $this->yourUser->checkAuthorization();
        $this->yourUserData = $this->yourUser->getUserData();
    }

    /**
     *  Форма
     */
    private function generateForm() {
        $urlHelper = new UrlHelper();
        $this->form = "";
        $this->getTextInfo();
        $this->form .= '<form class="AP_Form" name="AP_Form" action="'.$urlHelper->getThisPage().'" method="POST" accept - charset="UTF-8" required >';
            $this->form .= '<fieldset>';
            $this->form .= '<legend>Распаковать архив</legend>';
            $this->form .= '<table class="AP_FormTable">';
            $this->generationBlockForm("товаров", $this->archiveItemsImage, "ItemsImage");
            $this->generationBlockForm("иконок групп", $this->archiveGroupsIcons, "GroupsIcons");
            $this->form .= '</table>';
            $this->form .= '<center><input class="AP_Submit" type="submit" name="AP_Submit" value="Распаковать"></center>';
            $this->form .= '</fieldset>';
        $this->form .= '</form>';
    }

    private function getTextInfo() {
        $this->form = "Перед загрузкой изображений необходимо:";
        $this->form .= "<ul>";
        $this->form .= "<li>Создать zip-архив: для изображений товаров - 'ItemsImage.zip', для иконок групп - 'GroupsIcons.zip.'</li>";
        $this->form .= "<li>Разместить созданный архив в директории ./resources/Components/Shop/TEMP.</li>";
        $this->form .= "</ul>";
    }

    /**
     * Генерирование блока формы
     * @param type $text
     * @param type $zip
     * @param type $checkbox
     */
    private function generationBlockForm($text, $zip, $name) {
        $archive = $this->dirTEMP.$zip;
        $this->form .= '<tr>';
            $this->form .= '<td class="FormTable_Input">';
                $this->form .= '<div class="text">Залить изображения '.$text.'</div>';
            $this->form .= '</td>';
            if (file_exists($archive)) {
                $this->form .= '<td class="FormTable_Input">';
                    $this->form .= '<div class="text">"'.$zip.'"</div>';
                $this->form .= '</td>';
                $this->form .= '<td class="FormTable_Input">';
                    $this->form .= '<center><input type="checkbox" name="checkboxUploadImages[]" id="checkboxUploadImages" value="'.$zip.'" style="vertical-align:middle;"></center>';
                $this->form .= '</td>';
            } else {
                $this->form .= '<td class="FormTable_Input" colspan="2">';
                    $this->form .= '<div class="text">Архив "'.$name.'" отсутствует</div>';
                $this->form .= '</td>';
            }
        $this->form .= '</tr>';
    }

    /**
     * Загрузка checkboxItemsImage  checkboxGroupsIcons
     */
    private function uploadArchive() {
        if (isset($_POST['AP_Submit']) && isset($_POST['checkboxUploadImages']) &&
           $_POST['checkboxUploadImages'] != null && $_POST['checkboxUploadImages'] !== "") {
            $uploadImages = $_POST['checkboxUploadImages'];
            // если $uploadImages заполнен
            if ($uploadImages != null) {
                foreach ($uploadImages as $archiveName) {
                    // название папки для распаковывания
                    $this->dir = $this->getFileNameWithoutExtension($archiveName);
                    $this->dirIsExists($this->pathUnzipped);
                    // путь к папке распаковывания
                    $dirUnzipped = $this->pathUnzipped.$this->dir.'/';
                    $this->dirIsExists($dirUnzipped);

                    $this->unpaсkingArchive($archiveName, $dirUnzipped);
                    // выводим отчет
                    $this->generationReport($archiveName);
                    //делаем запись в логи
                    $this->recordActionLog($archiveName);
                    //удалить архив
//                    unlink($this->dirTEMP.$archiveName);
                }
            } else {
                $this->errors[] = 'Непредвиденная ошибка';
            }
        }
    }

    /**
     * Получить название файла без его расширения
     * @param type $file
     * @return type
     */
    private function getFileNameWithoutExtension($file) {
        $fileNameExtension = $this->reverse_strrchr($file, '.');
        $name = substr($fileNameExtension, 0, strlen($fileNameExtension) - 1);
        return $name;
    }

    /**
     * Если директория не существует - создать
     */
    private function dirIsExists($dir) {
        if (!file_exists($dir)) { 
            mkdir($dir, 0777, true);
            chmod($dir, 0777);
        }
    }

    /**
     * Распаковка архива
     */
    private function unpaсkingArchive($archiveName, $dirUnzipped) {
        // путь к распаковываемому архиву
        $archivePath = $this->dirTEMP.$archiveName;
        if (file_exists($archivePath) && $archivePath != null) {
            $unpacking = new Unpacking($archivePath, $dirUnzipped);
            $unpacking->setAccess(['image/jpeg', 'image/png']);
            if ($archiveName === $this->archiveItemsImage) {
                $unpacking->setSizeMiniature(200,200);
                $unpacking->setSizeMiniature(150,150);
                $unpacking->setSizeMiniature(100,100);
                $unpacking->setSizeMiniature(50,50);
            } else {
                $unpacking->unsetSizeMiniature();
            }
            $unpacking->zipExtract();
            $this->info = $unpacking->getInfoUnzippedFiles();
        } else {
            $this->errors[] = 'Архив не найден.';
        }
    }

    /**
     * Генерируем отчет о распаковке
     */
    private function generationReport($archive) {
        $this->form .= '<div class="uploadImagesItemsShop">';
            $this->form .= '<div>';
                $this->form .= '<p>Aрхив "'.$archive.'" успешно распакован</p>';
                $this->form .= '<p class="viewLogsShopImage" onclick="listImagesItems(\''.$this->dir.'\');" title="Смотреть список файлов"></p>';
            $this->form .= '</div>';
            $this->form .= '<div>';
                $this->form .= '<p>Всего файлов в архиве: ';
                    $this->form .= '<span class="blueUploadImagesItemsShop">'.$this->info['countAllFileArchive'].'</span>;';
                $this->form .= '';
                $this->form .= ' Распаковано: ';
                    $this->form .= '<span class="errorExportViewLogsShop">'.$this->info['countUnpaсking'].'</span>';
                $this->form .= ' файлa(ов); </p>';
            $this->form .= '</div>';
            $this->form .= '<div>';
                $this->form .= '<p>Новых ';
                    $this->form .= '<span class="greenExportViewLogsShop">'.$this->info['countNewFile'].'</span>;';
                $this->form .= ' Обновленных ';
                    $this->form .= '<span class="warningExportViewLogsShop">'.$this->info['countUpdateFile'].'</span>;';
                $this->form .= ' Не являющихся изображением ';
                    $this->form .= '<span class="purplUploadImagesItemsShop">'.$this->info['countNotImage'].'</span>;';
                $this->form .= ' Не имеющих совпадений ';
                    $this->form .= '<span class="pinkUploadImagesItemsShop">'.$this->info['countUndefinedFiles'].'</span>;';
                $this->form .= '</p>';
            $this->form .= '</div>';
        $this->form .= '</div>';

        $this->form .= '<div id="'.$this->dir.'" class="listImagesItemsAndIconsShop">';
            $this->form .= '<p>Список всех файлов</p>';
            $this->form .= '<div class="collumnsUploadImagesItemsShop">';
                $infoNewFile = array_diff($this->info['allFileArchive'], $this->info['updateFile'], $this->info['notImage'], $this->info['undefinedFiles']);
                $this->generationBlocklistFile($infoNewFile, "greenExportViewLogsShop", "Новые", true);
                $this->generationBlocklistFile($this->info['updateFile'], "warningExportViewLogsShop", "Обновленные", true);
                $this->generationBlocklistFile($this->info['notImage'], "purplUploadImagesItemsShop", "Не являющиeся изображением", false);
                $this->generationBlocklistFile($this->info['undefinedFiles'], "pinkUploadImagesItemsShop", "Не имеющиe совпадений", false);
            $this->form .= '</div>';
        $this->form .= '</div>';
    }

    /**
     * Генерирование блока с инфой в списке
     * @param type $info
     * @param type $class
     * @param type $text
     * @param type $flag
     */
    private function generationBlocklistFile($info, $class, $text, $flag) {
        if (count($info)) {
            $this->form .= '<p><span class="'.$class.'">'.$text.': </span></p>';
            $this->form .= '<ol>';
            foreach ($info as $file) {
                if ($flag) {
                    $nameFile = $this->getTextNameImage($file);
                    $this->form .= '<li>'.$nameFile.'</li>';
                } else {
                    $this->form .= '<li>'.$file.'</li>';
                }
            }
            $this->form .= '</ol>';
        }
    }

    /**
     * Получить название файла из базы по его id
     * @param type $file - название id
     * @return type - текстовое название файла
     */
    private function getTextNameImage($file) {
        $id = $this->getFileNameWithoutExtension($file);
        $query = "SELECT `groupName` as name FROM `ShopGroups` WHERE `id` = '".$id."';";
        $name = $this->SQL_HELPER->select($query,1);
        if ($name === null || empty($name)) {
            $query = "SELECT `itemName` as name FROM `ShopItems` WHERE `id` = '".$id."';";
            $name = $this->SQL_HELPER->select($query,1);
        }
        return $name['name'];
    }

    /**
     * Обрезает строку после заданного символа ($char)
     */
    private function reverse_strrchr($string, $char) {
        return strrpos($string, $char) ? substr($string, 0, strrpos($string, $char) + 1) : false;
    }

    /**
    * Возвращает ошибкy
    * @return type string
    */
    public function getError() {
        if ($this->errors !== null) {
            for ($i = 0; $i < count($this->errors); $i++) {
                return $this->errors[$i].'<br>';
            }
        }
    }

    /**
    * Возвращает текст сообщения (ошибки)
    * @return type string
    */
    public function getErrorHtml() {
        if ($this->errors !== null) {
            for ($i = 0; $i < count($this->errors); $i++) {
                echo $this->errors[$i].'<br>';
            }
        }
    }

    /**
     * Запись в логи таблица `ShopLogs`
     */
    private function recordActionLog($archive) {
        if ($archive === $this->archiveItemsImage) {
            $actionType = 'full_images_items';
            $title = 'Заливка изображений товаров';
            $logtext = 'Заливка изображений товаров через панель администрирования';
        } else {
            $actionType = 'full_icons_groups';
            $title = 'Заливка иконок групп';
            $logtext = 'Заливка иконок групп через панель администрирования';
        }
        $id = ID_GENERATOR::generateID();
        $date = date("Y-m-d h:i:s");
        $query = "INSERT INTO `ShopLogs` SET ";
        $query .= "`id` = '".$id."', ";
        $query .= "`user` = '".$this->yourUserData['login']."', ";
        $query .= "`actionType` = '".$actionType."', ";
        $query .= "`time` = '".$date."', ";
        $query .= "`title` = '".$title."', ";
        $query .= "`logtext` = '".$logtext."';";
        $this->SQL_HELPER->insert($query);
    }
}
