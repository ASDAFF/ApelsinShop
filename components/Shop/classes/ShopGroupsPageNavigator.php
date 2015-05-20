<?php
/**
 * Description of ShopGroupsPageNavigator
 *
 * @author Максим
 */
class ShopGroupsPageNavigator {
    private $HTML;
    private $groupID;
    private $maxPageOnNavigator = 10;
    
    private $prePage;
    private $prePageChange;
    private $postPage;
    private $postPageChange;
    private $thisPage;
    private $amauntOfPage;
    private $startPage;
    private $stopPage;
    
    public function __construct($groupID, $page) {
        $this->thisPage = $page;
        $this->groupID = $groupID;
        $this->getCountNavPage();
        $this->generatePageNavigator();
    }
    
    private function getCountNavPage() {
        $this->amauntOfPage = (int) ShopPropertiesFilterSerchArray::getArrayGroupAmauntOfPage($this->groupID);
        $this->prePage = $this->postPage = floor($this->maxPageOnNavigator / 2);
        $this->prePageChange = $this->postPageChange = 0;
        if($this->thisPage < 1) {
            $this->thisPage = 1;
        }
        if($this->thisPage > $this->amauntOfPage) {
            $this->thisPage = $this->amauntOfPage;
        }

        if($this->thisPage <= $this->prePage) {
            $this->prePageChange = $this->prePage - $this->thisPage + 1;
            $this->prePage -= $this->prePageChange;
            $this->postPage += $this->prePageChange;
        }

        if($this->postPage >= $this->amauntOfPage - $this->thisPage) {
            $this->postPageChange =  $this->postPage - ($this->amauntOfPage - $this->thisPage);
            $this->postPage -= $this->postPageChange;
            if($this->prePageChange === 0) {
                if($this->prePage + $this->postPageChange >= $this->thisPage) {
                    $this->prePage = $this->thisPage-1;
                } else {
                    $this->prePage += $this->postPageChange;
                }
            }
        }
        $this->startPage = $this->thisPage - $this->prePage;
        $this->stopPage = $this->thisPage + $this->postPage;
    }
    
    private function generatePageNavigator() {
//        $this->amauntOfPage = ShopPropertiesFilterSerchArray::getArrayGroupAmauntOfPage($this->groupID);
        $this->HTML .= "<ul class='ShopItemsListNav'>";
        if((int) $this->startPage !== 1) {
            $this->HTML .= $this->generatePageNavigator_FerstPage();
        }
        for ($i = $this->startPage; $i <= $this->stopPage; $i++) {
            if($this->thisPage == $i) {
                $this->HTML .= $this->generatePageNavigator_ThisPage($i);
            } else {
                $this->HTML .= $this->generatePageNavigator_OtherPage($i);
            }
        }
        if((int) $this->stopPage !== $this->amauntOfPage) {
            $this->HTML .= $this->generatePageNavigator_LastPage();
        }
        $this->HTML .= "</ul>";
    }
    
    private function generatePageNavigator_ThisPage($page) {
        $out = "<li class='ShopItemsListNavElement ThisPage'>";
        $out .= $page;
        $out .= "</li>";
        return $out;
    }
    
    private function generatePageNavigator_OtherPage($page) {
        $out = "<li class='ShopItemsListNavElement OtherPage'>";
        $out .= "<a href='".$this->getPageNavigatorElementURl($page)."'>".$page."</a>";
        $out .= "</li>";
        return $out;
    }
    
    private function generatePageNavigator_FerstPage() {
        $out = "<li class='ShopItemsListNavElement FerstPage'>";
        $out .= "<a href='".$this->getPageNavigatorElementURl(1)."'>к началу</a>";
        $out .= "</li>";
        return $out;
    }
    private function generatePageNavigator_LastPage() {
        $out = "<li class='ShopItemsListNavElement LastPage'>";
        $out .= "<a href='".$this->getPageNavigatorElementURl($this->amauntOfPage)."'>в конец</a>";
        $out .= "</li>";
        return $out;
    }
    
    private function getPageNavigatorElementURl($page) {
        if( $this->groupID !== 'root' ) {
            return ShopGroupsUrlHelper::getUrl(array('catalog', $this->groupID, 'p', $page));
        } else {
            return ShopGroupsUrlHelper::getUrl(array('p', $page));
        }
    }

    /**
     * выводим HTML
     */
    public function get() {
        echo $this->HTML;
    }
    
    /**
     * Возвращаем HTML
     * @return string $this->HTML - сгенерированный HTML
     */
    public function getHtml() {
        return $this->HTML;
    }
}
