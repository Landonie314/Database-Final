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
--Add movie: Quardians of the Galaxy 1

INSERT INTO Movie (Id, Title, Age_Rating, Runtime, Year, Storyline, Description, Metascore)
VALUES('tt2015381', 'Guardians of the Galaxy', 'PG-13', '2h 1m', 2014,'After stealing a mysterious orb in the far reaches of outer space, Peter Quill from Earth is now the main target of a manhunt led by the villain known as Ronan the Accuser. To help fight Ronan and his team and save the galaxy from his power, Quill creates a team of space heroes known as the "Guardians of the Galaxy" to save the galaxy.','A group of intergalactic criminals must pull together to stop a fanatical warrior with plans to purge the universe.',
76);

--Add movie: Quardians of the Galaxy 2

INSERT INTO Movie
VALUES('tt3896198', 'Guardians of the Galaxy Vol.2', 'PG-13', '2h 16m', 2017, 'After saving Xandar from Ronan''s wrath, the Guardians are now recognized as heroes. Now the team must help their leader, Star Lord, uncover the truth behind his true heritage. Along the way, old foes turn to allies and betrayal is blooming. And the Guardians find they are up against a devastating new menace who is out to rule the galaxy.', 'The Guardians struggle to keep together as a team while dealing with their personal family issues, notably Star-Lord''s encounter with his father, the ambitious celestial being Ego.', 67);

--Add movie: Quardians of the Galaxy 3

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



--Insert











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




--INSERT DIRECTORS HERE! (Height, Birthday, Trademark, Nickname, Name)

--DIRECTORS

INSERT INTO Director
VALUES('1.83', '05-AUG-66', 'Heavy use of tongue-in-cheek dialogue. Unconventional characters. His spiky hair.', 'The Sneepers', 'James Gunn');






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
































    