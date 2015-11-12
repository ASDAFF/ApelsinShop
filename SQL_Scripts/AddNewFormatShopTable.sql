CREATE TABLE IF NOT EXISTS `ShopExportType` (
  `type` VARCHAR(50) NOT NULL,
  `name` VARCHAR(50) NOT NULL,
  `description` LONGTEXT NULL,
  PRIMARY KEY (`type`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `ShopImportLogs` (
  `logId` VARCHAR(50) NOT NULL,
  `importDateTime` DATETIME NOT NULL,
  `exportDateTime` DATETIME NOT NULL,
  `exportType` VARCHAR(50) NOT NULL,
  `success` TINYINT(1) UNSIGNED NOT NULL DEFAULT 0,
  `errors` INT(10) UNSIGNED NOT NULL DEFAULT 0,
  `warnings` INT(10) UNSIGNED NOT NULL DEFAULT 0,
  `xmlFile` VARCHAR(50) NOT NULL,
  `logFile` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`logId`),
  INDEX `fk_ShopImportLogs_1_idx` (`exportType` ASC),
  CONSTRAINT `fk_ShopImportLogs_1`
    FOREIGN KEY (`exportType`)
    REFERENCES `ShopExportType` (`type`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `ShopGroups` (
  `id` VARCHAR(50) NOT NULL,
  `groupName` VARCHAR(50) NOT NULL,
  `shown` TINYINT(1) UNSIGNED NOT NULL DEFAULT 1,
  `showInHierarchy` TINYINT(1) UNSIGNED NOT NULL DEFAULT 1,
  `systemGroup` TINYINT(1) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `ShopGroupsHierarchy` (
  `group` VARCHAR(50) NOT NULL,
  `parentGroup` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`group`, `parentGroup`),
  INDEX `fk_ShopGroupsHierarchy_2_idx` (`parentGroup` ASC),
  CONSTRAINT `fk_ShopGroupsHierarchy_1`
    FOREIGN KEY (`group`)
    REFERENCES `ShopGroups` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_ShopGroupsHierarchy_2`
    FOREIGN KEY (`parentGroup`)
    REFERENCES `ShopGroups` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `ShopItems` (
  `id` VARCHAR(50) NOT NULL,
  `itemName` VARCHAR(200) NOT NULL,
  `article` VARCHAR(50) NULL,
  `directory` VARCHAR(50) NOT NULL,
  `directoryPath` LONGTEXT NOT NULL,
  `status` VARCHAR(50) NOT NULL,
  `type` VARCHAR(50) NOT NULL,
  `pricePer` VARCHAR(10) NOT NULL DEFAULT 'шт',
  `serviceCenter` LONGTEXT NULL,
  `action` TINYINT(1) UNSIGNED NOT NULL DEFAULT 0,
  `shown` TINYINT(1) UNSIGNED NOT NULL DEFAULT 0,
  `toRemove` TINYINT(1) UNSIGNED NOT NULL DEFAULT 0,
  `totalAmount` FLOAT UNSIGNED NOT NULL DEFAULT 0,
  `minAmount` FLOAT UNSIGNED NOT NULL DEFAULT 0,
  `description` LONGTEXT NULL,
  `group` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_ShopItems_1_idx` (`group` ASC),
  CONSTRAINT `fk_ShopItems_1`
    FOREIGN KEY (`group`)
    REFERENCES `ShopGroups` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `ShopStorages` (
  `id` VARCHAR(50) NOT NULL,
  `storageName` VARCHAR(50) NOT NULL,
  `storageName_1C` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `ShopItemsAmount` (
  `item` VARCHAR(50) NOT NULL,
  `storage` VARCHAR(50) NOT NULL,
  `value` FLOAT UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`item`, `storage`),
  INDEX `fk_ShopItemsAmount_2_idx` (`storage` ASC),
  CONSTRAINT `fk_ShopItemsAmount_1`
    FOREIGN KEY (`item`)
    REFERENCES `ShopItems` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_ShopItemsAmount_2`
    FOREIGN KEY (`storage`)
    REFERENCES `ShopStorages` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `ShopPropertiesValueType` (
  `type` VARCHAR(50) NOT NULL,
  `name` VARCHAR(50) NOT NULL,
  `description` LONGTEXT NULL,
  PRIMARY KEY (`type`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `ShopPropertiesFilterType` (
  `type` VARCHAR(50) NOT NULL,
  `name` VARCHAR(50) NOT NULL,
  `description` LONGTEXT NULL,
  PRIMARY KEY (`type`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `ShopProperties` (
  `id` VARCHAR(50) NOT NULL,
  `propertyName` VARCHAR(50) NOT NULL,
  `filterType` VARCHAR(50) NOT NULL,
  `valueType` VARCHAR(50) NOT NULL,
  `oneOfAllValues` TINYINT(1) UNSIGNED NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  INDEX `fk_ShopProperties_1_idx` (`filterType` ASC),
  INDEX `fk_ShopProperties_2_idx` (`valueType` ASC),
  CONSTRAINT `fk_ShopProperties_1`
    FOREIGN KEY (`filterType`)
    REFERENCES `ShopPropertiesFilterType` (`type`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_ShopProperties_2`
    FOREIGN KEY (`valueType`)
    REFERENCES `ShopPropertiesValueType` (`type`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `ShopPropertiesInGroups` (
  `id` VARCHAR(100) NOT NULL,
  `group` VARCHAR(50) NOT NULL,
  `property` VARCHAR(50) NOT NULL,
  `sequence` INT(5) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_ShopPropertiesInGroups_2_idx` (`property` ASC),
  UNIQUE INDEX `sequence_UNIQUE` (`group` ASC),
  CONSTRAINT `fk_ShopPropertiesInGroups_1`
    FOREIGN KEY (`group`)
    REFERENCES `ShopGroups` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_ShopPropertiesInGroups_2`
    FOREIGN KEY (`property`)
    REFERENCES `ShopProperties` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `new_shop_db`.`ShopPropertiesInGroupsRanking` (
  `group` VARCHAR(50) NOT NULL,
  `propertyInGroup` VARCHAR(100) NOT NULL,
  `sequence` INT(5) UNSIGNED NOT NULL,
  `shown` TINYINT(1) UNSIGNED NOT NULL DEFAULT 1,
  PRIMARY KEY (`group`, `propertyInGroup`),
  UNIQUE INDEX `sequence_UNIQUE` (`sequence` ASC, `group` ASC),
  INDEX `fk_ShopPropertiesInGroupsRanking_2_idx` (`propertyInGroup` ASC),
  CONSTRAINT `fk_ShopPropertiesInGroupsRanking_1`
    FOREIGN KEY (`group`)
    REFERENCES `new_shop_db`.`ShopGroups` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_ShopPropertiesInGroupsRanking_2`
    FOREIGN KEY (`propertyInGroup`)
    REFERENCES `new_shop_db`.`ShopPropertiesInGroups` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `ShopMeasure` (
  `measureF` VARCHAR(20) NOT NULL,
  `measureS` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`measureF`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `ShopMeasurePrefix` (
  `prefixF` VARCHAR(20) NOT NULL,
  `prefixS` VARCHAR(10) NOT NULL,
  `factor` FLOAT UNSIGNED NOT NULL,
  `reverseFactor` FLOAT UNSIGNED NOT NULL,
  PRIMARY KEY (`prefixF`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `ShopMeasureScaling` (
  `measure` VARCHAR(20) NOT NULL,
  `prefix` VARCHAR(20) NOT NULL,
  `aliasF` VARCHAR(20) NOT NULL,
  `aliasS` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`measure`, `prefix`),
  INDEX `fk_ShopMeasureScaling_2_idx` (`prefix` ASC),
  CONSTRAINT `fk_ShopMeasureScaling_1`
    FOREIGN KEY (`measure`)
    REFERENCES `ShopMeasure` (`measureF`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_ShopMeasureScaling_2`
    FOREIGN KEY (`prefix`)
    REFERENCES `ShopMeasurePrefix` (`prefixF`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `ShopPropertiesMeasure` (
  `property` VARCHAR(50) NOT NULL,
  `measure` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`property`, `measure`),
  INDEX `fk_ShopPropertiesMeasure_2_idx` (`measure` ASC),
  CONSTRAINT `fk_ShopPropertiesMeasure_1`
    FOREIGN KEY (`property`)
    REFERENCES `ShopProperties` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_ShopPropertiesMeasure_2`
    FOREIGN KEY (`measure`)
    REFERENCES `ShopMeasure` (`measureF`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `ShopItemsPropertiesValues` (
  `id` VARCHAR(100) NOT NULL,
  `item` VARCHAR(50) NOT NULL,
  `property` VARCHAR(50) NOT NULL,
  `value` VARCHAR(200) NOT NULL,
  `inFile` TINYINT(1) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  INDEX `fk_ShopItemsPropertiesValues_1_idx` (`item` ASC),
  INDEX `fk_ShopItemsPropertiesValues_2_idx` (`property` ASC),
  CONSTRAINT `fk_ShopItemsPropertiesValues_1`
    FOREIGN KEY (`item`)
    REFERENCES `ShopItems` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_ShopItemsPropertiesValues_2`
    FOREIGN KEY (`property`)
    REFERENCES `ShopProperties` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `ShopPricesTypes` (
  `id` VARCHAR(50) NOT NULL,
  `typeName` VARCHAR(50) NOT NULL,
  `typeName_1c` VARCHAR(50) NOT NULL,
  `default` TINYINT(1) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `ShopItemsPrices` (
  `item` VARCHAR(50) NOT NULL,
  `price` VARCHAR(50) NOT NULL,
  `value` FLOAT UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`item`, `price`),
  INDEX `fk_ShopItemsPrices_2_idx` (`price` ASC),
  CONSTRAINT `fk_ShopItemsPrices_1`
    FOREIGN KEY (`item`)
    REFERENCES `ShopItems` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_ShopItemsPrices_2`
    FOREIGN KEY (`price`)
    REFERENCES `ShopPricesTypes` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

INSERT INTO `ShopPropertiesFilterType` (`type`, `name`, `description`) VALUES
('bool', 'да/нет', 'Представляет из себя переключатель с двумя позициями: Да или Нет'),
('groupSelect', 'Множественный выбор', 'Позволяет выбрать несколько значений из всех известных'),
('none', 'Нет фильтра', 'По данному полю поиск производиться не будет.'),
('range', 'Целочисленный диапазон', 'Представляет из себя ползунок которым можно задать диапазон целых чисел'),
('select', 'Выпадающий список', 'Позволяет выбрать одно значение из всех доступных'),
('text', 'Текстовое поле', 'Текстовое поля для ввода текста для поиска');

INSERT INTO `ShopPropertiesValueType` (`type`, `name`, `description`) VALUES
('bool', 'Белевое значение', 'Белевое значение'),
('float', 'Десятичное число', 'Десятичное число'),
('int', 'Целое число', 'Целое число'),
('text', 'Текст', 'Большой объем текста с поддержкой HTML тегов'),
('varchar', 'Строка', 'Строка длинной до 200 символов');