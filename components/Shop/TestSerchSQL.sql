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