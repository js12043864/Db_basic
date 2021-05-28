drop table if exists examtable;
create table examtable(
	name varchar(20),
		id int not null primary key,
        kor int, eng int, mat int);
desc examtable;        

drop procedure if exists insert_examtable;
DELIMITER $$
create procedure insert_examtable(_last integer)
begin
		declare _name varchar(20);
        declare _id integer;
        declare _cnt integer;
        set _cnt = 0;
        
        delete from examtable where id > 0;
        _loop: LOOP
			SET _cnt=_cnt+1;
            SET _name=concat("홍길", cast(_cnt as char(4)));
            SET _id=_cnt;
            
            insert into examtable value (_name,_id, rand()*100, rand()*100, rand()*100);
            
            if _cnt=_last then
				leave _loop;
            end if;
        end LOOP _loop;    
end $$
DELIMITER ;

drop function if exists p_rank;
DELIMITER $$
create function p_rank(_id integer) Returns integer
begin		
        declare _rank integer;
        select (select count(*) + 1 from examtable as a where (a.kor+a.eng+a.mat) > (b.kor+b.eng+b.mat)) into _rank from examtable as b where id=_id;
return _rank;        
end $$
DELIMITER ;

call insert_examtable(100);
-- select *, kor+eng+mat as sum, (kor+eng+mat)/3 as ave, Rank() over (order by kor+eng+mat) as ranking from examtable;
select *, kor+eng+mat as sum, (kor+eng+mat)/3 as ave, p_rank(id) from examtable;
select *, kor+eng+mat as sum, (kor+eng+mat)/3 as ave, p_rank(id) from examtable order by kor+eng+mat desc;
