WITH cte_topGenres AS(
SELECT GenreId from (
SELECT
  GenreId, avg(Milliseconds) average
FROM
  Tracks a
  GROUP BY GenreId
  ORDER BY
average  DESC
LIMIT 5
))
  
  select *  from tracks where GenreId not in cte_topGenres;
