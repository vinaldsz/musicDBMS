-- Here trackId is automatically picked from Tracks

INSERT INTO Music_Video(track_id,video_director) SELECT TrackId, "Prem" FROM Tracks where name='Voodoo';