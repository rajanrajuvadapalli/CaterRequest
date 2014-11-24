
CREATE TABLE cater4party.Login (
	`id` INT NOT NULL AUTO_INCREMENT
	,PRIMARY KEY (id)
	,`username` VARCHAR(50) NOT NULL 
	,`password` VARCHAR(250) NOT NULL 
	,`role` VARCHAR(20) NOT NULL 
	,`active` BIT NOT NULL 
	,`create_ts` DATETIME NOT NULL
	,`lupd_ts` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP);

CREATE TABLE cater4party.Address (
	`id` INT NOT NULL  AUTO_INCREMENT
	,PRIMARY KEY (id)
	,`street1` VARCHAR(50) NOT NULL 
	,`street2` VARCHAR(50)  NULL 
	,`city` VARCHAR(20) NOT NULL 
	,`state` VARCHAR(2) NOT NULL 
	,`zip` VARCHAR(9) NOT NULL 
	,`create_ts` DATETIME NOT NULL
	,`lupd_ts` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP);

CREATE TABLE cater4party.Customer (
	`id` INT NOT NULL AUTO_INCREMENT
	,PRIMARY KEY (id)
	,`name` VARCHAR(50) NOT NULL 
	,`login_sk` INT NOT NULL 
	,`contact_number` VARCHAR(20) NOT NULL 
	,`contact_email` VARCHAR(50) NOT NULL 
	,`address_sk` INT  NULL 
	,`create_ts` DATETIME NOT NULL
	,`lupd_ts` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP);
-- Create Foreign Key: Customer.address_sk -> Address.id
ALTER TABLE Customer ADD FOREIGN KEY (address_sk) REFERENCES Address(id);
-- Create Foreign Key: Customer.login_sk -> Login.id
ALTER TABLE Customer ADD FOREIGN KEY (login_sk) REFERENCES Login(id);

CREATE TABLE cater4party.Restaurant (
	`id` INT NOT NULL AUTO_INCREMENT
	,PRIMARY KEY (id)
	,`name` VARCHAR(50) NOT NULL 
	,`address_sk` INT NOT NULL 
	,`login_sk` INT NOT NULL 
	,`contact_number` VARCHAR(20) NOT NULL 
	,`contact_email` VARCHAR(50) NOT NULL 
	,`cuisine_type` VARCHAR(20) NOT NULL 
	,`website_url` VARCHAR(50)  NULL 
	,`create_ts` DATETIME NOT NULL 
	,`lupd_ts` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP);
-- Create Foreign Key: Restaurant.address_sk -> Address.id
ALTER TABLE Restaurant ADD FOREIGN KEY (address_sk) REFERENCES Address(id);
-- Create Foreign Key: Restaurant.login_sk -> Login.id
ALTER TABLE Restaurant ADD FOREIGN KEY (login_sk) REFERENCES Login(id);

