/* SQL PROJECT
Oliver Aldorsson
YH24
*/

-- Music Store!!

-- Create the database:
DROP DATABASE IF EXISTS musicstore;
CREATE DATABASE musicstore;
USE musicstore; -- Open the music store!


CREATE TABLE artists(
	artist_id INT AUTO_INCREMENT PRIMARY KEY,
    artist_name VARCHAR(50) NOT NULL UNIQUE,
    formed INT,
    country VARCHAR(50),
    no_members INT,
    members VARCHAR(150)
);

INSERT INTO artists(artist_name, formed, country, no_members, members) VALUES
	("TOOL", 1990, "USA", 4, "Maynard James Keenan, Danny Carey, Adam Jones, Justin Chancellor"),
    ("Opeth", 1990, "Sweden", 5, "Mikael Åkerfeldt, Fredrik Åkesson, Joakim Svalberg, Martín Méndez, Waltteri Väyrynen"),
    ("Motörhead", 1975, "UK", 3, "Lemmy Kilmister, Phil Campbell, Mikkey Dee"),
    ("King Crimson", 1968, "UK", 7, "Robert Fripp, Mel Collins, Tony Levin, Pat Mastelotto, Gavin Harrison, Jakko Jekszyk, Jeremy Stacey"),
    ("Porcupine Tree", 1987, "UK", 3, "Steven Wilson, Richard Barbieri, Gavin Harrison"),
    ("Pink Floyd", 1965, "UK", 3, "David Gilmour, Nick Mason, Richard Wright")
    ;

SELECT * FROM artists;


-- Create the album table:
CREATE TABLE albums(
	stock_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(50) NOT NULL,
    artist VARCHAR(50) NOT NULL,
    released VARCHAR(12),
    tracks INT,
    genre VARCHAR(50),
    total_runtime TIME,
    record_company VARCHAR(50),
    FOREIGN KEY (artist) REFERENCES artists(artist_name) ON DELETE CASCADE
);

INSERT INTO albums(title, artist, released, tracks, genre, total_runtime, record_company) VALUES
("Fear Inoculum", "TOOL", "30/08/2019", 10, "Progressive Metal","01:26:43", "Tool Dissectional"),
("10,000 Days", "TOOL", "28/04/2006", 11, "Progressive Metal", "01:15:45", "Tool Dissectional"),
("Fear of a Blank Planet", "Porcupine Tree", "16/04/2007", 6, "Progressive Rock", "00:50:48", "Roadrunner"),
("The Dark Side of the Moon", "Pink Floyd", "01/03/1973", 10, "Progressive Rock", "00:42:50", "Harvest"),
("The Piper at the Gates of Dawn", "Pink Floyd", "04/08/1967", 11, "Psychedelic Rock", "00:41:54", "EMI Columbia"),
("Still Life", "Opeth", "18/10/1999", 7, "Progressive Death Metal", "01:02:29", "Peaceville"),
("Overkill", "Motörhead", "03/03/1979", 10, "Heavy Metal", "00:34:30", "Bronze"),
("In the Court of the Crimson King", "King Crimson", "10/10/1969", 5, "Progressive Rock", "00:43:54", "Island"),
("In Absentia", "Porcupine Tree", "24/09/2002", 12, "Progressive Rock", "01:08:20", "Lava"),
("Lateralus", "TOOL", "15/05/2001", 13, "Progressive Metal", "01:18:51", "Volcano"),
("Ghost Reveries", "Opeth", "29/08/2005", 8, "Progressive Metal", "01:06:46", "Roadrunner"),
("Watershed", "Opeth", "19/05/2008", 7, "Progressive Metal", "00:54:56", "Roadrunner"),
("Heritage", "Opeth", "13/09/2011", 10, "Progressive Rock", "00:57:04", "Roadrunner"),
("Damnation", "Opeth", "22/04/2003", 8, "Progressive Rock", "00:43:03", "Koch"),
("Deliverance", "Opeth", "12/11/2002", 6, "Progressive Death Metal", "01:01:45", "Koch"),
("My Arms, Your Hearse", "Opeth", "18/08/1998", 9, "Progressive Death Metal", "00:52:34", "Candelight"),
("Blackwater Park", "Opeth", "12/03/2001", 8, "Progressive Death Metal", "01:06:59", "Music for Nations"),
("Ænima", "TOOL", "17/09/1996", 15, "Altermative Metal", "01:17:18", "Zoo"),
("Undertow", "TOOL", "06/04/1993", 10, "Altermative Metal", "01:08:08", "Zoo"),
("Opiate", "TOOL", "10/03/1992", 6, "Altermative Metal", "00:26:52", "Zoo"),
("The Wall", "Pink Floyd", "30/10/1979", 26, "Progressive Rock", "01:20:42", "Harvest"),
("Wish You Were Here", "Pink Floyd", "12/09/1975", 5, "Progressive Rock", "00:44:05", "Harvest"),
("Animals", "Pink Floyd", "21/01/1977", 10, "Progressive Rock", "00:41:40", "Harvest"),
("On the Sunday of Life...", "Porcupine Tree", "12/05/1992", 18, "Progressive Rock", "01:15:47", "Delerium"),
("Up the Downstair", "Porcupine Tree", "07/06/1993", 10, "Progressive Rock", "00:47:59", "Delerium"),
("The Sky Moves Sideways", "Porcupine Tree", "30/01/1995", 6, "Progressive Rock", "01:05:31", "Delerium"),
("Signify", "Porcupine Tree", "30/09/1996", 12, "Progressive Rock", "01:01:56", "Delerium"),
("Lightbulb Sun", "Porcupine Tree", "22/05/2000", 10, "Progressive Rock", "00:56:17", "Snapper"),
("Deadwing", "Porcupine Tree", "24/03/2005", 9, "Progressive Rock", "00:59:35", "Lava"),
("Closure/Continuation", "Porcupine Tree", "24/06/2022", 10, "Progressive Rock", "00:48:01", "Music for Nations"),
("The Incident", "Porcupine Tree", "14/09/2009", 20, "Progressive Rock", "01:15:43", "Roadrunner")
;

-- Create indexes to optimize and make searching faster:
CREATE INDEX idx_artist ON albums(artist);
CREATE INDEX idx_genre ON albums(genre);

-- Create an index on the artists' name to make searching easier:
CREATE INDEX idx_artist_name ON artists(artist_name);

SELECT * FROM albums WHERE artist = 'TOOL';

SELECT * FROM albums;
SELECT SUM(tracks) AS total_antal_latar
FROM albums;


CREATE TABLE fear_inoculum(
	track_no INT AUTO_INCREMENT PRIMARY KEY,
    song_title VARCHAR(50) NOT NULL,
    composers VARCHAR(150),
    duration TIME,
    has_vocals BOOLEAN DEFAULT TRUE, -- If not specified, the default is that track is not instrumental
    artist VARCHAR(50),
    album_id INT,
    FOREIGN KEY (album_id) REFERENCES albums(stock_id) ON DELETE CASCADE -- The songs on fear_inoculum will be removed if Fear Inoculum gets removed off the album table.
);


INSERT INTO fear_inoculum(song_title, composers, has_vocals, artist, duration, album_id) VALUES
("Fear Inoculum", "Maynard James Keenan, Danny Carey, Adam Jones, Justin Chancellor", true, "TOOL", "00:10:21",1),
("Pneuma", "Maynard James Keenan, Danny Carey, Adam Jones, Justin Chancellor", 1, "TOOL", "00:11:53", 1),
("Litanie contre la peur", "Maynard James Keenan, Danny Carey, Adam Jones, Justin Chancellor", 0, "TOOL", "00:02:14", 1),
("Invincible", "Maynard James Keenan, Danny Carey, Adam Jones, Justin Chancellor", 1, "TOOL", "00:12:44", 1),
("Legion Inoculant", "Maynard James Keenan, Danny Carey, Adam Jones, Justin Chancellor", 0, "TOOL", "00:03:09", 1),
("Descending", "Maynard James Keenan, Danny Carey, Adam Jones, Justin Chancellor", 1, "TOOL", "00:13:37", 1),
("Culling Voices", "Maynard James Keenan, Danny Carey, Adam Jones, Justin Chancellor", 1, "TOOL", "00:10:05", 1),
("Chocolate Chip Trip", "Maynard James Keenan, Danny Carey, Adam Jones, Justin Chancellor", 0, "TOOL", "00:04:48", 1),
("7empest", "Maynard James Keenan, Danny Carey, Adam Jones, Justin Chancellor", 1, "TOOL", "00:15:43", 1),
("Mockingbeat", "Maynard James Keenan, Danny Carey, Adam Jones, Justin Chancellor", 0, "TOOL", "00:02:05", 1)
;

SELECT * FROM fear_inoculum;

CREATE TABLE fear_of_a_blank_planet(
	track_no INT AUTO_INCREMENT PRIMARY KEY,
    song_title VARCHAR(50),
    composers VARCHAR(150),
    duration TIME,
    artist VARCHAR(50),
    album_id INT,
    FOREIGN KEY (album_id) REFERENCES albums(stock_id) ON DELETE CASCADE -- The songs on fear_of_a_blank_planet will be removed if Fear of a Blank Planet gets removed off the album table.
);

INSERT INTO fear_of_a_blank_planet(song_title, composers, artist, duration, album_id) VALUES
("Fear of a Blank Planet", "Steven Wilson", "Porcupine Tree", "00:07:28",3),
("My Ashes", "Steven Wilson", "Porcupine Tree", "00:05:07", 3),
("Anesthetize", "Steven Wilson", "Porcupine Tree", "00:17:42", 3),
("Sentimental", "Steven Wilson", "Porcupine Tree", "00:05:26", 3),
("Way Out of Here", "Steven Wilson", "Porcupine Tree", "00:07:37", 3),
("Sleep Together", "Steven Wilson", "Porcupine Tree", "00:07:28", 3)
;

CREATE TABLE watershed(
	track_no INT AUTO_INCREMENT PRIMARY KEY,
    song_title VARCHAR(50),
    composers VARCHAR(150),
    duration TIME,
    mostly_acoustic BOOLEAN DEFAULT FALSE, -- If not specified, the default is that track is not mostly acoustic
    artist VARCHAR(50),
    album_id INT,
    FOREIGN KEY (album_id) REFERENCES albums(stock_id) ON DELETE CASCADE -- The songs on watershed will be removed if Watershed gets removed off the album table.
);

INSERT INTO watershed(song_title, composers, mostly_acoustic, artist, duration, album_id) VALUES
("Coil", "Mikael Åkerfeldt", 1, "Opeth", "00:03:10", 12),
("Heir Apparent", "Mikael Åkerfeldt", 0, "Opeth", "00:08:50", 12),
("The Lotus Eater", "Mikael Åkerfeldt", 0, "Opeth", "00:08:50", 12),
("Burden", "Mikael Åkerfeldt", 1, "Opeth", "00:07:41", 12),
("Porcelain Heart", "Mikael Åkerfeldt, Fredrik Åkesson", 0, "Opeth", "00:08:00", 12),
("Hessian Peel", "Mikael Åkerfeldt", 0, "Opeth", "00:11:25", 12),
("Hex Omega", "Mikael Åkerfeldt", 0, "Opeth", "00:07:00", 12)
;

SELECT * FROM fear_of_a_blank_planet;
SELECT * FROM fear_inoculum;
SELECT * FROM watershed;


CREATE TABLE songs(
song_id INT AUTO_INCREMENT PRIMARY KEY,
song_title VARCHAR(255) NOT NULL,
artist VARCHAR(50),
composers VARCHAR(150),
duration TIME,
release_year INT,
has_vocals BOOLEAN DEFAULT TRUE,
mostly_acoustic BOOLEAN DEFAULT FALSE,
album_id INT,
FOREIGN KEY (album_id) REFERENCES albums(stock_id)
);

SELECT * FROM albums;

INSERT INTO songs(song_title, artist, composers, duration, release_year, has_vocals, mostly_acoustic, album_id) VALUES
("Fear Inoculum", "TOOL", "Maynard James Keenan, Danny Carey, Adam Jones, Justin Chancellor", "00:10:21", 2019, 1, 0, 1),
("Pneuma", "TOOL", "Maynard James Keenan, Danny Carey, Adam Jones, Justin Chancellor", "00:11:53", 2019, 1, 0, 1),
("Litanie contre la peur", "TOOL", "Maynard James Keenan, Danny Carey, Adam Jones, Justin Chancellor", "00:02:14", 2019, 0, 0, 1),
("Invincible", "TOOL", "Maynard James Keenan, Danny Carey, Adam Jones, Justin Chancellor", "00:12:44", 2019, 1, 0, 1),
("Legion Inoculant", "TOOL", "Maynard James Keenan, Danny Carey, Adam Jones, Justin Chancellor", "00:03:09", 2019, 0, 0, 1),
("Descending", "TOOL", "Maynard James Keenan, Danny Carey, Adam Jones, Justin Chancellor", "00:13:37", 2019, 1, 0, 1),
("Culling Voices", "TOOL", "Maynard James Keenan, Danny Carey, Adam Jones, Justin Chancellor", "00:10:05", 2019, 1, 0, 1),
("Chocolate Chip Trip", "TOOL", "Maynard James Keenan, Danny Carey, Adam Jones, Justin Chancellor", "00:04:48", 2019, 0, 0, 1),
("7empest", "TOOL", "Maynard James Keenan, Danny Carey, Adam Jones, Justin Chancellor", "00:15:43", 2019, 1, 0, 1),
("Mockingbeat", "TOOL", "Maynard James Keenan, Danny Carey, Adam Jones, Justin Chancellor", "00:02:05", 2019, 0, 0, 1),
("Vicarious", "TOOL", "Maynard James Keenan, Danny Carey, Adam Jones, Justin Chancellor", "00:07:06", 2006, 1, 0, 2),
("Jambi", "TOOL", "Maynard James Keenan, Danny Carey, Adam Jones, Justin Chancellor", "00:07:28", 2006, 1, 0, 2),
("Wings For Marie (Pt 1)", "TOOL", "Maynard James Keenan, Danny Carey, Adam Jones, Justin Chancellor", "00:06:11", 2006, 0, 0, 2),
("10,000 Days (Wings Pt 2)", "TOOL", "Maynard James Keenan, Danny Carey, Adam Jones, Justin Chancellor", "00:11:13", 2006, 1, 0, 2),
("The Pot", "TOOL", "Maynard James Keenan, Danny Carey, Adam Jones, Justin Chancellor", "00:06:21", 2006, 1, 0, 2),
("Lipan Conjuring", "TOOL", "Maynard James Keenan, Danny Carey, Adam Jones, Justin Chancellor", "00:01:11", 2006, 1, 0, 2),
("Lost Keys (Blame Hofman)", "TOOL", "Maynard James Keenan, Danny Carey, Adam Jones, Justin Chancellor", "00:03:46", 2006, 1, 0, 2),
("Rosetta Stoned", "TOOL", "Maynard James Keenan, Danny Carey, Adam Jones, Justin Chancellor", "00:11:11", 2006, 1, 0, 2),
("Intension", "TOOL", "Maynard James Keenan, Danny Carey, Adam Jones, Justin Chancellor", "00:07:21", 2006, 1, 0, 2),
("Right In Two", "TOOL", "Maynard James Keenan, Danny Carey, Adam Jones, Justin Chancellor", "00:08:55", 2006, 1, 0, 2),
("Viginti Tres", "TOOL", "Maynard James Keenan, Danny Carey, Adam Jones, Justin Chancellor", "00:05:02", 2006, 0, 0, 2),
("Fear of a Blank Planet", "Porcupine Tree", "Steven Wilson", "00:07:28", 2007, 1, 0, 3),
("My Ashes", "Porcupine Tree", "Steven Wilson", "00:05:07", 2007, 1, 1, 3),
("Anesthetize", "Porcupine Tree", "Steven Wilson", "00:17:42", 2007, 1, 0, 3),
("Sentimental", "Porcupine Tree", "Steven Wilson", "00:05:26", 2007, 1, 0, 3),
("Way Out of Here", "Porcupine Tree", "Steven Wilson", "00:07:37", 2007, 1, 0, 3),
("Sleep Together", "Porcupine Tree", "Steven Wilson", "00:07:28", 2007, 1, 0, 3),
("Speak to Me", "Pink Floyd", "Nick Mason", "00:01:07", 1973, 1, 0, 4),
("Breathe (In the Air)", "Pink Floyd", "Richard Wright, David Gilmour", "00:02:49", 1973, 1, 0, 4),
("On the Run", "Pink Floyd", "David Gilmour, Roger Waters", "00:03:45", 1973, 1, 0, 4),
("Time", "Pink Floyd", "Nick Mason, Roger Waters, Richard Wright, David Gilmour", "00:06:53", 1973, 1, 0, 3),
("The Great Gig in the Sky", "Pink Floyd", "Richard Wright, Clare Torry", "00:04:44", 1973, 1, 0, 4),
("Money", "Pink Floyd", "Roger Waters", "00:06:23", 1973, 1, 0, 4),
("Us and Them", "Pink Floyd", "Richard Wright", "00:07:49", 1973, 1, 0, 4),
("Any Colour You Like", "Pink Floyd", "David Gilmour, Nick Mason, Richard Wright", "00:03:26", 1973, 1, 0, 4),
("Brain Damage", "Pink Floyd", "Roger Waters", "00:03:46", 1973, 1, 0, 4),
("Eclipse", "Pink Floyd", "Roger Waters", "00:02:12", 1973, 1, 0, 4),
("The Moor", "Opeth", "Mikael Åkerfeldt", "00:11:26", 1999, 1, 0, 6),
("Godhead's Lament", "Opeth", "Mikael Åkerfeldt", "00:09:47", 1999, 1, 0, 6),
("Benighted", "Opeth", "Mikael Åkerfeldt", "00:05:00", 1999, 1, 1, 6),
("Moonlapse Vertigo", "Opeth", "Mikael Åkerfeldt", "00:09:00", 1999, 1, 0, 6),
("Face of Melinda", "Opeth", "Mikael Åkerfeldt", "00:07:58", 1999, 1, 1, 6),
("Serenity Painted Death", "Opeth", "Mikael Åkerfeldt", "00:09:13", 1999, 1, 0, 6),
("White Cluster", "Opeth", "Mikael Åkerfeldt", "00:10:05", 1999, 1, 0, 6),
("Overkill", "Motörhead", "Lemmy Kilmister, Eddie Clarke, Phil Taylor", "00:05:12", 1979, 1, 0, 7),
("Stay Clean", "Motörhead", "Lemmy Kilmister, Eddie Clarke, Phil Taylor", "00:02:40", 1979, 1, 0, 7),
("(I Won't) Pay Your Price", "Motörhead", "Lemmy Kilmister, Eddie Clarke, Phil Taylor", "00:02:56", 1979, 1, 0, 7),
("I'll Be Your Sister", "Motörhead", "Lemmy Kilmister, Eddie Clarke, Phil Taylor", "00:02:51", 1979, 1, 0, 7),
("Capricorn", "Motörhead", "Lemmy Kilmister, Eddie Clarke, Phil Taylor", "00:04:06", 1979, 1, 0, 7),
("No Class", "Motörhead", "Lemmy Kilmister, Eddie Clarke, Phil Taylor", "00:02:39", 1979, 1, 0, 7),
("Damage Case", "Motörhead", "Lemmy Kilmister, Eddie Clarke, Phil Taylor, Mick Farren", "00:02:59", 1979, 1, 0, 7),
("Tear Ya Down", "Motörhead", "Lemmy Kilmister, Eddie Clarke, Phil Taylor", "00:02:39", 1979, 1, 0, 7),
("Metropolis", "Motörhead", "Lemmy Kilmister, Eddie Clarke, Phil Taylor", "00:03:34", 1979, 1, 0, 7),
("Limb from Limb", "Motörhead", "Lemmy Kilmister, Eddie Clarke, Phil Taylor", "00:04:54", 1979, 1, 0, 7),
("21st Century Schizoid Man", "King Crimson", "Robert Fripp, Ian McDonald, Greg Lake, Michael Giles, Peter Sinfield", "00:07:24", 1969, 1, 0, 8),
("I Talk to the Wind", "King Crimson", "Ian McDonald, Peter Sinfield", "00:06:05", 1969, 1, 1, 8),
("Epitaph", "King Crimson", "Fripp, McDonald, Lake, Giles, Sinfield", "00:08:47", 1969, 1, 0, 8),
("Moonchild", "King Crimson", "Fripp, McDonald, Lake, Giles, Sinfield", "00:12:13", 1969, 1, 1, 8),
("The Court of the Crimson King", "King Crimson", "McDonald, Sinfield", "00:09:25", 1969, 1, 0, 8),
("Blackest Eyes", "Porcupine Tree", "Steven Wilson", "00:04:23", 2002, 1, 0, 9),
("Trains", "Porcupine Tree", "Steven Wilson", "00:05:56", 2002, 1, 0, 9),
("Lips of Ashes", "Porcupine Tree", "Steven Wilson", "00:04:39", 2002, 1, 0, 9),
("The Sound of Muzak", "Porcupine Tree", "Steven Wilson", "00:04:59", 2002, 1, 0, 9),
("Gravity Eyelids", "Porcupine Tree", "Steven Wilson", "00:07:56", 2002, 1, 0, 9),
("Wedding Nails", "Porcupine Tree", "Richard Barbieri, Steven Wilson", "00:06:33", 2002, 0, 0, 9),
("Prodigal", "Porcupine Tree", "Steven Wilson", "00:05:32", 2002, 1, 0, 9),
('".3"', "Porcupine Tree", "Steven Wilson", "00:05:25", 2002, 1, 0, 9),
("The Creator Has a Mastertape", "Porcupine Tree", "Steven Wilson", "00:05:21", 2002, 1, 0, 9),
("Heartattack in a Layby", "Porcupine Tree", "Steven Wilson", "00:04:15", 2002, 1, 0, 9),
("Strip the Soul", "Porcupine Tree", "Colin Edwin, Steven Wilson", "00:07:21", 2002, 1, 0, 9),
("Collapse the Light Into Earth", "Porcupine Tree", "Steven Wilson", "00:05:54", 2002, 1, 0, 9),
("The Grudge", "TOOL", "Maynard James Keenan, Danny Carey, Adam Jones, Justin Chancellor", "00:06:36", 2001, 1, 0, 10),
("Eon Blue Apocalypse", "TOOL", "Maynard James Keenan, Danny Carey, Adam Jones, Justin Chancellor", "00:01:04", 2001, 0, 1, 10),
("The Patient", "TOOL", "Maynard James Keenan, Danny Carey, Adam Jones, Justin Chancellor", "00:07:13", 2001, 1, 0, 10),
("Mantra", "TOOL", "Maynard James Keenan, Danny Carey, Adam Jones, Justin Chancellor", "00:01:12", 2001, 0, 0, 10),
("Schism", "TOOL", "Maynard James Keenan, Danny Carey, Adam Jones, Justin Chancellor", "00:06:47", 2001, 1, 0, 10),
("Parabol", "TOOL", "Maynard James Keenan, Danny Carey, Adam Jones, Justin Chancellor", "00:03:04", 2001, 1, 1, 10),
("Parabola", "TOOL", "Maynard James Keenan, Danny Carey, Adam Jones, Justin Chancellor", "00:06:03", 2001, 1, 0, 10),
("Ticks & Leeches", "TOOL", "Maynard James Keenan, Danny Carey, Adam Jones, Justin Chancellor", "00:08:10", 2001, 1, 0, 10),
("Lateralus", "TOOL", "Maynard James Keenan, Danny Carey, Adam Jones, Justin Chancellor", "00:09:24", 2001, 1, 0, 10),
("Disposition", "TOOL", "Maynard James Keenan, Danny Carey, Adam Jones, Justin Chancellor", "00:04:46", 2001, 1, 0, 10),
("Reflection", "TOOL", "Maynard James Keenan, Danny Carey, Adam Jones, Justin Chancellor", "00:11:07", 2001, 1, 0, 10),
("Triad", "TOOL", "Maynard James Keenan, Danny Carey, Adam Jones, Justin Chancellor", "00:08:46", 2001, 0, 0, 10),
("Faaip de Oiad", "TOOL", "Maynard James Keenan, Danny Carey, Adam Jones, Justin Chancellor", "00:02:39", 2001, 1, 0, 10),
("Ghost of Perdition", "Opeth", "Mikael Åkerfeldt", "00:10:29", 2005, 1, 0, 11),
("The Baying of the Hounds", "Opeth", "Mikael Åkerfeldt", "00:10:41", 2005, 1, 0, 11),
("Beneath the Mire", "Opeth", "Mikael Åkerfeldt", "00:07:57", 2005, 1, 0, 11),
("Atonement", "Opeth", "Mikael Åkerfeldt", "00:06:28", 2005, 1, 0, 11),
("Reverie/Harequin Forest", "Opeth", "Mikael Åkerfeldt, Fredrik Åkesson", "00:11:39", 2005, 1, 0, 11),
("Hours of Wealth", "Opeth", "Mikael Åkerfeldt", "00:05:20", 2005, 1, 0, 11),
("The Grand Conjuration", "Opeth", "Mikael Åkerfeldt, Per Wiberg", "00:10:21", 2005, 1, 0, 11),
("Isolation Years", "Opeth", "Mikael Åkerfeldt", "00:03:51", 2005, 1, 0, 11),
("Coil", "Opeth", "Mikael Åkerfeldt", "00:03:10", 2008, 1, 1, 12),
("Heir Apparent", "Opeth", "Mikael Åkerfeldt", "00:08:50", 2008, 1, 0, 12),
("The Lotus Eater", "Opeth", "Mikael Åkerfeldt", "00:08:50", 2008, 1, 0, 12),
("Burden", "Opeth", "Mikael Åkerfeldt", "00:07:41", 2008, 1, 1, 12),
("Porcelain Heart", "Opeth", "Mikael Åkerfeldt, Fredrik Åkesson", "00:08:00", 2008, 1, 0, 12),
("Hessian Peel", "Opeth", "Mikael Åkerfeldt", "00:11:25", 2008, 1, 0, 12),
("Hex Omega", "Opeth", "Mikael Åkerfeldt", "00:07:00", 2008, 1, 0, 12)
;

-- Show all songs:
SELECT * FROM songs;

-- ...with album title instead of ID:
SELECT s.song_id, s.song_title, s.artist, s.composers, s.duration, s.release_year,
       s.has_vocals, s.mostly_acoustic, a.title AS album
FROM songs s
JOIN albums a ON s.album_id = a.stock_id;


-- Show Fear Inoculum track list, and release date
SELECT f.track_no, f.song_title, f.composers, f.has_vocals, f.duration, a.released
FROM fear_inoculum f
JOIN albums a ON f.album_id = a.stock_id;
-- WHERE f.artist = 'TOOL'; unncessary?


-- Stored procedure:
DELIMITER $$

CREATE PROCEDURE GetAlbumsByArtist(IN artist_name VARCHAR(50))
BEGIN
    SELECT title, released, genre 
    FROM albums 
    WHERE artist = artist_name;
END $$

DELIMITER ;

/*
-- Find all albums by (artist):
CALL GetAlbumsByArtist('TOOL');
CALL GetAlbumsByArtist('Pink Floyd');
CALL GetAlbumsByArtist('Porcupine Tree');
CALL GetAlbumsByArtist('Opeth');
*/

DROP USER 'admin'@'localhost';
DROP USER 'customer'@'localhost';

-- Secure stuf
-- Create users		THIS SHOULD RUN WHEN SCRIPT IS RUNNING!!!
CREATE USER 'admin'@'localhost' IDENTIFIED BY 'adminpassword';
CREATE USER 'customer'@'localhost' IDENTIFIED BY 'customerpassword';
-- MySQL encrypts passwords automatically via SHA-2 with this method. Secure Hash Algorithm 2 up to 256 bits -> 64 hex characters



-- Grand all priveleges on all tables:
GRANT ALL PRIVILEGES ON musicstore.* TO 'admin'@'localhost';

-- Grand rights to customers to read album and artist data
GRANT SELECT ON albums TO 'customer'@'localhost';
GRANT SELECT ON artists TO 'customer'@'localhost';

-- Revoke rights:
-- REVOKE SELECT ON albums FROM 'customer'@'localhost';


 
 -- Show all albums from the UK:
SELECT albums.title, albums.released, artists.artist_name, artists.country
FROM albums
JOIN artists ON albums.artist = artists.artist_name
WHERE artists.country = 'UK';

-- Group by genre:
SELECT genre, COUNT(*) AS number_of_albums
FROM albums
GROUP BY genre;


CREATE TABLE album_log (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    album_title VARCHAR(50),
    added_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Trigger for logging new albums inserted:
DELIMITER $$
CREATE TRIGGER after_album_insert
AFTER INSERT ON albums
FOR EACH ROW
BEGIN
    INSERT INTO album_log (album_title) VALUES (NEW.title);
END $$
DELIMITER ;


SELECT * FROM album_log;



-- Count how many albums each artist have released, in descending order, also ascending order by artist name
SELECT a.artist_name, COUNT(al.stock_id) AS album_count
FROM artists a
JOIN albums al ON a.artist_name = al.artist
GROUP BY a.artist_name
ORDER BY album_count DESC, a.artist_name ASC;
-- (JOIN and GROUP BY in the same query)


-- New tables:
CREATE TABLE products (
	product_id INT AUTO_INCREMENT PRIMARY KEY,
    album_id INT,
    title VARCHAR(50) NOT NULL,
    artist VARCHAR(50) NOT NULL,
    release_year INT,
    genre VARCHAR(50),
    price DECIMAL(10,2) NOT NULL CHECK (price > 0),
    stock_quantity INT,
    FOREIGN KEY (album_id) REFERENCES albums(stock_id)
);

-- Creating the table for the customers:
CREATE TABLE customers(
	customer_id INT AUTO_INCREMENT PRIMARY KEY,
	customer_name VARCHAR(100) NOT NULL,
	email VARCHAR(100) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    registration_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    role ENUM('customer', 'admin') DEFAULT 'customer'
);

-- Creating the orders table:
CREATE TABLE orders (
	order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    customer_name VARCHAR(100) NOT NULL,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
    
-- Creating the order_lines table:
CREATE TABLE order_lines(
	order_line_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    total_price DECIMAL(10, 2) GENERATED ALWAYS AS (quantity * price) STORED,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- CREATE INDEX idx_customer_id ON customers(customer_id);
-- CREATE INDEX idx_order_id ON orders(order_id);
CREATE INDEX idx_order_lines_order_id ON order_lines(order_id);
CREATE INDEX idx_order_lines_product_id ON order_lines(product_id);
CREATE INDEX idx_product_id ON products(product_id);


-- Update total price automatically, on order_lines
DELIMITER $$

CREATE TRIGGER update_total_price
AFTER INSERT ON order_lines
FOR EACH ROW
BEGIN
    DECLARE total DECIMAL(10, 2);
    
    -- Get the sum of the total price for the order
    SELECT SUM(price * quantity) INTO total
    FROM order_lines
    WHERE order_id = NEW.order_id;
    
    -- Update total_price in the orders table
    UPDATE orders
    SET total_amount = total
    WHERE order_id = NEW.order_id;
END $$

DELIMITER ;

-- Update stock quantity after order has been confirmed:
DELIMITER $$

CREATE TRIGGER update_stock_after_order
AFTER INSERT ON order_lines
FOR EACH ROW
BEGIN
    -- Update stock_quantity in the product table
    UPDATE products
    SET stock_quantity = stock_quantity - NEW.quantity
    WHERE product_id = NEW.product_id;
END $$

DELIMITER ;

-- INSERT INTO the tables:
INSERT INTO customers (customer_name, email, password_hash) VALUES
('Alice Andersson', 'alice13@email.com', SHA2('alicepassword', 256)),
('Bob Berg', 'bob50@email.com', SHA2('bobpassword', 256)),
('Clara Carlsson', 'clara22@email.com', SHA2('clarapassword', 256)),
('Mats Svensson', 'mattan50@email.com', SHA2('apassword3', 256)),
('Sven Karlsson', 'svennan20@email.com', SHA2('svett3', 256)),
('Karl Svensson', 'countdooku10@email.com', SHA2('sno123', 256)),
('Anakin Skywalker', 'ihatesand@email.com', SHA2('sandcursed', 256)),
('General Grevious', 'droidgeneral@email.com', SHA2('jediscum', 256)),
('Hans Svensson', 'hanssven@email.com', SHA2('sven123', 256)),
('Uber Van Canoli', 'darthcanoli@email.com', SHA2('chewbacca1', 256))
;

/*
DROP TABLE customers;
DELETE FROM customers WHERE customer_id = 3;
*/

-- Show data on customer_id 1:
SELECT *
FROM customers
WHERE email = 'alice13@email.com'
AND password_hash = SHA2('alicepassword', 256);

/* INSERT INTO products (title, artist, genre)
SELECT title, artist genre
FROM albums;
*/

INSERT INTO products (album_id, title, artist, release_year, genre, price, stock_quantity) VALUES
(1, "Fear Inoculum", "TOOL", 2019, "Progressive Metal", 299.99, 200),
(2, "10,000 Days", "TOOL", 2007, "Progressive Metal", 299.99, 300),
(6, "Still Life", "Opeth", 1999, "Progressive Death Metal", 299.99, 170),
(4, "The Dark Side of the Moon", "Pink Floyd", 1973, "Progressive Rock", 249.99, 200),
(9, "In Absentia", "Porcupine Tree", 2002, "Progressive Rock", 199.99, 200),
(11, "Ghost Reveries", "Opeth", 2005, "Progressive Metal", 199.99, 300),
(10, "Lateralus", "TOOL", 2001, "Progressive Metal", 249.99, 300),
(3, "Fear of a Blank Planet", "Porcupine Tree", 2007, "Progressive Rock", 249.99, 300),
(18, "Ænima", "TOOL", 1996, "Alternative Metal", 199.99, 300),
(31, "The Incident", "Porcupine Tree", 2009, "Progressive Rock", 299.99, 200),
(7, "Overkill", "Motörhead", 1979, "Heavy Metal", 199.99, 300),
(8, "In the Court of the Crimson King", "King Crimson", 1969, "Progressive Rock", 299.99, 200),
(4, "The Wall", "Pink Floyd", 1979, "Progressive Rock", 349.99, 400)
;

SELECT * FROM products;
SELECT * FROM album_log;
SELECT * FROM order_lines;

-- INSERT INTO orders (customer_id, total_amount) VALUES
-- (1, 299.99);

SELECT * FROM orders;


/*
-- Insert order:
INSERT INTO orders (customer_id, customer_name)
SELECT customer_id, customer_name
FROM customers
WHERE customer_id = 5;
*/

 -- Insert orders:

-- Insert several orders at the same time:
INSERT INTO orders (customer_id, customer_name)
SELECT customer_id, customer_name
FROM customers
WHERE customer_id IN (1, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10);



SELECT * FROM orders;

SELECT * FROM products;

-- Trigger eliminating the need to input any price manually into order_lines, instead it takes the price data from the products table:
DELIMITER $$

CREATE TRIGGER set_price_before_insert
BEFORE INSERT ON order_lines
FOR EACH ROW
BEGIN
	DECLARE prod_price DECIMAL(10,2);
    SELECT price INTO prod_price FROM products WHERE product_id = NEW.product_id;
    SET NEW.price = prod_price;
END;
$$

DELIMITER;

-- Put into order_lines and then get the price automatically:

INSERT INTO order_lines (order_id, product_id, quantity) VALUES
	(1, 7, 5),
	(2, 5, 3),
	(3, 1, 5),
	(4, 4, 7),
	(5, 6, 2),
	(6, 10, 3),
	(7, 12, 5),
	(8, 11, 10),
	(9, 2, 6),
	(10, 3, 1);


SELECT * FROM orders;
SELECT * FROM order_lines;


INSERT INTO albums(title, artist, released, tracks, genre, total_runtime, record_company) VALUES
("The Last Will and Testament", "Opeth", "22/11/2024", 8, "Progressive Death Metal", "00:50:52", "Moderbolaget");

SELECT * FROM albums;
SELECT * FROM album_log;


-- How many sales per time period?
DELIMITER $$

CREATE PROCEDURE get_total_sales (IN start_date DATE, IN end_date DATE)
BEGIN
    DECLARE total_sales DECIMAL(10, 2);
    DECLARE total_units INT;

    -- Sum all sales for the period:
    SELECT SUM(oi.quantity * oi.price), SUM(oi.quantity) 
    INTO total_sales, total_units
    FROM order_lines oi
    JOIN orders o ON oi.order_id = o.order_id
    WHERE o.order_date BETWEEN start_date AND end_date;

    -- Return both total sales and total units sold:
    SELECT 
        total_sales AS total_sales_for_period, 
        total_units AS total_units_sold;
END $$

DELIMITER ;


-- Call the procedure with start and end date:
CALL get_total_sales('2025-01-01', '2025-03-31');


-- The same procedure but also with album_name:
DELIMITER $$

CREATE PROCEDURE get_sales_and_top_albums (IN start_date DATE, IN end_date DATE)
BEGIN
    DECLARE total_sales DECIMAL(10, 2);
    DECLARE total_units_sold INT;

    -- Sum total for all orders in the selected period:
	SELECT 
	   SUM(oi.quantity * oi.price),
	   SUM(oi.quantity)
	INTO total_sales, total_units_sold
	FROM order_lines oi
	JOIN orders o ON oi.order_id = o.order_id
	WHERE o.order_date BETWEEN start_date AND end_date;

    -- Return the total sales for the period:
    SELECT total_sales AS total_sales_for_period,
           total_units_sold AS total_units_sold_for_period;

    -- Show the most sold albums for the period (order_lines, product_id, units sold):
    SELECT p.product_id, p.title AS album_name, SUM(oi.quantity) AS units_sold
    FROM order_lines oi
    JOIN products p ON oi.product_id = p.product_id
    JOIN orders o ON oi.order_id = o.order_id
    WHERE o.order_date BETWEEN start_date AND end_date
    GROUP BY p.product_id, p.title
    ORDER BY units_sold DESC;
END $$

DELIMITER ;

-- Call the procedure with start and end date:
CALL get_sales_and_top_albums('2025-01-01', '2025-03-31');


-- TOP 5 sold albums:
SELECT 
    p.title,
    p.artist,
    SUM(ol.quantity) AS total_sold
FROM order_lines ol
JOIN products p ON ol.product_id = p.product_id
GROUP BY p.title, p.artist
ORDER BY total_sold DESC
LIMIT 5;



-- Most money spent per customer + albums bought:
SELECT 
    c.customer_name,
    SUM(ol.quantity * ol.price) AS total_spent,
    SUM(ol.quantity) AS albums_bought
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN order_lines ol ON o.order_id = ol.order_id
GROUP BY c.customer_name
ORDER BY total_spent DESC
LIMIT 5;

-- Make backup:
-- mysqldump -u root -p musicstore > musicstore_backup.sql
-- Restore from backup:
-- mysql -u root -p musicstore < musicstore_backup.sql