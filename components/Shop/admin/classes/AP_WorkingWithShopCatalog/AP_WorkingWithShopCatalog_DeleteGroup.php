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
 * Description of AP_WorkingWithShopCatalog_deleteGroup
 *
 * @author Olga Rjabchikova
 * @copyright © 2010-2016, CompuProjec
 * @created 25.11.2015 10:18:47
 */
class AP_WorkingWithShopCatalog_DeleteGroup extends AP_WorkingWithShopCatalog_General {

    private $newOwner;

    public function __construct($groupId) {
        parent::__construct($groupId);
        $this->checkIsParent();
        $this->delete();
    }

    /**
     * Удаление
     * @param type $yes
     */
    public function delete() {
        if ($this->checkGroupId()) {
            if (isset($this->params[6])) {
                switch ($this->params[6]) {
                    case 'deleteRecursion':
                        $this->deleteRecursion();
                        break;
                    case 'deleteShift':
                        $this->deleteShift();
                        break;
                    case 'deleteStructure':
                        $this->deleteStructure();
                        break;
                    default:
                        $this->html = 'неверная URL';
                        break;
                }
            } else {
                $this->deleteNo();
            }
        } else {
            $this->html = "<div>Каталог не найден</div>";
        }
    }

    /**
     * Проверка наличия родителя (определение нового владельца)
     */
    private function checkIsParent() {
        if ($this->parent != null) {
            $this->newOwner = $this->parent;
        } else {
            $this->newOwner = SystemGroupIdConstants::SYSTEM_GROUP_UNALLOCATED_ITEMS;
        }
    }

    /**
     * Генерация отчета
     * @param type $text
     * @param type $button
     * @return string
     */
    private function generationUI($text, $button = false) {
        $html = '<div class="addGroupCatalogReportWraper">';
        $html .= '<div class="addGroupShopCatalogHead">' . $this->nameGroup . '</div>';
        $html .= '<div class="addGroupCatalogReportText">' . $text . '</div>';
        $html .= '<center>';
        if ($button == true) {
            $html .= $this->generationButtonForDelete();
        } else {
            $html .= $this->getButtonBack();
        }
        $html .= '</center>';
        $html .= '</div>';
        return $html;
    }

    /**
     * Генерация кнопок для отчета
     * @return string
     */
    private function generationButtonForDelete() {
        $params1[0] = $params2[0] = $params3[0] = $params4[0] = $this->params[0];
        $params1[1] = $params2[1] = $params3[1] = $params4[1] = $this->params[1];
        $params1[2] = $params2[2] = $params3[2] = $params4[2] = $this->params[2];
        $params1[3] = $params2[3] = $params3[3] = $params4[3] = $this->params[3];
        $params2[4] = $params3[4] = $params4[4] = $this->params[4];
        $params2[5] = $params3[5] = $params4[5] = $this->params[5];
        $params2[6] = 'deleteRecursion';
        $params3[6] = 'deleteShift';
        $params4[6] = 'deleteStructure';
        $noUrl = $this->urlHelper->chengeParams($params1);
        $yesUrlRecursion = $this->urlHelper->chengeParams($params2);
        $yesUrlShift = $this->urlHelper->chengeParams($params3);
        $yesUrlStructure = $this->urlHelper->chengeParams($params4);
        $html = '<a href="' . $yesUrlRecursion . '"><input class="AP_Submit" type="button" value="Удалить рекурсивно" '
                . 'title="Удалить полностью (в том числе вложенные каталоги), все товары будут перемещены в системный каталог"></a>';
        $html .= '<a href="' . $yesUrlShift . '"><input class="AP_Submit" type="button" value="Удалить со сдвигом" '
                . 'title="Удалить непосредственно этот каталог, товары и вложенные каталоги будут перемещены вверх по иерархии"></a>';
        $html .= '<a href="' . $yesUrlStructure . '"><input class="AP_Submit" type="button" value="Удалить структуру" '
                . 'title="Удалить полностью, товары и вложенные каталоги будут перемещены в родительский каталог или в корневой, если родитель отсутствует"></a>';
        $html .= '<a href="' . $noUrl . '"><input class="AP_Submit" type="button" value="Отменить удаление"></a>';
        return $html;
    }

    /**
     * Перемещение товаров
     */
    private function relocationItems($data) {
        $query = "UPDATE `ShopItems` SET `group`='" . $this->newOwner . "' WHERE ";
        if (is_array($data)) {
            foreach ($data as $id) {
                $query .= "`group`='" . $id . "' OR ";
            }
            $query = mb_strcut($query, 0, strlen($query) - 4);
        } else {
            $query .= "`group`='" . $data . "'";
        }
        $query .= ";";
        $this->SQL_HELPER->insert($query);
    }

    /**
     * Удаление каталога
     */
    private function deleteGroups() {
        foreach ($this->nodeChildrenAndParent as $id) {
            $queryDelete = "DELETE FROM `ShopGroups` WHERE `id`='" . $id . "';";
            $this->SQL_HELPER->insert($queryDelete);
        }
    }

    private function deleteRecursionOrStructure() {
        if (count($this->nodeChildrenAndParent) > 0) {
            $this->relocationItems($this->nodeChildrenAndParent);
            $this->deleteGroups();
        }
    }

    private function deleteRecursion() {
        $this->newOwner = SystemGroupIdConstants::SYSTEM_GROUP_UNALLOCATED_ITEMS;
        $this->deleteRecursionOrStructure();
        $text = "Каталог удален полностью, товары перенесены в `Системный каталог`";
        $this->html = $this->generationUI($text);
    }

    private function deleteStructure() {
        $this->deleteRecursionOrStructure();
        $parent = "";
        ($this->parent !== null) ? $parent .= $this->getGroupName($this->parent) : $parent .= "Системный каталог";
        $text = "Каталог удален, товары перенесены в `" . $parent . "`";
        $this->html = $this->generationUI($text);
    }

    private function deleteShift() {
        $this->relocationItems($this->groupId);
        $queryDelete = "DELETE FROM `ShopGroups` WHERE `id`='" . $this->groupId . "';";
        $this->SQL_HELPER->insert($queryDelete);
        $this->exchangeParent();
        $text = $this->getTextForShift();
        $this->html = $this->generationUI($text);
    }

    private function getTextForShift() {
        $parent = "";
        ($this->parent !== null) ? $parent .= $this->getGroupName($this->parent) : $parent .= "Корневой  каталог";
        $text = "Каталог удален, содержимое перенесено вверх по иерархии. Новый владелец - `" . $parent . "`<br />";
        $text .= "В него перемещены товары и вложенные каталоги:<br />";
        foreach ($this->info['children'] as $child) {
            $text .= $this->getGroupName($child) . ";<br />";
        }
        return $text;
    }

    private function exchangeParent() {
        if (isset($this->node) && !empty($this->node)) {
            foreach ($this->node as $child) {
                $query = "INSERT INTO `ShopGroupsHierarchy` SET ";
                $query .= "`group` = '" . $child . "', ";
                $query .= "`parentGroup` = '" . $this->parent . "';";
                $this->SQL_HELPER->insert($query);
            }
        }
    }

    /**
     * Уточнение удаления (выбор)
     * @return type
     */
    private function deleteNo() {
        $text = "Вы точно хотите удалить этот каталог?<br />";
        $this->html = $this->generationUI($text, true);
    }

}
