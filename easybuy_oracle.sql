--DROP TABLE easybuy_news;

CREATE TABLE easybuy_news (
  id number(10) NOT NULL primary key ,
  title varchar(40) NOT NULL ,
  content varchar(1000) NOT NULL ,
  createTime varchar(10) NOT NULL 
  
); 

--DROP TABLE easybuy_order;

CREATE TABLE easybuy_order (
  id number(11) NOT NULL primary key ,
  userId number(15)  ,
  loginName varchar(255) ,
  userAddress varchar(255)  ,
  createTime timestamp  ,
  cost number  ,
  serialNumber varchar(255)  
);


--DROP TABLE easybuy_order_detail;

CREATE TABLE easybuy_order_detail (
  id number(10) NOT NULL primary key,
  orderId number(10) NOT NULL ,
  productId number(10) NOT NULL ,
  quantity number(10) NOT NULL ,
  cost number NOT NULL 
);

--DROP TABLE easybuy_product;

CREATE TABLE easybuy_product (
  id number(10) NOT NULL primary key ,
  name varchar(20) NOT NULL ,
  description varchar(1024)  ,
  price number NOT NULL ,
  stock number(10) NOT NULL ,
  categoryLevel1Id number(10)  ,
  categoryLevel2Id number(10)  ,
  categoryLevel3Id number(10)  ,
  fileName varchar(200)  ,
  isDelete number(1)
);

--DROP TABLE easybuy_product_category;

CREATE TABLE easybuy_product_category (
  id number(10) NOT NULL primary key ,
  name varchar(200) NOT NULL ,
  parentId number(10) NOT NULL ,
  type number(11)  ,
  iconClass varchar(255)
);


--DROP TABLE easybuy_user;

CREATE TABLE easybuy_user (
  id number(20) NOT NULL primary key ,
  loginName varchar(255) NOT NULL ,
  userName varchar(255) NOT NULL,
  password varchar(255) NOT NULL ,
  sex number(2) NOT NULL  ,
  identityCode varchar(60)  ,
  email varchar(80)  ,
  mobile varchar(11)  ,
  type number(2)
); 


--DROP TABLE easybuy_user_address;

CREATE TABLE easybuy_user_address (
  id number(20) NOT NULL primary key,
  userId number(15)  ,
  address varchar(255) ,
  createTime timestamp  ,
  isDefault number(2) DEFAULT '0' ,
  remark varchar(255) 
);





