SELECT * FROM exercise1_1.weather;
use exercise1_1;
CREATE TABLE weather(
  date_weather Date,
  inches_rain REAL,
  temp_max REAL,
  temp_min REAL,
  did_rain enum('True','False'));
Select * from weather where date_weather between '2000-12-01' and '2000-12-15';
Select year(date_weather),avg(temp_max) as avg_high_temp from weather where year(date_weather)>=2000 group by year(date_weather) order by year(date_weather) asc;
Select year(date_weather),STDDEV(temp_max) as std_dev_temp_max from weather where year(date_weather)>=2000 group by year(date_weather) order by year(date_weather) asc;
select * from weather order by temp_max desc limit 10;
select (count(inches_rain)/366)*100 as fraction from weather where year(date_weather)=2016 and inches_rain!=0;
Select year(date_weather), avg(temp_max) from weather where month(date_weather)=7 group by year(date_weather) order by avg(temp_max) desc 8;
 Select year(date_weather), avg(temp_min) from weather where month(date_weather)=12 group by year(date_weather) order by avg(temp_min) limit 10;
  Select year(date_weather), round(avg(temp_min),3) from weather where month(date_weather)=12 group by year(date_weather) order by avg(temp_min) limit 10;
   select month(date_weather), avg(inches_rain) from weather where year(date_weather) between 2000 and 2010 group by month(date_weather);