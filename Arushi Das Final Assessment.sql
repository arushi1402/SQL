create database truYum;
use truYum;

-- 1. a) Frame insert scripts to add data into menu_item table.
create table menu_item(
item_id int auto_increment primary key,
item_name varchar(40) not null,
price float not null,
is_it_Active enum("Yes", "No") not null,
date_of_launch date not null,
category varchar(20),
free_delivery enum("Yes", "No"));
-- 1. b) Frame SQL query to get all menu items
select *from menu_item;

INSERT INTO menu_item (item_name,price,is_it_Active,date_of_launch,category,free_delivery)
values('Sandwich',99,'Yes', '2016-09-01', 'Main Course','Yes'),('Burger',129,'Yes', '2015-03-09', 'Main Course', 'No'),
('Pizza',149,'Yes', '2017-01-08', 'Main Course','Yes'),('French Fries',49, 'No','2017-03-05', 'Starters','Yes'),
('Chocolate Brownie',79, 'Yes','2018-04-09', 'Dessert','Yes');

-- 2. a)Frame SQL query to get all menu items which after launch date and is active.
select *from menu_item 
where is_it_Active = 'Yes';
 
-- 3 a. Frame SQL query to get a menu items based on Menu Item Id
select *from menu_item 
where item_id = 3;

-- b. Frame update SQL menu_items table to update all the columns values based on Menu Item Id
update menu_item
set item_name = 'Bagel'
where item_id = 1;

/*4.a. Add to Cart - Frame insert scripts for adding data into use cart tables.
In user table create two users. Once user will not have any entries in cart, 
while the other will have at least 3 items in the cart. */

create table users(	
id int primary key auto_increment,
name varchar(90) not null);

create table cart (
cart_id int primary key auto_increment,
menu_item_id int,
user_id int,
foreign key (user_id) references menu_item(item_id),
foreign key (user_id) references users(id));

select * from users;
select * from Cart;
insert into users(name) 
values('Stanley'),('John');


Insert into Cart(menu_item_id,user_id)
values (1, 1),(3, 1),( 5, 1);

-- 5 a. Frame SQL query to get all menu items in a particular user’s cart

Select Cart.user_id, users.name, Cart.cart_id, menu_item.item_name, 
menu_item.price from menu_item
Join Cart on menu_item.item_id=Cart.menu_item_id 
join users on users.id=Cart.User_id 
Where Cart.user_id='1';

-- 5 b. Cart.User_id, Users.User_Name, Cart.Cart_id, Menu_Items.Name, 
Select Sum(menu_item.price) as total_price from menu_item 
Join cart on menu_item.item_id=Cart.menu_item_id 
join users on users.id=Cart.user_id Where Cart.User_id='1'; #327

-- 6 a. Frame SQL query to remove a menu items from Cart based on User Id and Menu Item Id
delete from Cart where user_id = 1 and menu_item_id = 3;













