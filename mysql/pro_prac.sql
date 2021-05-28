drop procedure if exists insert_third;
DELIMITER $$
create procedure insert_third(_last integer)
begin
		declare _name varchar(20);
        declare _id integer;
        declare _cnt integer;
        set _cnt = 0;
        
        delete from third where id > 0;
        _loop: LOOP
			SET _cnt=_cnt+1;
            SET _name=concat("홍길", cast(_cnt as char(4)));
            SET _id=209900+_cnt;
            
            insert into third value (_name,_id, rand()*100, rand()*100, rand()*100);
            
            if _cnt=_last then
				leave _loop;
            end if;
        end LOOP _loop;    
end $$
DELIMITER ;

call insert_third(1000);
select * from third;
select *, kor+eng+mat as sum, (kor+eng+mat)/3 as ave from third limit 30,59;