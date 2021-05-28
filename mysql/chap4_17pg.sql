drop table if exists examtable3;
create table examtable3(
	name varchar(20),
		id int not null primary key,
        kor int, eng int, mat int);
desc examtable3;        
delete from examtable3 where id>0;
drop procedure if exists insert_examtable3;
DELIMITER $$

create procedure insert_examtable3(_last integer)
begin
		declare _name varchar(20);
        declare _id integer;
        declare _cnt integer;
        set _cnt = 0;
        
        delete from examtable3 where id > 0;
        _loop: LOOP
			SET _cnt=_cnt+1;
            SET _name=concat("홍길", cast(_cnt as char(4)));
            SET _id=209900+_cnt;
            
            insert into examtable3 value (_name,_id, rand()*100, rand()*100, rand()*100);
            
            if _cnt=_last then
				leave _loop;
            end if;
        end LOOP _loop;    
end $$
DELIMITER ;

call insert_examtable3(1000);
select * from examtable3;

drop view if exists exmview;
create view exmview(name,id,kor,eng,mat,tot,ave,ran)
as select *, 
	b.kor+b.eng+b.mat,
    (b.kor+b.eng+b.mat)/3,
    (select count(*)+1 from examtable3 as a
		where (a.kor+a.eng+a.mat) > (b.kor+b.eng+b.mat) )
        from examtable3 as b;
select * from exmview;
select name, ran from exmview;

select * from exmview where ran > 5;
insert into exmview values ("나연",309933,100,100,100,300,100,1);    

drop table if exists examtableEX;
create table examtableEX(
	name varchar(20),
    id int not null primary key,
    kor int, eng int, mat int, sum int, ave double, ranking int);
desc examtableEX;

insert into examtableEX
	select *, b.kor+b.eng+b.mat, (b.kor+b.eng+b.mat)/3,
    (select count(*)+1 from examtable3 as a where (a.kor+a.eng+a.mat) > (b.kor+b.eng+b.mat))
    from examtable3 as b;
    
select * from examtableEX order by ranking desc;
    
    