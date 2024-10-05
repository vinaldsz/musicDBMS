--query that lists all the tracks that have a ' in the name

SELECT * 
FROM tracks 
where Name like '%á%' OR Name like '%é%' OR  Name like '%í%' OR Name like '%ó%' OR Name like '%ú%';