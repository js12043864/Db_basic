drop table if exists hubo;
create table hubo(
	kiho int not null,
    name varchar(10),
    gongyak varchar(50),
    primary key(kiho),
    index(kiho));
desc hubo;

drop table if exists tupyo;
create table tupyo(
	kiho int,
    age int,
    foreign key(kiho) references hubo(kiho)
    );
desc tupyo;

delete from hubo where kiho>0;
insert into hubo values (1,"나연", "정의사회 구현");
insert into hubo values (2,"정연", "모두 1억줌");
insert into hubo values (3,"모모", "월화수목금토토일");
insert into hubo values (4,"사나", "이리사나저리사나");
insert into hubo values (5,"지효", "먹다 지쳐 잠드는 세상");
insert into hubo values (6,"미나", "나 뽑으면 너가 원하는대로");
insert into hubo values (7,"다현", "장바구니 다 사줌");
insert into hubo values (8,"채영", "노는게 젤 좋아");
insert into hubo values (9,"쯔위", "커플지옥 싱글 천국");
select kiho as 기호, name as 성명, gongyak as 공약 from hubo;

delete from tupyo where kiho>0;
drop procedure if exists insert_tupyo;
DELIMITER $$
create procedure insert_tupyo(_limit integer)
begin
        declare _cnt integer;
        set _cnt = 0;
        _loop: LOOP
			SET _cnt=_cnt+1;
            insert into tupyo value (rand()*8+1, rand()*8+1);
            if _cnt=_limit then
				leave _loop;
            end if;
        end LOOP _loop;
end $$
call insert_tupyo(1000);
select kiho as 투표한기호, age as 투표자연령대 from tupyo;
select kiho as 기호, name as 성명, gongyak as 공약 from hubo;


select kiho, count(*) from tupyo group by kiho;

select b.name, b.gongyak, count(a.kiho)
		from tupyo as a, hubo as b
        where a.kiho=b.kiho
        group by a.kiho;

select 
	(select name from hubo where kiho=a.kiho),
    (select gongyak from hubo where kiho=a.kiho),
    count(a.kiho)
    from tupyo as a
    group by a.kiho;

drop table if exists tupyo2;
create table tupyo2(
	kiho1 int,
    kiho1 int,
    kiho1 int,
    age int
    );
desc tupyo2;

call insert_tupyo2(1000);
select * from tupyo2;

from tupyo2 as a, hubo as h1, hubo as h2, hubo as h3
where a.kiho1=h1.kiho and a.kiho2=h2.kiho and a.kiho3=h3.kiho;