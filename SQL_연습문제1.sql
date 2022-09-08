#날짜 : 2022/08/29
#이름 : 조광호
#내용 : SQL 연습문제1

#실습 1-1
create database `java2_shop`;
create user 'java2_admin1'@'%' identified by '1234';
grant all privileges on `java2_shop`.* to 'java2_admin1'@'%';
flush privileges;

#실습 1-2
create table `customer`(
	`custid` varchar(10) primary key not null,
    `name`	 varchar(10) not null,
    `hp`	 char(13) default null unique,
    `addr`	 varchar(100) default null,
    `rdate`	 date not null
);

create table `product`(
	`prodno`	int auto_increment primary key,
    `prodname`	varchar(10) not null,
    `stock`		int default 0,
    `price`		int default null,
    `company`	varchar(20) not null
);

create table `order`(
	`orderno`	int auto_increment primary key,
    `orderid`	varchar(10) not null,
    `orderproduct`	int not null,
    `ordercount`	int default 1,
    `orderdate`		datetime not null
);


#실습 1-3
insert into `customer` values ('c101','김유신','010-1234-1001','김해시 봉황동','2022-01-01');
insert into `customer` values ('c102','김춘추','010-1234-1002','경주시 보문동','2022-01-02');
insert into `customer` values ('c103','장보고','010-1234-1003','완도군 청산면','2022-01-03');
insert into `customer` values ('c104','강감찬','010-1234-1004','서울시 마포구','2022-01-04');
insert into `customer` set
					`custid` = 'c105',
					`name` = '이성계',
                    `rdate` = '2022-01-05';
insert into `customer` values ('c106','정철','010-1234-1006','경기도 용인시','2022-01-06');
insert into `customer` set
					`custid` = 'c107',
					`name` = '허준',
                    `rdate` = '2022-01-07';
insert into `customer` values ('c108','이순신','010-1234-1008','서울시 영등포구','2022-01-08');
insert into `customer` values ('c109','송상현','010-1234-1009','부산시 동래구','2022-01-09');
insert into `customer` values ('c110','정약용','010-1234-1010','경기도 광주시','2022-01-10');

insert into `product` (`prodname`,`stock`,`price`, `company`) values ('새우깡','5000','1500','농심');
insert into `product` (`prodname`,`stock`,`price`, `company`) values ('초코파이','2500','2500','오리온');
insert into `product` (`prodname`,`stock`,`price`, `company`) values ('포카칩','3600','1700','오리온');
insert into `product` (`prodname`,`stock`,`price`, `company`) values ('양파링','1250','1800','농심');
insert into `product` set
				`prodname` = '죠리퐁',
                `stock` = '2200',
                `company` = '크라운';
insert into `product` (`prodname`,`stock`,`price`, `company`) values ('마카렛트','3500','3500','롯데');
insert into `product` (`prodname`,`stock`,`price`, `company`) values ('뿌셔뿌셔','1650','1200','오뚜기');

insert into `order` (`orderid`,`orderproduct`,`ordercount`,`orderdate`) values ('c102','3','2','2022-07-01 13:15:10');
insert into `order` (`orderid`,`orderproduct`,`ordercount`,`orderdate`) values ('c101','4','1','2022-07-01 14:16:11');
insert into `order` (`orderid`,`orderproduct`,`ordercount`,`orderdate`) values ('c108','1','1','2022-07-01 17:23:18');
insert into `order` (`orderid`,`orderproduct`,`ordercount`,`orderdate`) values ('c109','6','5','2022-07-02 10:46:36');
insert into `order` (`orderid`,`orderproduct`,`ordercount`,`orderdate`) values ('c102','2','1','2022-07-03 09:15:37');
insert into `order` (`orderid`,`orderproduct`,`ordercount`,`orderdate`) values ('c101','7','3','2022-07-03 12:35:12');
insert into `order` (`orderid`,`orderproduct`,`ordercount`,`orderdate`) values ('c110','1','2','2022-07-03 16:55:36');
insert into `order` (`orderid`,`orderproduct`,`ordercount`,`orderdate`) values ('c104','2','4','2022-07-04 14:23:23');
insert into `order` (`orderid`,`orderproduct`,`ordercount`,`orderdate`) values ('c102','1','3','2022-07-04 21:54:34');
insert into `order` (`orderid`,`orderproduct`,`ordercount`,`orderdate`) values ('c107','6','1','2022-07-06 14:21:03');

#실습 1-4 (고객 테이블에 존재하는 모든 속성 조회)
select * from `customer`;

#실습 1-5 (고객 테이블의 고객 아이디, 이름, 휴대폰 번호 조회)
select `custid`,`name`,`hp` from `customer`;

#실습 1-6 (제품 테이블에 존재하는 모든 속성 조회)
select * from `product`;

#실습 1-7 (제품 테이블에서 제조업체를 조회)
select `company` from `product`;

#실습 1-8 (제품 테이블에서 제조업체 중복 없이 조회)
select distinct `company` from `product`;

#실습 1-9 (제품 테이블에서 제품명과 단가를 조회)
select `prodname`,`price` from `product`;

#실습 1-10 (제품 테이블- 제품명과 단가를 조회, 단가에 500원을 더해 조정단가로 출력)
select `prodname`, `price` + 500 as `조정단가` from `product`;
#실습 1-11 (제품 테이블- 오리온이 제조한 제품의 제품명, 재고량, 단가 조회)
select `prodname`, `stock`, `price` from `product` where `company` = '오리온';

#실습 1-12 (주문 테이블 - c102 고객이 주문한 주문제품, 수량, 주문일지 조회)
select `orderproduct`, `ordercount`, `orderdate` from `order` where `orderid`= 'c102';
#실습 1-13 (주문 테이블, c102고객 2개이상 제품,수량,일지)
select `orderproduct`, `ordercount`, `orderdate` from `order` where `orderid` = 'c102' and `ordercount` >= 2;

#실습 1-14 (제품 테이블, 단가 1000원 이상 2000 이하 제품조회)
select*from `product` where `price` >= 1000 and `price` <= 2000;
#실습 1-15 (고객 테이블, 성이 김씨인 고객아이디, 이름, 휴대폰, 주소를 조회)
select `custid`, `name`, `hp`, `addr` from `customer` where `name` like '김%';
#실습 1-16 (고객 테이블, 고객 이름 2자인 고객)
select `custid`, `name`, `hp`, `addr` from `customer` where `name` like '__';
#실습 1-17 (고객 테이블, 휴대폰 번호 입력되지 않는 고객조회)
select * from `customer` where `hp` is null;
#실습 1-18 (고객 테이블, 주소가 입력된 고객 조회)
select * from `customer` where `addr` is not null;

#실습 1-19 (고객 테이블, 가입일을 내림차순으로)
select * from `customer` order by `rdate` desc;

#실습 1-20
select * from `order` where `ordercount` >= 3 order by `ordercount` desc, `orderproduct` asc;

#실습 1-21
select avg(price) as `평균` from `product`; 

#실습 1-22
select sum(stock) as `재고량 합계` from `product` where `company` = '농심';
#실습 1-23
select count(custid) as `고객수` from `customer`;
#실습 1-24
select count(distinct `company`) as `제조업체 수` from `product`;
#실습 1-25
select `orderproduct` as `주문 상품번호`, 
		sum(`ordercount`) as `총 주문수량` from `order` group by `orderproduct`;
#실습 1-26
SELECT `company` AS `제조업체`, COUNT(*) AS `제품수`, MAX(`price`) AS `최고가` FROM `Product` GROUP BY `company`;
#실습 1-27
SELECT `company` AS `제조업체`, COUNT(*) AS `제품수`, MAX(`price`) AS `최고가` FROM `Product` GROUP BY `company` HAVING `제품수` >= 2;

#실습 1-28
SELECT `orderProduct`, `orderId`, SUM(`orderCount`) AS `총 주문수량` FROM `Order` GROUP BY `orderProduct`, `orderId`;

#실습 1-29
select a.`orderid`, b.`prodname` from `order` as a
join `product` as b
on a.orderproduct = b.prodNo
where `orderid` = 'c102';

#실습 1-30
select `orderid`, `name`, `prodName`, `orderDate` from `Order` as a
join `Customer` as b on a.orderId = b.custId
join `Product` as c on a.orderProduct = c.prodNo
where substr(`orderDate`, 1, 10) = '2022-07-03';