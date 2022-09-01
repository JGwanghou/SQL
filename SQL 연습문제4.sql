#날짜: 2022/09/01
#이름: 조광호
#내용: SQL 연습문제4

#실습4-1
CREATE DATABASE `java2_BookStore`;
CREATE USER 'java2_admin4'@'%' IDENTIFIED BY '1234';
grant all privileges on `java2_Bookstore`.* to 'java2_admin4'@'%';
flush privileges;

#실습4-2
CREATE TABLE `Customer`(
	`custId`		INT AUTO_INCREMENT PRIMARY KEY,
    `name`			VARCHAR(10) NOT NULL,
    `address`		VARCHAR(20), 
    `phone`			CHAR(13)
);

CREATE TABLE `Book`(
	`bookId`		INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `bookName`		VARCHAR(20) NOT NULL,
    `publisher`		VARCHAR(20) NOT NULL,
    `price`			INT
);

CREATE TABLE `Order`(
	`orderId`		INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    `custId`		INT NOT NULL,
    `bookId`		INT NOT NULL,
    `salePrice`		INT NOT NULL,
    `orderDate`		DATE NOT NULL
    
);


#실습4-3
INSERT INTO `Customer`(`name`,`address`,`phone`) VALUES ('박지성','영국 맨체스타',  '000-5000-0001');
INSERT INTO `Customer`(`name`,`address`,`phone`) VALUES ('김연아','대한민국 서울',  '000-6000-1001');
INSERT INTO `Customer`(`name`,`address`,`phone`) VALUES ('장미란','대한민국 강원도', '000-7000-1001');
INSERT INTO `Customer`(`name`,`address`,`phone`) VALUES ('추신수','미국 클리블랜드',  '000-6000-1001');
INSERT INTO `Customer`(`name`,`address`) VALUES ('박세리','대한민국 대전');

INSERT INTO `Book` (`bookname`,`publisher`,`price`)VALUES ('축구의 역사','굿스포츠','7000');
INSERT INTO `Book` (`bookname`,`publisher`,`price`)VALUES ('축구아는여자','나무수','13000');
INSERT INTO `Book` (`bookname`,`publisher`,`price`)VALUES ('축구의 이해','대한미디어','22000');
INSERT INTO `Book` (`bookname`,`publisher`,`price`)VALUES ('골프 바이블','대한미디어','35000');
INSERT INTO `Book` (`bookname`,`publisher`,`price`)VALUES ('피겨 교본','굿스포츠','8000');
INSERT INTO `Book` (`bookname`,`publisher`,`price`)VALUES ('역도 단계별기술','굿스포츠','6000');
INSERT INTO `Book` (`bookname`,`publisher`,`price`)VALUES ('야구의 추억','이상미디어','20000');
INSERT INTO `Book` (`bookname`,`publisher`,`price`)VALUES ('야구를 부탁해','이상미디어','13000');
INSERT INTO `Book` (`bookname`,`publisher`,`price`)VALUES ('올림픽 이야기','삼성당','7500');
INSERT INTO `Book` (`bookname`,`publisher`,`price`)VALUES ('Olympic Champions','Pearson','13000');

INSERT INTO `Order` (`custid`,`bookid`,`saleprice`,`orderdate`) VALUES ('1','1','6000','2014-07-01');
INSERT INTO `Order` (`custid`,`bookid`,`saleprice`,`orderdate`) VALUES ('1','3','21000','2014-07-03');
INSERT INTO `Order` (`custid`,`bookid`,`saleprice`,`orderdate`) VALUES ('2','5','8000','2014-07-03');
INSERT INTO `Order` (`custid`,`bookid`,`saleprice`,`orderdate`) VALUES ('3','6','6000','2014-07-04');
INSERT INTO `Order` (`custid`,`bookid`,`saleprice`,`orderdate`) VALUES ('4','7','20000','2014-07-05');
INSERT INTO `Order` (`custid`,`bookid`,`saleprice`,`orderdate`) VALUES ('1','2','12000','2014-07-07');
INSERT INTO `Order` (`custid`,`bookid`,`saleprice`,`orderdate`) VALUES ('4','8','13000','2014-07-07');
INSERT INTO `Order` (`custid`,`bookid`,`saleprice`,`orderdate`) VALUES ('3','10','12000','2014-07-08');
INSERT INTO `Order` (`custid`,`bookid`,`saleprice`,`orderdate`) VALUES ('2','10','7000','2014-07-09');
INSERT INTO `Order` (`custid`,`bookid`,`saleprice`,`orderdate`) VALUES ('3','8','13000','2014-07-10');

#실습4-4
select `custid`,`name`,`address` from `customer`;

#실습4-5
select `bookname`, `price` from `book`;

#실습4-6
select `price`,`bookname` from `book`;

#실습4-7
select * from `book`;

#실습4-8
select `publisher` from `book`;

#실습4-9
select distinct `publisher` from `book`;

#실습4-10
select * from `book`where `price` >= '20000';

#실습4-11
select * from `book` where `price` < '20000';

#실습4-12
select * from `book` where `price` > '10000' and 20000 >= `price`;

#실습4-13
select `bookid`,`bookname`,`price` from `book` where `price` > '15000' and 30000 > `price`;

#실습4-14
select * from `book` where `bookid` in (2,3,5);

#실습4-15
select * from `book` where mod (`bookid`, 2) = 0;

#실습4-16
select * from `customer` where `name` like '박%';

#실습4-17
select * from `customer` where `address` like '대한민국%';

#실습4-18
select * from `customer` where `phone` is not null;

#실습4-19
select * from `book` where `publisher` in ('굿스포츠', '대한미디어');

#실습4-20
select `publisher` from `book` where `bookname` = '축구의 역사';

#실습4-21
select `publisher` from `book` where `bookname` like '축구%';

#실습4-22
select * from `book` where `bookname` like '_구%';

#실습4-23
select * from `book` where `bookname` like '_구%' and `price` > 20000;

#실습4-24
select * from `book` order by `bookname`;

#실습4-25
select * from `book` order by `price` asc, `bookname` asc;

#실습4-26
select * from `book` order by `price` desc, `publisher` desc;

#실습4-27
select * from `book` order by `price` desc limit 3;

#실습4-28
select * from `book` order by `price` asc limit 3;

#실습4-29
select
sum(saleprice) as `총 판매액`
from `order`;

#실습4-30
select 
sum(saleprice) as `총 판매액`,
avg(saleprice) / COUNT(*) as `평균값`,
min(saleprice) as `최저가`,
max(saleprice) as `최고가`
from `order`;

#실습4-31
select count(orderid) as `판매건수` 
from `order`;

#실습4-32
select `bookid`, replace(`bookname`, '야구', '농구') as `bookname`, `publisher`, `price` from `book`;
	
#실습4-33
select * from `order` where `saleprice` >= 8000;

#실습4-34
select * from `customer` as a
join `order` as b
on a.custId = b.custid;

#실습4-35
select * from `customer` as a
join `order` as b
on a.custId = b.custid order by a.`custid`;

#실습4-36
select `name`, `saleprice` from `customer` as a
join `order` as b
on a.custid = b.custid;

#실습4-37

#실습4-38
select * from `customer` as a
join `book` as b
on a.custid = b.bookid;

#실습4-39
#실습4-40
select `name`, `saleprice` from `customer` as a
left join `order` as b
on a.custId = b.custId;

#실습4-41
select * from `book` where `price` = (select max(`price`)from `book`);

#실습4-42
select `name` from `customer` where `name` not in (select `name` from `customer` where `custid` in (select distinct `custid` from `order`));
select `name` from `customer` where `custid` in (select distinct `custid` from `order`);
select distinct `custid` from `order`; 

#실습4-43
select sum(`saleprice`) as `총판매액`
from `order` where `custid` = (select `custid` from `customer` where `name` = '김연아');

#실습4-44
INSERT INTO `book` (`bookid`,`bookname`,`publisher`) values ('21','스포츠의학','한솔의학서적');
#실습4-45
Update `customer` set `address` = '대한민국 부산' where name = '박세리'; 

#실습4-46
delete from `customer` where `custid` = 5;

