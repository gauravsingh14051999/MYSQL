create database exercise9;
Alter table 
use exercise9;
Select count(*) from table1;
Select Distinct package from table1;
Select package,count(package) from table1 Where package="Rcpp" group by package;
Select country,count(country) from table1 Where country="CN" ;
Select package,count(package) from table1  group by package order by count(package);
Select package, count(package), rank() over (order by count(package)) as ranks from table1 group by package;
Select country,count(country) from table1 Where country in ("CN","JP","SG") group by Country;
Select Country,count(package) from table1 group by country having count(package)>(Select count(package) from table1  where country="CN");
select package, avg(time) as avg_length from table1 group by package;
With a as (Select package, count(package), dense_rank() over (order by count(package)) as ranks from table1 group by package) select * from a where ranks=2;
select package,count(package) from table1  group by package having count(package)>1000;

