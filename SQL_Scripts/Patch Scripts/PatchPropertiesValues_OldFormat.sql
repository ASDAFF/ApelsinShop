DELETE FROM `ShopItemsPropertiesValues` WHERE `value` = '';
DELETE FROM `ShopItemsPropertiesValues` WHERE `value` IS NULL;
UPDATE `ShopItemsPropertiesValues` SET `value` = REPLACE(`value`, ',', '.') WHERE `value` LIKE '%,%';