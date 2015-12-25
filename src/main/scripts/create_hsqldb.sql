CREATE TABLE cater4party.Login (
	id INT NOT NULL IDENTITY
	,username VARCHAR(50) NOT NULL 
	,password VARCHAR(250) NOT NULL 
	,role VARCHAR(20) NOT NULL 
	,active BIT NOT NULL 
	,create_ts DATETIME NOT NULL
	,lupd_ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP );

CREATE TABLE cater4party.Address (
	id INT NOT NULL  IDENTITY
	,street1 VARCHAR(50) NOT NULL 
	,street2 VARCHAR(50)  NULL 
	,city VARCHAR(20) NOT NULL 
	,state VARCHAR(2) NOT NULL 
	,zip VARCHAR(9) NOT NULL 
	,create_ts DATETIME NOT NULL
	,lupd_ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP );

CREATE TABLE cater4party.Customer (
	id INT NOT NULL IDENTITY
	,name VARCHAR(50) NOT NULL 
	,login_sk INT NOT NULL 
	,contact_number VARCHAR(20) NOT NULL
	,number_verified BIT NOT NULL
	,sms_ok BIT NOT NULL
	,contact_email VARCHAR(50) NOT NULL 
	,address_sk INT  NULL 
	,create_ts DATETIME NOT NULL
	,lupd_ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP );
-- Create Foreign Key: Customer.address_sk -> Address.id
ALTER TABLE cater4party.Customer ADD FOREIGN KEY (address_sk) REFERENCES cater4party.Address(id);
-- Create Foreign Key: Customer.login_sk -> Login.id
ALTER TABLE cater4party.Customer ADD FOREIGN KEY (login_sk) REFERENCES cater4party.Login(id);

CREATE TABLE cater4party.Restaurant (
	id INT NOT NULL IDENTITY
	,name VARCHAR(50) NOT NULL 
	,login_sk INT NOT NULL 
	,cuisine_type VARCHAR(20) NOT NULL 
	,website_url VARCHAR(50)  NULL
	,about_us VARCHAR(5000) NULL
	,create_ts DATETIME NOT NULL 
	,lupd_ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP );
-- Create Foreign Key: Restaurant.login_sk -> Login.id
ALTER TABLE cater4party.Restaurant ADD FOREIGN KEY (login_sk) REFERENCES cater4party.Login(id);

CREATE TABLE cater4party.Restaurant_branch (
	id INT NOT NULL IDENTITY
	,restaurant_sk INT NOT NULL
	,address_sk INT NOT NULL
	,contact_number VARCHAR(20) NOT NULL
	,number_verified BIT NOT NULL
	,contact_email VARCHAR(50) NOT NULL
	,deliver_miles INT NOT NULL
	,sales_tax DECIMAL(4,2) NOT NULL
	,create_ts DATETIME NOT NULL
	,lupd_ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP );
-- Create Foreign Key: Restaurant_branch.restaurant_sk -> Restaurant.id
ALTER TABLE cater4party.Restaurant_branch ADD FOREIGN KEY (restaurant_sk) REFERENCES cater4party.Restaurant(id);
-- Create Foreign Key: Restaurant_branch.address_sk -> Address.id
ALTER TABLE cater4party.Restaurant_branch ADD FOREIGN KEY (address_sk) REFERENCES cater4party.Address(id);

CREATE TABLE cater4party.Event
(
	id INT NOT NULL IDENTITY
	,customer_sk INT NOT NULL
	,status VARCHAR(30)  NULL
	,name VARCHAR(250) NOT NULL 
	,location_sk INT NOT NULL 
	,date_time DATETIME NOT NULL 
	,person_count INT NULL
	,kids_count INT NULL
	,pick_up BIT NOT NULL
	,budget_total INT NULL 
	,create_ts DATETIME NOT NULL 
	,lupd_ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP );
-- Create Foreign Key: Event.customer_sk -> Customer.id
ALTER TABLE cater4party.Event ADD FOREIGN KEY (customer_sk) REFERENCES cater4party.Customer(id);
-- Create Foreign Key: Event.location_sk -> Address.id
ALTER TABLE cater4party.Event ADD FOREIGN KEY (location_sk) REFERENCES cater4party.Address(id);

CREATE TABLE cater4party.Menu
(
	id INT NOT NULL IDENTITY
	,data VARCHAR(10000)  NULL 
	,event_sk INT NOT NULL 
	,cuisine_type VARCHAR(20) NOT NULL
	,comments VARCHAR(1000) NULL
	,create_ts DATETIME NOT NULL 
	,lupd_ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP );
-- Create Foreign Key: Menu.event_sk -> Event.id
ALTER TABLE cater4party.Menu ADD FOREIGN KEY (event_sk) REFERENCES cater4party.Event(id);

CREATE TABLE cater4party.Quote
(
	id INT NOT NULL IDENTITY
	,menu_sk INT NOT NULL 
	,restaurant_branch_sk INT NOT NULL 
	,price DECIMAL(10,2)  NULL
	,deliver BIT NOT NULL
	,status VARCHAR(30)  NULL 
	,notes VARCHAR(1000) NULL
	,create_ts DATETIME NOT NULL 
	,lupd_ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP );
-- Create Foreign Key: Quote.menu_sk -> Menu.id
ALTER TABLE cater4party.Quote ADD FOREIGN KEY (menu_sk) REFERENCES cater4party.Menu(id);
-- Create Foreign Key: Quote.restaurant_branch_sk -> Restaurant_branch.id
ALTER TABLE cater4party.Quote ADD FOREIGN KEY (restaurant_branch_sk) REFERENCES cater4party.Restaurant_branch(id);

select * from cater4party.Restaurant;
select * from cater4party.Restaurant_branch;
