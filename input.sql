create table mitablagenial (col int null, col2 varchar(5) null, col3 int not null);
create table prueba (col int null, col2 int null, col3 int not null);

CREATE TABLE PROJ (PROJNO CHAR(6) NOT NULL,
 PROJNAME VARCHAR(24) NOT NULL,
 DEPTNO CHAR(3) NOT NULL WITH DEFAULT 'AAA',
 RESPEMP CHAR(6) NOT NULL,
 PRSTAFF DECIMAL(5,2) ,
 PRSTAXT DECIMAL(5) ,
 PRSTDATE DATE ,
 PRENDATE DATE ,
 MAJPROJ CHAR(6) NOT NULL
);

CREATE TABLE DEPT

 (DEPTNO CHAR(3) NOT NULL,

 DEPTNAME VARCHAR(36) NOT NULL,

 MGRNO CHAR(6) ,

 ADMRDEPT CHAR(3) NOT NULL,

 LOCATION CHAR(16)
);


CREATE TABLE TS01TB

 (C1 SMALLINT,

 C2 DECIMAL(9,2),

 C3 CHAR(4));


CREATE TABLE TS02TB

 (C1 SMALLINT,

 C2 DECIMAL(9,2),

 C3 CHAR(4));

CREATE TABLE TB01 (

 ACCT_NUM INTEGER, 

 CUST_LAST_NM CHAR(15), 

 LAST_ACTIVITY_DT VARCHAR(25), 

 COL2 CHAR(10), 

 COL3 CHAR(25), 

 COL4 CHAR(25), 

 COL5 CHAR(25), 

 COL6 CHAR(55), 

 STATE CHAR(55));



