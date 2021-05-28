drop table if exists Twi_tupyo;
create table Twi_tupyo(
	name varchar(20),
    age_type int);
desc Twi_tupyo;

insert into Twi_tupyo value ("나연", rand()*8 +1);
insert into Twi_tupyo value ("정연", rand()*8 +1);
insert into Twi_tupyo value ("모모", rand()*8 +1);
insert into Twi_tupyo value ("사나", rand()*8 +1);
insert into Twi_tupyo value ("지효", rand()*8 +1);
insert into Twi_tupyo value ("미나", rand()*8 +1);
insert into Twi_tupyo value ("다현", rand()*8 +1);
insert into Twi_tupyo value ("채영", rand()*8 +1);
insert into Twi_tupyo value ("쯔위", rand()*8 +1);

select * from Twi_tupyo;
select count(*) from Twi_tupyo;
select name, count(name) as count, count(name)/(select count(*) from Twi_tupyo)*100 as rate from Twi_tupyo group by name order by count desc;
select age_type, count(name) as count, count(name)/(select count(*) from Twi_tupyo where name='나연')*100 as rate from Twi_tupyo where name='나연' group by age_type order by count desc;
select age_type, count(name) as count, count(name)/(select count(*) from Twi_tupyo where name='정연')*100 as rate from Twi_tupyo where name='정연' group by age_type order by count desc;