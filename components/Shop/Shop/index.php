<?php
$ShopGroupsTree = new ShopGroupsTree();
$ShopGroupsTree->addFunctionalButton('test', '$("#" + elementId).remove()', 'Удалить элемент');
$ShopGroupsTree->addFunctionalButton('test', '$("#" + childrenGroupId).remove()', 'Удалить дочерние элементы');
$ShopGroupsTree->addFunctionalButton('MoveGroupButton', 'moveGroup ($("#" + elementId));', 'Перенести группу', true);
$ShopGroupsTree->addFunctionalButton('ImportMoveGroupButton', 'importMoveGroup ($("#" + elementId),$("#" + childrenGroupId));', 'Вставить группу');
echo $ShopGroupsTree->getTree();

$shopMainClass = new ShopMainClass();
$shopMainClass->get();