###sql exam 
use classicmodels
#Q1 Employees all over the world. Can you tell me the top three cities that we have employees?
#Expected result:
#City      employee count
#San Francisco   6
#Paris           5
#Syndney         4

select o.city , count(e.employeeNumber) as 'employee count'
from employees e
inner join offices o
on e.officeCode = o.officeCode
group by o.city
order by count(e.employeeNumber) DESC
limit 3;

#Q2 For company products, each product has inventory and buy price, msrp. Assume that every product is sold on msrp price. Can you write a query to tell company executives: profit margin on each productlines

select c.productLine, (pf.profit-c.cost)/pf.profit as 'marginProfit'
from 
	(select p.productLine, sum(p.buyPrice*p.quantityInStock) as 'cost'
	from products p
	group by p.productLine
    order by p.productLine) c
join
	(select p.productLine , sum(p.MSRP*quantityOrdered) as 'profit'
    from products p
    right join orderdetails o on p.productCode = o.productCode
    group by productLine
    order by productLine) pf
on c.productLine = pf.productLine;


#Q3 Company wants to award the top 3 sales rep They look at who produces the most sales revenue.
#A can you write a query to help find the employees.
select c.salesRepEmployeeNumber
from customers c
where salesRepEmployeeNumber is not null
group by c.salesRepEmployeeNumber
order by c.salesRepEmployeeNumber DESC
limit 3;

#B if we want to promote the employee to a manager, what do you think are the tables to be updated.
#update table: employees

#C An employee is leaving the company, write a stored procedure to handle the case. 
#1). Make the current employee inactive, 
#2). Replaced with its manager employeenumber in order table. 

alter table employees
add isActive boolean
update employees
set isActive = True
        
CREATE DEFINER=`root`@`localhost` PROCEDURE `InactiveEmployees`( IN eNumber int)
begin
	update employees 
    set isActive = False
    where employeeNumber = eNumber
    
    update customers c
    join employees e on  c.salesRepEmployee = e.employeeNumber
    set c.salesRepEmployee = e.reportsTo
    where e.employeeNumber = eNumber
end;
        
#Q4 Ask to provide a table to show for each employee in a certain department how many times their Salary changes

CREATE DEFINER=`root`@`localhost` PROCEDURE `SalaryCount`( IN dId int)
begin
	select e.employee_id, e.employee_name, (count(salary)-1) as 'salary_changes'
	from Employee_salary s
    join Employee e on s.employee_id = e.employee_id
	where e.department_id = dId
	group by e.employee_id
end;

#Q5 Ask to provide a table to show for each department the top 3 salary with employee name and employee has not left the company.

select e.employee_name, e.current_salary
from Employee e
join Department d on e.department_id = d.department_id
where e.term_date IS NULL
group by d.department_id
order by e.current_salary DESC
limit 3;

 



 


