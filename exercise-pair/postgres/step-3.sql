-- CAMPGROUND TABLE
-----------------------------------------------

-- select name and daily fee of all campgrounds
SELECT campground.name, campground.daily_fee FROM campground;

-- select name and daily fee of all campgrounds ordered by campground name
SELECT campground.name, campground.daily_fee FROM campground ORDER BY campground.name;

-- select name, open from month, open to month, and daily fee of the campgrounds where daily fee is less than $100
SELECT campground.name, campground.open_from_mm, campground.open_to_mm, campground.daily_fee FROM campground WHERE campground.daily_fee < '$100';

-- select name and daily fee of the campgrounds where the campground is open all year long
SELECT campground.name, campground.daily_fee FROM campground WHERE campground.open_from_mm = '01' AND campground.open_to_mm = '12';



-- PARK TABLE
-----------------------------------------------

-- select name and description of all parks order by established date in descending order
SELECT park.name, park.description FROM park ORDER BY park.establish_date DESC;  

-- select name and description of all parks in Ohio
SELECT park.name, park.description FROM park WHERE park.location = 'Ohio';

-- select name and description of all parks NOT in Ohio
SELECT park.name, park.description FROM park WHERE park.location <> 'Ohio';

-- select the total number of visitors for all parks
SELECT SUM(visitors) AS total_visitors FROM park;

-- select the average number of visitors for all parks
SELECT AVG(visitors) AS average_visitors FROM park;


-- SITE TABLE
-----------------------------------------------

-- select all columns from site where utilities is true and order by max RV length with the largest coming first
SELECT site.site_id, site.campground_id, site.site_number, site.max_occupancy, site.accessible, site.max_rv_length, site.utilities
FROM site
WHERE site.utilities = true
ORDER BY max_rv_length DESC;

-- select total number of sites that have utilities hook up
SELECT COUNT(site.site_id) AS total_number_of_utility_sites FROM site WHERE site.utilities = true;


-- RESERVATION TABLE
-----------------------------------------------

-- select reservation id, site id, name, from date, to date of the reservations where the checkin date is 
-- between the first and last day of the current month (hard coded month is ok)
SELECT reservation.reservation_id, reservation.site_id, reservation.name, reservation.from_date, reservation.to_date
FROM reservation
WHERE reservation.from_date BETWEEN '2021-10-01' AND '2021-10-31';

-- select all columns from reservation where name includes 'Reservation'
SELECT reservation.name FROM reservation WHERE reservation.name LIKE '%Reservation%';

-- select the total number of reservations in the reservation table
SELECT COUNT(reservation.reservation_id) AS total_reservations FROM reservation;

-- select reservation id, site id, name of the reservations where site id is in the list 9, 20, 24, 45, 46
SELECT reservation.reservation_id, reservation.site_id, reservation.name FROM reservation WHERE reservation.site_id IN (9, 20, 24, 45, 46);

-- select the date and number of reservations for each date orderd by from_date in ascending order
SELECT reservation.from_date, COUNT(reservation.reservation_id) 
FROM reservation 
GROUP BY reservation.from_date 
ORDER BY reservation.from_date ASC;
