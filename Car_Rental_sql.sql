CREATE DATABASE IF NOT EXISTS car_rental ;


USE car_rental ;

CREATE TABLE Car 
(Car_Number INT NOT NULL PRIMARY KEY,
Car_Model INT  ,
Car_Type VARCHAR(45)  ,
Car_Color VARCHAR(45) , 
Day_Rental_Price INT NOT NULL ) ; 



create table Contract(
Contract_ID int not null primary key,
 start_Date date not null ,
 End_Date date not null,
 Car_num int not null,
 CONSTRAINT For1_key FOREIGN KEY (Car_num)  REFERENCES Car(Car_Number) ON UPDATE CASCADE ON DELETE CASCADE
);


create table Customer ( 
Cust_ID int not null primary key,
First_Name varchar (20) not null,
Middle_Name varchar(20) not null,
Last_Name varchar(20) not null,
Gender ENUM('M','F'),
Email_ID varchar(30) not null,
Zip_Code int,
Street varchar(40),
City varchar(40),
Occupation varchar(40)
); 

create table Employee(
Emp_ID int not null,
Fname varchar(20) not null,
Mname varchar(20) not null,
Lname varchar(20) not null,
Gender Enum ('Male','Female'),
address varchar(20),
Salary int null,
Age int null,
Supper_ID int ,
Bdate date null,
primary key (Emp_ID),
CONSTRAINT For0_key FOREIGN KEY (Supper_ID)  REFERENCES Employee(Emp_ID) ON UPDATE CASCADE ON DELETE CASCADE  
);

CREATE TABLE Office(
Office_ID INT NOT NULL PRIMARY KEY,
Office_Name VARCHAR(30),
MGR_ID varchar(20) NOT NULL ,
Office_Location VARCHAR(40),
MGR_strat_date DATE NOT NULL ,
Employee_ID INT NOT NULL ,
Contract_ID INT NOT NULL,
CONSTRAINT Fore1_key FOREIGN KEY (Employee_ID)  REFERENCES Employee(Emp_ID) ON UPDATE CASCADE ON DELETE CASCADE,
CONSTRAINT Fore2_key FOREIGN KEY (Contract_ID)  REFERENCES Contract(Contract_ID ) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE Payment 
( Contract_ID INT NOT NULL,
Customer_ID INT NOT NULL,
Total_Price INT ,
Payment_Method ENUM('cash', 'check' , 'credit_card'),
CONSTRAINT Pre_key PRIMARY KEY (Customer_ID , Contract_ID),
CONSTRAINT For3_key FOREIGN KEY (Contract_ID)  REFERENCES Contract(Contract_ID) ON UPDATE CASCADE ON DELETE CASCADE,
CONSTRAINT For4_key FOREIGN KEY (Customer_ID)  REFERENCES Customer(Cust_ID) ON UPDATE CASCADE ON DELETE CASCADE  
); 

Create table Dealing_with
(
Cust_ID int not null,
Office_ID int not null,

CONSTRAINT pre3_key PRIMARY KEY (Cust_ID , Office_ID),

CONSTRAINT For7_key FOREIGN KEY (Office_ID)  REFERENCES Office(Office_ID) ON UPDATE CASCADE ON DELETE CASCADE,  
CONSTRAINT For8_key FOREIGN KEY (Cust_ID)  REFERENCES Customer(Cust_ID) ON UPDATE CASCADE ON DELETE CASCADE
);

Create table Customer_Phone
(
Cust_ID int not null,
Phone_Num int not null,

CONSTRAINT pre2_key PRIMARY KEY (Cust_ID , Phone_num),

CONSTRAINT For5_key FOREIGN KEY (Cust_ID)  REFERENCES Customer(Cust_ID) ON UPDATE CASCADE ON DELETE CASCADE 
);


INSERT INTO Car VALUES 
('900' , '2021' , 'Full_Size', 'Black', '300' ),
('901' , '2019' , 'Premiun', 'Silver', '500' ),
('902' , '2020' , 'SUVs', 'White', '600' ),
('903' , '2021' , 'Luxury', 'White', '700' ),
('904' , '2018' , 'SUVs', 'Red', '350' ), 
('905' , '2020' , 'Standard', 'Black', '400' ), 
('906' , '2021' , 'Compact', 'Red', '650' ),
('907' , '2020' , 'Full_Size', 'Silver', '500' ), 
('908' , '2020' , 'Economy', 'White', '200' ),
('909' , '2020' , 'Intermediate', 'Blue', '330' ); 


INSERT INTO Customer Values
( '101','Abdullah','Ali','Mohammad','M','AbdullahMoh@Hotmail.com','58940','5A','Dammam','Teacher'),
( '102','Hamad','Omar','Ahmad','M','Homar00@outlook.com','58863','8B','Khobar','customs official'),
( '103','Dana','Abdullah','Abdulaziz','F','Aquariusdana@gmail.com','58941','9C','Dhahran','Student'),
( '104','Ahmad','Mohaamad','Redha','M','Ahmad1991@Hotmail.com','98762','19Z','Khobar','Government emplyee'), 
( '105','Deema','Khaled','Rashed','F','Deemaaa09@Hotmail.com','58882','9X','Jubail','Public servant'),
( '106','Hadeel','Yousef','Abdulrahman','F','HadeelYA@outlook.com','58940','30A','Dammam','Financial officer'),
( '107','Abdulaziz','Faisal','Salman','M','Aabdulazizz109@Hotmail.com','58865','6O','Abqaiq','civil servant'),
( '108','Suliman','Mansour','Ahmad','M','Suliimaann88@gmail.com','58990','76C','Dammam','Banker'),
( '109','Sara','Mohammad','Abdullah','F','Saramoh@outlook.sa','50097','9B','Khobar','Sales man'),
( '110','Lulu','Hussain','Majed','F','Lulu2030@Hotmail.com','58900','BA','Jubail','Student');


insert into Employee values
('180786532','Ahmad','abdullah','alqahtani','male','Dammam','7000','30',null,'1990-10-03'),
('100789535','Mohamed','nasser','alotaibi','male','Dammam','7500','28','180786532','1992-08-27'),
('190746530','Ali','Khaled','almari','male','Khobar','8000','31','180786532','1989-10-11'),
('160780531','Othman','Malek','alqahtani','male','Khobar','5000','25','180786532','1995-09-01'),
('130786537','Saeed','Ali','almalki','male','Dammam','9000','30','180786532','1990-09-09'),
('102786534','Ahmad','Yasser','aldossary','male','Khobar','7000','28','180786532','1992-06-07'),
('150386539','Nouf','Mohamed','alsubaie','Female','Khobar','9000','28','null','1992-10-25'),
('140706536','yara','abdullah','alotabi','Female','Dammam','6500','25','150386539','1995-09-16'),
('120756533','Naif','Raad','alsultan','male','Dammam','4000','22','150386539','1998-03-10'),
('110780538','Haya','abulaziz','almubark','Female','Khobar','10000','32','150386539','1988-02-19');

INSERT INTO Contract  VALUES 
('10001' , '2021-03-01' ,'2021-03-05','900' ),
('10002' , '2021-03-04' ,'2021-03-05','901' ),
('10003' , '2021-03-05' ,'2021-03-12','902' ),
('10004' , '2021-03-07' ,'2021-03-14','903' ),
('10005' , '2021-03-10' ,'2021-03-12','904' ),
 ('10006' , '2021-03-14' ,'2021-03-24','905' ),
('10007' , '2021-03-21' ,'2021-03-25','906' ),
('10008' , '2021-03-27' ,'2021-04-01','907' ),
 ('10009' , '2021-04-01' ,'2021-04-05','908' ),
('10010' , '2021-04-02' ,'2021-04-08','909' );

INSERT INTO Office  VALUES 
('11000' , '4 Tire Car Rental Shop' , '22000', 'Dammam', '2021-3-2','100789535','10001' ),
('11001' , '4 Tire Car Rental Shop' , '22001', 'Jeddah', '2021-3-4','102786534','10002' ),
('11002' , '4 Tire Car Rental Shop' , '22002', 'Jubail', '2021-3-8','110780538','10003' ),
('11003' , '4 Tire Car Rental Shop' , '22003', 'Riyadh', '2021-3-9','120756533','10004' ),
('11004' , '4 Tire Car Rental Shop' , '22004', 'Khobar', '2021-3-11','130786537','10005' ),
('11005' , '4 Tire Car Rental Shop' , '22005', 'Dammam', '2021-3-17','140706536','10006' ),
 ('11006' , '4 Tire Car Rental Shop' , '22006', 'Jubail', '2021-3-22','150386539','10007' ),
('11007' , '4 Tire Car Rental Shop' , '22007', 'Jeddah', '2021-3-28','160780531','10008' ),
('11008' , '4 Tire Car Rental Shop' , '22008', 'Dammam', '2021-4-2','180786532','10009' ),
('11009' , '4 Tire Car Rental Shop' , '22009', 'Riyadh', '2021-4-4','190746530','10010' );

insert into dealing_with values
('101','11000'),('102','11001'),('103','11002'),('104','11003'),('105','11004'),('106','11005'),('107','11006'),
('108','11007'),('109','11008'),('110','11009');

insert into customer_Phone Values
('101','0548097432'),('102','0568797402'),('103','0508090032'),('104','0509397431'),('105','0508088432'),
('106','0546091432'),('107','0531177432'),('108','0548066403'),('109',0542994232),('110','0500787432');

INSERT INTO Payment VALUES 
( '10001' , '101' ,'1500', 'credit_card'),
( '10002' , '102' ,'1000', 'cash'),
( '10003' , '103' ,'4800', 'Cash'),
( '10004' , '104' ,'5600', 'credit_card'),
( '10005' , '110' ,'1050', 'check'),
( '10006' , '106' ,'4400', 'cash'),
( '10007' , '105' ,'3250', 'credit_card'),
( '10008' , '107' ,'3000', 'check'),
( '10009' , '109' ,'1000', 'cash'),
( '10010' , '108' ,'2310', 'credit_card');

use car_rental;
 update Car 
 set Day_Rental_Price = '350'
 where Car_Number ='908';
 
 use car_rental;
 create view Cust_ID 
 as 
 select Cust_ID
 from customer, payment
 where Total_Price>'2000'
 AND Cust_ID = Customer_ID;
 
 
 use car_rental;
 INSERT INTO car VALUES ( '910' , '2021' , 'Full_Size' , 'Pink' , '676' );
 
 delete from Employee
where Emp_ID = '140706536';

SELECT * 
FROM Customer 
WHERE City IN ('Dammam' , 'Jubail');

 use car_rental;
 Select * 
from Employee 
Where age between 27 and 30;

Select AVG(Salary)
From Employee;

 use car_rental;
SELECT *
FROM Employee
ORDER BY FName ASC;

select Contract_ID 
From Contract 
union 
select Contract_ID 
From Office;



USE Car_Rental; 
SELECT *
FROM Car 
WHERE EXISTS
(SELECT*
FROM Contract
WHERE Car_Number = car_num ) ;

USE Car_Rental; 
SELECT * 
FROM Contract 
Where End_Date IS NULL;

USE Car_Rental; 
Select First_Name
From Customer 
Group by First_Name
Having First_Name>'e' order by First_Name;


USE Car_Rental; 
CREATE TRIGGER Deleted_Car
AFTER DELETE ON Car
FOR EACH ROW
Delete FROM  Contract  WHERE car_num = old.Car_Number; 

USE Car_Rental; 
delete from Car
where Car_Number = '900';


USE Car_Rental; 
SELECT * 
FROM Employee 
WHERE FName LIKE 'a%'; 

use car_rental;
delimiter $$ 
Create function Total_price()
Returns integer
deterministic 
Begin 
Declare total integer;
Select sum(Day_Rental_Price) into total 
From Car;
Return (total);
End;




