use kopoctc;
drop table if exists Answer;
create table Answer (
subjectID int not null primary key,
a01 int, a02 int, a03 int, a04 int, a05 int, a06 int, a07 int, a08 int, a09 int, a10 int,
a11 int, a12 int, a13 int, a14 int, a15 int, a16 int, a17 int, a18 int, a19 int, a20 int);

insert into Answer value (01,1,2,3,4,3,2,1,2,3,4,3,2,1,2,3,4,2,3,1,3);	##국어 정답
insert into Answer value (02,2,4,1,2,3,3,3,2,3,1,3,2,2,2,4,4,4,3,4,3);	##영어 정답
insert into Answer value (03,1,3,3,3,3,2,3,2,3,4,3,3,4,2,1,2,2,2,2,3);	##수학 정답
select * from Answer;

drop table if exists Testing;
create table Testing (
subjectID int not null,
stu_name varchar(20),
stu_id int not null,
a01 int, a02 int, a03 int, a04 int, a05 int, a06 int, a07 int, a08 int, a09 int, a10 int,
a11 int, a12 int, a13 int, a14 int, a15 int, a16 int, a17 int, a18 int, a19 int, a20 int,
primary key(subjectID,stu_id)
);
select * from Testing;

drop table if exists Scoring;
create table Scoring (
subjectID int not null,
stu_name varchar(20),
stu_id int not null,
a01 int, a02 int, a03 int, a04 int, a05 int, a06 int, a07 int, a08 int, a09 int, a10 int,
a11 int, a12 int, a13 int, a14 int, a15 int, a16 int, a17 int, a18 int, a19 int, a20 int,
score int,
primary key(subjectID,stu_id)
);

drop table if exists Reporttable;
create table Reporttable (
stu_name varchar(20),
stu_id int not null primary key,
kor int, eng int, mat int);

DESC Answer;
DESC Testing;
DESC Scoring;
DESC Reporttable;

drop procedure if exists insert_Testing;
DELIMITER $$
create procedure insert_Testing(_last integer)
begin
		declare _name varchar(20);
        declare _id integer;
        declare _cnt integer;
        set _cnt = 0;
        delete from Testing where stu_id > 0;
        _loop: LOOP
			SET _cnt=_cnt+1;
            SET _name=concat("홍길", cast(_cnt as char(4)));
            SET _id=209900+_cnt;
            
            insert into Testing value (01,_name,_id, rand()*3 + 1, rand()*3 + 1, rand()*3 + 1, rand()*3 + 1, rand()*3 + 1
										, rand()*3 + 1, rand()*3 + 1, rand()*3 + 1, rand()*3 + 1, rand()*3 + 1
                                        , rand()*3 + 1, rand()*3 + 1, rand()*3 + 1, rand()*3 + 1, rand()*3 + 1
                                        , rand()*3 + 1, rand()*3 + 1, rand()*3 + 1, rand()*3 + 1, rand()*3 + 1);
            insert into Testing value (02,_name,_id, rand()*3 + 1, rand()*3 + 1, rand()*3 + 1, rand()*3 + 1, rand()*3 + 1
										, rand()*3 + 1, rand()*3 + 1, rand()*3 + 1, rand()*3 + 1, rand()*3 + 1
                                        , rand()*3 + 1, rand()*3 + 1, rand()*3 + 1, rand()*3 + 1, rand()*3 + 1
                                        , rand()*3 + 1, rand()*3 + 1, rand()*3 + 1, rand()*3 + 1, rand()*3 + 1);
            insert into Testing value (03,_name,_id, rand()*3 + 1, rand()*3 + 1, rand()*3 + 1, rand()*3 + 1, rand()*3 + 1
										, rand()*3 + 1, rand()*3 + 1, rand()*3 + 1, rand()*3 + 1, rand()*3 + 1
                                        , rand()*3 + 1, rand()*3 + 1, rand()*3 + 1, rand()*3 + 1, rand()*3 + 1
                                        , rand()*3 + 1, rand()*3 + 1, rand()*3 + 1, rand()*3 + 1, rand()*3 + 1);
                                        
            if _cnt=_last then
				leave _loop;
            end if;
        end LOOP _loop;    
end $$
DELIMITER ;
call insert_Testing(1000);
select * from Testing;
select count(*) from Testing;