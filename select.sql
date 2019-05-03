-- select 기본

select *
	from departments;

select first_name,
	   gender,
       hire_date
       from employees;
       
select concat(first_name, ' ', last_name),
	   gender,
       hire_date
       from employees;

select concat(first_name, ' ', last_name) AS 이름,
	   gender AS 성별,
       hire_date AS 입사일
       from employees;
       
select distinct title from titles;

select concat(first_name, ' ', last_name) AS 이름,
	   gender AS 성별,
       hire_date AS 입사일
       from employees 
       order by hire_date desc;
       
select emp_no, salary
	from salaries
    where from_date like '2001%'
    order by salary desc;
    
select concat(first_name, ' ', last_name) AS 이름,
	   gender AS 성별,
       hire_date AS 입사일
       from employees 
       where hire_date <= '1991-01-01';

select concat(first_name, ' ', last_name) AS 이름,
	   gender AS 성별,
       hire_date AS 입사일
       from employees 
       where hire_date <= '1991-01-01'
       and gender = 'f';
       
select emp_no, dept_no
	from dept_emp
    where dept_no in ('d005', 'd009');
    


        


           
              
    
      

       
       