<?php     

    class LangPanel {
        private $totalLang;
        private $langs;
        private $html;
        
        public function __construct() {
            global $_URL_PARAMS;
            $this->getTotalLang($_URL_PARAMS['lang']);
            $this->getAllLengs();
            $this->generateHTML();
        }
        
        private function getTotalLang($lang) {
            $query = "Select * from `Lang` where `lang`='$lang';";
            $mySqlHelper = new MySqlHelper($query);
            $this->totalLang = $mySqlHelper->getDataRow(0);
        }
        
        private function getAllLengs() {
            $query = "Select * from `Lang` order by `default` desc;";
            $mySqlHelper = new MySqlHelper($query);
            $this->langs = $mySqlHelper->getAllData();
        }
        
        private function generateHTML() {
            $out = "";
            $out .= '<div id="dd" class="wrapper-dropdown-2" tabindex="1">';
//            $out .= $this->totalLang['langName'];
            $out .= '<div class="flag flag-'.strtolower($this->totalLang['lang']).'" title="'.$this->totalLang['langName'].'"></div>';
            $out .= '<ul class="dropdown">';
            $urlHelper = new UrlHelper();
            foreach ($this->langs as $lang) {
                $out .= '<li><a href="'.$urlHelper->chengeLangUrl($lang['lang']).
                        '"></i>';
//                $out .= $lang['langName'];
                $out .= '<div class="flag flag-'.strtolower($lang['lang']).'" title="'.$lang['langName'].'"></div>';
                $out .= '</a></li>';
            }
            $out .= '</ul></div>';
            $out .= "
                <script type='text/javascript'>
                    function DropDown(el) {
                        this.dd = el;
                        this.initEvents();
                    }
                    DropDown.prototype = {
                        initEvents : function() {
                            var obj = this;
                            obj.dd.on('click', function(event){
                                $(this).toggleClass('active');
                                event.stopPropagation();
                            });	
                        }
                    }
                    $(function() {
                        var dd = new DropDown( $('#dd') );
                        $(document).click(function() {
                            // all dropdowns
                            $('.wrapper-dropdown-2').removeClass('active');
                        });

                    });
                </script>";
            $this->html = $out; 
        }
        
        public function init() {
            echo $this->html;
        }
    }
    $langPanel = new LangPanel();
    $langPanel->init();
?>