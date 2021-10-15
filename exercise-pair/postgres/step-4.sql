-- select the park name, campground name, open_from_mm, open_to_mm & daily_fee ordered by park name and then campground name
SELECT park.name AS park_name, campground.name AS campground_name, campground.open_from_mm, campground.open_to_mm, campground.daily_fee
FROM park
JOIN campground ON park.park_id = campground.campground_id
ORDER BY park.name, campground.name;

-- select the park name and the total number of campgrounds for each park ordered by park name
SELECT park.name AS park_name, COUNT(campground.park_id)
FROM park
JOIN campground ON park.park_id = campground.park_id
GROUP BY park_name
ORDER BY park.name;

-- select the park name, campground name, site number, max occupancy, accessible, max rv length, utilities where the campground name is 'Blackwoods'
SELECT park.name AS park_name, campground.name AS campground_name, site.site_number, site.max_occupancy, site.max_rv_length, site.utilities
FROM site
JOIN campground ON site.campground_id = campground.campground_id
JOIN park ON campground.park_id = park.park_id
WHERE campground.name = 'Blackwoods';

/*
  select park name, campground, total number of sites (column alias 'number_of_sites') ordered by park
  -------------------------------------------------
    Acadia	Blackwoods	276
    Acadia	Seawall	198
    Acadia	Schoodic Woods	92
    Arches	"Devil's Garden"	49
    Arches	Canyon Wren Group Site	1
    Arches	Juniper Group Site	1
    Cuyahoga Valley	The Unnamed Primitive Campsites	5
  -------------------------------------------------
*/
SELECT park.name AS park_name, campground.name AS campground_name, COUNT(site.site_number) AS number_of_sites FROM site
JOIN campground ON site.campground_id = campground.campground_id
JOIN park ON campground.park_id = park.park_id
GROUP BY campground_name, park_name
ORDER BY park_name;


-- select site number, reservation name, reservation from and to date ordered by reservation from date
SELECT site.site_number, reservation.name, reservation.from_date, reservation.to_date 
FROM reservation 
JOIN site ON reservation.reservation_id = site.site_id 
ORDER BY reservation.from_date;




/*
  select campground name, total number of reservations for each campground ordered by total reservations desc
  -------------------------------------------------
    Seawall	13
    Blackwoods	9
    "Devil's Garden"	7
    Schoodic Woods	7
    The Unnamed Primitive Campsites	5
    Canyon Wren Group Site	4
    Juniper Group Site	4
  -------------------------------------------------
*/

SELECT campground.name, COUNT(reservation.reservation_id) AS num_of_reservations 
FROM reservation 
JOIN site ON reservation.site_id = site.site_id 
JOIN campground ON site.campground_id = campground.campground_id
GROUP BY campground.name
ORDER BY num_of_reservations DESC;




