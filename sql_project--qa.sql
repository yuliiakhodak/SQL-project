 --1
 select employee_id, first_name, last_name from employees
 where (salary) > (select avg(salary) from employees);

--2
select employee_id, first_name, last_name, salary from employees
where manager_id = 122;

--3
select e.department_id, e.first_name, e.last_name, e.job_id, d.department_name from employees e
join departments d
on e.department_id = d.department_id
where d.department_name = 'Finance';

--4

select * from employees
where salary between (select min(salary)from employees) and 2500;

--5

select e.first_name, e.last_name, d.department_name, l.city, l.state_province from employees e
join departments d
on e.department_id = d.department_id
join locations l
on d.location_id = l.location_id;

--6

select e.first_name, e.last_name, e.department_id, d.department_name from employees e
join departments d
on e.department_id = d.department_id
where e.department_id = 80 or e.department_id = 40;

--7
select first_name, last_name, hire_date from employees 
where department_id = (select department_id from employees where first_name = 'Clara')
AND first_name != 'Clara';

--8
select employee_id, first_name, last_name, salary from employees
where salary > (select avg(salary) from employees)
and department_id in (select department_id from employees where first_name like '%J%');

--9
select e.first_name, e.last_name, d.department_name, l.city, l.state_province from employees e
join departments d
on e.department_id = d.department_id
join locations l
on d.location_id = l.location_id
where e.first_name like '%z%';


--10

SELECT e.first_name, e.last_name, d.department_id, d.department_name
FROM departments d
LEFT JOIN employees e ON d.department_id = e.department_id;

-- 11

select employee_id, first_name, last_name, job_id FROM employees 
WHERE salary < (SELECT MIN(salary) FROM employees WHERE job_id = 'MK_MAN');

--12

SELECT employee_id, first_name, last_name, job_id from employees
WHERE salary > (SELECT max(salary) from employees WHERE job_id = 'PU_MAN')
and job_id != 'PU_MAN';

-- 13 ???

SELECT employee_id, first_name, last_name, job_id from employees
WHERE salary > any (SELECT avg(salary) from employees group by department_id);

--14

select  sum(salary), department_id from employees
group by department_id
having  count(*) > 1;

--15

select first_name, last_name, salary from employees
where salary < (select salary from employees where employee_id = 182);

--16

SELECT e.first_name AS employee_name, m.first_name AS manager_name
FROM employees e
JOIN employees m ON e.manager_id = m.employee_id;

--17

select d.department_name, l.city, l.state_province from departments d
join locations l 
on d.location_id = l.location_id;

---18

select first_name from employees
where salary > (select avg(salary) from employees)
and department_id = 60;

--19

SELECT e.first_name, e.last_name, e.department_id, d.department_name FROM employees e
LEFT JOIN departments d 
ON e.department_id = d.department_id;

--20
SELECT e.first_name AS employee_name, m.first_name AS manager_name
FROM employees e
left JOIN employees m ON e.manager_id = m.employee_id;

--21

SELECT first_name, last_name FROM employees
where salary > (select salary from employees where employee_id = 163);

--22

SELECT first_name, last_name, salary, department_id, job_id FROM employees
where department_id in (select department_id FROM employees where employee_id = 169 );
   
--23

SELECT first_name, last_name, department_id FROM employees
where department_id in (select department_id FROM employees where last_name = 'Taylor');

--24

SELECT m.department_id, m.first_name , m.last_name 
FROM employees e
JOIN employees m ON e.manager_id = m.employee_id;


--25
 select j.employee_id, j.start_date, j.end_date, j.job_id, j.department_id from job_history j
 join employees e
 on j.employee_id = e.employee_id
 where e.salary >= 12000;
 
 --26 ?
 
 SELECT first_name, last_name, salary, department_id FROM employees
 WHERE 
    salary = (SELECT MIN(salary) FROM employees);


---27

select * FROM employees
where salary = 3000
and manager_id = 121;

--28
SELECT 
    e.first_name,
    e.last_name,
    e.employee_id,
    e.job_id
FROM 
    employees e
JOIN 
    departments d ON e.department_id = d.department_id
JOIN 
    locations l ON d.location_id = l.location_id
WHERE 
    l.city = 'Toronto';

--29

SELECT 
    e.first_name,
    e.last_name,
    e.department_id
FROM 
    employees e
    where salary > 3700;
    
    
--30

select * from employees
where salary > (select salary from employees where last_name ='Russell');

--31

select first_name, last_name from employees
where manager_id is null;

--32

select department_id, count(*) from employees
group by department_id;

--33

select e.last_name, l.city from employees e 
join departments d
on e.department_id = d.department_id 
join locations l
on d.location_id = l.location_id;

--34

select j.job_title, avg(e.salary) from jobs j
join employees e
on e.job_id = j.job_id
group by job_title;

--35

select e.last_name, d.department_name, l.city from employees e
join departments d
on e.department_id = d.department_id 
join locations l
on d.location_id = l.location_id;

--36

select first_name, last_name from employees
where department_id is null;


---37
SELECT 
    d.department_name,
    COUNT(e.employee_id) AS num_employees
FROM 
    departments d
LEFT JOIN 
    employees e ON d.department_id = e.department_id
GROUP BY 
    d.department_name;

--38
select e.first_name, e.last_name, department_name from employees e
join departments d
on e.department_id = d.department_id 
where e.salary > 10000;

--39

SELECT 
    department_id,
    last_name,
    AVG(salary) AS average_salary
FROM 
    employees
GROUP BY 
    department_id, last_name
HAVING 
    AVG(salary) > 7000;
    
--40

select first_name, last_name from employees e 
join departments d 
on e.department_id = d.department_id
where department_name = 'IT';

---41

SELECT
    e.first_name,
    e.last_name
FROM
    employees e
JOIN
    departments d ON e.department_id = d.department_id
WHERE
    e.salary > 0.5 * (
        SELECT
            SUM(salary)
        FROM
            employees e2
        WHERE
            e2.department_id = e.department_id
    );

--42


SELECT
*
FROM
    employees e
JOIN
    employees m ON e.employee_id = m.manager_id;
    
--43
SELECT
    d.department_id,
    d.department_name
FROM
    departments d
JOIN
    locations l ON d.location_id = l.location_id
JOIN
    countries c ON l.country_id = c.country_id
WHERE
    l.city = 'London';
    
--44
SELECT
    first_name,
    last_name,
    salary,
    department_id
FROM
    employees
WHERE
    salary > (SELECT AVG(salary) FROM employees)
ORDER BY
    salary DESC;


--45

SELECT
    first_name,
    last_name,
    salary,
    department_id
FROM
    employees
WHERE
    salary > (
        SELECT MAX(salary)
        FROM employees
        WHERE department_id = 40
    );
    
-- 46

SELECT
    d.department_id,
    d.department_name
FROM
    departments d
JOIN
    locations l1 ON d.location_id = l1.location_id
JOIN
    locations l2 ON l1.location_id = l2.location_id
WHERE
    d.department_id = 30;
    
--47

SELECT
    d.department_id,
    d.department_name,
    e.first_name AS manager_first_name,
    e.last_name AS manager_last_name
FROM
    departments d
JOIN
    employees e ON d.manager_id = e.employee_id
WHERE
    e.first_name = 'Susan' OR e.last_name = 'Susan';
    
--48
SELECT
    d.department_name,
    l.city
FROM
    departments d
JOIN
    locations l ON d.location_id = l.location_id
JOIN
    countries c ON l.country_id = c.country_id
WHERE
    c.country_id = 'US';
    
    
--49

SELECT
    e.first_name,
    e.last_name,
    d.department_name
FROM
    employees e
JOIN
    departments d ON e.department_id = d.department_id
WHERE
    e.last_name LIKE 'S%';
    
--50
SELECT
    d.department_name,
    COUNT(e.employee_id) AS num_employees
FROM
    departments d
JOIN
    employees e ON d.department_id = e.department_id
GROUP BY
    d.department_name
HAVING
    COUNT(e.employee_id) > 2
ORDER BY
    num_employees DESC;




