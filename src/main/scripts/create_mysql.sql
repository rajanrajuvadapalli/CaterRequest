
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
ALTER TABLE cater4party.Customer ADD FOREIGN KEY (address_sk) REFERENCES cater4party.Address(id);
-- Create Foreign Key: Customer.login_sk -> Login.id
ALTER TABLE cater4party.Customer ADD FOREIGN KEY (login_sk) REFERENCES cater4party.Login(id);

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
ALTER TABLE cater4party.Restaurant ADD FOREIGN KEY (address_sk) REFERENCES cater4party.Address(id);
-- Create Foreign Key: Restaurant.login_sk -> Login.id
ALTER TABLE cater4party.Restaurant ADD FOREIGN KEY (login_sk) REFERENCES cater4party.Login(id);

CREATE TABLE cater4party.Event
(
	`id` INT NOT NULL AUTO_INCREMENT
	,PRIMARY KEY (id)
	,`customer_sk` INT NOT NULL 
	,`name` VARCHAR(250) NOT NULL 
	,`location_sk` INT NOT NULL 
	,`date_time` DATETIME NOT NULL 
	,`create_ts` DATETIME NOT NULL 
	,`lupd_ts` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP);
-- Create Foreign Key: Event.customer_sk -> Customer.id
ALTER TABLE cater4party.Event ADD FOREIGN KEY (customer_sk) REFERENCES cater4party.Customer(id);
-- Create Foreign Key: Event.location_sk -> Address.id
ALTER TABLE cater4party.Event ADD FOREIGN KEY (location_sk) REFERENCES cater4party.Address(id);

CREATE TABLE cater4party.Menu
(
	`id` INT NOT NULL AUTO_INCREMENT
	,PRIMARY KEY (id)
	,`data` VARCHAR(50000)  NULL 
	,`event_sk` INT NOT NULL 
	,`cuisine_type` VARCHAR(20) NOT NULL 
	,`create_ts` DATETIME NOT NULL 
	,`lupd_ts` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP);
-- Create Foreign Key: Menu.event_sk -> Event.id
ALTER TABLE cater4party.Menu ADD FOREIGN KEY (event_sk) REFERENCES cater4party.Event(id);

CREATE TABLE cater4party.Quote
(
	`id` INT NOT NULL AUTO_INCREMENT
	,PRIMARY KEY (id)
	,`menu_sk` INT NOT NULL 
	,`restaurant_sk` INT NOT NULL 
	,`price` DECIMAL(6,2)  NULL 
	,`status` VARCHAR(20)  NULL 
	,`create_ts` DATETIME NOT NULL 
	,`lupd_ts` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP);
-- Create Foreign Key: Quote.menu_sk -> Menu.id
ALTER TABLE cater4party.Quote ADD FOREIGN KEY (menu_sk) REFERENCES cater4party.Menu(id);
-- Create Foreign Key: Quote.restaurant_sk -> Restaurant.id
ALTER TABLE cater4party.Quote ADD FOREIGN KEY (restaurant_sk) REFERENCES cater4party.Restaurant(id);

