SELECT 
SG.`id`, 
SG.`groupName`, 
SG.`shown`, 
SG.`showInHierarchy`,
SGH.`group`, 
SGH.`parentGroup` 
FROM `ShopGroupsHierarchy` as SGH 
right join `ShopGroups` as SG
on SGH.`parentGroup` = SG.`id`;
where SGH.`group` IS NULL;


SELECT 
count(Pa.`alias`) as pages
FROM `Pages` as Pa
LEFT JOIN `ComponentsElements` as CE
on Pa.`componentElement` = CE.`id`
WHERE Pa.`alias` = 'test'
AND CE.`component` = 'Shop';