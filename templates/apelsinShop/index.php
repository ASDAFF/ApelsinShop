<!DOCTYPE html>
<?php global $ROOT;?>
<html>
<head>
    <?php $ROOT->head();?>
    <link rel="shortcut icon" href="<?php $ROOT->templatePath();?>favicon.ico" type="image/x-icon">
    <link rel="stylesheet" href="<?php $ROOT->templatePath();?>css/main.css" type="text/css" />
    <link rel="stylesheet" href="<?php $ROOT->templatePath();?>css/modules.css" type="text/css" />
    <link rel="stylesheet" href="<?php $ROOT->templatePath();?>css/siteMenu.css" type="text/css" />
    <link rel="stylesheet" href="<?php $ROOT->templatePath();?>css/shopNavigationPanel.css" type="text/css" />
    <link rel="stylesheet" href="<?php $ROOT->templatePath();?>css/shopItemsList.css" type="text/css" />
    <link rel="stylesheet" href="<?php $ROOT->templatePath();?>css/shopItem.css" type="text/css" />
    <link rel="stylesheet" href="<?php $ROOT->templatePath();?>css/ShopBasket.css" type="text/css" />
    <link rel="stylesheet" href="<?php $ROOT->templatePath();?>css/ShopBasketModule.css" type="text/css" />
    <link rel="stylesheet" href="<?php $ROOT->templatePath();?>css/ThisGroupPathPanel.css" type="text/css" />
    <script src="<?php $ROOT->templatePath();?>js/TemplateAnimations.js"></script>
    <link rel="stylesheet" href="<?php $ROOT->templatePath();?>css/print.css" type="text/css" />
</head>
<body>
    <?php $ROOT->bodyStart();?>
    <div class="Wraper">
        <div class="HeadWraper">
            <div class="HeadWraperBlock">
                <div class="SiteLogo"><img src='<?php $ROOT->templatePath();?>img/SiteLogo.png'></div>
                <div class="LeftHeadWraper">
                    <div class="LeftHeadBlock">
                        <div class="LeftTopHeadWraper">
                            <div class="LeftTopHeadBlock">
                                <?php $ROOT->block('LeftTopHeadBlock');?>
                            </div>
                        </div>
                        <div class="LeftBottomHeadWraper">
                            <div class="LeftBottomHeadBlock">
                                <?php $ROOT->block('LeftBottomHeadBlock');?>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="MenuWraper">
            <div class="MenuBlock">
                <?php $ROOT->block('MenuBlock');?>
            </div>
        </div>
        <div class="BeforeContentWraper">
            <div class="BeforeContentBlock">
                <?php $ROOT->block('BeforeContentBlock');?>
            </div>
        </div>
        <div class="BeforeContentButtonWraper">
            <div class="BeforeContentButtonBlock">
                <div class="BeforeContentButton">
                    <div class="BeforeContentButtonText HideText"></div>
                </div>
            </div>
        </div>
        <div class="ContentWraper">
            <div class="ContentBlock">
                <div class="ContentTopWraper">
                    <div class="ContentTopBlock">
                        <?php $ROOT->block('ContentTopBlock');?>
                    </div>
                </div>
                <div class="ContentMainWraper">
                    <div class="ContentMainBlock">
                        <?php $ROOT->content(); ?>
                    </div>
                </div>
                <div class="ContentBottomWraper">
                    <div class="ContentBottomBlock">
                        <?php $ROOT->block('ContentBottomBlock');?>
                    </div>
                </div>
            </div>
        </div>
        <div class="AfterContentWraper">
            <div class="AfterContentBlock">
                <?php $ROOT->block('AfterContentBlock');?>
            </div>
        </div>
        <div class="FutterWraper">
            <div class="FutterBlock">
                <div class="FutterLeftWraper">
                    <div class="FutterLeftBlock">
                        <?php $ROOT->block('FutterLeftBlock');?>
                        <div class="clear"></div>
                    </div>
                </div>
                <div class="FutterRightWraper">
                    <div class="FutterRightBlock">
                        <?php $ROOT->block('FutterRightBlock');?>
                        <div class="clear"></div>
                    </div>
                </div>
            </div>
            <div class="clear"></div>
        </div>
    </div>
    <?php $ROOT->bodyEnd();?>
</body>
</html>
