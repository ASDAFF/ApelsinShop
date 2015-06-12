<?php
class ShopBasketModule {

    private $html;
    private $params;

    public function __construct() {
        global $_URL_PARAMS;
        $this->params = $_URL_PARAMS['params'];
        $this->generationHtml();
    }

    public function getHtml() {
        return $this->html;
    }

    private function generationHtml() {
        $urlHelper = new UrlHelper();
        $this->html = '<a href="'.$urlHelper->pageUrl(ShopPageInfoHelper::getShopPageAlias(), array('shopbasket')).'">';
            $this->html .= '<div class="ShopBasketModuleBlockBasket" id="ShopBasketModuleBlockBasket">';
                $this->html .= '<div class="ShopBasketModuleBlockBasketIcon">';
                    $this->html .= '<img src="./templates/apelsinShop/img/basket_icon.png" title="icon">';
                $this->html .= '</div>';
                $this->html .= '<div class="ShopBasketModuleBlockBasketUnit">';
                    $this->html .= ShopBasketHelper::getUnitInBasket();
                $this->html .= '</div>';
                $this->html .= '<div class="ShopBasketModuleBlockBasketTotal">';
                    $this->html .= ShopBasketHelper::getTotal();
                $this->html .= '</div>';
            $this->html .= '</div>';
        $this->html .= '</a>';
        $this->html .= '<div class="ShopBasketModule" id="ShopBasketModule"></div>';
        $this->html .= '<div class="ShopBasketModuleOneItemInBasket" id="ShopBasketModuleOneItemInBasket"></div>';
        if (!(ShopPageInfoHelper::isShopPage() && isset($this->params[0]) && $this->params[0] === ShopPageInfoHelper::getShopbasketPage())) {
            $this->html .= $this->getJS();
        }
    }

    private static function getJS() {
        $out = "<script type=\"text/javascript\">
            jQuery(document).ready(function() {
            $('.ShopBasketModuleBlockBasket').css('cursor', 'pointer');
                $('.ShopBasketModuleBlockBasket').hover(function(e) {
                    updateBasket();
                    $('#ShopBasketModule').show();
                    $('.Wraper').css('width', $('.Wraper').css('width'));
                    $('body').css('overflow', 'hidden');
                    e.stopPropagation();
                });
                $('#ShopBasketModule').mouseleave(function(e) {
                    $('.ShopBasketModule').hide();
                    $('body').css('overflow', 'auto');
                    $('.Wraper').css('width', 'auto');
                    e.stopPropagation();
                });
                $('ShopBasketModuleBlockBasket').mouseleave(function(e) {
                    $('.ShopBasketModule').hide();
                    $('body').css('overflow', 'auto');
                    $('.Wraper').css('width', 'auto');
                    e.stopPropagation();
                });
            });
            </script>";
        return $out;
    }
}
