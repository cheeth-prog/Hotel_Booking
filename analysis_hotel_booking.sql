--show all the data 
select * from hotelbookinginfo

--what is the highest hotel booking in year and month
--add where (to filter all the data for verification)
select arrival_date_year,arrival_date_month,hotel,count(assigned_room_type)
from hotelbookinginfo
where arrival_date_year = 2017 and hotel = 'City Hotel'
group by arrival_date_year,arrival_date_month,hotel
order by count(assigned_room_type) desc

--Pattern in meal, what are the most common order for both resort and city hotel
--add where (to filter all the data for verification)
select arrival_date_year,meal,hotel,arrival_date_month,count(meal)
from hotelbookinginfo
where arrival_date_year = 2017 and hotel like 'City Hotel'
group by arrival_date_year,meal,hotel,arrival_date_month
order by count(meal) asc

--What are the highest income assigned room type in both resort and city hotel
--find the pattern in year and month
--add where (to filter all the data for verification)
select arrival_date_year,arrival_date_month,hotel,assigned_room_type,
sum(average_daily_rate) as total_ADR from hotelbookinginfo
where arrival_date_year = 2017 and hotel like 'City Hotel'
group by arrival_date_year,arrival_date_month,hotel,assigned_room_type
having sum(average_daily_rate) <= 0
order by sum(average_daily_rate) desc

--why do we have 0 daily average for specific rooms
select arrival_date_year,arrival_date_month,hotel,assigned_room_type,
count(assigned_room_type) as number_of_booking_room_assigned,
sum(average_daily_rate) as total_ADV
from hotelbookinginfo
where arrival_date_year = 2015 and hotel like 'Resort Hotel'
group by arrival_date_year,arrival_date_month,hotel,assigned_room_type
order by sum(average_daily_rate) asc

--total number of booking in Resort and City Hotel per year 
select arrival_date_year,hotel,count(assigned_room_type)
from hotelbookinginfo
group by arrival_date_year,hotel
order by arrival_date_year asc

--how many avail parking per year and month find pattern if any
--add where (to filter all the data for verification)
select arrival_date_year,arrival_date_month,required_car_parking_spaces,
count(required_car_parking_spaces) from hotelbookinginfo
where arrival_date_year = 2017 and required_car_parking_spaces != 0
group by arrival_date_year,arrival_date_month,required_car_parking_spaces
order by count(required_car_parking_spaces) desc

--Total available booking per year and month
select arrival_date_year,arrival_date_month,hotel,count(assigned_room_type)
from hotelbookinginfo
group by arrival_date_year,arrival_date_month,hotel

