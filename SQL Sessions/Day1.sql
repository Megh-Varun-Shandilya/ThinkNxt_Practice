create table book(Book_No int(6), Book_Name varchar(20), Author_name varchar(20), Cost int(7), Category char(20));

desc book;
insert into book values(101,'Let us C','Denis Ritchie',450,'System');

insert into book values(102,'Oracle – Complete', 'Loni', 550, 	'Database');
insert into book values(103, 'Mastering SQL','Loni',250,'Database'); 
insert into book values(104,	'PL SQL-Ref',	'Scott Urman',750, 'Database');



# data fetching 
#-------------------------------------------------
select * from book;

select * from book where cost between 500 and 700;

select * from book where book_name like 'O%';

select * from book where cost < (select avg(cost) from book);

create table new_book like book;
 
create table new_kitab as (select * from book);

select max(cost) from book as Costliest_Book;

select min(cost) from book as Cheapest_book;


select author_name from book group by Author_name having count(*) > 1;

update book SET cost = cost + 150 where book_name = 'let us c';
SET SQL_SAFE_UPDATES = 0;



select * from book where book_name = 'let us c';

select book_name, cost from book where category = 'Database' OR category ='System';


alter table book add published_year int(4);


alter table book add subscriber varchar(20) after author_name;

update book set published_year = 2023 where book_name='let us c'; 

desc book;

select * from book where book_name='let us c';

create table employee
(eno int primary key,
ename varchar(10),gender varchar(2),job varchar(10),salary int,doj date,comm int,dno int);
insert into employee (eno,ename,gender,job,salary,doj,comm,dno)
values
(01,'pretty','f','teacher',15000,'2022-3-19',1000,100),
(02,'preethi','f','office',10000,'2021-3-23',500,101),
(03,'blessy','f','teacher',20000,'2019-7-25',2000,100),
(04,'rajeev','m','principal',30000,'2017-03-05',4000,102),
(05,'jessy','m','teacher',15000,'2022-3-19',1000,100),
(06,'sunny','m','office',10000,'2020-5-09',1000,101),
(07,'crizal','f','watch man',5000,'2016-8-10',500,103);


create table dept
(dno int primary key,
dname varchar(30) not null,no_of_employees int,location varchar(25) ,
eno int, foreign key (eno) references employee(eno) );
select* from dept;
insert into dept (dno,dname,no_of_employees,location)
values
(201,'physics department',2,'hyderabad'),
(203,'maths department',4,'hyderabad'),
(202,'computers department',3,'hyderabad');


