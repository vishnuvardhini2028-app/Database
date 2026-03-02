create table bankaccountsss(acc_no int primary key,name text not null,balanceamt int not null)
begin
insert into bankaccountsss values(100,'vishnu',5000);
insert into bankaccountsss values(200,'taj',10000);
insert into bankaccountsss values(300,'gowsalya',15000);
insert into bankaccountsss values(400,'priya',25000);
select * from bankaccountsss;
update bankaccountsss
set balanceamt=balanceamt+2000
where balanceamt>10000;
rollback
commit

-- 2. view*************
CREATE TABLE employee (
    emp_id int,
    emp_name VARCHAR(50),
    salary int not null
);

CREATE VIEW emp_view AS
SELECT emp_name FROM employee;

GRANT SELECT ON emp_view TO vishnu;





