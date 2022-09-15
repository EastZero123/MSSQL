create database Study;
go
use Study;

create table tStaff
(
	name CHAR(15) primary key,
	depart char(10) not null,
	gender char(3) not null,
	joindate date not null,
	grade char(10) not null,
	salary int not null,
	score decimal(5,2) null
);

INSERT INTO tStaff VALUES ('김유신','총무부','남','2000-2-3','이사',420,88.8);
INSERT INTO tStaff VALUES ('유관순','영업부','여','2009-3-1','과장',380,NULL);
INSERT INTO tStaff VALUES ('안중근','인사과','남','2012-5-5','대리',256,76.5);
INSERT INTO tStaff VALUES ('윤봉길','영업부','남','2015-8-15','과장',350,71.25);
INSERT INTO tStaff VALUES ('강감찬','영업부','남','2018-10-9','사원',320,56.0);
INSERT INTO tStaff VALUES ('정몽주','총무부','남','2010-9-16','대리',370,89.5);
INSERT INTO tStaff VALUES ('허난설헌','인사과','여','2020-1-5','사원',285,44.5);
INSERT INTO tStaff VALUES ('신사임당','영업부','여','2013-6-19','부장',400,92.0);
INSERT INTO tStaff VALUES ('성삼문','영업부','남','2014-6-8','대리',285,87.75);
INSERT INTO tStaff VALUES ('논개','인사과','여','2010-9-16','대리',340,46.2);
INSERT INTO tStaff VALUES ('황진이','인사과','여','2012-5-5','사원',275,52.5);
INSERT INTO tStaff VALUES ('이율곡','총무부','남','2016-3-8','과장',385,65.4);
INSERT INTO tStaff VALUES ('이사부','총무부','남','2000-2-3','대리',375,50);
INSERT INTO tStaff VALUES ('안창호','영업부','남','2015-8-15','사원',370,74.2);
INSERT INTO tStaff VALUES ('을지문덕','영업부','남','2019-6-29','사원',330,NULL);
INSERT INTO tStaff VALUES ('정약용','총무부','남','2020-3-14','과장',380,69.8);
INSERT INTO tStaff VALUES ('홍길동','인사과','남','2019-8-8','차장',380,77.7);
INSERT INTO tStaff VALUES ('대조영','총무부','남','2020-7-7','차장',290,49.9);
INSERT INTO tStaff VALUES ('장보고','인사과','남','2005-4-1','부장',440,58.3);
INSERT INTO tStaff VALUES ('선덕여왕','인사과','여','2017-8-3','사원',315,45.1);

select name, depart, grade from tStaff;
SELECT * FROM tStaff;
select * from tStaff where salary >= 400;


create table tCity
(
	name CHAR(10) primary key,
	area int null,
	popu int null,
	metro CHAR(1) not null,
	region char(6) not null
);

insert into tCity values ('서울', 605,974,'y','경기');
insert into tCity values ('부산', 765,342,'y','경상');
insert into tCity values ('오산', 42,21,'n','경기');
insert into tCity values ('청주', 940,83,'n','충청');
insert into tCity values ('전주', 205,65,'n','전라');
insert into tCity values ('순천', 910,27,'n','전라');
insert into tCity values ('춘천', 1116,27,'n','강원');
insert into tCity values ('홍천', 1819,7,'n','강원');

select name [도시],popu [인구(만명)],region [지역] from tCity;
select * from tCity
select * from tCity where popu<10;
select * from tCity where region='전라';

select * from tStaff where salary < 300 and score > 60;
select name from tStaff where depart = '영업부' and gender = '여';

select * from tStaff where name like '정%';
select * from tStaff where name like '%신%';

select * from tCity where area between 500 and 1000;
select * from tStaff where salary between 200 and 300;

select * from tStaff where depart in ('총무부', '영업부');
select * from tStaff where depart in ('인사과', '영업부') and grade = '대리';
select * from tStaff where grade not in ('사원','대리') and gender='여';

select * from tStaff order by salary, score desc;
select * from tStaff where depart='영업부' order by joindate;

select distinct depart from tStaff where convert(varchar(10),joindate)>convert(varchar(10),2020-01-01) and grade='사원';

select * from tStaff order by salary desc offset 11 rows fetch next 5 rows only; 

select name from tStaff where score is Null;
select count(*) from tStaff where score >= 80;

select max(salary) from tStaff where gender = '여';
select min(joindate) from tStaff where depart = '총무부';

select region, sum(popu) from tCity group by region;

select region, max(area) from tCity group by region having sum(popu)>50
select region, avg(area) from tCity group by region having avg(area)>=1000;

insert into tCity values('용인', 293, 98, 'y', '경기');
insert into tStaff values('최동영','개발팀','남','2022-9-13','사원',250,50);

insert into tCity (name, area, popu, metro, region) values('이천', 461, 21, 'y', '경기'),('대구', 883, 248, 'y', '경북'),('영월', 1127, 4, 'n', '강원');

select name,salary into cruetable from tStaff where score >= 80;
select * from cruetable;

update tStaff set grade='대리' where gender='여';
update tStaff set salary = 1.1 * salary where depart='영업부';

drop table tCity;
use master;
drop database Study;