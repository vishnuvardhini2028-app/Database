create table attendance(attendance_id serial PRIMARY KEY,emp_id int,attendance_date date,status text)
insert into attendance values(1,101,'2026-2-26','present'),(2,102,'2026-2-10','absents'),(3,103,'2026-2-1','late'),(4,104,'2026-1-2','present'),
(5,105,'2026-2-2','late'),(6,106,'2026-1-26','absents'),(7,107,'2026-1-11','present'),(8,108,'2026-2-21','late'),(9,109,'2026-2-11','present'),
(10,110,'2026-1-10','present');

--**********1) count number of absentees from table *********
create or replace procedure count_absentees()
language plpgsql
as
$$
declare
absents record;
begin
for absents in select emp_id, count(*) as absent_members from attendance 
where status='absents'
group by emp_id
loop
raise notice 'Employee % has % absents days',absents.emp_id,absents.absent_members;
end loop;
end;
$$
select * from attendance
call count_absentees()

-- 2)********** update attendance status to late *******
create or replace function update_attendances()
returns void
language plpgsql
as
$$
begin
update  attendance
set status='present'
where status='late';
end;
$$
select update_attendances()

-- 3) *******case query******
select emp_id,
case
when count(*) filter(where status='absents')<=2 then 'good'
when count(*) filter(where status='absents') between 3 and 5 then 'average'
else 'poor'
end
from
attendance
group by emp_id
              ****************************************************************************************

--Library Book management
CREATE TABLE books (book_id serial PRIMARY KEY,title text, author text,copies int)
insert into books (title, author, copies)values('Java Programming', 'James Gosling', 10),('Effective Java', 'Joshua Bloch', 5),
('Python Basics', 'Guido van Rossum', 7),('Database Systems', 'Elmasri', 4),('Operating Systems', 'Silberschatz', 6);
select * from books

create OR replace function issue_books(bid INT)
returns int
language plpgsql
as $$
begin
if(SELECT copies FROM books WHERE book_id = bid) > 0 THEN
update books
set copies = copies - 1
where book_id = 1;
else
raise notice 'Book is out of stock';
end if;
end;
$$;
select issue_book(1)

--3) ************case to assign availability status***********
SELECT 
    book_id,
    title,
    copies,
case
when copies > 5 then 'Available'
when copies between 1 and 5 then 'Limited'
when copies = 0 then 'Out of Stock'
end as availability_status
from books

