CREATE DATABASE IF NOT EXISTS employees;
USE employees;

CREATE TABLE employee (
    empID      INT    auto_increment      NOT NULL,
    fName  VARCHAR(14)     NOT NULL,
    lName   VARCHAR(16)     NOT NULL,
    gender      ENUM ('M','F')  NOT NULL,    
    dateHired   DATE            NOT NULL,
    officeID  INT not null,
    PRIMARY KEY (empID)
);

CREATE TABLE department (
    deptID     CHAR(4)         NOT NULL,
    deptName   VARCHAR(40)     NOT NULL,
    PRIMARY KEY (deptID),
    UNIQUE  KEY (deptName)
);

CREATE TABLE deptManager (
   empID       INT       auto_increment      NOT NULL,
   deptID      CHAR(4)         NOT NULL,
   startDate    DATE            NOT NULL,
   endDate      DATE            NOT NULL,
   PRIMARY KEY (empID,deptID)
); 

CREATE TABLE deptEmp (
    empID      INT       auto_increment    NOT NULL,
    deptID     CHAR(4)         NOT NULL,
    startDate   DATE            NOT NULL,
    endDate     DATE            NOT NULL,
    PRIMARY KEY (empID,deptID)
);

CREATE TABLE salary (
    empID      INT       auto_increment      NOT NULL,
    salary      INT             NOT NULL,
    startDate   DATE            NOT NULL,
    endDate     DATE            NOT NULL,
    PRIMARY KEY (empID, startDate)
) 
; 
CREATE TABLE office(
  officeID int NOT NULL,
  phone varchar(50) NOT NULL,
  officeAddress varchar(50) NOT NULL,
  officeState varchar(50) DEFAULT NULL,
  postalCode varchar(15) NOT NULL,
  PRIMARY KEY (officeID)
);
alter table deptManager add FOREIGN KEY (empID)  REFERENCES employee (empID) ON DELETE CASCADE;
alter table deptManager add FOREIGN KEY (deptID) REFERENCES department (deptID) ON DELETE CASCADE;
alter table deptEmp add FOREIGN KEY (empID) REFERENCES employee (empID) ON DELETE CASCADE;
alter table deptEmp add FOREIGN KEY (deptID) REFERENCES department (deptID) ON DELETE CASCADE;
alter table salary add FOREIGN KEY (empID) REFERENCES employee (empID) ON DELETE CASCADE;
alter table employee add FOREIGN KEY (officeID) REFERENCES office(officeID) ON DELETE cascade;
