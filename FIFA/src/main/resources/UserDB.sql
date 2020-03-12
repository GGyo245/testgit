drop table userdb;

create table USERDB(
    email varchar2(100) primary key,
    name varchar2(40) not null,
    nick varchar2(40) not null,
    pw varchar2(40) not null,
    inputdate date default sysdate,
    authorites varchar2(20) default 'ROLE_MEMBER'
);