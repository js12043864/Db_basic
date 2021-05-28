drop table if exists examtable4;
create table examtable4(
	name varchar(20),
		id int not null primary key,
        kor int, eng int, mat int);

drop procedure if exists insert_examtable4;
DELIMITER $$
create procedure insert_examtable4(_last integer)
begin
		declare _name varchar(20);
        declare _id integer;
        declare _cnt integer;
        set _cnt = 0;
        
        delete from examtable4 where id > 0;
        _loop: LOOP
			SET _cnt=_cnt+1;
            SET _name=concat("홍길", cast(_cnt as char(4)));
            SET _id=_cnt;
            
            insert into examtable4 value (_name,_id, rand()*100, rand()*100, rand()*100);
            
            if _cnt=_last then
				leave _loop;
            end if;
        end LOOP _loop;    
end $$
DELIMITER ;
call insert_examtable4(1000);
select *, kor+eng+mat as sum, (kor+eng+mat)/3 as avg from examtable4;
select count(*) from examtable4;

drop procedure if exists print_report;
DELIMITER $$
create procedure print_report(_page integer, _contentCnt integer)
begin
		declare _start integer;		##페이지마다의 첫 번째 순서
        declare _fin_pg integer;		##마지막 페이지
        declare _fin_pg_start_num integer;		##마지막 페이지의 시작 번호
        declare total_cnt integer;		## 총 데이터 수(누적 때문에) 
        declare filed_cnt integer;		## 누적 데이터 수 (누적 때문에)
        if ((select count(*) from examtable4) % _contentCnt = 0) then
			Set _fin_pg = (select count(*) from examtable4) / _contentCnt;
		else 
			Set _fin_pg = (select count(*) from examtable4) / _contentCnt + 1;
        end if;
        Set _fin_pg_start_num = (_fin_pg - 1) * _contentCnt;
        SET _start = _contentCnt * (_page-1);
        set total_cnt = (select count(*) from examtable4);
        set filed_cnt = _contentCnt * _page;
        
        if _page <= 1 then
			select *, kor + mat + eng as sum, (kor + mat + eng)/3 as avg, Rank() over (order by kor+eng+mat desc) as ranking from (select * from examtable4 limit 0,_contentCnt) as page;
            select Sum(kor), Sum(eng), Sum(mat), Sum(kor + mat + eng), sum((kor + mat + eng)/3), avg(kor), avg(eng), avg(mat), avg(kor + mat + eng), avg((kor + mat + eng)/3) from (select * from examtable4 limit 0,_contentCnt) as page;
            select Sum(kor), Sum(eng), Sum(mat), Sum(kor + mat + eng), sum((kor + mat + eng)/3), avg(kor), avg(eng), avg(mat), avg(kor + mat + eng), avg((kor + mat + eng)/3) from (select * from examtable4 limit 0,_contentCnt) as page;
		elseif _page >= _fin_pg then
			select *, kor + mat + eng as sum, (kor + mat + eng)/3 as avg, Rank() over (order by kor+eng+mat desc) as ranking from (select * from examtable4 limit _fin_pg_start_num,_contentCnt) as page;
            select Sum(kor), Sum(eng), Sum(mat), Sum(kor + mat + eng), sum((kor + mat + eng)/3), avg(kor), avg(eng), avg(mat), avg(kor + mat + eng), avg((kor + mat + eng)/3) from (select * from examtable4 limit _fin_pg_start_num,_contentCnt) as page;
            select Sum(kor), Sum(eng), Sum(mat), Sum(kor + mat + eng), sum((kor + mat + eng)/3), avg(kor), avg(eng), avg(mat), avg(kor + mat + eng), avg((kor + mat + eng)/3) from (select * from examtable4 limit 0, total_cnt) as page;
		else
			select *, kor + mat + eng as sum, (kor + mat + eng)/3 as avg, Rank() over (order by kor+eng+mat desc) as ranking from (select * from examtable4 limit _start,_contentCnt) as page;
            select Sum(kor), Sum(eng), Sum(mat), Sum(kor + mat + eng), sum((kor + mat + eng)/3), avg(kor), avg(eng), avg(mat), avg(kor + mat + eng), avg((kor + mat + eng)/3) from (select * from examtable4 limit _start,_contentCnt) as page;
            select Sum(kor), Sum(eng), Sum(mat), Sum(kor + mat + eng), sum((kor + mat + eng)/3), avg(kor), avg(eng), avg(mat), avg(kor + mat + eng), avg((kor + mat + eng)/3) from (select * from examtable4 limit 0, filed_cnt) as page;
		end if;
        
        
end $$
DELIMITER ;
call print_report(5,25)
