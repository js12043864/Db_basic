drop table if exists third;
create table third(
	name varchar(20),
		id int not null primary key,
        kor int, eng int, mat int);
desc third;        
delete from third where id>0;
insert into third value ("나연",209901, rand()*100, rand()*100, rand()*100);
insert into third value ("정연",209902, rand()*100, rand()*100, rand()*100);
insert into third value ("모모",209903, rand()*100, rand()*100, rand()*100);
insert into third value ("사나",209904, rand()*100, rand()*100, rand()*100);
insert into third value ("지효",209905, rand()*100, rand()*100, rand()*100);
insert into third value ("미나",209906, rand()*100, rand()*100, rand()*100);
insert into third value ("다현",209907, rand()*100, rand()*100, rand()*100);
insert into third value ("채영",209908, rand()*100, rand()*100, rand()*100);
insert into third value ("쯔위",209909, rand()*100, rand()*100, rand()*100);
insert into third value ("송가인",209910, rand()*100, rand()*100, rand()*100);
insert into third value ("나연",209911, rand()*100, rand()*100, rand()*100);
insert into third value ("정연",209912, rand()*100, rand()*100, rand()*100);
insert into third value ("모모",209913, rand()*100, rand()*100, rand()*100);
insert into third value ("사나",209914, rand()*100, rand()*100, rand()*100);
insert into third value ("지효",209915, rand()*100, rand()*100, rand()*100);
insert into third value ("미나",209916, rand()*100, rand()*100, rand()*100);
insert into third value ("다현",209917, rand()*100, rand()*100, rand()*100);
insert into third value ("채영",209918, rand()*100, rand()*100, rand()*100);
insert into third value ("쯔위",209919, rand()*100, rand()*100, rand()*100);
insert into third value ("송가인",209920, rand()*100, rand()*100, rand()*100);
select * from third;
select name, eng from third group by eng;
select * from third;
select * from third order by kor;
select * from third order by eng;
select * from third order by kor,eng;
select * from third order by kor asc;
select * from third order by kor desc;
    
select *, kor+eng+mat, (kor+eng+mat)/3 from third;        
select *, kor+eng+mat, (kor+eng+mat)/3 from third order by kor+eng+mat desc;        
select *, kor+eng+mat as total , (kor+eng+mat)/3 as average from third order by total desc;

select name as 이름, id as 학번, kor as 국어, eng as 영어, mat as 수학, kor+eng+mat as 합계,
	(kor+eng+mat)/3 as 평균 from third order by 합계 desc;

select * from third group by name;
select name, count(name) from third group by name;
select * from third group by kor;        
select kor,count(kor) from third group by kor;               
select kor,count(kor) from third group by eng;                
select kor,count(kor),eng, count(eng) from third group by kor,eng;                 
select eng,count(eng) from third group by eng;

insert into third value ("팽수",209921, 100, 90, rand()*100);
insert into third value ("팽수",209922, 100, 90, rand()*100);
select kor,count(kor),eng, count(eng) from third group by kor,eng;
select name,count(name),kor,count(kor),eng, count(eng) from third group by name,kor,eng;
select *, name,count(name),kor,count(kor),eng, count(eng) from third group by name,kor,eng;

select eng,count(eng) from third group by eng having count(eng)>1;
