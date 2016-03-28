<?php
/**
 * Description of ShopLastItems
 *
 * @author Максим
 */
class ShopLastItems {
    
    private $SQL_HELPER;
    private $urlHelper;
    
    private $shopPages = array();
    private $page = "";
    private $params = "";
    private $cookies = array();
    private $itemsData = array();
    private $HTML = array();
    
    private $imageItemPath;
    private $defaultImageItemPath;
    
    private $shopComponentName = 'Shop';
    private $shopComponentElementName = 'Shop';
    private $subPageName = 'item';
    private $shopComponentElementId;
    private $maxItemShow = 6;
    
    public function __construct() {
        global $_SQL_HELPER;
        $this->SQL_HELPER = $_SQL_HELPER;
        global $_URL_PARAMS;
        $this->page = $_URL_PARAMS['page'];
        $this->params = $_URL_PARAMS['params'];
        $this->urlHelper = new UrlHelper();
        $this->setImagePath();
        $this->getShopPages();
        $this->getCookies();
        $this->generateHtml();
        $this->addItem();
    }

    public function setImagePath($imageItemPath = './resources/Components/Shop/Image/ITEMS/', $defaultImageItemPath = './resources/Components/Shop/Image/ITEMS/defaultIcon_150x150.png') {
        $this->imageItemPath = $imageItemPath;
        $this->defaultImageItemPath = $defaultImageItemPath;
    }
    
    private function getImage($item) {
        if (file_exists($this->imageItemPath . $item . '.jpg')) {
            return $this->imageItemPath . $item . '.jpg';
        } elseif (file_exists($this->imageItemPath . $item . '.png')) {
            return $this->imageItemPath . $item . '.png';
        }
        return $this->defaultImageItemPath;
    }
    
    private function isItemNamePage() {
        return in_array($this->page, $this->shopPages) && isset($this->params[0]) && isset($this->params[1]) && $this->params[0] === $this->subPageName;
    }
    
    private function getShopPages() {
        $this->shopPages = array();
        $query = "SELECT `id` FROM `ComponentsElements` WHERE `component`='$this->shopComponentName' AND `alias`='$this->shopComponentElementName';";
        $rezult = $this->SQL_HELPER->select($query,1);
        if (isset($rezult['id'])) {
            $this->shopComponentElementId = $rezult['id'];
            $query = "SELECT `alias` FROM `Pages` WHERE `componentElement`='$this->shopComponentElementId';";
            $rezult = $this->SQL_HELPER->select($query);
            foreach ($rezult as $val) {
                $this->shopPages[] = $val['alias'];
            }
        }
    }
    
    private function getCookies() {
        $this->cookies = array();
        if(isset($_COOKIE["ShopLastItemsCookies"])) {
            $cookiesTemp = explode(";",$_COOKIE["ShopLastItemsCookies"]);
        }
        foreach ($cookiesTemp as $cookie) {
            if(mb_strlen($cookie) && !in_array($cookie, $this->cookies)) {
                $this->cookies[] = $cookie;
            }
        }
    }
    
    private function addItem() {
        if($this->isItemNamePage()) {
            if(count($this->cookies) >= $this->maxItemShow && !in_array($this->params[1], $this->cookies)) {
                $start = count($this->cookies)-$this->maxItemShow+1;
                $this->cookies = array_slice ($this->cookies, $start, $this->maxItemShow-1);
            }
            if(!in_array($this->params[1], $this->cookies)) {
                $this->cookies[] = $this->params[1];
            }
        }
        $cookiesString = "";
        foreach ($this->cookies as $cookie) {
            $cookiesString .= $cookie.";";
        }
        echo '
            <script type="text/javascript">
                setShopLastItemsCookies("'.$cookiesString.'");
            </script>
        ';
    }
    
    private function getItemData() {
        $this->itemsData = array();
        if(!empty($this->cookies)) {
            $query = "SELECT `id`, `itemName` FROM `ShopItems` WHERE ";
            foreach ($this->cookies as $cookie) {
                $query .= "`id`='$cookie' OR ";
            }
            $query = substr($query, 0,  strlen($query)-4).";";
            $this->itemsData = $this->SQL_HELPER->select($query);
        }
    }
    
    private function getItemImage($itemId) {
        $imageName = $itemId . "_150x150";
        $img = '<img src="' . $this->getImage($imageName) . '">';
        return '<div class="ShopLastItemsElementBlock_Image">' . $img . '</div>';
    }
    
    private function generateElementHtml($item) {
        $itemURL = $this->urlHelper->chengeParams(array('item', $item['id']));
        $out = '<div class="ShopLastItemsElementBlock">';
        $out .= "<a href='" . $itemURL . "'>";
        $out .= $this->getItemImage($item['id']);
        $out .= "<div class='ShopLastItemsElementBlock_ItemName'><div>" . $item['itemName'] . "</div></div>";
        $out .= "</a>";
        $out .= '</div>';
        return $out;
    }
    
    private function generateHtml() {
        $this->getItemData();
        $this->HTML = '';
        if(!empty($this->itemsData)) {
            $this->HTML .= '<div class="ShopLastItemsBlock">';
            $this->HTML .= '<div class="ShopLastItemsBlockTitle">Вы недавно смотрели:</div>';
            foreach ($this->itemsData as $item) {
                $this->HTML .= $this->generateElementHtml($item);
            }
            $this->HTML .= '<div class="clear"></div>';
            $this->HTML .= '</div>';
        }
    }

    public function get() {
        echo $this->HTML;
    }

    public function getHtml() {
        return $this->HTML;
    }
}
