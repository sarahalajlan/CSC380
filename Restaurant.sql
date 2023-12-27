create database Restaurant;
use Restaurant;


create table CUSTOMER
( Cust_id char(9) primary key NOT NUll, 
Name varchar(15) NOT NULL,
Phone_number char(12)
);

create table MENU
(Menu_id char(9) NOT NULL,
Category varchar(10),
primary key(Menu_id)
);

create table STAFF
(
Id char(9)  primary key NOT NULL,
Name varchar(15) NOT NULL,
Phone_number char(12),
Birth_date Date,
Work_hours decimal(3,1),
Role varchar(15) ,
Monthly_salary decimal(10,2) , 
 Branch_id char(9),
Super_id char(9)
);

drop table IN_CHARGE_OF;
drop table STAFF;


alter table STAFF add Super_id char(9);
alter table STAFF add constraint  foreign key(Super_id) references STAFF(Id);

create table RESTORDER
(
Order_id char(9),
Cust_id char(9),
Num_of_items int,

primary key(Order_id)
);


create table RECEIPT
(Receipt_number char(15),
Order_id char(9),
Order_type char(8),
Tax decimal(5,2) ,
Payment_method varchar(10),
Total_amount decimal(10,2),
Date date,

primary key(Receipt_number),
foreign key(Order_id) references RESTORDER(Order_id)
);




create table RESTTABLE (
Table_num  int ,
Aval_status boolean NOT NULL,
Num_seats int NOT NULL,
primary key(Table_num)
);


create table IN_CHARGE_OF(
Staff_id char(9),
Table_num INT, 
primary key(Staff_id,Table_num),
foreign key(Staff_id) references STAFF (Id),
foreign key(Table_num) references RESTTABLE (Table_num)
);

create table item(
item_id char(9) ,
Menu_id char(9),
Name varchar(15),
Price decimal(5,2),
primary key(item_id),
foreign key(Menu_id) references MENU(Menu_id)
);

create table CONTAINED_BY(
Item_id char(9),
Order_id char(9),
Date Date,
Time Time,
primary key (Item_id,Order_id),
foreign key(Order_id) references RESTORDER(Order_id)
);







create table SUPPLIER(
Id char(9) primary key NOT NULL,
Name varchar(15) NOT NULL,
Phone_number char(12)
);

create table BRANCH (
Id char(9) primary key NOT NULL,
Location varchar(25) NOT NULL,
Phone_number char(12),
Working_hours INT);

create table CONTRACTS(
Sid char(9) ,
Bid char(9) ,
Start_date Date NOT NULL,
End_date Date NOT NULL,
foreign key(Sid) references SUPPLIER (Id),
foreign key(Bid) references BRANCH (id),
primary key(Sid,Bid)
);

create table TABLE_ORDER(
Table_num INT ,
Order_id char(9) ,
primary key(Table_num,Order_id),
foreign key(Table_num) references RESTTABLE (Table_num),
foreign key(Order_id) references BRANCH (Id));

create table RESERVED_BY(
Table_num INT ,
Cust_id char(9) ,
Date Date,
Time Time,
primary key(Table_num,Cust_id),
foreign key(Table_num) references RESTTABLE (Table_num),
foreign key(Cust_id) references CUSTOMER (Cust_id));

insert into STAFF values ('111222333', 'noura' , '966555555555' , '1980-09-12', '23.0' ,'chef'
, 5000.00,null,null);

select*from STAFF;

drop view MANAGER;



select * from table_order;

delete from STAFF where '111222633';

insert into MANAGER values ('111222633', 'majd' , '966555544455' , '2002-08-12', '23.0' ,'manager'
, 50000.00,null,null);

update STAFF set Super_id='111222633' where Id='111222333'; 

