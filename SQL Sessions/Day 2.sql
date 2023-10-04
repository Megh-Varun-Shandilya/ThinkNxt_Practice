desc cars;

select * from cars where maker='volkswagen';


select  model,max(displacement) from cars group by model;

select count(*) as 'Total Count',type from cars group by type order by count(*) desc;
select count(*), maker from cars group by Maker;


select distinct(fuel) from cars;


show tables;
desc employee;


create table department (dept_ID INT NOT NULL PRIMARY KEY, DEPT_NAME VARCHAR(40) NOT NULL);


INSERT INTO DEPARTMENT VALUES(101, 'Admin');
INSERT INTO DEPARTMENT VALUES(102, 'HR');
INSERT INTO DEPARTMENT VALUES(103, 'Finance');
INSERT INTO DEPARTMENT VALUES(104, 'Production');
INSERT INTO DEPARTMENT VALUES(105, 'Sales');
INSERT INTO DEPARTMENT VALUES(106, 'Executive Office');
INSERT INTO DEPARTMENT VALUES(107, 'Software Engineering');

drop table department;

update department set dept_NAME = 'Admin' where dept_id=101;

select distinct(dept_name) from department;

select * from department;

create table employee_data(id INT PRIMARY KEY NOT NULL, NAME VARCHAR(100), AGE INT, DEPT_ID INT, FOREIGN KEY (DEPT_ID) REFERENCES DEPARTMENT(DEPT_ID));


desc employee_data;

alter table employee_data rename column id TO ID ;

alter table employee_data add CITY varchar(20) after name;


insert into employee_data values(1,'Varun','Pune',26,107);
insert into employee_data values(2,'Kavita','Patna',26,104);
insert into employee_data values(3,'Nancy','Ranchi',25,102);
insert into employee_data values(4,'Kittu','Daltonganj',27,105);
insert into employee_data values(5,'Ruhi','Raipur',27,103);
insert into employee_data values(6,'Megh','Pune',26,105);
insert into employee_data values(7,'Ketan','Delhi',28,103);
insert into employee_data values(8,'Anshu','Gurgaon',29,106);
insert into employee_data values(9,'Anku','Patna',24,106);


select * from employee_data;




  select * from employee_data e inner join department d on d.dept_id = e.dept_id  dept_id=104;
  
  
create table students (s_id INT(10) NOT NULL AUTO_INCREMENT, s_firstname VARCHAR(30) NOT NULL, s_lastname VARCHAR(30) NOT NULL, s_email VARCHAR(40), PRIMARY KEY (s_id));
  
  show tables;
  
  desc students;
  
insert into students (s_firstname,s_lastname,s_email) values ('Shankar', 'Bhat', 'shankar@example.com');
insert into students (s_firstname,s_lastname,s_email) values ('Venkat', 'Rao', 'venkat@example.com');
insert into students (s_firstname,s_lastname,s_email) values ('Mohan', 'Nair', 'mohan@example.com');
insert into students (s_firstname,s_lastname,s_email) values ('Abhijeet', 'Patel', 'abhi@example.com');







create table Atable (aid int primary key);
   insert into atable values (1);
   
   
   create table Btable (bid int primary key);
   insert into btable values (11);


 create table ctable (aid int,bid int,foreign key(aid) references atable(aid),foreign key(bid) references btable(bid));
 
 insert into ctable values(1,11);
 
 
 
 select * from atable a, btable b, ctable c where b.bid = c.bid and c.aid = a.aid;
 
 
 drop table btable;
 
 rollback;
 
 
 
 
 show tables;
 
 
 
 
 
 
 create table Atable (aid int primary key);
alter table atable add name varchar(20);
insert into atable values (1,'one');


create table Btable (bid int primary key);
alter table btable add name varchar(20);
insert into btable values (11,'eleven');



create table ctable (aid int,bid int,foreign key(aid) references atable(aid),foreign key(bid) references btable(bid));
 
 
 
 insert into ctable values(1,11);

select a.aid "A",b.bid "B" from atable a,btable b, ctable c where b.bid=c.bid and c.aid = a.aid;

select a.name,b.name from atable a,btable b, ctable c where b.bid=c.bid and c.aid = a.aid;
 
 
 
 create table employee(empid int primary key not null, name varchar(20), salary int(10));
 
 
insert into organization values(1,101);
insert into organization values(2,'103');
insert into organization values(3,'102');
   
   
 select e.empid,o.deptid from employee e, department d, organization o where e.empid = o.empid and d.deptid = o.deptid;
 
 
 
 
 
 
 
 create table department(deptid int primary key not null, deptname varchar(20));
 
 
 
 create table organization (empid int, foreign key(empid) references employee(empid), deptid int(20), foreign key(deptid) references department(deptid));   
 
 
 show tables;
 
 
 select * from employee;