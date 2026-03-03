create table studentdetails(id int primary key,name text not null,mark int not null)
begin
insert into studentdetails values(1,'vishnu',80)
commit;
insert into studentdetails values(2,'taj',85)
savepoint s
insert into studentdetails values(3,'gowsalya',90)
savepoint s1
insert into studentdetails values(4,'priya',95)
savepoint s2
select * from studentdetails;
update studentdetails 
set mark=70 where id=3;
rollback to s1
delete from studentdetails where id=4;
rollback


