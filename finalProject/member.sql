create table member(
mid varchar2(50) primary key,
mpw varchar2(50) not null,
mname varchar2(20) not null unique,
mprofile varchar2(100),
mtel varchar2(20),
maddr1 varchar2(200),
maddr2 varchar2(200),
gender varchar2(10),
agegroup varchar2(10),
rdate varchar2(20)
)