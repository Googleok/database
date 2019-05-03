-- 날짜형 함수

select curdate(), current_date();
select curtime(), current_date();
select now(), sysdate(), current_timestamp();

select now(), sleep(2), now();
-- sysdate 는 시차가 생긴다.
select sysdate(), sleep(2), sysdate();

select date_format(now(), '%Y년 %m월 %d일 %h시 %m분 %s초');

select first_name, 
	   hire_date,
       date_add(hire_date, interval 5 month)
       from employees;
       
select now(), cast(now() as date);
select cast(1-2 as unsigned);
select cast(cast(1-2 as unsigned) as signed);


