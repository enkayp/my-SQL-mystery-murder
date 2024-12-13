--select all the tables 
select *
from crime_scene_report
select *
from drivers_license
select *
from facebook_event_checkin
select *
from get_fit_now_check_in
select *
from get_fit_now_member
select *
from income
select *
from interview
select *
from person;

--select the data from the crime scene table that has the provided information
SELECT *
FROM crime_scene_report
WHERE date = 20180115 and city = 'SQL City' and type = 'murder';

--find the description of the crime scene report on the day of the incident
SELECT description
FROM crime_scene_report
WHERE date = 20180115 and city = 'SQL City' and type = 'murder'

--finding the first witness ID '14887'
SELECT 
(SELECT id from person  WHERE  address_street_name like '%Northwestern DR%' ORDER by address_number DESC
) as witness_1
FROM person
LIMIT 1

--finding second witness using iD '16371'
SELECT id  as witness_2
from person 
WHERE name LIKE '%Annabel%' and address_street_name like '%franklin Ave%';

--gettin the statement(transcript) of the first witness
SELECT transcript
FROM person p
LEFT JOIN interview  i ON
p.id = i.person_id
WHERE id =14887;

--getting the statement from the seond witness
SELECT transcript
FROM person p
LEFT JOIN interview  i ON
p.id = i.person_id
WHERE id =16371;

--using the wtnesses table to get the murderer
SELECT gfnm.name, gfnci.membership_id, gfnm.person_id
FROM get_fit_now_member gfnm
left join get_fit_now_check_in gfnci
on gfnm.id = gfnci.membership_id
WHERE membership_status = 'gold'
and gfnm.id LIKE '%48Z%'
and check_in_date LIKE '%0109%'

--joined the getfit member now to get the plate number of the exact suspect
SELECT p.name, dl.id, dl.plate_number
FROM drivers_license DL
JOIN person P
ON dl.id = p.license_id
JOIN get_fit_now_member gfnm
ON p.name = gfnm.name
WHERE gfnm.membership_status = 'gold'
and gfnm.id LIKE '%48Z%'
and dl.plate_number LIKE '%H42W%' 
















