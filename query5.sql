--All the tracks that have 'MPEG audio file' and belong to 90's music. Here upper() is used to compare the string since sql is case sensitive
select track.Name, track.trackId 
from
	(select trackId, Name from tracks where MediaTypeId IN (
		select MediaTypeId from media_types where upper(Name) = 'MPEG AUDIO FILE' )) AS track
INNER JOIN playlist_track b 
on track.TrackId = b.TrackId
INNER JOIN playlists c 
on b.PlaylistId = c.PlaylistId
where upper(c.Name)=  upper("90’s Music");