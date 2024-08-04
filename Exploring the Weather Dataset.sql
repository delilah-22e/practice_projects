--Creating a table weather in the database and inserted the data froom my pc.
CREATE TABLE Weather (
    Date_time Timestamp,
    Temp_c Float,
	Dew_point_temp_C Float,
	Rel_Hum_pcnt int,
	Wind_speed int,
	Visibility_Km Float,
	Press_Kpa Float,
	Weather Varchar(80)
);
COPY Weather
FROM 'C:\DATA\1. Weather Data.csv' with CSV header
;
--Q1 Find all records where the weather was exctly clear.
SELECT * 
FROM Weather
where weather = 'Clear'
;
--Q2 Find the number of times the windspeed was exactly 4km.h.
select COUNT(*)
from weather 
where wind_speed = 4
;
--Q6: Find the number of records where windspeed is greater than 24km/h and visibility is equal to 25km.
select count(*) 
from weather 
where wind_speed > 24
and visibility_km = 25
;
--#Q7: What is the mean value of each column for each weather condition.
select w.weather,
avg(temp_c) as avg_temp,
avg(dew_point_temp_c ) as avg_dew_point,
avg(rel_hum_pcnt)as avg_rel_hum,
avg(wind_speed)as avg_wind_speed,
avg(visibility_km) as avg_visibility_km,
avg(press_kpa ) as avg_press
from weather w 
group by weather 
;
--#Q8:Find all instances where the weather is clear and the relative humidity is greater than 50 or visibility is above 40.
select *
from weather w 
where weather = 'Clear'
and rel_hum_pcnt > 50 
or visibility_km >40
;