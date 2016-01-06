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




SELECT 
`id`, 
`itemName`, 
`group`, 
`action`, 
`amount`, 
`minAmount`, 
`description`, 
`shown` 
FROM 
`ShopItems` 
WHERE




SELECT 
SI.`id`, 
SI.`itemName`, 
SI.`group`, 
SI.`action`, 
SI.`amount`, 
SI.`minAmount`, 
SI.`description`, 
SI.`shown`
FROM `ShopItems` as SI LEFT JOIN `ShopItemsPropertiesValues` as SIPV
on SI.`id`=SIPV.`item`
where 
(
    (SIPV.`property`='bbea9c1a-3a4b-11e3-88c8-005056be1f7a' AND SIPV.`value`='для потолков') OR
    (SIPV.`property`='bbea9c1a-3a4b-11e3-88c8-005056be1f7a' AND SIPV.`value`='для стен') OR
    (SIPV.`property`='e765ba72-107d-11e3-8a5d-0050569a1080' AND SIPV.`value`='база С') OR
    (SIPV.`property`='0a552a3f-3bb7-11e3-80e1-005056be1f7a' AND SIPV.`value`='белый') OR
    (SIPV.`property`='42d0b52f-970f-11e4-9be0-005056be1f7c' AND SIPV.`value`='краска')
) 
AND SI.`shown`='1'
AND SI.`action`='1'
GROUP BY SI.`id`


SELECT
SI.`id`, 
SI.`itemName`, 
SI.`group`, 
SI.`action`, 
SI.`amount`, 
SI.`minAmount`, 
SI.`description`, 
SI.`shown`, 
SI.`price`, 
SI.`value`,
SI.`typeName`, 
SI.`default`
FROM (
    SELECT 
    SI.`id`, 
    SI.`itemName`, 
    SI.`group`, 
    SI.`action`, 
    SI.`amount`, 
    SI.`minAmount`, 
    SI.`description`, 
    SI.`shown`, 
    SI.`price`, 
    SI.`value`,
    SPT.`typeName`, 
    SPT.`default`
    FROM(
        SELECT 
        SI.`id`, 
        SI.`itemName`, 
        SI.`group`, 
        SI.`action`, 
        SI.`amount`, 
        SI.`minAmount`, 
        SI.`description`, 
        SI.`shown`, 
        SIP.`price`, 
        SIP.`value`
        FROM (
            SELECT 
            SI.`id`, 
            SI.`itemName`, 
            SI.`group`, 
            SI.`action`, 
            SI.`amount`, 
            SI.`minAmount`, 
            SI.`description`, 
            SI.`shown`
            FROM `ShopItems` as SI 
            LEFT JOIN `ShopItemsPropertiesValues` as SIPV
            on SI.`id` = SIPV.`item`
            where 
            (
                (SIPV.`property`='bbea9c1a-3a4b-11e3-88c8-005056be1f7a' AND SIPV.`value`='для потолков') OR
                (SIPV.`property`='bbea9c1a-3a4b-11e3-88c8-005056be1f7a' AND SIPV.`value`='для стен') OR
                (SIPV.`property`='e765ba72-107d-11e3-8a5d-0050569a1080' AND SIPV.`value`='база С') OR
                (SIPV.`property`='0a552a3f-3bb7-11e3-80e1-005056be1f7a' AND SIPV.`value`='белый') OR
                (SIPV.`property`='42d0b52f-970f-11e4-9be0-005056be1f7c' AND SIPV.`value`='краска')
            )
            AND SI.`shown`='1'
            AND SI.`action`='1'
            GROUP BY SI.`id`
        ) as SI 
        LEFT JOIN `ShopItemsPrices` as SIP
        on SI.`id` = SIP.`item`
    ) as SI 
    LEFT JOIN `ShopPricesTypes` as SPT
    on SI.`price` = SPT.`id`
    where SI.`price`='feff0694-99ab-11db-937f-000e0c431b33' 
    OR SPT.`default`='1'
    ORDER BY SPT.`default` ASC
) SI
GROUP BY SI.`id`
HAVING SPT.`default` = '0'




GROUP BY SI.`id`

feff0694-99ab-11db-937f-000e0c431b33










SELECT 
SI.`id`, 
SI.`itemName`, 
SI.`group`, 
SI.`action`, 
SI.`amount`, 
SI.`minAmount`, 
SI.`description`, 
SI.`shown`, 
SI.`price`, 
SI.`value`,
SPT.`typeName`, 
SPT.`default`
FROM(
    SELECT 
    SI.`id`, 
    SI.`itemName`, 
    SI.`group`, 
    SI.`action`, 
    SI.`amount`, 
    SI.`minAmount`, 
    SI.`description`, 
    SI.`shown`, 
    SIP.`price`, 
    SIP.`value`
    FROM (
        SELECT 
        SI.`id`, 
        SI.`itemName`, 
        SI.`group`, 
        SI.`action`, 
        SI.`amount`, 
        SI.`minAmount`, 
        SI.`description`, 
        SI.`shown`
        FROM `ShopItems` as SI 
        LEFT JOIN `ShopItemsPropertiesValues` as SIPV
        on SI.`id` = SIPV.`item`
        where 
        (
            (SIPV.`property`='bbea9c1a-3a4b-11e3-88c8-005056be1f7a' AND SIPV.`value`='для потолков') OR
            (SIPV.`property`='bbea9c1a-3a4b-11e3-88c8-005056be1f7a' AND SIPV.`value`='для стен') OR
            (SIPV.`property`='e765ba72-107d-11e3-8a5d-0050569a1080' AND SIPV.`value`='база С') OR
            (SIPV.`property`='0a552a3f-3bb7-11e3-80e1-005056be1f7a' AND SIPV.`value`='белый') OR
            (SIPV.`property`='42d0b52f-970f-11e4-9be0-005056be1f7c' AND SIPV.`value`='краска')
        )
        AND SI.`shown`='1'
        AND SI.`action`='1'
        GROUP BY SI.`id`
    ) as SI 
    LEFT JOIN `ShopItemsPrices` as SIP
    on SI.`id`=SIP.`item`
) SI 
LEFT JOIN `ShopPricesTypes` as SPT
on SI.`price` = SPT.`id`
GROUP BY SI.`id`
ORDER BY wp_posts.post_date DESC








SELECT 
SI.`id`, 
SI.`itemName`, 
SI.`group`, 
SI.`action`, 
SI.`amount`, 
SI.`minAmount`, 
SI.`description`, 
SI.`shown`,  
SI.`value` as default_value
FROM(
    SELECT 
    SI.`id`, 
    SI.`itemName`, 
    SI.`group`, 
    SI.`action`, 
    SI.`amount`, 
    SI.`minAmount`, 
    SI.`description`, 
    SI.`shown`, 
    SIP.`price`, 
    SIP.`value`
    FROM (
        SELECT 
        SI.`id`, 
        SI.`itemName`, 
        SI.`group`, 
        SI.`action`, 
        SI.`amount`, 
        SI.`minAmount`, 
        SI.`description`, 
        SI.`shown`
        FROM `ShopItems` as SI 
        LEFT JOIN `ShopItemsPropertiesValues` as SIPV
        on SI.`id` = SIPV.`item`
        where 
        (
            (SIPV.`property`='bbea9c1a-3a4b-11e3-88c8-005056be1f7a' AND SIPV.`value`='для потолков') OR
            (SIPV.`property`='bbea9c1a-3a4b-11e3-88c8-005056be1f7a' AND SIPV.`value`='для стен') OR
            (SIPV.`property`='e765ba72-107d-11e3-8a5d-0050569a1080' AND SIPV.`value`='база С') OR
            (SIPV.`property`='0a552a3f-3bb7-11e3-80e1-005056be1f7a' AND SIPV.`value`='белый') OR
            (SIPV.`property`='42d0b52f-970f-11e4-9be0-005056be1f7c' AND SIPV.`value`='краска')
        )
        AND SI.`shown`='1'
        AND SI.`action`='1'
        GROUP BY SI.`id`
    ) as SI 
    LEFT JOIN `ShopItemsPrices` as SIP
    on SI.`id` = SIP.`item`
) as SI 
LEFT JOIN `ShopPricesTypes` as SPT
on SI.`price` = SPT.`id`
where SPT.`id`='feff0694-99ab-11db-937f-000e0c431b33'

where SPT.`default`='1'


where SI.`price`='feff0694-99ab-11db-937f-000e0c431b33'


















--- список групп которые у нас отображаются
SELECT `id` FROM `ShopGroups` WHERE (
`id`='75d66d49-99a5-11db-937f-000e0c431b59' OR 
`id`='076d216a-4380-11de-8f53-000e0c431b58' OR 
`id`='27566c6a-9ed8-11e3-96ad-005056be1f7b'
) AND `shown`='1'

SELECT
SI.`id`, 
SI.`itemName`, 
SI.`group`, 
SI.`action`, 
SI.`amount`, 
SI.`minAmount`, 
SI.`amount`/SI.`minAmount` as amountKe,
round(SI.`amount`/SI.`minAmount`) as amountK,
SI.`description`,
SIP.`value` as priceValue
FROM(
    SELECT
    SI.`id`, 
    SI.`itemName`, 
    SI.`group`, 
    SI.`action`, 
    SI.`amount`, 
    SI.`minAmount`,
    SI.`description`
    FROM(
        SELECT 
        `id`, 
        `itemName`, 
        `group`, 
        `action`, 
        `amount`, 
        `minAmount`,
        `description`
        FROM `ShopItems` 
        WHERE 
        (
            `group`='75d66d49-99a5-11db-937f-000e0c431b59' OR 
            `group`='076d216a-4380-11de-8f53-000e0c431b58' OR 
            `group`='27566c6a-9ed8-11e3-96ad-005056be1f7b'
        ) AND `shown`='1' AND `action`='0'
    ) as SI 
    LEFT JOIN 
    `ShopItemsPropertiesValues` as SIPV
    on SI.`id` = SIPV.`item`
    where 
    (
        (SIPV.`property`='e8287600-ad96-11e3-b114-005056be1f7c' AND SIPV.`value`='ЛАКРА') OR
        (SIPV.`property`='cce0ab91-6a67-11e4-8945-005056be1f7a' AND SIPV.`value`='Россия')
    ) OR (
        LOWER(SI.`itemName`) LIKE '%штукатурка%' OR 
        LOWER(SI.`itemName`) LIKE '%структурная%'
    )
    GROUP BY SI.`id`
) as SI 
LEFT JOIN 
`ShopItemsPrices`  as SIP
on SI.`id` = SIP.`item`
where 
SIP.`price` = '288427e0-9732-11db-bbb4-0017315894a1'
AND SIP.`value` >= '855'
AND SIP.`value` <= '979'
ORDER BY priceValue DESC






SELECT
count(SI.`id`) as amount
FROM `ShopItems` as SI 
LEFT JOIN `ShopItemsPrices`  as SIP
on SI.`id` = SIP.`item`
WHERE
`shown`='1' AND
`action`='0' AND
SIP.`price` = '288427e0-9732-11db-bbb4-0017315894a1'
AND SIP.`value` >= '855'
AND SIP.`value` <= '979'
AND (
    LOWER(SI.`itemName`) LIKE '%штукатурка%' OR 
    LOWER(SI.`itemName`) LIKE '%структурная%'
)












SELECT
            SI.`id`, 
            SI.`itemName`, 
            SI.`group`, 
            SI.`action`, 
            SI.`amount`, 
            SI.`minAmount`,
            SI.`description`,
            SIP.`value` as priceValue
            FROM(
                SELECT
                SI.`id`, 
                SI.`itemName`, 
                SI.`group`, 
                SI.`action`, 
                SI.`amount`, 
                SI.`minAmount`,
                SI.`description`
                FROM(
                    SELECT 
                    `id`, 
                    `itemName`, 
                    `group`, 
                    `action`, 
                    `amount`, 
                    `minAmount`,
                    `description`
                    FROM `ShopItems` 
                    WHERE `shown`='1' AND (`group`='27566c6a-9ed8-11e3-96ad-005056be1f7b')) as SI 
                LEFT JOIN 
                `ShopItemsPropertiesValues` as SIPV
                on SI.`id` = SIPV.`item`
                where  
                (LOWER(SI.`itemName`) LIKE '%Лакра%')  AND 
                (SIPV.`property`='27c97b3a-3bc1-11e3-80e1-005056be1f7a' AND SIPV.`value`='внутренние работы') OR (SIPV.`property`='e765ba75-107d-11e3-8a5d-0050569a1080' AND SIPV.`value` >= '9' AND SIPV.`value` <= '18') OR (SIPV.`property`='1ea6fcc4-d206-11e4-9be0-005056be1f7c' AND SIPV.`value` >= '0' AND SIPV.`value` <= '3')GROUP BY SI.`id`
            ) as SI 
            LEFT JOIN 
            `ShopItemsPrices`  as SIP
            on SI.`id` = SIP.`item`
            where SIP.`price` = '288427e0-9732-11db-bbb4-0017315894a1' ORDER BY priceValue DESC LIMIT 0, 50











(
    LOWER(SI.`itemName`) LIKE '%2%'
) 
AND 
(
    (SIPV.`property`='e765ba75-107d-11e3-8a5d-0050569a1080' AND SIPV.`value` >= '9' AND SIPV.`value` <= '18') AND 
    (SIPV.`property`='42d0b52f-970f-11e4-9be0-005056be1f7c' AND SIPV.`value`='краска фактурная') AND 
    (SIPV.`property`='1ea6fcc4-d206-11e4-9be0-005056be1f7c' AND SIPV.`value` >= '0' AND SIPV.`value` <= '3')
) 



SELECT
count(SI.`id`) as amount
FROM(
    SELECT
    SI.`id`, 
    SI.`itemName`
    FROM(
        SELECT 
        `id`, 
        `itemName`
        FROM `ShopItems` 
        WHERE `shown`='1' AND (`group`='27566c6a-9ed8-11e3-96ad-005056be1f7b')) as SI 
    LEFT JOIN 
    `ShopItemsPropertiesValues` as SIPV
    on SI.`id` = SIPV.`item`
    where  (
        (SIPV.`property`='27c97b3a-3bc1-11e3-80e1-005056be1f7a' AND SIPV.`value`='внутренние работы') AND 
        (SIPV.`property`='e765ba75-107d-11e3-8a5d-0050569a1080' AND SIPV.`value` >= '9' AND SIPV.`value` <= '18') AND 
        (SIPV.`property`='1ea6fcc4-d206-11e4-9be0-005056be1f7c' AND SIPV.`value` >= '0' AND SIPV.`value` <= '3') 
    ) GROUP BY SI.`id`
) as SI 
LEFT JOIN 
`ShopItemsPrices`  as SIP
on SI.`id` = SIP.`item`
where SIP.`price` = '288427e0-9732-11db-bbb4-0017315894a1'


SELECT
count(SI.`id`) as amount
FROM(
    SELECT
    SI.`id`, 
    SI.`itemName`
    FROM(
        SELECT 
        `id`, 
        `itemName`
        FROM `ShopItems` 
        WHERE `shown`='1' AND (`group`='27566c6a-9ed8-11e3-96ad-005056be1f7b')) as SI 
    LEFT JOIN 
    `ShopItemsPropertiesValues` as SIPV
    on SI.`id` = SIPV.`item`
    where  (
        (SIPV.`property`='27c97b3a-3bc1-11e3-80e1-005056be1f7a' AND SIPV.`value`='внутренние работы') AND 
        (SIPV.`property`='1ea6fcc4-d206-11e4-9be0-005056be1f7c' AND SIPV.`value` >= '0' AND SIPV.`value` <= '3') 
    ) GROUP BY SI.`id`
) as SI 
LEFT JOIN 
`ShopItemsPrices`  as SIP
on SI.`id` = SIP.`item`
where SIP.`price` = '288427e0-9732-11db-bbb4-0017315894a1'



SELECT
SI.`id` 
FROM(
    SELECT
    SI.`id`, 
    SI.`itemName`
    FROM(
        SELECT 
        `id`, 
        `itemName`
        FROM `ShopItems` 
        WHERE `shown`='1' AND (`group`='27566c6a-9ed8-11e3-96ad-005056be1f7b')) as SI 
    LEFT JOIN 
    `ShopItemsPropertiesValues` as SIPV
    on SI.`id` = SIPV.`item`
    where  (
        (SIPV.`property`='27c97b3a-3bc1-11e3-80e1-005056be1f7a' AND SIPV.`value`='внутренние работы')
    ) GROUP BY SI.`id`
) as SI 
LEFT JOIN 
`ShopItemsPrices`  as SIP
on SI.`id` = SIP.`item`
where SIP.`price` = '288427e0-9732-11db-bbb4-0017315894a1'















SELECT COUNT(t1.`id`) as amount 
FROM (
    SELECT t1.`id` 
    FROM (
        SELECT t1.`id` 
        FROM (
            SELECT t1.`id`
            FROM (
                SELECT `id` 
                FROM `ShopItems` 
                WHERE `shown` = '1' AND (`group`='27566c6a-9ed8-11e3-96ad-005056be1f7b')
            ) as t1
            LEFT JOIN `ShopItemsPrices` as t2
            on t1.`id` = t2.`item`
            WHERE  t2.`price` = '288427e0-9732-11db-bbb4-0017315894a1'
        ) as t1
        INNER JOIN `ShopItemsPropertiesValues` as t2
        on t1.`id` = t2.`item`
        WHERE t2.`property`='e765ba75-107d-11e3-8a5d-0050569a1080' AND t2.`value` >= 9.5 AND t2.`value` <= 18 GROUP BY `item`
    ) as t1
    INNER JOIN `ShopItemsPropertiesValues` as t2
    on t1.`id` = t2.`item`
    WHERE t2.`property`='1ea6fcc4-d206-11e4-9be0-005056be1f7c' AND t2.`value` >= 0 AND t2.`value` <= 3 GROUP BY `item`
) as t1;
