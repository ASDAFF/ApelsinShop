CREATE TABLE IF NOT EXISTS `ShopPropertiesFilterType` (
  `type` VARCHAR(100) NOT NULL,
  `name` VARCHAR(100) NOT NULL,
  `description` LONGTEXT NULL,
  PRIMARY KEY (`type`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `ShopPropertiesValueType` (
  `type` VARCHAR(100) NOT NULL,
  `name` VARCHAR(100) NOT NULL,
  `description` LONGTEXT NULL,
  PRIMARY KEY (`type`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `ShopProperties` (
  `id` VARCHAR(200) NOT NULL,
  `propertyName` VARCHAR(100) NOT NULL,
  `filterType` VARCHAR(100) NOT NULL,
  `valueType` VARCHAR(100) NOT NULL,
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

CREATE TABLE IF NOT EXISTS `ShopGroups` (
  `id` VARCHAR(200) NOT NULL,
  `groupName` VARCHAR(100) NOT NULL,
  `shown` TINYINT(1) UNSIGNED NOT NULL DEFAULT 1,
  `showInHierarchy` TINYINT(1) UNSIGNED NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `ShopGroupsHierarchy` (
  `group` VARCHAR(200) NOT NULL,
  `parentGroup` VARCHAR(200) NOT NULL,
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

CREATE TABLE IF NOT EXISTS `ShopPropertiesInGroups` (
  `group` VARCHAR(200) NOT NULL,
  `property` VARCHAR(200) NOT NULL,
  `sequence` INT(3) UNSIGNED NOT NULL,
  PRIMARY KEY (`group`, `property`),
  INDEX `fk_ShopPropertiesInGroups_2_idx` (`property` ASC),
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

CREATE TABLE IF NOT EXISTS `ShopItems` (
  `id` VARCHAR(200) NOT NULL,
  `itemName` VARCHAR(100) NOT NULL,
  `group` VARCHAR(200) NOT NULL,
  `action` TINYINT(1) UNSIGNED NOT NULL DEFAULT 0,
  `amount` FLOAT UNSIGNED NOT NULL,
  `minAmount` FLOAT UNSIGNED NOT NULL,
  `description` LONGTEXT NULL,
  `shown` TINYINT(1) UNSIGNED NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  INDEX `fk_ShopItems_1_idx` (`group` ASC),
  CONSTRAINT `fk_ShopItems_1`
    FOREIGN KEY (`group`)
    REFERENCES `ShopGroups` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `ShopItemsPropertiesValues` (
  `item` VARCHAR(200) NOT NULL,
  `property` VARCHAR(200) NOT NULL,
  `value` VARCHAR(200) NOT NULL,
  `measure` VARCHAR(50) NULL,
  PRIMARY KEY (`property`, `item`),
  INDEX `fk_ShopItemsPropertiesValues_1_idx` (`item` ASC),
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
  `id` VARCHAR(200) NOT NULL,
  `typeName` VARCHAR(100) NOT NULL,
  `default` TINYINT(1) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `ShopItemsPrices` (
  `item` VARCHAR(200) NOT NULL,
  `price` VARCHAR(200) NOT NULL,
  `value` FLOAT UNSIGNED NOT NULL,
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

CREATE TABLE IF NOT EXISTS `ShopLogsActionType` (
  `type` VARCHAR(100) NOT NULL,
  `name` VARCHAR(100) NOT NULL,
  `description` LONGTEXT NULL,
  PRIMARY KEY (`type`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `ShopLogs` (
  `id` VARCHAR(200) NOT NULL,
  `user` VARCHAR(25) NOT NULL,
  `actionType` VARCHAR(100) NOT NULL,
  `time` DATETIME NOT NULL,
  `title` VARCHAR(100) NOT NULL,
  `logtext` LONGTEXT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_ShopLogs_1_idx` (`user` ASC),
  INDEX `fk_ShopLogs_2_idx` (`actionType` ASC),
  CONSTRAINT `fk_ShopLogs_1`
    FOREIGN KEY (`user`)
    REFERENCES `Users` (`login`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_ShopLogs_2`
    FOREIGN KEY (`actionType`)
    REFERENCES `ShopLogsActionType` (`type`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `ShopImportLogs` (
  `importDate` DATETIME NOT NULL,
  `exportDate` DATETIME NOT NULL,
  `user` VARCHAR(25) NOT NULL,
  `success` TINYINT(1) UNSIGNED NOT NULL DEFAULT 0,
  INDEX `fk_ShopImportLogs_1_idx` (`user` ASC),
  PRIMARY KEY (`importDate`),
  CONSTRAINT `fk_ShopImportLogs_1`
    FOREIGN KEY (`user`)
    REFERENCES `Users` (`login`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


INSERT DELAYED IGNORE INTO `` (``) VALUES ();