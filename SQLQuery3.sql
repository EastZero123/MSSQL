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

INSERT INTO tStaff VALUES ('������','�ѹ���','��','2000-2-3','�̻�',420,88.8);
INSERT INTO tStaff VALUES ('������','������','��','2009-3-1','����',380,NULL);
INSERT INTO tStaff VALUES ('���߱�','�λ��','��','2012-5-5','�븮',256,76.5);
INSERT INTO tStaff VALUES ('������','������','��','2015-8-15','����',350,71.25);
INSERT INTO tStaff VALUES ('������','������','��','2018-10-9','���',320,56.0);
INSERT INTO tStaff VALUES ('������','�ѹ���','��','2010-9-16','�븮',370,89.5);
INSERT INTO tStaff VALUES ('�㳭����','�λ��','��','2020-1-5','���',285,44.5);
INSERT INTO tStaff VALUES ('�Ż��Ӵ�','������','��','2013-6-19','����',400,92.0);
INSERT INTO tStaff VALUES ('���﹮','������','��','2014-6-8','�븮',285,87.75);
INSERT INTO tStaff VALUES ('��','�λ��','��','2010-9-16','�븮',340,46.2);
INSERT INTO tStaff VALUES ('Ȳ����','�λ��','��','2012-5-5','���',275,52.5);
INSERT INTO tStaff VALUES ('������','�ѹ���','��','2016-3-8','����',385,65.4);
INSERT INTO tStaff VALUES ('�̻��','�ѹ���','��','2000-2-3','�븮',375,50);
INSERT INTO tStaff VALUES ('��âȣ','������','��','2015-8-15','���',370,74.2);
INSERT INTO tStaff VALUES ('��������','������','��','2019-6-29','���',330,NULL);
INSERT INTO tStaff VALUES ('�����','�ѹ���','��','2020-3-14','����',380,69.8);
INSERT INTO tStaff VALUES ('ȫ�浿','�λ��','��','2019-8-8','����',380,77.7);
INSERT INTO tStaff VALUES ('������','�ѹ���','��','2020-7-7','����',290,49.9);
INSERT INTO tStaff VALUES ('�庸��','�λ��','��','2005-4-1','����',440,58.3);
INSERT INTO tStaff VALUES ('��������','�λ��','��','2017-8-3','���',315,45.1);

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

insert into tCity values ('����', 605,974,'y','���');
insert into tCity values ('�λ�', 765,342,'y','���');
insert into tCity values ('����', 42,21,'n','���');
insert into tCity values ('û��', 940,83,'n','��û');
insert into tCity values ('����', 205,65,'n','����');
insert into tCity values ('��õ', 910,27,'n','����');
insert into tCity values ('��õ', 1116,27,'n','����');
insert into tCity values ('ȫõ', 1819,7,'n','����');

select name [����],popu [�α�(����)],region [����] from tCity;
select * from tCity
select * from tCity where popu<10;
select * from tCity where region='����';

select * from tStaff where salary < 300 and score > 60;
select name from tStaff where depart = '������' and gender = '��';

select * from tStaff where name like '��%';
select * from tStaff where name like '%��%';

select * from tCity where area between 500 and 1000;
select * from tStaff where salary between 200 and 300;

select * from tStaff where depart in ('�ѹ���', '������');
select * from tStaff where depart in ('�λ��', '������') and grade = '�븮';
select * from tStaff where grade not in ('���','�븮') and gender='��';

select * from tStaff order by salary, score desc;
select * from tStaff where depart='������' order by joindate;

select distinct depart from tStaff where convert(varchar(10),joindate)>convert(varchar(10),2020-01-01) and grade='���';

select * from tStaff order by salary desc offset 11 rows fetch next 5 rows only; 

select name from tStaff where score is Null;
select count(*) from tStaff where score >= 80;

select max(salary) from tStaff where gender = '��';
select min(joindate) from tStaff where depart = '�ѹ���';

select region, sum(popu) from tCity group by region;

select region, max(area) from tCity group by region having sum(popu)>50
select region, avg(area) from tCity group by region having avg(area)>=1000;

insert into tCity values('����', 293, 98, 'y', '���');
insert into tStaff values('�ֵ���','������','��','2022-9-13','���',250,50);

insert into tCity (name, area, popu, metro, region) values('��õ', 461, 21, 'y', '���'),('�뱸', 883, 248, 'y', '���'),('����', 1127, 4, 'n', '����');

select name,salary into cruetable from tStaff where score >= 80;
select * from cruetable;

update tStaff set grade='�븮' where gender='��';
update tStaff set salary = 1.1 * salary where depart='������';

drop table tCity;
use master;
drop database Study;