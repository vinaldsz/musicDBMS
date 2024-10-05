--creating Music_Video TABLE
CREATE TABLE "Music_Video" (
	"track_id"	INTEGER NOT NULL,
	"video_director"	TEXT,
	PRIMARY KEY("track_id"),
	FOREIGN KEY("track_id") REFERENCES "Tracks"("TrackId") ON DELETE CASCADE
)
-- creating trigger so that no track is inserted in Music_Video that is not part of track
CREATE TRIGGER check_track_exists_before_insert
BEFORE INSERT 
ON Music_Video
BEGIN
    SELECT CASE
        WHEN (SELECT COUNT(*) FROM Tracks WHERE TrackId = NEW.track_id) = 0 THEN
            RAISE(ABORT, 'Track does not exist in the Tracks table')
    END;
END;


