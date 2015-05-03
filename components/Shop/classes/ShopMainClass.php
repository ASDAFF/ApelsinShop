<?php
/**
 * Description of ShopMainClass
 *
 * @author Максим
 */
class ShopMainClass {
    private $params;
    private $HTML;
    private $page = 1;
    
    public function __construct() {
        global $_URL_PARAMS;
        $this->params = $_URL_PARAMS['params'];
//        var_dump($this->params);
        if ( (!isset($this->params[0])) || (isset($this->params[0]) && $this->params[0] === 'catalog') || (isset($this->params[0]) && $this->params[0] === 'p') ) {
            if (isset($this->params[0]) && $this->params[0] === 'p' && isset($this->params[1])) {
                $this->page = $this->params[1];
            } else if(isset($this->params[2]) && $this->params[2] === 'p' && isset($this->params[3])) {
                $this->page = $this->params[3];
            }
            $shopGroupsItemList = new ShopGroupsItemList($this->page);
            $this->HTML = $shopGroupsItemList->getHtml();
        } else {
            $this->HTML = "в разработке";
        }
    }
    
    public function get() {
        echo $this->HTML;
    }
    
    public function getHtml() {
        return $this->HTML;
    }
}
