-- item_01, item_02, item_04
SELECT `item` FROM `TestSerch` WHERE `property`='prop_01' AND `value`='value_01_t1'

-- item_01, item_02, item_03, item_04
SELECT `item` FROM `TestSerch` WHERE `property`='prop_02' AND `value`='value_02_t22'


SELECT * FROM `TestSerch` WHERE `item`='item_01' OR `item`='item_02' OR `item`='item_04'


SELECT t2.`item` FROM
(
    SELECT t1.`item` FROM
    (
        SELECT `item` FROM `TestSerch` 
        WHERE `property`='prop_01' AND `value`='value_01_t1' GROUP BY `item`
    ) as t1
    INNER JOIN `TestSerch` as t2
    ON t1.`item` = t2.`item`
    WHERE t2.`property`='prop_02' AND t2.`value`='value_02_t22' GROUP BY `item`
) as t1
INNER JOIN `TestSerch` as t2
ON t1.`item` = t2.`item`
WHERE t2.`property`='prop_02' AND t2.`value`='value_02_t21' GROUP BY `item`




SELECT
SI.`id`, 
SI.`itemName`, 
SI.`group`, 
SI.`action`, 
SI.`amount`, 
SI.`minAmount`,
SI.`description`,
SIP.`value` as priceValue
FROM `ShopItems` as SI 
LEFT JOIN `ShopItemsPrices`  as SIP
on SI.`id` = SIP.`item`
WHERE `shown` = '1' 
AND SI.`action` = '0'
AND SIP.`value` >= '100'
AND SIP.`value` <= '700'
AND (LOWER(SI.`itemName`) LIKE '%краска%' OR LOWER(SI.`itemName`) LIKE '%молот%')


ORDER BY priceValue DESC
LIMIT 20, 20





SELECT
t1.`id`, 
t1.`itemName`, 
t1.`group`, 
t1.`action`, 
t1.`amount`, 
t1.`minAmount`,
t1.`description`,
t2.`value` as priceValue
FROM (
    SELECT
    `id`, 
    `itemName`, 
    `group`, 
    `action`, 
    `amount`, 
    `minAmount`,
    `description`
    FROM `ShopItems`
    WHERE `shown` = '1' 
    AND `action` = '0'
    AND (LOWER(`itemName`) LIKE '%краска%' OR LOWER(`itemName`) LIKE '%молот%')
) as t1
LEFT JOIN `ShopItemsPrices` as t2
on t1.`id` = t2.`item`
WHERE t2.`value` AND t2.`value` >= '100' AND t2.`value` <= '700'













SELECT
`id`, 
`itemName`, 
`group`, 
`action`, 
`amount`, 
`minAmount`,
`description`
FROM `ShopItems`
WHERE `shown` = '1' 
AND `action` = '0'
AND (LOWER(`itemName`) LIKE '%краска%' OR LOWER(`itemName`) LIKE '%молот%')



SELECT
`id`, 
`itemName`, 
`group`, 
`action`, 
`amount`, 
`minAmount`,
`description`
FROM `ShopItems`
WHERE `shown` = '1'
AND `action`='0' 
AND (LOWER(`itemName`) LIKE '%краска%' OR LOWER(`itemName`) LIKE '%молот%') 













SELECT
t1.`id`, 
t2.`itemName`, 
t2.`group`, 
t2.`action`, 
t2.`amount`, 
t2.`minAmount`,
t2.`description`,
t1.`priceValue`
FROM (
    SELECT
    t1.`id`,
    t2.`value` as priceValue
    FROM (
        SELECT
        `id`
        FROM `ShopItems`
        WHERE `shown` = '1' 
        AND `action` = '0'
        AND (LOWER(`itemName`) LIKE '%краска%' OR LOWER(`itemName`) LIKE '%молот%')
    ) as t1
    LEFT JOIN `ShopItemsPrices` as t2
    on t1.`id` = t2.`item`
    WHERE t2.`price` = '288427e0-9732-11db-bbb4-0017315894a1' AND t2.`value` AND t2.`value` >= '100' AND t2.`value` <= '700'
) as t1
INNER JOIN `ShopItems` as t2
on t1.`id` = t2.`id`




SELECT
t1.`id`, 
t1.`itemName`, 
t1.`group`, 
t1.`action`, 
t1.`amount`, 
t1.`minAmount`,
t1.`description`,
t2.`value` as priceValue
FROM (
    SELECT
    t2.`id`, 
    t2.`itemName`, 
    t2.`group`, 
    t2.`action`, 
    t2.`amount`, 
    t2.`minAmount`,
    t2.`description`
    FROM (
        SELECT
        t1.`id`
        FROM (
            SELECT
            `id`
            FROM `ShopItems`
            WHERE `shown` = '1' 
            AND `action` = '0'
            AND (LOWER(`itemName`) LIKE '%краска%' OR LOWER(`itemName`) LIKE '%молот%')
        ) as t1
        LEFT JOIN `ShopItemsPrices` as t2
        on t1.`id` = t2.`item`
        WHERE t2.`price` = '288427e0-9732-11db-bbb4-0017315894a1' AND t2.`value` AND t2.`value` >= '100' AND t2.`value` <= '700'
    ) as t1
    INNER JOIN `ShopItems` as t2
    on t1.`id` = t2.`id`
) as t1
LEFT JOIN `ShopItemsPrices` as t2
on t1.`id` = t2.`item`
WHERE t2.`price` = '288427e0-9732-11db-bbb4-0017315894a1' AND t2.`value` AND t2.`value` >= '100' AND t2.`value` <= '700'








SELECT COUNT(t1.`id`) as amount
FROM (
                SELECT t1.`id` FROM (
                    
                SELECT t1.`id` FROM (
                    
            SELECT
            t1.`id`
            FROM (
                SELECT 
                `id` 
                FROM `ShopItems` 
                WHERE `shown` = '1'
                 AND (`group`='75d66d1b-99a5-11db-937f-000e0c431b59' OR `group`='01f691f1-87cd-11de-8f0e-000e0c431b58' OR `group`='01f691f2-87cd-11de-8f0e-000e0c431b58' OR `group`='75d66d49-99a5-11db-937f-000e0c431b59' OR `group`='076d216a-4380-11de-8f53-000e0c431b58' OR `group`='27566c6a-9ed8-11e3-96ad-005056be1f7b' OR `group`='9291c606-5ab3-11dc-be42-000e0c431b58' OR `group`='9291c607-5ab3-11dc-be42-000e0c431b58' OR `group`='f8e15f34-b217-11dd-8051-000e0c431b58' OR `group`='a6f80c91-516a-11dd-a89a-000e0c431b58') 
                
                
            ) as t1
            LEFT JOIN `ShopItemsPrices` as t2
            on t1.`id` = t2.`item`
            WHERE  t2.`price` = '288427e0-9732-11db-bbb4-0017315894a1'  
        
                ) as t1
                INNER JOIN `ShopItemsPropertiesValues` as t2
                on t1.`id` = t2.`item`
                WHERE t2.`property`='6cd386f1-3a4b-11e3-88c8-005056be1f7a' 
                 AND t2.`value` >= '0,75' AND t2.`value` <= '75' GROUP BY `item`
            
                ) as t1
                INNER JOIN `ShopItemsPropertiesValues` as t2
                on t1.`id` = t2.`item`
                WHERE t2.`property`='0a552a3f-3bb7-11e3-80e1-005056be1f7a' 
                 AND (t2.`value` = 'зеленый' OR t2.`value` = 'коричневый' OR t2.`value` = 'серый' OR t2.`value` = 'синий') GROUP BY `item`
) as t1