###sql exam 
use classicmodels
#Q1	
select o.city as 'City' , count(e.employeeNumber) as 'employee count'
from employees e
inner join offices o
on e.officeCode = o.officeCode
group by o.city
order by count(e.employeeNumber) DESC
limit 3;

#Q2

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


#Q3
#A
select c.salesRepEmployeeNumber
from customers c
where salesRepEmployeeNumber is not null
group by c.salesRepEmployeeNumber
order by c.salesRepEmployeeNumber DESC
limit 3;

#B
#update table: employees

#C
#1)
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
        

        



 


