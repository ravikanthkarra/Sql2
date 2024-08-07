# Write your MySQL query statement below
with cte as
(select id, student, (case when id %2 = 0 then (id-1) else (id+1) end) as id1 from seat )

select c1.id, c2.student from cte c1, cte c2
where c1.id = c2.id1
union
select c1.id, c1.student from cte c1
where c1.id1 not in (select id from seat)
order by id

----Another Solution----

# Write your MySQL query statement below
SELECT CASE WHEN id=(SELECT MAX(id) FROM SEAT) AND MOD(id,2)=1 THEN id
        WHEN MOD(id,2)=0 THEN id-1
        ELSE id+1 END AS id, student
FROM
Seat
ORDER BY 1;