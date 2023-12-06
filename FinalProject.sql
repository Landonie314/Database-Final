DROP TABLE Writer CASCADE CONSTRAINTS;
DROP TABLE Actor CASCADE CONSTRAINTS;
DROP TABLE Director CASCADE CONSTRAINTS;
DROP TABLE Movie CASCADE CONSTRAINTS;
DROP TABLE TV_show CASCADE CONSTRAINTS;
DROP TABLE TV_write CASCADE CONSTRAINTS;
DROP TABLE TV_act CASCADE CONSTRAINTS;
DROP TABLE TV_direct CASCADE CONSTRAINTS;
DROP TABLE MV_write CASCADE CONSTRAINTS;
DROP TABLE MV_act CASCADE CONSTRAINTS;
DROP TABLE MV_direct CASCADE CONSTRAINTS;
DROP TABLE Movie_awards CASCADE CONSTRAINTS;
DROP TABLE TV_show_awards CASCADE CONSTRAINTS;
DROP TABLE MV_genres CASCADE CONSTRAINTS;
DROP TABLE Production_company CASCADE CONSTRAINTS;
DROP TABLE MV_reviews CASCADE CONSTRAINTS;
DROP TABLE TV_reviews CASCADE CONSTRAINTS;




CREATE TABLE Writer
  (Height	NUMBER(3,2),
   Birthday	DATE,
   Trademark	VARCHAR2(500),
   Nickname	VARCHAR2(30),
   Name		VARCHAR2(40),
   CONSTRAINT writer_name_pk PRIMARY KEY (Name)
);

CREATE TABLE Actor
  (Height	NUMBER(3,2),
   Birthday	DATE,
   Trademark	VARCHAR2(500),
   Nickname	VARCHAR2(30),
   Name		VARCHAR2(40),
   CONSTRAINT actor_name_pk PRIMARY KEY (Name)
);

CREATE TABLE Director
  (Height	NUMBER(3,2),
   Birthday	DATE,
   Trademark	VARCHAR2(500),
   Nickname	VARCHAR2(30),
   Name		VARCHAR2(40),
   CONSTRAINT director_name_pk PRIMARY KEY (Name)
);


CREATE TABLE TV_show
  (Id		CHAR(9),
   Title	VARCHAR2(50),
   Age_Rating	VARCHAR2(5),
   Seasons	NUMBER(2),
   Year		NUMBER(4),
   Storyline	VARCHAR2(500),
   CONSTRAINT tv_show_id_pk PRIMARY KEY (Id)
);

CREATE TABLE Movie
  (Id		CHAR(9),
   Title	VARCHAR2(50),
   Age_Rating	VARCHAR2(10),
   Runtime	VARCHAR2(10),
   Year		NUMBER(4),
   Storyline	VARCHAR2(500),
   Description  VARCHAR2(500),
   Metascore	CHAR(3),
   CONSTRAINT movie_id_pk PRIMARY KEY (Id)
);

CREATE TABLE TV_write
  (Name		VARCHAR2(40),
   Id		CHAR(9),
   CONSTRAINT 	tv_write_nameid_pk PRIMARY KEY (Name, Id)
);

CREATE TABLE TV_act
  (Name		VARCHAR2(40),
   Id		CHAR(9),
   CONSTRAINT 	tv_act_nameid_pk PRIMARY KEY (Name, Id)
);

CREATE TABLE TV_direct
  (Name		VARCHAR2(40),
   Id		CHAR(9),
   CONSTRAINT 	tv_direct_nameid_pk PRIMARY KEY (Name, Id)
);     

CREATE TABLE MV_write
  (Name		VARCHAR2(40),
   Id		CHAR(9),
   CONSTRAINT 	mv_write_nameid_pk PRIMARY KEY (Name, Id)
);

CREATE TABLE MV_act
  (Name		VARCHAR2(40),
   Id		CHAR(9),
   CONSTRAINT 	mv_act_nameid_pk PRIMARY KEY (Name, Id)
);

CREATE TABLE MV_direct
  (Name		VARCHAR2(40),
   Id		CHAR(9),
   CONSTRAINT 	mv_direct_nameid_pk PRIMARY KEY (Name, Id)
);

CREATE TABLE Movie_awards
  (Id		CHAR(9),
   Mv_awards	VARCHAR2(50),
   CONSTRAINT	mv_awards_idawards_pk PRIMARY KEY (Id, Mv_awards)
);

CREATE TABLE Tv_show_awards
  (Id		CHAR(9),
   Tv_awards	VARCHAR2(50),
   CONSTRAINT	tv_awards_idawards_pk PRIMARY KEY (Id, Tv_awards)
);

CREATE TABLE Mv_genres
  (Id		CHAR(9),
   Mv_genre	VARCHAR2(20),
   CONSTRAINT	mv_genres_idgenres_pk PRIMARY KEY (Id, Mv_genre)
);

CREATE TABLE Production_company
  (Id		CHAR(9),
   Company	VARCHAR2(50),
   CONSTRAINT	production_idcompany_pk PRIMARY KEY (Id, Company)
);

CREATE TABLE TV_reviews
  (Id		CHAR(9),
   Username	VARCHAR2(25),
   Title	VARCHAR2(25),
   Review_date		DATE,
   Critics	NUMBER(3),
   Account_date	DATE,
   CONSTRAINT tv_reviews_iduser_pk PRIMARY KEY (Id, Username)
);

CREATE TABLE MV_reviews
  (Id		CHAR(9),
   Username	VARCHAR2(25),
   Title	VARCHAR2(25),
   Review_date		DATE,
   Critics	NUMBER(3),
   Metacritic	VARCHAR2(1),
   Account_date	DATE,
   CONSTRAINT mv_reviews_iduser_pk PRIMARY KEY (Id, Username)
);


ALTER TABLE TV_write
ADD CONSTRAINT tv_write_name_fk FOREIGN KEY (Name)
REFERENCES Writer (Name);

ALTER TABLE TV_write
ADD CONSTRAINT tv_write_id_fk FOREIGN KEY (Id)
REFERENCES Tv_show (Id);

ALTER TABLE TV_act
ADD CONSTRAINT tv_act_name_fk FOREIGN KEY (Name)
REFERENCES Actor (Name);

ALTER TABLE TV_act
ADD CONSTRAINT tv_act_id_fk FOREIGN KEY (Id)
REFERENCES Tv_show (Id);

ALTER TABLE TV_direct
ADD CONSTRAINT tv_direct_name_fk FOREIGN KEY (Name)
REFERENCES Director (Name);

ALTER TABLE TV_direct
ADD CONSTRAINT tv_direct_id_fk FOREIGN KEY (Id)
REFERENCES Tv_show (Id);

ALTER TABLE MV_write
ADD CONSTRAINT mv_write_name_fk FOREIGN KEY (Name)
REFERENCES Writer (Name);

ALTER TABLE MV_write
ADD CONSTRAINT mv_write_id_fk FOREIGN KEY (Id)
REFERENCES Movie (Id);

ALTER TABLE MV_act
ADD CONSTRAINT mv_act_name_fk FOREIGN KEY (Name)
REFERENCES Actor (Name);

ALTER TABLE MV_act
ADD CONSTRAINT mv_act_id_fk FOREIGN KEY (Id)
REFERENCES Movie (Id);

ALTER TABLE MV_direct
ADD CONSTRAINT mv_direct_name_fk FOREIGN KEY (Name)
REFERENCES Director (Name);

ALTER TABLE MV_direct
ADD CONSTRAINT mv_direct_id_fk FOREIGN KEY (Id)
REFERENCES Movie (Id);

ALTER TABLE Movie_awards
ADD CONSTRAINT mv_awards_id_fk FOREIGN KEY (Id)
REFERENCES Movie (Id);

ALTER TABLE TV_show_awards
ADD CONSTRAINT tv_awards_id_fk FOREIGN KEY (Id)
REFERENCES TV_show (Id);

ALTER TABLE Mv_genres
ADD CONSTRAINT mv_genres_id_fk FOREIGN KEY (Id)
REFERENCES Movie (Id);

ALTER TABLE Production_company
ADD CONSTRAINT company_id_fk FOREIGN KEY (Id)
REFERENCES Movie (Id);

ALTER TABLE TV_reviews
ADD CONSTRAINT tv_reviews_id_fk FOREIGN KEY (Id)
REFERENCES TV_show (Id);

ALTER TABLE MV_reviews
ADD CONSTRAINT mv_reviews_id_fk FOREIGN KEY (Id)
REFERENCES Movie (Id);

--INSERT MOVIES (Id, Title, Age_rating, Runtime, Year, storyline, Description, Metascore)
--Add movie: Guardians of the Galaxy 1

INSERT INTO Movie (Id, Title, Age_Rating, Runtime, Year, Storyline, Description, Metascore)
VALUES('tt2015381', 'Guardians of the Galaxy', 'PG-13', '2h 1m', 2014,'After stealing a mysterious orb in the far reaches of outer space, Peter Quill from Earth is now the main target of a manhunt led by the villain known as Ronan the Accuser. To help fight Ronan and his team and save the galaxy from his power, Quill creates a team of space heroes known as the "Guardians of the Galaxy" to save the galaxy.','A group of intergalactic criminals must pull together to stop a fanatical warrior with plans to purge the universe.',
76);

--Add movie: Guardians of the Galaxy 2

INSERT INTO Movie
VALUES('tt3896198', 'Guardians of the Galaxy Vol.2', 'PG-13', '2h 16m', 2017, 'After saving Xandar from Ronan''s wrath, the Guardians are now recognized as heroes. Now the team must help their leader, Star Lord, uncover the truth behind his true heritage. Along the way, old foes turn to allies and betrayal is blooming. And the Guardians find they are up against a devastating new menace who is out to rule the galaxy.', 'The Guardians struggle to keep together as a team while dealing with their personal family issues, notably Star-Lord''s encounter with his father, the ambitious celestial being Ego.', 67);

--Add movie: Guardians of the Galaxy 3

INSERT INTO Movie
VALUES('tt6791350', 'Guardians of the Galaxy Vol.3', 'PG-13', '2h 30m', 2023, 'In Marvel Studios "Guardians of the Galaxy Vol. 3" our beloved band of misfits are looking a bit different these days. Peter Quill, still reeling from the loss of Gamora, must rally his team around him to defend the universe along with protecting one of their own. A mission that, if not completed successfully, could quite possibly lead to the end of the Guardians as we know them.', 'Still reeling from the loss of Gamora, Peter Quill rallies his team to defend the universe and one of their own - a mission that could mean the end of the Guardians if not successful.', 64);

--Add movie: Avengers: Infinity War

INSERT INTO Movie
VALUES('tt4154756', 'Avengers: Infinity War', 'PG-13', '2h 29m', 2018, 'As the Avengers and their allies have continued to protect the world from threats too large for any one hero to handle, a new danger has emerged from the cosmic shadows: Thanos. A despot of intergalactic infamy, his goal is to collect all six Infinity Stones, artifacts of unimaginable power, and use them to inflict his twisted will on all of reality. Everything the Avengers have fought for has led up to this moment, the fate of Earth and existence has never been more uncertain.', 'The Avengers and their allies must be willing to sacrifice all in an attempt to defeat the powerful Thanos before his blitz of devastation and ruin puts an end to the universe.', 68);

--Add movie: Avengers: Endgame

INSERT INTO Movie
VALUES('tt4154796', 'Avengers: Endgame', 'PG-13', '3h 1m', '2019', 'fter the devastating events of Avengers: Infinity War (2018), the universe is in ruins due to the efforts of the Mad Titan, Thanos. With the help of remaining allies, the Avengers must assemble once more in order to undo Thanos's actions and undo the chaos to the universe, no matter what consequences may be in store, and no matter who they face...', 'After the devastating events of Avengers: Infinity War (2018), the universe is in ruins. With the help of remaining allies, the Avengers assemble once more in order to reverse Thanos' actions and restore balance to the universe.', 78);

-- INSERT MORE HERE!


--INSERT TV_Shows (Id, Title, Age_rating, Seasons, Year, Storyline)

INSERT INTO TV_show
VALUES('tt10168312', 'What If...?', 'TV-14', 3, 2021, 'Exploring pivotal moments from the Marvel Cinematic Universe and turning them on their head, leading the audience into uncharted territory.');


--Insert
INSERT INTO TV_show(Id, Title, Age_rating, Seasons, Year, Storyline)
VALUES('tt9140554', 'Loki','TV-14', 2, 2021, 'The mercurial villain Loki resumes his role as the God of Mischief in a new series that takes place after the events of “Avengers: Endgame.”')

INSERT INTO TV_show
VALUES('tt9140560','WandaVision','TV-PG',1, 2021, 'Blends the style of classic sitcoms with the MCU, in which Wanda Maximoff and Vision - two super-powered beings living their ideal suburban lives - begin to suspect that everything is not as it seems.')











-- INSERT ACTORS (Height, Birthday, Trademark, Nickname, Name)

-- 10 actors from Guardians of the Galaxy 1
INSERT INTO Actor (Height, Birthday, Trademark, Nickname, Name)
VALUES('1.88', '21-JUN-79', 'Affable, gregarious if somewhat goofy persona. Says dude a lot, on screen and off. Tall stature.', 'Chris', 'Chris Pratt');

INSERT INTO Actor 
VALUES('1.82', '18-JUL-67', 'Shaves his head. Muscular physique. Deep, gravelly, powerful voice. Big, lanky boots.', NULL, 'Vin Diesel');

INSERT INTO Actor
VALUES('1.85', '05-JAN-75', 'Piercing blue eyes. Often plays devious yet charming characters', 'Coop', 'Bradley Cooper');

INSERT INTO Actor
VALUES('1.70', '19-JUN-78', 'Often plays strong, dominant heroines', NULL, 'Zoe Saldana');

INSERT INTO Actor
VALUES('1.94', '18-JAN-69', 'Deep husky voice. His tattoos. Towering height and broad frame.', 'Kahn', 'Dave Bautista');

INSERT INTO Actor
VALUES('1.96', '25-MAR-79', 'Bushy eyebrows. Shy and nervous yet charming demeanor. Towering height and rich, smooth voice.', NULL, 'Lee Pace');

INSERT INTO Actor
VALUES('1.78', '06-APR-55', 'Raspy gravelly voice. Frequently plays law enforcement or military characters. Collaborations with James Gunn.', NULL, 'Micheal Rooker');

INSERT INTO Actor
VALUES('1.80', '28-NOV-87', 'Red hair. Energetic personality. Scottish accent. Towering height.', 'Kaz', 'Karen Gillan');

INSERT INTO Actor
VALUES('1.87', '24-APR-64', NULL, 'Djimon', 'Djimon Hounsou');

INSERT INTO Actor
VALUES('1.87', '24-MAY-65', 'Curly brown hair', NULL, 'John C. Reilly');

--7 from vol1 + 3 more actors from Guardians of the Galaxy 2

INSERT INTO Actor
VALUES('1.70', '03-MAY-86', NULL, 'Pominator', 'Pom Klementieff');

INSERT INTO Actor
VALUES('1.78', '06-JUL-46', 'Deep resonant voice and mumbling. Very muscular physique. Roles as John Rambo and Rocky Balboa. Crooked mouth.', 'Sly', 'Sylvester Stallone');

INSERT INTO Actor
VALUES('1.76', '17-MAR-51', 'Often has long hair or a mullet. Often performs many of his stunts himself. Often works with John Carpenter. Distinctive gravelly voice', NULL, 'Kurt Russell');

--6 from previous 2 + 4 more actors from Guadrians of the Galaxy 3

INSERT INTO Actor
VALUES('1.88', '01-DEC-67', NULL, NULL, 'Stephen Blackehart');

INSERT INTO Actor
VALUES('1.83', NULL, NULL, 'T Rose', 'Terence Rosemore');

INSERT INTO Actor
VALUES('1.83', '22-MAY-74', NULL, 'The Judge', 'Sean Gunn');

INSERT INTO Actor
VALUES('1.91', '28-JAN-93', NULL, NULL, 'Will Poulter');


--Inserting actors from Infinity war

--Actors from WandaVision/Loki
INSERT INTO Actor
VALUES('1.87', '09-FEB-81', 'Self-described blond curly "Gene Wilder" hair. His wide, warm smile. Expressive blue-green eyes. Deep smooth voice. Extremely polite, articulate and friendly personality', 'Hiddles', 'Tom Hiddleston');
INSERT INTO Actor
VALUES('1.70', NULL, NULL, NULL, 'Sophia Di Martino'); 
INSERT INTO Actor
VALUES('1.80', '18-NOV-68', 'Broken nose. His mop of blond hair. Soft mellow voice. Often works with Ben Stiller and his brother Luke Wilson. Often plays extremely mellow and friendly characters. Frequently cast by Wes Anderson. 
Says "wow" at least once in almost every movie.', 'O', 'Owen Wilson');
INSERT INTO Actor
VALUES('1.74', '31-JUL-86', NULL, NULL, 'Wunmi Mosaku');
INSERT INTO Actor
VALUES('1.63', '21-APR-83', 'Mole on right side of upper lip.', NULL, 'Gugu Mbatha-Raw');
INSERT INTO Actor
VALUES('1.71', NULL, NULL, NULL, 'Eugene Cordero'); 
INSERT INTO Actor
VALUES(NULL, NULL, NULL, NULL, 'Neil Ellice'); 
INSERT INTO Actor
VALUES('1.59', '12-FEB-73', 'She usually provides the voices for young male characters in cartoons. The voice of Bubbles on The Powerpuff Girls (1998). The voice of Timmy in The Fairly OddParents (2001). Voice of Raven in Teen Titans (2003) and Twilight Sparkle in My Little Pony: Friendship Is Magic (2010). Blonde hair and buxom figure', NULL, 'Tara Strong'); 
INSERT INTO Actor
VALUES('1.65', '20-AUG-71', NULL, 'Jonathan', 'Ke Huy Quan'); 
INSERT INTO Actor
VALUES('1.75', NULL, NULL, NULL, 'Lauren Revard'); 

INSERT INTO Actor
VALUES('1.68', '16-FEB-89', 'Clear green eyes', 'Lizzie', 'Elizabeth Olsen');
INSERT INTO Actor
VALUES('1.91', '27-MAY-71', 'Scene-stealing supporting characters. Towering height and slender frame.', NULL, 'Paul Bettany');
INSERT INTO Actor
VALUES('1.65', '23-JUL-73', 'Over-the-top facial expressions. Wide smile.', NULL, 'Kathryn Hahn');
INSERT INTO Actor
VALUES('1.65', '22-SEP-87', NULL, NULL, 'Teyonah Parris');
INSERT INTO Actor
VALUES('1.87', '04-JAN-70', NULL, 'Josh', 'Josh Stamberg');
INSERT INTO Actor
VALUES(NULL, NULL, NULL, NULL, 'David A Payton');
INSERT INTO Actor
VALUES('1.78', NULL, NULL, NULL, 'David Lengel');
INSERT INTO Actor
VALUES(NULL, NULL, NULL, NULL, 'Amos Glick');
INSERT INTO Actor
VALUES('1.55', NULL, NULL, NULL, 'Selena Anduze');
INSERT INTO Actor
VALUES('1.75', NULL, NULL, NULL, 'Randall Park');

--Infinity war
INSERT INTO Actor
VALUES('1.91', 11-AUG-83, 'Deep resonant voice. Muscular physique.', 'Kip, Chris', 'Chris Hemsworth');
INSERT INTO Actor
VALUES('1.31', 11-JUN-69, 'Short stature. Driven, intense portrayals. Deep baritone voice. Frequently portrays gifted speakers and morally ambiguous heros.', NULL, 'Peter Dinklage');

--Endgame
INSERT INTO Actor
VALUES('1.75', 6-APR-69, 'Low-key, sardonic sense of humor. Frequently co-stars with Steve Carell and Seth Rogen. Sarcastic wit. Often cast by Judd Apatow. Vivid green eyes.', 'Fred', 'Paul Rudd');
INSERT INTO Actor
VALUES('1.73', 22-NOV-67, 'Frequently plays likable everyman types', NULL, 'Mark Ruffalo');

--What if...?
INSERT INTO Actor
VALUES('1.83', 19-JUL-76, 'Deep bass-baritone voice', 'Ben', 'Benedict Cumberbatch');
INSERT INTO Actor
VALUES('1.60', 9-JUN-81, 'Often portrays characters taht are rather smart, mature and grown up for their age. Brown eyes. Lisp sweet voice. Petite figure. Mole on the side of her face.', 'Nat', 'Natalie Portman');


--INSERT DIRECTORS HERE! (Height, Birthday, Trademark, Nickname, Name)

--DIRECTORS



INSERT INTO Director
VALUES('1.83', '05-AUG-66', 'Heavy use of tongue-in-cheek dialogue. Unconventional characters. His spiky hair.', 'The Sneepers', 'James Gunn');

--loki directors
INSERT INTO Director
VALUES(NULL, '28-OCT-87', NULL, NULL, 'Kate Herron');
INSERT INTO Director
VALUES('1.88', '09-JUN-83', NULL, NULL, 'Justin Benson');
INSERT INTO Director
VALUES(NULL, '17-DEC-87', NULL, 'NULL', 'Aaron Moorhead');
INSERT INTO Director
VALUES(NULL, NULL, NULL, 'NULL', 'Dan DeLeeuw');
INSERT INTO Director
VALUES(NULL, NULL, NULL, 'NULL', 'Kasra Farahani');

--wandavision direct
INSERT INTO Director
VALUES(NULL, '08-AUG-75', NULL, NULL, 'Matt Shakman');

--What if...?
INSERT INTO Director
VALUES(NULL, NULL, NULL, NULL, 'Bryan Andrews');

--Infinity war
INSERT INTO Director
VALUES(NULL, 3-FEB-70, NULL, NULL, 'Anthony Russo');

INSERT INTO Director
VALUES(NULL, 8-JUL-71, NULL, NULL, 'Joe Russo');

--INSERT WRITERS HERE! (Height, Birthday, Trademark, Nickname, name)

--WRITERS


INSERT INTO Writer
VALUES(NULL, '31-JAN-81', NULL, NULL, 'Nicole Perlman');

INSERT INTO Writer
VALUES(NULL, '12-OCT-65', NULL, NULL, 'Dan Abnett');

INSERT INTO Writer
VALUES(NULL, NULL, NULL, NULL, 'Andy Lanning');

INSERT INTO Writer
VALUES('1.75', '09-OCT-49', NULL, NULL, 'Jim Starlin');

INSERT INTO Writer
VALUES('1.80', '28-DEC-22', 'His signature dark sunglasses. Cameos in the films based on his comics. Often referred to faithful fans as true believers.', 'The Man', 'Stan Lee');

--Infinity war
INSERT INTO Writer
VALUES('1.84', 2-JAN-70, NULL, NULL, 'Christopher Markus');

INSERT INTO Writer
VALUES('1.88', 24-FEB-70, NULL, NULL, 'Stephen McFeely');

INSERT INTO Writer
VALUES('1.57', 28-AUG-17, 'The realistic manner in which he depicted fight scenes. Bold inflation in lettering. Use of Splash paneles (Large panels, sometimes taking up entire pages, often depicting big events). Always started in the middle of a story, then created the beginning and end afterwards. His art was always known to have lots of impact, power and energy. Known for rigorious work ethic and incredible productivity.', 'The King', 'Jack Kirby');

--What If...?
INSERT INTO Writer
VALUES(NULL, NULL, NULL, NULL, 'A.C. Bradley');

INSERT INTO Writer
VALUES(NULL, NULL, NULL, NULL, 'Matthew Chauncey');

INSERT INTO Writer
VALUES(NULL, 22-APR-47, NULL, NULL, 'Steve Englehart');

INSERT INTO Writer
VALUES(NULL, NULL, NULL, NULL, 'Steve Gan');

INSERT INTO Writer
VALUES(NULL, 20-SEP-47, NULL, NULL, 'Steve Gerber');

--wandavision write
INSERT INTO Writer
VALUES('1.93', NULL, NULL, NULL, 'Peter Cameron');
INSERT INTO Writer
VALUES(NULL, NULL, NULL, NULL, 'Mackenzie Dohr');
INSERT INTO Writer
VALUES(NULL, NULL, NULL, NULL, 'Laura Donney');
INSERT INTO Writer
VALUES(NULL, NULL, NULL, NULL, 'Bobak Esfarjani');
INSERT INTO Writer
VALUES(NULL, NULL, NULL, NULL, 'Megan McDonnell');

--loki write
INSERT INTO Writer
VALUES(NULL, NULL, NULL, NULL, 'Eric Martin');
INSERT INTO Writer
VALUES('1.93', '23-APR-87', 'Wife works in pediatric plastic surgery.', NULL, 'Michael Waldron');
INSERT INTO Writer
VALUES(NULL,NULL,NULL, NULL, 'Bisha K. Ali');
INSERT INTO Writer
VALUES(NULL,NULL,NULL, NULL, 'Elissa Karasik');
INSERT INTO Writer
VALUES(NULL,NULL,NULL, NULL, 'Katharyn Blair');