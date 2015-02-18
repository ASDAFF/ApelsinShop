<?php
class AccountSettings {
    
    private $SQL_HELPER;
    private $urlHelper;
    private $inputHelper;
    private $localization;
    private $updateValue = array();
    
    private $yourUser;
    private $userData;
    private $authorization;
    private $avatarPath;
    private $fileName = "av.png";
    private $fileNameCut = "cut_av.png";
    private $fileName200 = "200_av.png";
    private $fileName50 = "50_av.png";
    private $fileName30 = "30_av.png";
    private $message="";
    
    private $avatarSafeLoadingImages;
    
    
    private $avatarDir="./resources/Components/Users/";
    
    public function __construct() {
        global $_SQL_HELPER;
        $this->SQL_HELPER = $_SQL_HELPER;
        $this->urlHelper = new UrlHelper();
        $this->yourUser = new UserData();
        $this->authorization = $this->yourUser->checkAuthorization();
        $this->inputHelper = new InputHelper();
        $this->localization = new Localization("Users/RegistrationForm");
        if($this->authorization) {
            $this->userData = $this->yourUser->getUserData();
            $this->avatarPath = $this->avatarDir.$this->userData['login']."/";
            if(!is_dir($this->avatarPath)) {
                mkdir($this->avatarPath, 0777);
            }
            $this->createSafeLoadingImages();
        }  else {
            echo "Для настройки своего аккаунта вам необходимо авторизироватсья на сайте. если у вас нет пользователя, вы можете зарегистрировать нового.";
            exit;
        }
    }
    
    /**
     * Создание изображения
     */
    private function createSafeLoadingImages() {
        $this->avatarSafeLoadingImages = new SafeLoadingImages($this->avatarPath,$this->urlHelper->getThisPage(),false,"image/jpeg,image/png");
    }
    
    /**
     * Загрузка формы
     */
    private function getAvatarLoadForm() {
        $this->avatarSafeLoadingImages->uploadFile($this->fileName,200,200,800,500);
        $out = "";
        $out .= "<h1>Загрузите основу для аватара</h1>";
        $out .= $this->avatarSafeLoadingImages->getForm();
        
        return $out;
    }
    
    /**
     * Изменения изображения
     */
    private function changeImage() {
        $out = "";

        $img = $this->avatarPath.$this->fileName200;
        if(!file_exists($img)) {
            $img = $this->avatarDir."noAV.png";
        }
        $img2 = $this->avatarPath.$this->fileName;
        $out .= "<h1>Измените аватар</h1>";
        $out .= '<div class="avatarPromoBox">';
            if(file_exists($img2)) {
                $out .= '<div class="avatarPromoConteiner">';
            } else {
                $out .= '<div class="avatarPromoOneConteiner">'; 
            }
                $out .= '<img class="avatarPromo" src="'.$img.'?r='.rand().'" onclick="changeImageBox_show();" title="Текущий аватар">';
                $out .= '<div class="avatarPromoText">';
                $out .= 'Текущий аватар';
                $out .= '</div>';
            $out .= '</div>';
            if(file_exists($img2)) {
                $out .= '<div class="avatarPromoConteiner">';
                    $out .= '<img class="avatarPromo" src="'.$img2.'?r='.rand().'" onclick="changeImageBox_show();" title="Загруженная основа">';
                    $out .= '<div class="avatarPromoText">';
                    $out .= 'Загруженная основа';
                    $out .= '</div>';
                $out .= '</div>';
            }
        $out .= '</div>';
        if(file_exists($img2)) {
            $out .= '<input type="button" value="Изменить аватар" onclick="changeImageBox_show();">';
        } else {
            $out .= '<div class="noMainAvatarFileInfo">Не найдена основа для аватара.<br>Чтобы отредактирваоть аватар необходимо загрузить основу.</div>';
        }
            
        if(file_exists($img2)) {
            $image = new CMSCutImage($this->avatarPath.$this->fileName);
            if(isset($_POST['x'])) {
                $image->saveCutImage($_POST['x'], $_POST['y'], $_POST['w'], $_POST['h'], null, null, $this->avatarPath.$this->fileNameCut);
                $image->getSmall($this->avatarPath.$this->fileNameCut, $this->avatarPath.$this->fileName30, 30, 30);
                $image->getSmall($this->avatarPath.$this->fileNameCut, $this->avatarPath.$this->fileName50, 50, 50);
                $image->getSmall($this->avatarPath.$this->fileNameCut, $this->avatarPath.$this->fileName200, 200, 200);
                echo '<script language="JavaScript">';
                echo 'window.location.href = "'.$this->urlHelper->getThisPage().'"';
                echo '</script>';

            }
            $out .= '<div id="changeImageBox" class="changeImageBox" style="display: none;">';
                $out .= '<div class="changeImageConteiner">';
                    $out .= '<div class="changeImage">';
                        $out .= $image->getImg('AccountAvatarImageJcrop');
                    $out .= '</div>';
                    $out .= '<div class="changeImagePromo">';
                        $out .= '<div class="changeImagePromo200">';
                            $out .= $image->getPreview("avprev200","200px", "200px");
                        $out .= '</div>';
                        $out .= '<div class="changeImagePromo30">';
                            $out .= $image->getPreview("avprev30","30px", "30px");
                        $out .= '</div>';
                        $out .= '<div class="changeImagePromo50">';
                            $out .= $image->getPreview("avprev50","50px", "50px");
                        $out .= '</div>';
                        $out .= '<div class="changeImageText">';
                            $out .= 'Выделите область изображения которую хотите сохранить в качестве вашего аватара и нажмите на кнопку <b>"Применить"</b>.<br><br>';
                            $out .= 'Чтобы закрыть это окно не применяя изменения, нажмите на кнопку <b>"Отменить"</b>.<br><br>';
                        $out .= '</div>';
                        $out .= $image->getForm($this->urlHelper->getThisPage(),"changeImageBox_hide();");
                    $out .= '</div>';
                $out .= '</div>';
            $out .= '</div>';
        }
        return $out;
    }
    
    public function getChangeAvatar() { 
        $out = "";
        $out .= '<p>Аватар — это графическое представление вас, как пользователя сайта и 
                представляет из себя выделенную область изображения, 
                загруженного в качестве основы.</p>';
        $out .= '<p>Аватар отображается в вашем профиле и в местах, где вы проявляли 
                активность, например если вы оставили комментарий, то ваш аватар будет расположен 
                рядом с ним. Помните, что аватар доступен для просмотра любому пользователю 
                сайта, поэтому выбирайте изображение осторожно.</p>';
        
        $out .= '<div class="changeImageMainBlock">';
        $out .= $this->changeImage();
        $out .= '</div>';
        $out .= '<div class="AvatarLoadFormMainBlock">';
        $out .= $this->getAvatarLoadForm();
        $out .= '</div>';
        $out .= '<div class="AvatarLoadInfo">';
            $out .= '<p>Вы можете в любой момент отредактировать текущий аватар, выбрав 
                    другую область изображения загруженного в качестве основы.</p>';

            $out .= '<p>Вы можете в любой момент загрузить новое изображение в качестве 
                    основы для аватара. Поддерживаются изображения размером от <b>200x200</b> до <b>500x500</b>.</p>';

            $out .= '<p>Обратите внимание на то, что после загрузки новой основы, ваш 
                    старый аватар <b>НЕ</b> изменится до тех пор, пока вы не отредактируете его.</p><br>';
        $out .= '</div>';
        return $out;
    }

    
    /**
     * Добавить строку к форме
     * @param type $input - input элемент формы
     * @param type $mandatory - обязателен к заполнению
     * @param type $text - текст
     * @param type $info - дополнительная информация
     * @return string - вернет код строки для таблицы формы
     */
    private function createFormRow($input,$mandatory,$text,$info=null) {
        $mandatoryText = "";
        if($mandatory) {
            $mandatoryText = '* ';
        }
        $out =  '<tr>';
        $out .=  '<td class="EditUserDataFormTable_Text">';
        $out .=  '<div class="text">'.$mandatoryText.$text.'</div>';
        if($info != null && $info != "") {
            $out .=  '<div class="info">'.$info.'</div>';
        }
        $out .=  '</td>';
        $out .=  '<td class="EditUserDataFormTable_Input">'.$input.'</td>';
        $out .=  '</tr>';
        return $out;
    }
    
    /**
     * Аналогичен createFormRow() за исключением того, что данная функция 
     *      принмиает на вход не текст а переменные для локализации
     * @param type $input
     * @param type $mandatory
     * @param type $text
     * @param type $info
     * @return type
     */
    private function createLocalizationFormRow($input,$mandatory,$text,$info=null) {
        $text = $this->localization->getText($text);
        if($info != null && $info != "") {
            $info = $this->localization->getText($info);
        }
        return $this->createFormRow($input,$mandatory,$text,$info);
    }
    
    public function getChangeUserDataForm() {
        if(isset($_POST['EditUserDataFormSubmit'])) {
            $this->getInsertValueArray();
            $this->updateData();
        }
        $out = '';
//        $this->form .= 'Уважаемые пользователи, указанные вами <i>ИМЯ</i>, <i>ФАМИЛИЯ</i>, <i>ТЕЛЕФОН</i> и <i>EMAIL</i><br>';
//        $this->form .= '<b>НЕ ДОСТУПНЫ ДРУГИМ ПОЛЬЗОВАТЕЛЯМ</b>.<br><br>';
//        $this->form .= 'При редактировании указывать настоящие имена, фамилии и контактные данные.<br><br>';
//        $this->form .= 'Администрация сайта оставляет за собой право <b>ПРОВЕРИТЬ</b> эти <b>ДАННЫЕ</b>.<br>';
//        $this->form .= 'В случае их не соответствия действительности, мы <b>ЗАБЛОКИРУЕМ</b> вашего пользователя<br>';
//        $this->form .= '<b>И ИСКЛЮЧИМ ВАС ИЗ УЧАСТИЯ НА ФЕСТИВАЛЕ</b>.<br><br><hr><br>';
        
        $out .= '<form class="EditUserDataForm" name="EditUserDataForm" action="'.$this->urlHelper->getThisPage().'" 
            method="post" accept-charset="UTF-8" autocomplete="on">';
        $out .= '<center>';
        $out .= "<div class='message'>$this->message</div>";
        $out .= '<table class="EditUserDataFormTable" >';
        // ferstName
        $namePatern = $this->localization->getText("namePatern");
        $ferstName = $this->inputHelper->paternTextBox("ferstName", "ferstName", "ferstName", 50, true, $namePatern, "[А-Яа-яЁёA-Za-z]{2,50}", $this->userData['ferstName']);
        $out .= $this->createLocalizationFormRow($ferstName, true, 'ferstName');
        // lastName
        $lastName = $this->inputHelper->paternTextBox("lastName", "lastName", "lastName", 50, true, $namePatern, "[А-Яа-яЁёA-Za-z]{2,50}", $this->userData['lastName']);
        $out .= $this->createLocalizationFormRow($lastName, true, 'lastName');
        // birthday
        $birthday = $this->inputHelper->paternTextBox("birthday", "birthday", "birthday", 10, true, "ГГГГ-ММ-ДД", "[0-9]{4}-[0-9]{2}-[0-9]{2}", substr($this->userData['birthday'],0,10));
        $out .= $this->createLocalizationFormRow($birthday, true, 'birthday','birthdayInfo');
        // sex
        $sexArray = array();
        $sexArray[0]['value'] = 1;
        $sexArray[0]['text'] = $this->localization->getText("male");
        $sexArray[1]['value'] = 0;
        $sexArray[1]['text'] = $this->localization->getText("female");
        $sex = $this->inputHelper->select('sex', 'sex', $sexArray, true, $this->userData['sex']==null?1:$this->userData['sex']);
        $out .= $this->createLocalizationFormRow($sex, true, 'sex');
        // city
        $cityPatern = $this->localization->getText("cityPatern");
        $city = $this->inputHelper->paternTextBox("city", "city", "city", 200, true, $cityPatern, "[А-ЯЁЦЙA-Z]{1}[а-яёцйa-z]{1,199}", $this->userData['city']);
        $out .= $this->createLocalizationFormRow($city, true, 'city');
        // email
        $email = $this->inputHelper->paternTextBox("email", "email", "email", 200, true, "user@domen.zone", "^[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$", $this->userData['email']);
        $out .= $this->createLocalizationFormRow($email, true, 'email');
        // phone
        $phone = $this->inputHelper->paternTextBox("phone", "phone", "phone", 30, true, "+7(XXX)XXX-XX-XX", "^((8|\+7)-?)?\(?\d{3,5}\)?-?\d{1}-?\d{1}-?\d{1}-?\d{1}-?\d{1}((-?\d{1})?-?\d{1})?$", $this->userData['phone']);
        $out .= $this->createLocalizationFormRow($phone, true, 'phone');
        // status
        $status = $this->inputHelper->textarea("status", "status", "status", 150, false, $this->userData['status']);
        $out .= $this->createLocalizationFormRow($status, false, 'status');
        // aboutYourself
        $aboutYourself = $this->inputHelper->textarea("aboutYourself", "aboutYourself", "aboutYourself", 600, false, $this->userData['aboutYourself']);
        $out .= $this->createLocalizationFormRow($aboutYourself, false, 'aboutYourself');
        // icq
        $isq = $this->inputHelper->textBox('icq', 'icq', 'icq', 25, false, $this->userData['icq']);
        $out .= $this->createLocalizationFormRow($isq, false, 'icq');
        // skype
        $skype = $this->inputHelper->textBox('skype', 'skype', 'skype', 25, false, $this->userData['skype']);
        $out .= $this->createLocalizationFormRow($skype, false, 'skype');
        // vk
        $vk = $this->inputHelper->textBox('vk', 'vk', 'vk', 25, false, $this->userData['vk']);
        $out .= $this->createLocalizationFormRow($vk, false, 'vk');
        // odnoklasniki
        $odnoklasniki = $this->inputHelper->textBox('odnoklasniki', 'odnoklasniki', 'odnoklasniki', 25, false, $this->userData['odnoklasniki']);
        $out .= $this->createLocalizationFormRow($odnoklasniki, false, 'odnoklasniki');
        // google
        $google = $this->inputHelper->textBox('google', 'google', 'google', 25, false, $this->userData['google']);
        $out .= $this->createLocalizationFormRow($google, false, 'google');
        // facebook
        $facebook = $this->inputHelper->textBox('facebook', 'facebook', 'facebook', 25, false, $this->userData['facebook']);
        $out .= $this->createLocalizationFormRow($facebook, false, 'facebook');
        // twitter
        $twitter = $this->inputHelper->textBox('twitter', 'twitter', 'twitter', 25, false, $this->userData['twitter']);
        $out .= $this->createLocalizationFormRow($twitter, false, 'twitter');
        // instagram
        $instagram = $this->inputHelper->textBox('instagram', 'instagram', 'instagram', 25, false, $this->userData['instagram']);
        $out .= $this->createLocalizationFormRow($instagram, false, 'instagram');
        // youtube
        $youtube = $this->inputHelper->textBox('youtube', 'youtube', 'youtube', 25, false, $this->userData['youtube']);
        $out .= $this->createLocalizationFormRow($youtube, false, 'youtube');
        // livejournal
        $livejournal = $this->inputHelper->textBox('livejournal', 'livejournal', 'livejournal', 25, false, $this->userData['livejournal']);
        $out .= $this->createLocalizationFormRow($livejournal, false, 'livejournal');
        // blogger
        $blogger = $this->inputHelper->textBox('blogger', 'blogger', 'blogger', 25, false, $this->userData['blogger']);
        $out .= $this->createLocalizationFormRow($blogger, false, 'blogger');
        // siteName
        $siteName = $this->inputHelper->textBox('siteName', 'siteName', 'siteName', 25, false, $this->userData['siteName']);
        $out .= $this->createLocalizationFormRow($siteName, false, 'siteName');
        // siteUrl
        $siteUrl = $this->inputHelper->textBox('siteUrl', 'siteUrl', 'siteUrl', 25, false, $this->userData['siteUrl']);
        $out .= $this->createLocalizationFormRow($siteUrl, false, 'siteUrl');
        // captcha
        $captcha = $this->inputHelper->textBox("captcha", "captcha", "captcha", 25, true, null);
        $out .= $this->createFormRow($captcha, true, getCaptcha(120, 25));
        $out .= '</table>';
        $out .= '<div class="mandatoryText">'.$this->localization->getText('mandatoryText').'</div>';
        $out .= '<center>';
        $out .= '<input class="EditUserDataFormButton" type="submit" name="EditUserDataFormSubmit" value="'.$this->localization->getText("editUserDataFormButtonText").'">';
        $out .= '</form><br>';
        return $out;
    }
    
    /**
     * Проверка каптчи
     * @return type - вернет true если проверка удачная
     */
    private function checkCaptcha() {
        @session_start();
        return (
                isset($_SESSION['captcha']) && 
                strtoupper($_SESSION['captcha']) == strtoupper($_POST['captcha'])
        );
    }
    
    private function checkLogin() {
        $query = "Select `login` from `Users` where `login`='".$this->userData['login']."';";
        $login = $this->SQL_HELPER->select($query);
        return count($login)>0;
    }
    
    /**
     * Проверка всех значений
     * @return type
     */
    private function checkAllValue() {
        return (
                $this->checkValue('ferstName',"/[^А-ЯA-Z]{1}[а-яa-z]{1,49}+$/u") && 
                $this->checkValue('lastName',"/[^А-ЯA-Z]{1}[а-яa-z]{1,49}+$/u") && 
                $this->checkValue('city',"/[^А-ЯA-Z]{1}[а-яa-z]{1,199}+$/u") && 
                $this->checkValue('birthday',"/^[0-9]{4}-[0-9]{2}-[0-9]{2}$/") &&
                $this->checkValue('sex',"/^[0-1]$/") && 
                $this->checkValue('email',"/^([a-z0-9_\.-]+)@([a-z0-9_\.-]+)\.([a-z\.]{2,6})$/") &&
                $this->checkValue('phone',"/^((8|\+7)-?)?\(?\d{3,5}\)?-?\d{1}-?\d{1}-?\d{1}-?\d{1}-?\d{1}((-?\d{1})?-?\d{1})?$/") &&
                $this->checkValue('captcha',"/^[A-Za-z0-9]{1,20}$/")
        );
    }
    
    /**
     * Проверка значений
     * @param type $key - ключ для $_POST массива
     * @param type $preg - регулярное выражение
     * @return type
     */
    private function checkValue($key,$preg=null) {
        return (
                isset($_POST[$key]) && 
                $_POST[$key]!=null && 
                $_POST[$key]!="" &&
                ($preg==null || preg_match($preg, $_POST[$key]))
        );
    }
    
    /**
     * Формирование Query запроса на изменение
     * @return string
     */
    private function getQuery() {
        $query = "UPDATE `Users` SET ";
        foreach ($this->updateValue as $key => $value ) {
            $query .= "`$key`='".$value."',";
        }
        $query = substr($query, 0, strlen($query)-1);
        $query .= "WHERE `login`='".$this->userData['login']."'";
        $query .= ";";
        return $query;
    }
    
    /**
     * Преобразование текста для Mysql
     * @global type $_DBSETTINGS
     * @param type $text
     * @param type $mysqlRealEscape
     * @param type $br
     * @return null
     */
    private function getMysqlText($text,$mysqlRealEscape=true,$br=false) {
        global $_DBSETTINGS;
        $link = mysql_connect($_DBSETTINGS['host'], $_DBSETTINGS['user'], $_DBSETTINGS['password']) OR die(mysql_error());
        $text = nl2br($text);
        if($br) {
            $text = strip_tags($text, '<br>');
        } else {
            $text = strip_tags($text);
        }
        $text = htmlspecialchars_decode($text);
        if($mysqlRealEscape) {
            $text = mysql_real_escape_string($text);
        }
        if($text=="") {
            $text = null;
        }
        return $text;
    }
    
    /**
     * Првоерка $_POST значений
     * @param type $key
     * @return type
     */
    private function getPostValue($key,$mysqlRealEscape=true,$br=false) {        
        return (
                isset($_POST[$key]) && 
                $_POST[$key]!=null && 
                $_POST[$key]!=""
        ) ? $this->getMysqlText($_POST[$key],$mysqlRealEscape=true,$br=false) : null;
    }
    
    /**
     * Инициализация значений формы
     */
    private function getInsertValueArray() {
        $this->updateValue = array();
        $this->updateValue['ferstName'] = $this->getPostValue('ferstName');
        $this->updateValue['lastName'] = $this->getPostValue('lastName');
        $this->updateValue['birthday'] = $this->getPostValue('birthday');
        $this->updateValue['sex'] = $this->getPostValue('sex');
        $this->updateValue['city'] = $this->getPostValue('city');
        $this->updateValue['email'] = $this->getPostValue('email');
        $this->updateValue['phone'] = $this->getPostValue('phone');
        $this->updateValue['status'] = $this->getPostValue('status');
        $this->updateValue['aboutYourself'] = $this->getPostValue('aboutYourself');
        $this->updateValue['icq'] = $this->getPostValue('icq');
        $this->updateValue['skype'] = $this->getPostValue('skype');
        $this->updateValue['vk'] = $this->getPostValue('vk');
        $this->updateValue['odnoklasniki'] = $this->getPostValue('odnoklasniki');
        $this->updateValue['google'] = $this->getPostValue('google');
        $this->updateValue['facebook'] = $this->getPostValue('facebook');
        $this->updateValue['twitter'] = $this->getPostValue('twitter');
        $this->updateValue['instagram'] = $this->getPostValue('instagram');
        $this->updateValue['youtube'] = $this->getPostValue('youtube');
        $this->updateValue['livejournal'] = $this->getPostValue('livejournal');
        $this->updateValue['blogger'] = $this->getPostValue('blogger');
        $this->updateValue['siteName'] = $this->getPostValue('siteName');
        $this->updateValue['siteUrl'] = $this->getPostValue('siteUrl');
    }
    
    private function updateData() {
        if($this->checkCaptcha()) {
            //echo "2";
            if($this->checkLogin()) {
                //echo "3";
                if($this->checkAllValue()) {
                    //echo "4";
                    if($this->SQL_HELPER->insert($this->getQuery())) {
                        $this->message = $this->localization->getText("updateOK");
                        echo '<script language="JavaScript">';
                        echo 'window.location.href = "'.$this->urlHelper->getThisPage().'"';
                        echo '</script>';
                    } else {
                        $this->message = $this->localization->getText("dbError");
                    }
                } else {
                    $this->message = $this->localization->getText("checkAllValueFalse");
                }
            } else {
                $this->message = $this->localization->getText("noneUser");
            }
        } else {
            $this->message = $this->localization->getText("checkCaptchaFalse");
        }
    }

public function getChangePasswordForm() {
        if (isset($_POST['changePasswordFormSubmit'])) {
            $this->updatePassword();
        }
        $form = '<form class="changePasswordForm" name="RegistrationForm" action="'.$this->urlHelper->getThisPage().'" 
            method="post" accept-charset="UTF-8" autocomplete="on">';
        $form .= "<div class='message'>$this->message</div>";
        $form .= '<table class="changePasswordFormTable" >';
        $loginAndPasswordPatern = "loginAndPasswordPatern";
        // currentPassword
        $currentPassword = $this->inputHelper->paternPasswordBox("currentPassword", "currentPassword", "changePassword", 25, true, $this->localization->getText($loginAndPasswordPatern), "[A-Za-z0-9]{3,20}", null);
        $form .= $this->createLocalizationFormRow($currentPassword, true, 'currentPassword');
        // newPassword
        $newPassword = $this->inputHelper->paternPasswordBox("newPassword", "newPassword", "changePassword", 25, true, $this->localization->getText($loginAndPasswordPatern), "[A-Za-z0-9]{3,20}", null);
        $form .= $this->createLocalizationFormRow($newPassword, true, 'newPassword');
        // repeatNewPassword
        $repeatNewPassword = $this->inputHelper->paternPasswordBox("repeatNewPassword", "repeatNewPassword", "changePassword", 25, true, $this->localization->getText($loginAndPasswordPatern), "[A-Za-z0-9]{3,20}", null);
        $form .= $this->createLocalizationFormRow($repeatNewPassword, true, 'repeatNewPassword');
        // captcha
        $captcha = $this->inputHelper->textBox("captcha", "captcha", "changePassword", 20, true, null);
        $form .= $this->createFormRow($captcha, true, getCaptcha(120, 25));
        $form .= '</table>';
        $form .= '<input class="RegistrationFormButton" type="submit" name="changePasswordFormSubmit" value="'.$this->localization->getText("changePasswordFormButtonText").'">';
        $form .= '</form>';
        return $form;
    }
    
    private function checkRepeatPassword() {
        return ($_POST['newPassword'] == $_POST['repeatNewPassword']);
    }
    
    private function checkPassword() {
        $query = "SELECT `password` FROM `Users` WHERE `login` = '".$this->userData['login']."';";
        $password = $this->SQL_HELPER->select($query);
        return (md5(InputValueHelper::getPostValue('currentPassword')) === $password[0]['password']) ? true : false ;
    }

    private function checkValueNewPassword() {
        $this->checkAllValueErrors = array();
        $error = false;
        if (!$this->checkValue('currentPassword',"/^[A-Za-z0-9]{3,25}+$/u")) {
            $error = true;
            $this->checkAllValueErrors[] = "Ваш текущийй пароль не совпадает с введённым. Попробуйте ещё раз";
        }
        if (!$this->checkValue('newPassword',"/^[A-Za-z0-9]{3,25}+$/u")) {
            $error = true;
            $this->checkAllValueErrors[] = "Неверно указан пароль. Он может состоять из английских букв и цифр. Минимальная длина пароля 3 символа, максимальная - 25.";
        }
        if (!$this->checkValue('repeatNewPassword',"/^[A-Za-z0-9]{3,25}+$/u")) {
            $error = true;
            $this->checkAllValueErrors[] = "Не задан или не корректно введён повторный пароль.";
        }
        if (!$this->checkValue('captcha',"/^[A-Za-z0-9]{1,20}+$/u")) {
            $error = true;
            $this->checkAllValueErrors[] = "Проверьте правильность заполнения каптчи";
        }
        return !$error;
    }
    
    private function getQueryForUpdatePassword() {
        return ($query = "UPDATE `Users` SET `password` = '".md5(InputValueHelper::getPostValue('newPassword'))."' WHERE `login` = '".$this->userData['login']."';");
    }
  
    private function getButtonExit() {
        $html = '<a href="./out.php?backURL='.$this->urlHelper->getThisPage().'">';
            $html .= '<input class="RegistrationFormButton" type="button"  value="'.$this->localization->getText("changePasswordExitButtonText").'">';
        $html .= '</a>';
        return $html;
    }
    
    private function updatePassword() {
        if ($this->checkCaptcha()) {
            if ($this->checkPassword()) {
                if ($this->checkRepeatPassword()) {
                    if ($this->checkValueNewPassword()) {
                        $update = $this->getQueryForUpdatePassword();
                        if ($this->SQL_HELPER->insert($update)) {
                            $this->message = $this->localization->getText("checkPasswordTrue");
                            $this->yourUser->authorization($this->userData['login'], InputValueHelper::getPostValue('newPassword'));
//                            $this->message .= $this->getButtonExit();
                        } else {
                            $this->message = $this->localization->getText("dbError");
                            // если необходима запись в логи
//                            $this->message .= $this->reportError($update);
                        }
                    } else {
                        $this->message = $this->localization->getText("checkAllValueFalse")."<br>";
                        if ($this->checkAllValueErrors!=null) {
                            foreach ($this->checkAllValueErrors as $CVerror) {
                                $this->message .= "<br>".$CVerror;
                            }
                            $this->message .= "<br>";
                        }
                    }
                } else {
                    $this->message = $this->localization->getText("checkRepeatPasswordFalse");
                } 
            } else {
                $this->message = $this->localization->getText("checkPasswordFalse");
            }
        } else {
            $this->message = $this->localization->getText("checkCaptchaFalse");
        }
    }
    
    // если необходима запись в логи
//    private function reportError($sql) {
//        $sql = $this->getMysqlText($sql);
//        $query = "INSERT INTO `DBerrors`(`element`, `sql`, `date`) VALUES ('RegistrationForm','".$sql."','".date("Y-m-d h:i:s")."');";
//        $this->SQL_HELPER->insert($query);
//        return "Сделана запись в логах<br>";
//    }
    
}
?>