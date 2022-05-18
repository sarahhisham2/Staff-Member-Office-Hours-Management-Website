create schema staff;
Use staff;
CREATE TABLE StaffMembers
(
MemberID  varchar(20) not null,
UserName varchar(45) ,
password varchar(45),
email varchar(45),
contact varchar(45),
subject varchar(45),
name varchar(45),
primary key(MemberID)
);

CREATE TABLE OfficeHours
(
StaffMemberID varchar(20),
day varchar(20),
t time ,
status varchar(20), -- offline/online
location varchar(20),
ID varchar(20) not null,
primary key(ID),
foreign key(StaffMemberID) references staffmembers(MemberID)
);

CREATE TABLE Students
(
MemberID  varchar(20) not null,
UserName varchar(45) ,
password varchar(45),
email varchar(45),
contact varchar(45),
name varchar(45),
primary key(MemberID)
);

CREATE TABLE reservation
(
StudentID varchar(20),
officeHoursID varchar(45) not null,
d date,
t time,
StaffMemberID varchar(20),
primary key(officeHoursID),
foreign key (officeHoursID) references OfficeHours(ID),
foreign key (StudentID) references Students(MemberID),
foreign key (StaffMemberID) references StaffMembers(MemberID)
);

insert into StaffMembers values('1','hala','111','@gmail','011','math','hala');
insert into StaffMembers values('2','hana','111','@gmail','011','math','hana');
insert into StaffMembers values('3','tala','111','@gmail','011','science','tala');
insert into StaffMembers values('4','sama','111','@gmail','011','english','sama');

insert into OfficeHours values('1','wednesday','5:00:00','online','home','1');
insert into OfficeHours values('2','tuesday','5:00:00','offline','lab 6','2');
insert into OfficeHours values('3','monday','5:00:00','online','home','3');
insert into OfficeHours values('4','thursday','5:00:00','offline','lab 33','4');

insert into Students values('1','ahmed10','111','@gmail','011','ahmed');
insert into Students values('2','farida11','111','@gmail','011','farida');
insert into Students values('3','salma20','111','@gmail','011','salma');
insert into Students values('4','mohamed','111','@gmail','011','mohamed');

select MemberID from StaffMembers where name='hana';
select subject ,name from StaffMembers ;
select *from OfficeHours;
DELETE FROM officehours WHERE ID='1';
SELECT max( ID) FROM OfficeHours where StaffMemberID='1';
select name , status , time , location from StaffMembers , OfficeHours where name='hana' and MemberID = OfficeHours.StaffMemberID;
select name, contact from students where name='farida';