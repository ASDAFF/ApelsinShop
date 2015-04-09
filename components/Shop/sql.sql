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

SELECT 
Pe.`alias`
FROM `ComponentsElements` AS CE 
LEFT JOIN `Pages` as Pe
ON CE.`id` = Pe.`componentElement`
WHERE CE.`alias` = 'Shop'
AND CE.`component` = 'Shop'
order by Pe.`isMainPage` desc
LIMIT 1;

SELECT SIPV.`value`
FROM `ShopItemsPropertiesValues` AS SIPV
LEFT JOIN `ShopItems` AS SI
ON SIPV.`item` = SI.`id`
WHERE 
SIPV.`property` = '0a552a3f-3bb7-11e3-80e1-005056be1f7a' AND
(SI.`group` = '01f691f1-87cd-11de-8f0e-000e0c431b58' OR SI.`group` = '01f691f2-87cd-11de-8f0e-000e0c431b58')
GROUP BY SIPV.`value`




SELECT 
SPIG.`group`,
SPIG.`property`,
SPIG.`sequence`,
SP.`propertyName`,
SP.`filterType`,
SP.`valueType`,
SP.`oneOfAllValues`
FROM `ShopPropertiesInGroups` as SPIG
LEFT JOIN `ShopProperties` AS SP
ON SPIG.`property` = SP.`id`
WHERE `group`='75d66d1b-99a5-11db-937f-000e0c431b59' OR `group`='01f691f1-87cd-11de-8f0e-000e0c431b58' OR `group`='01f691f2-87cd-11de-8f0e-000e0c431b58'




SELECT * FROM `ShopPropertiesInGroups` WHERE `group`='75d66d49-99a5-11db-937f-000e0c431b59'