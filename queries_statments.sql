USE employees;

#Update Employee Data
UPDATE employee SET fName='emp', lName='1' WHERE empID=1;
UPDATE employee SET fName='emp', lName='2' WHERE empID=2;
UPDATE employee SET fName='emp', lName='3' WHERE empID=3;
UPDATE employee SET fName='emp', lName='4' WHERE empID=4;
UPDATE employee SET fName='emp', lName='5' WHERE empID=5;
UPDATE employee SET fName='emp', lName='6' WHERE empID=6;


#Update Salary Data
UPDATE salary SET startDate='2002-04-10', endDate='2020-01-30' WHERE empID=1;
UPDATE salary SET startDate='2005-10-10', endDate='2020-01-30' WHERE empID=2;
UPDATE salary SET startDate='2010-03-21', endDate='2020-01-30' WHERE empID=3;
UPDATE salary SET startDate='2003-06-25', endDate='2020-01-30' WHERE empID=4;
UPDATE salary SET startDate='2007-08-12', endDate='2020-01-30' WHERE empID=5;
UPDATE salary SET startDate='2002-05-10' WHERE empID=6;

#Update Department Manager Data
UPDATE deptmanager SET startDate='2002-04-10', endDate='2020-01-30' WHERE empID=1;
UPDATE deptmanager SET startDate='2005-10-10', endDate='2020-01-30' WHERE empID=2;
UPDATE deptmanager SET startDate='2010-03-21', endDate='2020-01-30' WHERE empID=3;
UPDATE deptmanager SET startDate='2003-06-25', endDate='2020-01-30' WHERE empID=4;
UPDATE deptmanager SET startDate='2007-08-12', endDate='2020-01-30' WHERE empID=5;

#Update Office Data
Update office set officeAddress='13 elzohor district',officeState='Cairo' where officeID=1;
Update office set officeAddress='45 moalemeen street',officeState='Alex' where officeID=2;
Update office set officeAddress='old city',officeState='Damascus' where officeID=3;
Update office set officeAddress='6 october',officeState='Cairo' where officeID=4;
Update office set officeAddress='zawraa park street',officeState='Baghdad' where officeID=5;

#Update Department Data
Update department set deptName='Computer Science' where deptID='1';
Update department set deptName='Software Engineering' where deptID='2';
Update department set deptName='Bioinformatics' where deptID='3';
Update department set deptName='Information System' where deptID='4';
Update department set deptName='Artificial Intelligence' where deptID='5';


#Delete Statements

DELETE FROM employee WHERE year(dateHired) <= 2002;
DELETE FROM department WHERE deptName = 'Computer Science';
DELETE FROM office WHERE officeState = 'Cairo' ;
DELETE FROM salary WHERE salary <= 2200 ;
DELETE FROM employee WHERE gender = 'F';


#Select Statements

Select fname as "first name", lname as "last name" from employee;

Select fname, lname from employee where gender = 'F';

Select count(*) as "Number of Employees" from employee where year(DateHired) >= 2004;

Select year(DateHired) as "Year", count(*) as "Number of Employees" from employee group by year(DateHired);

Select lname, gender from employee where officeID != 4 and officeID != 5 ;

Select lname from employee where empID in (Select empID from salary where salary > 3000);

Select max(salary) from salary where year(startDate) > 2006;

Select phone from office where officeState = 'Cairo';

Select officeAddress from office where phone = '01011231452';

Select count(*) as "Number of offices", officeState as "State" from office group by officeState;

Select deptName as "Department Name" from department;

Select count(*) as "Number of employees", deptID as "Department ID" from deptemp group by deptID;

Select empID as "Employee ID", startDate as "Date Started" from deptemp where deptID = '1';

Select officeID as "Office Number", empID as "Employee ID" from employee where empID in (Select empID as "Employee ID" from deptemp where deptID = '3');

Select empID as "Manager ID" from deptmanager;

Select empID, deptID from deptemp where day(endDate) >= '15';

Select empID from deptemp where year(startdate) < 2008 and day(endDate) < 25;

Select fName,lName from employee LEFT JOIN deptemp USING(empID) where year(startdate) < 2008 and day(endDate) < 25;

Select officeID, sum(salary) as "Office Salary" from salary LEFT JOIN employee USING(empID) group by(officeID) order by(sum(salary)) DESC;

Select fName as "First Name", lName "Last Name" from employee where officeID in (Select officeID from office where officeState != "Cairo");