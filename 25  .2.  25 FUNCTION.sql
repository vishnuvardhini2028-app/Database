--1)find total marks
create procedure totalmarkss(mark1 int,mark2 int,mark3 int)
language plpgsql
as $$
declare
student int;
begin
student:=mark1+mark2+mark3;
raise notice 'total mark is: %',student;
if(student>=150) then
raise notice'result: pass';
else
raise notice'result: fail';
end if;
end;
$$;
call totalmarkss(10,50,30);


--2)simple intrest calculation

create or replace procedure simpleintrest(principle decimal,numbers decimal,rate decimal)
language plpgsql
as
$$
declare
si decimal;
totalamount decimal;
begin
si:=(principle*numbers*rate)/100;
totalamount:=principle+si;
raise notice 'the principle amount is %',principle;
raise notice 'the simpleintrests  is %',si;
raise notice 'the tot amount is %',totalamount;
end;
$$;
call simpleintrest(10000,2,5);


