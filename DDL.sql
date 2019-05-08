-- DDL

create table member(
	no int not null auto_increment,
    email varchar(50) not null default '',
    passwd varchar(64) not null,
    name varchar(25), 
    dept_name varchar(25),
    primary key(no)
);

drop table member;

desc member;

insert into member( passwd, name, dept_name) values(password('1234'), '박종억', 'ec솔로션팀');

alter table member add juminbunho char(13) not null after no;
alter table member drop juminbunho;

alter table member change no no int unsigned not null;

alter table member add join_date datetime not null;

alter table member change no no int unsigned not null auto_increment;

alter table member change dept_name department_name varchar(25);

alter table member change name name varchar(10);

drop table member;

alter table member rename user;

desc user;

select * from user;

insert into user
 values(null, '', password('1234'), '박종억2', 'ec솔루션팀', now());

insert into user( passwd, name, department_name, join_date) 
values(password('1234'), '박종억3', 'ec솔로션팀', now());

update user
	set join_date = (select now())
    where no = 1;
    
update user
	set join_date = now(),
		name = 'Park J.eok'
    where no = 1;
    
    delete from user where no = 1;

select * from user;

