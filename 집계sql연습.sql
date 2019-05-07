-- 집계 sql 연습
SELECT * FROM salaries where emp_no = 11007;
-- 예제 1 : 각 사원별로 평균연봉 출력
select emp_no, avg(salary) from salaries
	group by emp_no
    order by avg(salary) desc;

-- 예제 2 : 각 현재 Manager 직책 사원에 대한 평균 연봉은?
select emp_no, title from titles
	where title = 'Manager';
    
-- 예제 3 : 사원별 몇 번의 직책 변경이 있었는지 조회
select emp_no, count(title) 
	from titles
    group by emp_no;
    
-- 예제 4 : 각 사원별로 평균연봉 출력하되 50,000불
-- 이상인 직원만 출력

select emp_no, avg(salary) as avg_salary
	from salaries
    group by emp_no
    having avg(salary) > 50000;
    
-- 예제 5 : 현재 직책별로 (평균 연봉)과 인원수를 구하되
-- 직책별로 인원이 100명 이상인 직책만 출력하세요.
SELECT title, count(emp_no)
	from titles
    where to_date = '9999-01-01'
    group by title
    having count(emp_no) >= 100;
    
-- 예제 6 :현재 부서별로 현재 직책이 Engineer인 직원들에
-- 대해서만 평균급여를 구하세요.
-- JOIN 맛보기
-- equi 조인 같은 조건을 찾아라
select c.dept_no, d.dept_name, avg(a.salary)
	from salaries a, titles b, dept_emp c, departments d
    where a.emp_no = b.emp_no
    and c.dept_no = d.dept_no
    and b.emp_no = c.emp_no
    and a.to_date = '9999-01-01'
    and b.to_date = '9999-01-01'
    and b.title = 'Engineer'
group by c.dept_no;
        
-- 예제 7 : 현재 직책별로 급여의 총합을 구하되 Engineer
-- 직책은 제외하세요. 단, 총합이 2,000,000,000 이상인
-- 직책만 나타내며 급여총합에 대해서 내림차순(DESC)로 정렬하세요.    
select title, sum(salary)
	from titles a, salaries b
    where a.emp_no = b.emp_no
    and a.to_date = '9999-01-01'
    and b.to_date = '9999-01-01'
group by title
	having sum(salary) > 2000000000
order by sum(salary) desc;

-- employees 테이블과 titles 테이블을
-- join 하여 직원의 이름과 직책을 출력하되
-- 여성 엔지니어만 출력하세요.
select concat(a.first_name, ' ', a.last_name) as name
	, b.title 
	from employees a, titles b
    where a.emp_no = b.emp_no
    and a.gender = 'F'
    and b.title = 'Engineer';

--
-- ANSI/ISO SQL 1999 JOIN의 문법
--

-- join ~ on
select concat(a.first_name, ' ', a.last_name) as name,
	b.title , a.gender
	from employees a
    join titles b on a.emp_no = b.emp_no
    where a.gender = 'F'
    and b.title = 'Engineer';

-- natural join
select concat(a.first_name, ' ', a.last_name) as name,
	b.title , a.gender
	from employees a
    join titles b 
    where a.gender = 'F'
    and b.title = 'Engineer';

-- join ~ using
select count(*)
	from employees a
    join titles b 
    using (emp_no)
    where a.gender = 'F'
    and b.title = 'Engineer';

-- Outer Join
-- 실습문제 1: 현재 회사 상황을 반영한 직원(별) 근무부서를
-- 사번, 직원 전체이름, 근무부서 형태로 출력해 보세요.
select a.first_name, b.dept_no, c.dept_name
	from employees a
    left join dept_emp b on a.emp_no = b.emp_no
    join departments c on b.dept_no = c.dept_no
    where b.dept_no = c.dept_no
    and b.to_date = '9999-01-01'
    and b.dept_no is null;

-- 실습문제 2: 현재 회사에서 지급되고 있는 급여체계를 반영한 결과를 출력하세요.
-- 사번, 전체이름, 연봉 이런 형태로 출력하세요.

