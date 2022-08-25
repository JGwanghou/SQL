#날짜 : 2022/08/25
#이름 : 조광호
#내용 : 제 4장 SQL 고급

#실습 4-1
create table `Member` (
		`uid` 	varchar(10) primary key ,
        `name`	varchar(10) NOT NULL,
        `hp`	char(13) UNIQUE NOT NULL,
        `pos`	varchar(10) default '사원',
        `dep`	tinyint,
        `rdate`	datetime not null
);
drop table `member`;
create table `Department` (
		`depNo`	tinyint primary key,
        `name`	varchar(10) not null,
        `tel`	char(12) not null
);

create table `Sales` (
		`seq` 	int auto_increment primary key,
        `uid` 	varchar(10) not null,
        `year`	year not null,
        `month`	tinyint not null,
        `sale` 	int not null
);
#실습 4-2
insert into `Member` values ('a101','박혁거세','010-1234-1001','부장','101','2020-11-19 11:39:48');
insert into `Member` values ('a102','김유신','010-1234-1002','차장','101','2020-11-19 11:39:48');
insert into `Member` values ('a103','김춘추','010-1234-1003','사원','101','2020-11-19 11:39:48');
insert into `Member` values ('a104','장보고','010-1234-1004','대리','102','2020-11-19 11:39:48');
insert into `Member` values ('a105','강감찬','010-1234-1005','과장','102','2020-11-19 11:39:48');
insert into `Member` values ('a106','이성계','010-1234-1006','차장','103','2020-11-19 11:39:48');
insert into `Member` values ('a107','정철','010-1234-1007','차장','103','2020-11-19 11:39:48');
insert into `Member` values ('a108','이순신','010-1234-1008','부장','104','2020-11-19 11:39:48');
insert into `Member` values ('a109','허균','010-1234-1009','부장','104','2020-11-19 11:39:48');
insert into `Member` values ('a110','정약용','010-1234-1010','사원','105','2020-11-19 11:39:48');
insert into `Member` values ('a111','박지원','010-1234-1011','사원','105','2020-11-19 11:39:48');

insert into `Department` values ('101','영업1부','051-512-1001');
insert into `Department` values ('102','영업2부','051-512-1002');
insert into `Department` values ('103','영업3부','051-512-1003');
insert into `Department` values ('104','영업4부','051-512-1004');
insert into `Department` values ('105','영업5부','051-512-1005');
insert into `Department` values ('106','영업지원부','051-512-1006');
insert into `Department` values ('107','인사부','051-512-1007');

insert into `sales` (`uid`,`year`,`month`,`sale`) values ('a101','2018','1','98100');
insert into `sales` (`uid`,`year`,`month`,`sale`) values ('a102','2018','1','136000');
insert into `sales` (`uid`,`year`,`month`,`sale`) values ('a103','2018','1','80100');
insert into `sales` (`uid`,`year`,`month`,`sale`) values ('a104','2018','1','78000');
insert into `sales` (`uid`,`year`,`month`,`sale`) values ('a105','2018','1','93000');

insert into `sales` (`uid`,`year`,`month`,`sale`) values ('a101','2018','2','23500');
insert into `sales` (`uid`,`year`,`month`,`sale`) values ('a102','2018','2','126000');
insert into `sales` (`uid`,`year`,`month`,`sale`) values ('a103','2018','2','18500');
insert into `sales` (`uid`,`year`,`month`,`sale`) values ('a105','2018','2','19000');
insert into `sales` (`uid`,`year`,`month`,`sale`) values ('a106','2018','2','53000');

insert into `sales` (`uid`,`year`,`month`,`sale`) values ('a101','2019','1','24000');
insert into `sales` (`uid`,`year`,`month`,`sale`) values ('a102','2019','1','109000');
insert into `sales` (`uid`,`year`,`month`,`sale`) values ('a103','2019','1','101000');
insert into `sales` (`uid`,`year`,`month`,`sale`) values ('a104','2019','1','53500');
insert into `sales` (`uid`,`year`,`month`,`sale`) values ('a107','2019','1','24000');

INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a102', 2019, 2, 160000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a103', 2019, 2, 101000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a104', 2019, 2,  43000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a105', 2019, 2,  24000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a106', 2019, 2, 109000);

INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a102', 2020, 1, 201000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a104', 2020, 1,  63000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a105', 2020, 1,  74000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a106', 2020, 1, 122000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a107', 2020, 1, 111000);

INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a102', 2020, 2, 120000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a103', 2020, 2,  93000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a104', 2020, 2,  84000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a105', 2020, 2, 180000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a108', 2020, 2,  76000);

#실습 4-3
select * from `member` where `name` <> '김춘추';
select * from `member` where `pos` = '사원' or `pos`='대리';
select * from `Member` where `pos` IN('사원', '대리');
select * from `member` where `name` like '%신';
select * from `member` where `name` like '정_';
select * from `sales` where `sale` between 50000 and 100000;

select * from `member` where `name`='김유신';
select * from `member` where `dep` in(101,102,103);
select * from `member` where `name` like '김__';
select * from `sales` where `sale` not between 50000 and 100000;
select * from `sales` where `sale` in(2020);
select * from `sales` where `month` in(1,2);
select * from `member` where `name` like '_성_';

#실습 4-4
select * from `sales` order by `sale`;
select * from `sales` order by `sale` desc;
select * from `sales` order by `sale` desc;
select * from `sales` where `sale` > 50000 
order by `year`, `month`, `sale` desc;
select * from `member` order by `name`;
select * from `member` order by `name` desc;
select * from `member` order by `rdate` asc;
select * from `sales` where `sale` > 50000 order by `year` desc;

#실습 4-5
select * from `sales` limit 3;
select * from `sales` limit 0,3;
select * from `sales` limit 1,2;
select * from `sales` limit 5,3;
select * from `sales` order by `sale` desc limit 3,5;
select * from `sales` where `sale` < 50000 order by `sale` desc limit 3;
select * from `sales` where `sale` > 50000 order by `year` desc, `month`, `sale` desc limit 5;

#실습 4-6
select sum(`sale`) as `매출총합` from `sales`;

select count(`seq`) as `갯수` from `sales`;
select substring(`hp`, 10, 4) as `휴대폰끝자리` from `member`;
insert into `member` values ('b101','을지문덕','010-5555-1234','사장','107',Now());

#실습 4-7
select 
sum(`sale`) as `2018년 1월 매출총합` 
from `sales` where `year` = 2018 and `month`=1;
select * from `sales` where `year` = 2018 and `month`=1;

#실습 4-8
select 
	sum(`sale`) as `총합`,
    avg(`sale`) as `평균`
from `sales`
where `year`=2019 and `month`=2 and `sale` >= 50000;

#실습 4-9
select 
	min(`sale`) as `최저`,
    max(`sale`) as `최고`
from `sales` where `year` = 2020;
#실습 4-10
#실습 4-11
#실습 4-12
#실습 4-13
#실습 4-14
#실습 4-15
#실습 4-16
#실습 4-17