# Data202009
 
1. Employees all over the world. Can you tell me the top three cities that we have employees?
Expected result:
City      employee count
San Francisco   6
Paris                  5
Syndney            4




2. For company products, each product has inventory and buy price, msrp. Assume that every product is sold on msrp price. Can you write a query to tell company executives: profit margin on each productlines
Profit margin= sum(profit if all sold) - sum(cost of each=buyPrice) / sum (buyPrice)
Product line = each product belongs to a product line. You need group by product line. 


3. company wants to award the top 3 sales rep They look at who produces the most sales revenue.
can you write a query to help find the employees. 
      B. if we want to promote the employee to a manager, what do you think are the tables to be updated. 
      C. An employee is leaving the company, write a stored procedure to handle the case. 1). Make the current employee inactive, 2). Replaced with its manager employeenumber in order table. 

=======following challenge:
Employee 
[employee_id, employee_name, gender, current_salary, department_id, start_date, term_date]

Employee_salary 
[employee_id, salary, year, month]

Department 
[department_id, department_name]

4. Employee Salary Change Times 
Ask to provide a table to show for each employee in a certain department how many times their Salary changes 

5. Top 3 salary
	Ask to provide a table to show for each department the top 3 salary with employee name 
and employee has not left the company.
