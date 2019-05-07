-- outer join

insert into department values(null, '총무팀');
insert into department values(null, '개발팀');
insert into department values(null, '인사팀');
insert into department values(null, '영업팀');

select * from department;

select * from employee;

insert into employee values(null, '둘리', 1);
insert into employee values(null, '마이콜', 2);
insert into employee values(null, '또치', 3);
insert into employee values(null, '길동', null);

-- join ~ on (inner join)
select *
	from employee a
    join department b 
		on a.department_no = b.no;

-- left join ( outer join )
select a.name, ifnull(b.name, '없음')
	from employee a
    left join department b 
		on a.department_no = b.no;

-- right join ( outer join )
select ifnull(a.name, '없음'), b.name
	from employee a
    right join department b 
		on a.department_no = b.no;

-- full join ( outer join ) -> mysql / mariadb 지원 안함 
-- select a.name, b.name
--	from employee a
--  full join department b 
--		on a.department_no = b.no;




