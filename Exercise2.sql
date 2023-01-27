use Exercise2;
Select * from employees;
Select * from departments;
-- 2.1 Select the last name of all employees.
Select LastName from employees;

-- 2.2 Select the last name of all employees, without duplicates.
Select distinct LastName from employees;
Select LastName from employees where count(LastName)=1;
Select LastName from employees group by lastname;

-- 2.3 Select all the data of employees whose last name is "Smith".
Select * from employees where lastname="Smith";

-- 2.4 Select all the data of employees whose last name is "Smith" or "Doe".
Select * from employees where lastname in("Smith","Doe");

-- 2.5 Select all the data of employees that work in department 14.
Select * from employees where Department=14;

-- 2.6 Select all the data of employees that work in department 37 or department 77.
Select * from employees where Department in (37,77);
-- 2.7 Select all the data of employees whose last name begins with an "S".
select * from employees where lastname like "S%";
-- 2.8 Select the sum of all the departments' budgets.
select sum(Budget) from departments;
-- 2.9 Select the number of employees in each department (you only need to show the department code and the number of employees).
Select department ,count(*) as No_of_employees from employees group by department;

-- 2.10 Select all the data of employees, including each employee's department's data.
select * from employees e left join departments d on e.department=d.code;
  
-- 2.11 Select the name and last name of each employee, along with the name and budget of the employee's department.
select e.name,e.lastname,d.Name,d.budget from employees e left join departments d on e.department=d.code;

-- 2.12 Select the name and last name of employees working for departments with a budget greater than $60,000.
select e.name,e.lastname,d.Name,d.budget from employees e 
left join departments d on e.department=d.code where budget>60000; 

-- 2.13 Select the departments with a budget larger than the average budget of all the departments.
Select * from departments where budget>(select avg(budget) from departments);

-- 2.14 Select the names of departments with more than two employees.
select d.name from employees e join departments d on e.department=d.code group by department having count(e.department)>2;

-- 2.15 Very Important - Select the name and last name of employees working for departments with second lowest budget.
With low_budget as
(select e.name,e.lastname, dense_rank() over (order by d.budget asc) as rank1
from employees e join departments d on e.department=d.code)  
select name,lastname from low_budget where rank1=2;

-- 2.16  Add a new department called "Quality Assurance", with a budget of $40,000 and departmental code 11. 
insert into departments values(11,"Quality Assurance",40000);

-- And Add an employee called "Mary Moore" in that department, with SSN 847-21-9811.
insert into employees values(847219811,"Marry","Moore",11);
-- 2.17 Reduce the budget of all departments by 10%.
update departments set budget=budget*0.9;

-- 2.18 Reassign all employees from the Research department (code 77) to the IT department (code 14).
update employees set department=14 where department=17;

-- 2.19 Delete from the table all employees in the IT department (code 14).
delete from employees where department=14;
-- 2.20 Delete from the table all employees who work in departments with a budget greater than or equal to $60,000.
delete from employees where department in (select code from departments where budget>=60000);
-- 2.21 Delete from the table all employees.
delete from employees;