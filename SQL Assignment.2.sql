select * from jomato

--Create a user-defined functions to stuff the Chicken into ‘Quick Bites’.
--Eg: ‘Quick Chicken Bites’.

select stuff('Chicken',1,7,'Quick Bites')as Quick_Chiken_Bites from jomato

--Use the function to display the restaurant name and cuisine type which has the
--maximum number of rating.

select RestaurantName, CuisinesType ,No_of_Rating,
count(No_of_Rating) as  Max_rating
from Jomato
group by RestaurantName, CuisinesType,No_of_Rating order by No_of_Rating Desc;


--Create a Rating Status column to display the rating as ‘Excellent’ if it has more the 4
--start rating, ‘Good’ if it has above 3.5 and below 5 star rating, ‘Average’ if it is above 3
--and below 3.5 and ‘Bad’ if it is below 3 star rating

select RestaurantName,CuisinesType, Rating,
case
when Rating > 4 Then 'Excellant'
when Rating >= 3.5 and Rating <= 4 then 'Good'
when Rating >= 3 and Rating <= 3.5 then 'Average'
when Rating < 3 then 'Bad'
end as Rating_Status
from jomato
Order by Rating Desc;

--Find the Ceil, floor and absolute values of the rating column and display the current date
--and separately display the year, month_name and day
select RestaurantName,CuisinesType,Rating,
ceiling(Rating) as ceil_value,
floor(Rating)as floor_value,
abs(Rating) as absolute_value,
getdate () as Todays_date,
year(getdate()) as year,
month(getdate()) as month,
day(getdate()) as day
from jomato

--Display the restaurant type and total average cost using rollup.
select RestaurantType,
sum(averageCost) as avg_cost from Jomato
group by rollup (RestaurantType)