<?php
$urlHelper = new UrlHelper();
$thisPage = 'http://'.$_SERVER["SERVER_NAME"].'/'.$urlHelper->getThisPage();
?>
<div class="socialPanelBox">
<!-- apelsin.ru -->
<!-- vk -->
<!--<div class="socialPanelElement vk">
    <div id="vk_like"></div>
    <script type="text/javascript">
    VK.Widgets.Like("vk_like", {type: "mini", verb: 1});
    </script>
</div>-->

<!-- compuproject.com -->
<!-- vk -->
<div class="socialPanelElement vk">
    <div id="vk_like"></div>
    <script type="text/javascript">
    VK.Widgets.Like("vk_like", {type: "mini", verb: 1});
    </script>
</div>
<!-- facebook -->
<div class="socialPanelElement facebook">
    <div class="fb-like" data-href="<?php echo $thisPage?>" data-layout="button_count" data-action="like" data-show-faces="true" data-share="true"></div>
</div>
<!-- google -->
<div class="socialPanelElement google">
    <div class="g-plusone" data-size="medium"></div>
    <script type="text/javascript">
      window.___gcfg = {lang: 'ru'};

      (function() {
        var po = document.createElement('script'); po.type = 'text/javascript'; po.async = true;
        po.src = 'https://apis.google.com/js/platform.js';
        var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s);
      })();
    </script>
</div>
<!-- mail.ru -->
<div class="socialPanelElement mailru">
    <a target="_blank" class="mrc__plugin_uber_like_button" href="http://connect.mail.ru/share" data-mrc-config="{'nt' : '1', 'cm' : '1', 'sz' : '20', 'st' : '2', 'tp' : 'mm'}">Нравится</a>
    <script src="http://cdn.connect.mail.ru/js/loader.js" type="text/javascript" charset="UTF-8"></script>
</div>
<!-- odnoklassniki -->
<div class="socialPanelElement odnoklassniki">
    <div id="ok_shareWidget"></div>
    <script>
    !function (d, id, did, st) {
      var js = d.createElement("script");
      js.src = "http://connect.ok.ru/connect.js";
      js.onload = js.onreadystatechange = function () {
      if (!this.readyState || this.readyState == "loaded" || this.readyState == "complete") {
        if (!this.executed) {
          this.executed = true;
          setTimeout(function () {
            OK.CONNECT.insertShareWidget(id,did,st);
          }, 0);
        }
      }};
      d.documentElement.appendChild(js);
    }(document,"ok_shareWidget","<?php echo $thisPage?>","{width:100,height:30,st:'rounded',sz:20,nt:1}");
    </script>
</div>


</div>