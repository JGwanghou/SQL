#날짜 : 2022/08/31
#이름 : 조광호
#내용 : SQL 연습문제3

#실습 3-1
create database `collge`;
create user 'java2_admin3'@'%' identified by '1234';
grant all privileges on java2_collge.* to 'java2_admin3'@'%';
flush privileges;

#실습 3-2
create table `student`(
	`stdNo` 		varchar(8) not null primary key,
	`stdName`		varchar(20) not null,
    `stdHp`			varchar(13) not null,
    `stdYear`		int not null,
    `stdAddress` 	varchar(100) default null
);

create table `Lecture`(
	`lecNo`			int not null primary key,
    `lecName`		varchar(20) not null,
    `lecCredit`		int not null,
    `lecTime`		int not null,
    `lecClass`		varchar(10) default null
);

create table `Register`(
	`regStdNo`		varchar(8) not null,
    `regLecNo`		decimal(5),
    `regMidScore`	tinyint,
    `regFinalScore`	tinyint,
    `regTotalScore`	tinyint,
    `regGrade`		char(1)
);
#실습 3-3
insert into `Student` set
		`stdNo`='20201016',
        `stdName`='김유신',
        `stdHp`='010-1234-1001',
        `stdYear`='3';
insert into `student` values ('20201126','김춘추','010-1234-1002','3','경상남도 경주시');
insert into `student` values ('20210216','장보고','010-1234-1003','2','전라남도 완도시');
insert into `student` values ('20210326','강감찬','010-1234-1004','2','서울시 영등포구');
insert into `student` values ('20220416','이순신','010-1234-1005','1','부산시 부산진구');
insert into `student` values ('20220521','송상현','010-1234-1006','1','부산시 동래구');

insert into `Lecture` values ('159','인지행동심리학','3','40','본304');
insert into `Lecture` values ('167','운영체제론','3','25','본B05');
insert into `Lecture` values ('234','중급 영문법','3','20','본201');
insert into `Lecture` values ('239','세법개론','3','40','본204');
insert into `Lecture` values ('248','빅데이터 개론','3','20','본B01');
insert into `Lecture` values ('253','컴퓨팅사고와 코딩','2','10','본B02');
insert into `Lecture` values ('349','사회복지 마케팅','2','50','본301');

insert into `Register` (`regStdNo`,`regLecNo`) values ('20201126','234');
insert into `Register` (`regStdNo`,`regLecNo`) values ('20201016','248');
insert into `Register` (`regStdNo`,`regLecNo`) values ('20201016','253');
insert into `Register` (`regStdNo`,`regLecNo`) values ('20201126','239');
insert into `Register` (`regStdNo`,`regLecNo`) values ('20210216','349');
insert into `Register` (`regStdNo`,`regLecNo`) values ('20210326','349');
insert into `Register` (`regStdNo`,`regLecNo`) values ('20201016','167');
insert into `Register` (`regStdNo`,`regLecNo`) values ('20220416','349');

#실습 3-4
select * from `lecture`;

#실습 3-5
select * from `student`;

#실습 3-6
select * from `register`;

#실습 3-7
select * from `student` where `stdYear` = 3;

#실습 3-8
select * from `lecture` where `lecCredit` = 2;

#실습 3-9
update `register` set `regMidscore` = 36, `regFinalScore` = 42 where `regStdNo` = '20201126' and `regLecNo` ='234';
update `register` set `regMidscore` = 24, `regFinalScore` = 62 where `regStdNo` = '20201016' and `regLecNo` ='248';
update `register` set `regMidscore` = 28, `regFinalScore` = 40 where `regStdNo` = '20201016' and `regLecNo` ='253';
update `register` set `regMidscore` = 37, `regFinalScore` = 57 where `regStdNo` = '20201126' and `regLecNo` ='239';
update `register` set `regMidscore` = 28, `regFinalScore` = 68 where `regStdNo` = '20210216' and `regLecNo` ='349';
update `register` set `regMidscore` = 16, `regFinalScore` = 65 where `regStdNo` = '20210326' and `regLecNo` ='349';
update `register` set `regMidscore` = 18, `regFinalScore` = 38 where `regStdNo` = '20201016' and `regLecNo` ='167';
update `register` set `regMidscore` = 25, `regFinalScore` = 58 where `regStdNo` = '20220416' and `regLecNo` ='349';
select * from `Register`;

#실습 3-10
update `register` set 
		`regtotalscore` = `regMidScore` + `regFinalscore`,
		`regGrade` = if(`regtotalScore` >= 90 , 'A',
					 if(`regtotalScore` >= 80 , 'B',
                     if(`regtotalScore` >= 70 , 'C',
                     if(`regtotalScore` >= 60 , 'D', 'F'))));
select * from `Register`;
			
#실습 3-11
select * from `Register` order by `regtotalscore` desc;

#실습 3-12
select * from `Register` where `regLecNo` = 349 order by `regMidScore` desc;

#실습 3-13
select * from `lecture` where `lectime` > 30;

#실습 3-14
select `lecName`, `lecClass` from `lecture`;

#실습 3-15
select `stdNo`, `stdName` from `student`;

#실습 3-16
select * from `Student` where `stdAddress` is null;

#실습 3-17
select * from `student` where `stdAddress` like '부산시 %';

#실습 3-18
select * from `student` as a left join `Register` as b on a.stdNo = b.regStdNo; 

#실습 3-19
select 	`stdNo`,
		`stdName`,
        `regLecNo`,
        `regmidscore`,
        `regFinalScore`,
        `regtotalscore`,
        `reggrade`
from `student` as a,
`register` as b
where
a.stdNo = b.regStdNo;

#실습 3-20
select `stdName`,`stdNo`,`regLecNo` 
from `student` as a
join `register` as b
where `reglecNo` = 349;

#실습 3-21
select 
	`stdNo`,
    `stdName`,
    count(stdNo) as `수강신청 건수`,
    sum(`regTotalScore`) as `종합점수`,
    sum(`regTotalScore`) / count(`stdNo`) as `평균`
from 
`student` as a
join `register` as b
on a.stdNo = b.regStdNo
group by `stdName`;

#실습 3-22
select * from `register` as a
join `lecture` as b
on a.reglecNo = b.lecNo;

#실습 3-23
select
		`regStdNo`,
        `regLecNo`,
        `lecName`,
        `regMidScore`,
        `regFinalScore`,
        `regtotalScore`,
        `regGrade`
from `register` as a
join `lecture` as b
on a.reglecno = b.lecno;

#실습 3-24
select 
count(*) as `사회복지 마케팅 수강 신청건수`,
avg(`regTotalScore`) as `사회복지 마케팅 평균`
from `register` as a
join `lecture` as b
on a.reglecNo = b.lecNo
where `lecName` = '사회복지 마케팅';

#실습 3-25
select `regstdno`,`lecname` from `register`as a
join `lecture` as b
on a.regLecNo = b.lecNo where `regGrade` = 'a';

#실습 3-26
#실습 3-27
#실습 3-28
#실습 3-29
#실습 3-30
