drop procedure if exists print_report2;
DELIMITER $$
create procedure print_report2(_page integer, _contentCnt integer)
begin
		declare _start integer;		##페이지마다의 첫 번째 순서
        declare _fin_pg integer;		##마지막 페이지
        declare _fin_pg_start_num integer;		##마지막 페이지의 시작 번호
        declare total_cnt integer;		## 총 데이터 수(누적 때문에) 
        declare filed_cnt integer;		## 누적 데이터 수 (누적 때문에)
        declare _cnt integer; ##순번
        if ((select count(*) from wifi) % _contentCnt = 0) then
			Set _fin_pg = (select count(*) from wifi) / _contentCnt;
		else 
			Set _fin_pg = (select count(*) from wifi) / _contentCnt + 1;
        end if;
        Set _fin_pg_start_num = (_fin_pg - 1) * _contentCnt;
        SET _start = _contentCnt * (_page-1);
        set total_cnt = (select count(*) from wifi);
        set filed_cnt = _contentCnt * _page;
        
        if _page <= 1 then
			SELECT *, (6371 * acos (cos ( radians(37.38099) ) * cos( radians( latitude ) ) * cos( radians( longitude) - radians(127.11783) ) 
            + sin ( radians(37.38099) ) * sin( radians( latitude) ))) AS distance FROM (select * from wifi limit 0,_contentCnt) as page;
		elseif _page >= _fin_pg then
            SELECT *, (6371 * acos (cos ( radians(37.38099) ) * cos( radians( latitude ) ) * cos( radians( longitude) - radians(127.11783) ) 
            + sin ( radians(37.38099) ) * sin( radians( latitude) ))) AS distance FROM (select * from wifi limit _fin_pg_start_num,_contentCnt) as page;
		else
            SELECT *, (6371 * acos (cos ( radians(37.38099) ) * cos( radians( latitude ) ) * cos( radians( longitude) - radians(127.11783) ) 
            + sin ( radians(37.38099) ) * sin( radians( latitude) ))) AS distance FROM (select * from wifi limit _start,_contentCnt) as page;
		end if;
end $$
DELIMITER ;
call print_report2(5,25)