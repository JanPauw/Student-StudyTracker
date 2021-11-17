create database [UniManageApp-DB];

---------------------------------------------
--Table Creation
---------------------------------------------
create table Student
(
	[S_Number] varchar(255) NOT NULL PRIMARY KEY,
	[S_Name] varchar(255),
	[S_Surname] varchar(255),
	[S_SemLength] int,
	[S_SemStart] date,
    [Password] varchar(MAX),
);

create table Module
(
	[ID] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[M_Code] varchar(255) NOT NULL,
	[M_Name] varchar(255),
	[M_Credits] int,
	[M_Hours] int,
	[S_Number] varchar(255),
	[M_Studied] int,

	FOREIGN KEY (S_Number) REFERENCES Student(S_Number),
);

create table StudyDay
(
	[ID] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[M_Code] varchar(255) NOT NULL,
	[S_Number] varchar(255),
	[M_Studied] int,
	[Study_Date] date
);

---------------------------------------------
--View Data
---------------------------------------------
select * from Student;
select * from Module;
select * from StudyDay;

---------------------------------------------
--Drop Tables
---------------------------------------------
drop table Student;
drop table Module;
drop table StudyDay;
---------------------------------------------