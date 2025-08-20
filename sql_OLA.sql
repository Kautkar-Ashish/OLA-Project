create database OLA;
use OLA;

----- *Sucessful Booking* 
create view Successful_Bookings As
select * from Booking
where Booking_Status = 'Success';

Select * from Successful_Bookings;


create view ride_distance_for_each_Vehicle as
select Vehicle_Type, avg(Ride_Distance)
as avg_distance From Booking
group by Vehicle_Type;

select * from ride_distance_for_each_Vehicle;


create view canceled_rides_by_customers AS
select count(*) from Booking
where Booking_Status = 'Canceled by Customer';

select * from canceled_rides_by_customers;


create view booked_the_highest_number_of_rides AS
select Customer_ID, count(Booking_ID) as total_rides
from Booking
group by Customer_ID
order by total_rides DESC LIMIT 5;

select * from booked_the_highest_number_of_rides;


create view Canceled_by_Drivers AS
select count(*) from Booking
where Canceled_Rides_by_Driver = 'Personal & Car related issues';

select * from Canceled_by_Drivers;

create view Max_Min_Driver_Rating AS
select max(Driver_Ratings) as max_rating,
min(Driver_Ratings) as min_rating
from Booking where Vehicle_Type = 'Prime Sedan';

select * from Max_Min_Driver_Rating;


create view UPI_Payment AS
select * from Booking
where Payment_Method = 'UPI';

select * from UPI_Payment;


create view AVG_Cust_Rating AS
select Vehicle_Type, avg(Customer_Rating) as avg_customer_rating
from Booking
group by Vehicle_Type;


create view total_successful_value AS
select sum(Booking_Value) as total_successful_value
from Booking
where Booking_Status = 'Success';

select * from total_successful_value;


create view Incomplete_Rides_Reason AS
select Booking_ID, Incomplete_Rides_Reason
from Booking
where Incomplete_Rides = 'Yes';

select * from Incomplete_Rides_Reason;



