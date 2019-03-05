create table member(
mid varchar2(30) primary key,
mpw varchar2(20) not null,
mname varchar2(20) not null unique,
mprofile varchar2(300),
mtel varchar2(20),
maddr1 varchar2(200),
maddr2 varchar2(200),
gender varchar2(5),
agegroup varchar2(5),
rdate varchar2(20)
)