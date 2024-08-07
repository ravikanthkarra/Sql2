# Write your MySQL query statement below
With EmplSalary as
(
    select departmentId, name as Employee, salary as Salary,
        dense_rank() over (partition by departmentId order by salary desc) as rnk
    from Employee
)

select d.name as Department, es.Employee, es.Salary
from EmplSalary es INNER JOIN Department d
on es.departmentId = d.id
where rnk <= 3
-- order by d.name, es.Employee