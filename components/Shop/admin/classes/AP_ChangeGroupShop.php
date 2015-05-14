<?php
/**
 * Description of AP_ChangeGroupShop
 *
 * @author olga
 */
class AP_ChangeGroupShop extends AdminPanel_ComponentPanelUI_Element {

    private $type;      // тип поиска
    private $search;    // ключ поиска

    public function __construct() {
        parent::__construct();
        $this->getUserData();
        if ($this->yourUser->checkAuthorization()) {
            $this->generateForm();
            if (isset($_POST['AP_Submit'])) { 
                $this->searchItems();
            }
        }
    }

    public function getHtml() {
        return $this->html;
    }
    
    /**
     * Подгрузить id товара в ссылку для редактирования
     * @param type $id - id товара
     */
    protected function setElementAliasID($id) {
        $this->elementAliasID = $id;
    }
    
    /**
     * Получить данные по найденым совпадениям
     */
    protected function getData() {
        $query = $this->getQuery();
        $this->data = $this->SQL_HELPER->select($query);
    }
    
    /**
     * Генерация формы поиска
     */
    private function generateForm() {
        $this->html = '';
        $this->html .= '<form class="AP_Form" name="AP_Form" action="'.$this->urlHelper->getThisPage().'" method="post" autocomplete="off" accept-charset="UTF-8">';
            $this->html .= '<fieldset>';
            $this->html .= '<legend>Найти группу</legend>';
                $this->html .= '<table class="AP_FormTable" >';
                    $selectTypeSearch = InputHelper::select('selectTypeSearch', 'selectTypeSearch', $this->getSelectData(), true, '');
                    $this->html .= InputHelper::createFormRow($selectTypeSearch, true, 'Определите тип поиска');
                    $inputTypeSearch = InputHelper::textBox("inputTypeSearch", "inputTypeSearch", "inputTypeSearch", 100, true, '' );
                    $this->html .= InputHelper::createFormRow($inputTypeSearch, true, "Введите данные для поиска");
                $this->html .= '</table>';
                $this->html .= '<center><input class="AP_Submit" type="submit" name="AP_Submit" value="Найти"></center>';
            $this->html .= '</fieldset>';
        $this->html .= '</form>';
    }
    
    /**
     * Данные для Select
     * @return type
     */
    private function getSelectData() {
        $res = [];
        $result = ['0'=>'', 'groupName'=>'Найти по названию группы', 'id'=>'Найти по ID группы'];
        foreach ($result as $key => $value) {
            $res[$key]['text'] = $value;
            $res[$key]['value'] = $key;
        }
        return $res;
    }
    
    /**
     * Поиск
     */
    private function searchItems() {
        if ($this->checkAllValue()) {
            $this->type = $_POST['selectTypeSearch'];
            $this->search = explode(' ', $_POST['inputTypeSearch']);
            $this->generationListItem(); 
        }
    }

    /**
     * Проверка введенных данных
     * @return type
     */
    private function checkAllValue() {   
        $error = false;
        if (!InputValueHelper::getOriginalPostValue('selectTypeSearch')) {
            $error = true;
            $this->html .= "Определите тип поиска";
        }
        if (!InputValueHelper::getOriginalPostValue('inputTypeSearch')) {
            $error = true;
            $this->html .= " Введите данные для поиска";
        }
        return !$error;
    }
    
    /**
     * Получить список совпадений
     * @return type
     */
    private function generationListItem() {
        $params_edit = $this->getParamsEdit();
        $this->getData();
        if (count($this->data) > 0 && $this->data != null) {
            $this->html .= '<div class="listItemsShopItems">';
            $i = 0;
            foreach ($this->data as $item) {
                $this->setElementAliasID($item['id']);
                $textShown = $this->getShown($item['shown']);
                $textShowInHierarchy = $this->getShowInHierarchy($item['showInHierarchy']);
                $params_edit[5] = $this->elementAliasID;
                $groupName = $this->getGroupText($item['group'], $item['parentGroup']);
                $this->html .= '<div class="wrapperItemsShopItems groupShop">';
                    $this->html .= '<div class="blockGorizontConteinerShopItems">';
                        $this->html .= '<div class="leftBlockGorizontShopItems ">группа - <span class="itemsName">'.$item['groupName'].'</span> ('.$item['id'].')</div>';
                        $this->html .= '<div class="rightBlockGorizontShopItems">';
                            $this->html .= '<div class="'.$textShown['class'].'" id="actionShopGroup'.$i.'" title="'.$textShown['textShown'].'"'
                                    . ' onclick="setShowHideGroup(\''.$i.'\', \''.$item['id'].'\');">';
                                $this->html .= $textShown['textShown'];
                            $this->html .= '</div>';
                            $this->html .= '<div class="'.$textShowInHierarchy['class'].'" id="actionShopGroupInHierarchy'.$i.'" title="'.$textShowInHierarchy['textShowInHierarchy'].'" '
                                    . 'onclick="setShowHideGroupInHierarchy(\''.$i.'\', \''.$item['id'].'\');">';
                                $this->html .= $textShowInHierarchy['textShowInHierarchy'];
                            $this->html .= '</div>';
                        $this->html .= '</div>';
                    $this->html .= '</div>';
                    $this->html .= '<div class="blockGorizontConteinerShopItems">';
                        $this->html .= '<div class="leftBlockGorizontShopItems ">'.$groupName.'</div>';
                        $this->html .= '<div class="rightBlockGorizontShopItems forGroup">';
                            $this->html .= '<a href="'.$this->urlHelper->chengeParams($params_edit).'" title="Редактировать">';
                                $this->html .= '<span class="editItemsShopImage">Изменить</span>';
                            $this->html .= '</a>';
                        $this->html .= '</div>';
                    $this->html .= '</div>';
                $this->html .= '</div>';
                $i++;
            }
        } else {
            $this->html .= '<p>Совпадение не найдено</p>'; 
        } 
        return $this->html;
    }
    
    /**
     * Формирование массива $params_edit
     * @return string
     */
    private function getParamsEdit() {
        $params_edit = array();
        $params_edit[0] = $this->URL_PARAMS[0];
        $params_edit[1] = $this->URL_PARAMS[1];
        $params_edit[2] = $this->URL_PARAMS[2];
        $params_edit[3] = $this->URL_PARAMS[3];
        $params_edit[4] = 'edit';
        return $params_edit;
    }

    /**
     * Формирование строки для названия группы
     * @param type $group
     * @param type $parentGroup
     * @return string
     */
    private function getGroupText($group, $parentGroup) {
        $name = $this->getNameGroup($group);
        if ($name !== null) {
            $groupName = 'родительская группа - '.$name['groupName'].' ('.$parentGroup.')';
        } else {
            $groupName = 'Kорневая группа';
        }
        return $groupName;
    }

    /**
     * Формирование строки запроса для поиска
     * @return string
     */
    private function getQuery() {
        
        $query = "SELECT * FROM (SELECT * FROM `ShopGroups` WHERE `".$this->type."` LIKE '%".$this->search[0]."%' ";  
        if (count($this->search) > 1) {
            for ($i = 1; count($this->search) > $i; $i++) {
                $query .=  " OR '%".$this->search[$i]."%'";
            }
        }
        $query .=  " ) AS SpGr LEFT JOIN `ShopGroupsHierarchy` AS SpGrHi ON SpGr.`id` = SpGrHi.`group`;";
        return $query;
    }
    
    /**
     * UI для редактирования
     */
    protected function generateEditUI() {
        $changeGroupEdit = new AP_ChangeGroupEdit($this->URL_PARAMS[5]);
        echo $changeGroupEdit->getHtml();
    }

    /**
     * Генерация стиля кнопки отображения товара на сайте
     * @param type $shown - поле shown таблицы `ShopItems`
     * @return массив значений
     */
    private function getShown($shown) {
        if ($shown == '0') {
            $text['textShown'] = 'Не показывать на сайте';
            $text['class'] = 'hideShopItems';
        } else {
            $text['textShown'] = 'Показывать на сайте';
            $text['class'] = 'showShopItems';
        }
        return $text;
    } 
    
    /**
     * Генерация стиля кнопки отображения товара на сайте
     * @param type $shown - поле shown таблицы `ShopItems`
     * @return массив значений
     */
    private function getShowInHierarchy($showInHierarchy) {
        if ($showInHierarchy == '0') {
            $text['textShowInHierarchy'] = 'Не показывать в иерархии';
            $text['class'] = 'hideShopItems';
        } else {
            $text['textShowInHierarchy'] = 'Показывать в иерархии';
            $text['class'] = 'showShopItems';
        }
        return $text;
    } 
    
    /**
     * Получить название группы
     * @param type $id
     * @return type
     */
    private function getNameGroup($id) {
        $query = "SELECT `groupName` FROM `ShopGroups` WHERE `id` = '".$id."' ;";
        $result = $this->SQL_HELPER->select($query);
        if (count($result) > 0) {
            $name = $result[0] ;
        } else {
            $name = null;
        }
        return $name;
    }

    /**
     * Данные о пользователе
     */
    private function getUserData() {
        $this->yourUser = new UserData();
        $this->yourUser->checkAuthorization();
        $this->yourUserData = $this->yourUser->getUserData();
    }
}
