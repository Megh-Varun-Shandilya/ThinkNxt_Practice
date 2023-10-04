DROP procedure myProcedure;

# Example 1 -----------------------------------------------------------------------------------------------------------------------------------------
delimiter $$
CREATE procedure myProcedure()
BEGIN
	select * from cars;
END $$    
   call myProcedure();
   
# Example 2------------------------------------------------------------------------------------------------------------------------  
delimiter $$   
CREATE procedure exampleTwo()
   
   
   
 # Example 3 ------------------------------------------------------------------------------------------------------------------------  
delimiter $$   
CREATE procedure simpleProc(OUT var INT)
Begin 
 select count(*) into var from cars;
End $$
call simpleProc(@a);
select @a;

# Example 4 ------------------------------------------------------------------------------------------------------------------------
delimiter $$

CREATE procedure getTotalCarsBy(IN mkrName varchar(30), OUT total int)
BEGIN
select count(*) into total from cars where maker = mkrName;
END $$

call getTotalCarsBy("Volkswagen",@tot);

select @tot AS 'Total';

#Example 5 -------------------------------------------------------------------------------------------------------------

# CASE 1: A Stored Procedure that Accept No Parameters
DELIMITER |
CREATE PROCEDURE sample_sp_no_param ()
BEGIN
UPDATE emp SET `first name`= 'ChangedHJK' where id = 1;
END
|

DELIMITER ;
CALL sample_sp_no_param;
select * from emp;

# Example 6 -----------------------------------------------------------------------------------------------------------------------------------

# CASE 2: A Stored Procedure that Accept Parameters(IN, OUT, INOUT)

Delimiter |

CREATE procedure caseStudyTwo(IN empId INT Unsigned, OUT oldName VARCHAR(20), INOUT newName VARCHAR(20))
BEGIN
SELECT 'first Name' into oldname from Emp where id = empId;

#UPDATE emp SET 'first Name' = newName where id = empId;

END |

set @inout='updatedHJK';
CALL sample_sp_with_params(1,@out,@inout);
select @out,@inout;
select * from emp;

CREATE TABLE emp1(`first name` VARCHAR(20), id INT PRIMARY KEY);

insert into emp1 values('HJK', 1);
insert into emp1 values('ABC', 2);
insert into emp1 values('DEF', 3);

# Example 7 -------------------------------------------------------------------------------------------------------------------------
Delimiter &&
CREATE PROCEDURE fact(IN x INT)
BEGIN
  DECLARE result INT;
  DECLARE i INT;
  SET result = 1;
  SET i = 1;
  WHILE i <= x DO
    SET result = result * i;
    SET i = i + 1;
  END WHILE;

  SELECT x AS Number, result as Factorial;

END &&

CALL fact(1);
CALL fact(2);
CALL fact(4);
CALL fact(0);


# Example 8-----------------------------------------------------------------------------------------------------------------

DELIMITER //
CREATE FUNCTION CalcIncome( starting_value INT )
RETURNS INT
BEGIN
   DECLARE income INT;
   SET income = 0;

   label: WHILE income <= 3000 DO
     SET income = income + starting_value;
   END WHILE label;

   RETURN income;
END //

DELIMITER ;
SELECT CalcIncome (1000);


#Example 9 ---------------------------------------------------------------------------------------------------
Delimiter $
CREATE FUNCTION hello(s CHAR(20))
RETURNS CHAR(50) 
DETERMINISTIC
begin
RETURN CONCAT('Hello, ',s,'!');
End $

SELECT hello('world');

# Example 10 ------------------------------------------------------------------------------------------------------------------
# CASE 4: A Stored Function that Accept No Parameters

DELIMITER |
CREATE FUNCTION sampleProg ()
RETURNS INT
Deterministic
BEGIN
DECLARE count INT;
SELECT COUNT(*) INTO count FROM emp;
RETURN count;
END |

DELIMITER ;
select sampleProg ();

# Example 11-------------------------------------------------------------------------------------------------------------

CREATE TABLE test1(a1 INT);
CREATE TABLE test2(a2 INT);
CREATE TABLE test3(a3 INT NOT NULL AUTO_INCREMENT PRIMARY KEY);
CREATE TABLE test4(
  a4 INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  b4 INT DEFAULT 0
);

delimiter |

CREATE TRIGGER testref BEFORE INSERT ON test1
  FOR EACH ROW
  BEGIN
    INSERT INTO test2 SET a2 = NEW.a1;
    DELETE FROM test3 WHERE a3 = NEW.a1;
    UPDATE test4 SET b4 = b4 + 1 WHERE a4 = NEW.a1;
  END;
|

delimiter ;

INSERT INTO test3 (a3) VALUES
  (NULL), (NULL), (NULL), (NULL), (NULL),
  (NULL), (NULL), (NULL), (NULL), (NULL);

INSERT INTO test4 (a4) VALUES
  (0), (0), (0), (0), (0), (0), (0), (0), (0), (0);

SET @sum=0;

CREATE TABLE accounts(account_nun int,amount decimal(10,2));


insert into accounts values(1,10000.23);
insert into accounts values(2,20000);
select @sum;    

CREATE TRIGGER trg_1 BEFORE INSERT on accounts
for EACH ROW
SET @sum=@sum+NEW.amount;

select @sum; 


#Example 12-------------------------------------------------------------------------------------------------------
CREATE TABLE employees_audit (
    id INT AUTO_INCREMENT PRIMARY KEY,
    employeeNumber INT NOT NULL,
    lastname VARCHAR(50) NOT NULL,
    changedat DATETIME DEFAULT NULL,
    action VARCHAR(50) DEFAULT NULL
);

DELIMITER $$
CREATE TRIGGER before_employee_update 
    BEFORE UPDATE ON emp
    FOR EACH ROW 
BEGIN
    INSERT INTO employees_audit
    SET action = 'update',
     employeeNumber = OLD.employeeNumber,
        lastname = OLD.lastname,
        changedat = NOW(); 
END$$
DELIMITER ;






