--top 5 Genres that are highest sold

-- There if a track is purchased, there will be an associated invoice for it. 
select * from (select count(a.TrackId) cnt, a.GenreId from Tracks a inner join invoice_items b On a.TrackId = b.TrackId group by a.genreId ) c
Inner join Genres d on c.GenreId=d.GenreId
order by cnt desc
Limit 5;
