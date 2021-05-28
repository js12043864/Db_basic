##트와이스 멤버 선호도
drop table if exists Twi_tupyo2;
create table Twi_tupyo2(
	mem_name varchar(20)
    );
desc Twi_tupyo2;

drop procedure if exists input_data;
DELIMITER $$
create procedure input_data(num int)
BEGIN
	DECLARE _cnt integer;
    DECLARE _rand integer;
	set _cnt = 0;
    _loop: loop
		Set _cnt=_cnt+1;
        Set _rand = rand()*8 +1;
        
		IF _rand = 1 THEN
			insert into Twi_tupyo2 value ("나연");
		ELSEIF _rand = 2 THEN
			insert into Twi_tupyo2 value ("정연");
		ELSEIF _rand = 3 THEN
			insert into Twi_tupyo2 value ("모모");
        ELSEIF _rand = 4 THEN
			insert into Twi_tupyo2 value ("사나");
		ELSEIF _rand = 5 THEN
			insert into Twi_tupyo2 value ("지효");
		ELSEIF _rand = 6 THEN
			insert into Twi_tupyo2 value ("미나");
		ELSEIF _rand = 7 THEN
			insert into Twi_tupyo2 value ("다현");
		ELSEIF _rand = 8 THEN
			insert into Twi_tupyo2 value ("채영");
		ELSEIF _rand = 9 THEN
			insert into Twi_tupyo2 value ("쯔위");
		END IF;
        
        if _cnt=num then
			Leave _loop;
		end if;
	end loop _loop;
END $$
call input_data(1000);
select count(*) from Twi_tupyo2;
select * from Twi_tupyo2;

drop function if exists cnt_rate;
DELIMITER $$
create function cnt_rate(_mem_name varchar(20)) Returns double
begin
        declare _rate double;
		select count(mem_name)/(select count(*) from Twi_tupyo2)*100.0 into _rate from Twi_tupyo2 where mem_name=_mem_name;
        
return _rate;        
end $$
DELIMITER ;
select mem_name, cnt_rate(mem_name) from Twi_tupyo2 group by mem_name;
##select mem_name, count(mem_name) as count, count(mem_name)/(select count(*) from Twi_tupyo2)*100 as rate from Twi_tupyo2 group by mem_name;