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
  (Id		CHAR(10),
   Title	VARCHAR2(50),
   Age_Rating	VARCHAR2(5),
   Seasons	NUMBER(2),
   Year		NUMBER(4),
   Storyline	VARCHAR2(500),
   CONSTRAINT tv_show_id_pk PRIMARY KEY (Id)
);

CREATE TABLE Movie
  (Id		CHAR(10),
   Title	VARCHAR2(50),
   Age_Rating	VARCHAR2(10),
   Runtime	VARCHAR2(10),
   Year		NUMBER(4),
   Storyline	VARCHAR2(500),
   Description  VARCHAR2(500),
   Metascore	NUMBER(3),
   CONSTRAINT movie_id_pk PRIMARY KEY (Id)
);

CREATE TABLE TV_write
  (Name		VARCHAR2(40),
   Id		CHAR(10),
   CONSTRAINT 	tv_write_nameid_pk PRIMARY KEY (Name, Id)
);

CREATE TABLE TV_act
  (Name		VARCHAR2(40),
   Id		CHAR(10),
   CONSTRAINT 	tv_act_nameid_pk PRIMARY KEY (Name, Id)
);

CREATE TABLE TV_direct
  (Name		VARCHAR2(40),
   Id		CHAR(10),
   CONSTRAINT 	tv_direct_nameid_pk PRIMARY KEY (Name, Id)
);     

CREATE TABLE MV_write
  (Name		VARCHAR2(40),
   Id		CHAR(10),
   CONSTRAINT 	mv_write_nameid_pk PRIMARY KEY (Name, Id)
);

CREATE TABLE MV_act
  (Name		VARCHAR2(40),
   Id		CHAR(10),
   CONSTRAINT 	mv_act_nameid_pk PRIMARY KEY (Name, Id)
);

CREATE TABLE MV_direct
  (Name		VARCHAR2(40),
   Id		CHAR(10),
   CONSTRAINT 	mv_direct_nameid_pk PRIMARY KEY (Name, Id)
);

CREATE TABLE Movie_awards
  (Id		CHAR(10),
   Mv_awards	VARCHAR2(150),
   CONSTRAINT	mv_awards_idawards_pk PRIMARY KEY (Id, Mv_awards)
);

CREATE TABLE Tv_show_awards
  (Id		CHAR(10),
   Tv_awards	VARCHAR2(150),
   CONSTRAINT	tv_awards_idawards_pk PRIMARY KEY (Id, Tv_awards)
);

CREATE TABLE Mv_genres
  (Id		CHAR(10),
   Mv_genre	VARCHAR2(20),
   CONSTRAINT	mv_genres_idgenres_pk PRIMARY KEY (Id, Mv_genre)
);

CREATE TABLE Production_company
  (Id		CHAR(10),
   Company	VARCHAR2(50),
   CONSTRAINT	production_idcompany_pk PRIMARY KEY (Id, Company)
);

CREATE TABLE TV_reviews
  (Id		CHAR(10),
   Username	VARCHAR2(40),
   Title	VARCHAR2(100),
   Review_date		DATE,
   Critics	NUMBER(2),
   Account_date	DATE,
   CONSTRAINT tv_reviews_iduser_pk PRIMARY KEY (Id, Username)
);

CREATE TABLE MV_reviews
  (Id		CHAR(10),
   Username	VARCHAR2(40),
   Title	VARCHAR2(100),
   Review_date		DATE,
   Critics	NUMBER(2),
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

--Add movie: Avengers Infinity War

INSERT INTO Movie
VALUES('tt4154756', 'Avengers: Infinity War', 'PG-13', '2h 29m', 2018, 'As the Avengers and their allies have continued to protect the world from threats too large for any one hero to handle, a new danger has emerged from the cosmic shadows: Thanos. A despot of intergalactic infamy, his goal is to collect all six Infinity Stones, artifacts of unimaginable power, and use them to inflict his twisted will on all of reality. Everything the Avengers have fought for has led up to this moment, the fate of Earth and existence has never been more uncertain.', 'The Avengers and their allies must be willing to sacrifice all in an attempt to defeat the powerful Thanos before his blitz of devastation and ruin puts an end to the universe.', 68);

--Add movie: Avengers Endgame

INSERT INTO Movie
VALUES('tt4154796', 'Avengers: Endgame', 'PG-13', '3h 1m', 2019, 'After the devastating events of Avengers: Infinity War (2018), the universe is in ruins due to the efforts of the Mad Titan, Thanos. With the help of remaining allies, the Avengers must assemble once more in order to undo Thanos''s actions and undo the chaos to the universe, no matter what consequences may be in store, and no matter who they face...', 'After the devastating events of Avengers: Infinity War (2018), the universe is in ruins. With the help of remaining allies, the Avengers assemble once more in order to reverse Thanos'' actions and restore balance to the universe.', 78);



--INSERT TV_show (Id, Title, Age_rating, Seasons, Year, Storyline)

INSERT INTO TV_show
VALUES('tt10168312', 'What If...?', 'TV-14', 3, 2021, 'Exploring pivotal moments from the Marvel Cinematic Universe and turning them on their head, leading the audience into uncharted territory.');

INSERT INTO TV_show(Id, Title, Age_rating, Seasons, Year, Storyline)
VALUES('tt9140554', 'Loki','TV-14', 2, 2021, 'The mercurial villain Loki resumes his role as the God of Mischief in a new series that takes place after the events of “Avengers: Endgame.”')

INSERT INTO TV_show
VALUES('tt9140560','WandaVision','TV-PG',1, 2021, 'Blends the style of classic sitcoms with the MCU, in which Wanda Maximoff and Vision - two super-powered beings living their ideal suburban lives - begin to suspect that everything is not as it seems.')

INSERT INTO TV_show
VALUES('tt10234724', 'Moon Knight','TV-14', 1, 2022, 'Steven Grant discovers he''s been granted the powers of an Egyptian moon god. But he soon finds out that these newfound powers can be both a blessing and a curse to his troubled life.”')

INSERT INTO TV_show
VALUES('tt10160804','Hawkeye','TV-14',1, 2021, 'Series based on the Marvel Comics superhero Hawkeye, centering on the adventures of Young Avenger, Kate Bishop, who took on the role after the original Avenger, Clint Barton.')










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
VALUES('1.91', '11-AUG-83', 'Deep resonant voice. Muscular physique.', 'Kip, Chris', 'Chris Hemsworth');
INSERT INTO Actor
VALUES('1.31', '11-JUN-69', 'Short stature. Driven, intense portrayals. Deep baritone voice. Frequently portrays gifted speakers and morally ambiguous heros.', NULL, 'Peter Dinklage');

--Endgame
INSERT INTO Actor
VALUES('1.75', '6-APR-69', 'Low-key, sardonic sense of humor. Frequently co-stars with Steve Carell and Seth Rogen. Sarcastic wit. Often cast by Judd Apatow. Vivid green eyes.', 'Fred', 'Paul Rudd');
INSERT INTO Actor
VALUES('1.73', '22-NOV-67', 'Frequently plays likable everyman types', NULL, 'Mark Ruffalo');

--What if...?
INSERT INTO Actor
VALUES('1.83', '19-JUL-76', 'Deep bass-baritone voice', 'Ben', 'Benedict Cumberbatch');
INSERT INTO Actor
VALUES('1.60', '9-JUN-81', 'Often portrays characters taht are rather smart, mature and grown up for their age. Brown eyes. Lisp sweet voice. Petite figure. Mole on the side of her face.', 'Nat', 'Natalie Portman');

--10 Moon Knight Actors

INSERT INTO Actor
VALUES('1.74', '09-MAR-79', NULL, NULL, 'Oscar Isaac');
INSERT INTO Actor
VALUES('1.79', '06-NOV-70', 'In later roles, meek and mild-manner demeanor. In 1990s roles, a prototypical Gen X rebel/outsider. Often sports a goatee in his films. Frequently collaborating with Richard Linklater.', NULL, 'Ethan Hawke');
INSERT INTO Actor
VALUES('1.69', '28-OCT-86', 'Freckles. Curly Hair.', NULL, 'May Calamawy');
INSERT INTO Actor
VALUES('1.80', '24-OCT-39', 'Rich smooth voice. Often plays untrustworthy schemers. Often plays refined, sinister villains.', NULL, 'Frank Murray Abraham');
INSERT INTO Actor
VALUES('1.75', NULL, NULL, NULL, 'Michael Benjamin Hernandez');
INSERT INTO Actor
VALUES('1.57', NULL, NULL, NULL, 'Ann Akinjirin');
INSERT INTO Actor
VALUES(NULL, NULL, NULL, NULL, 'Karim El Hakim');
INSERT INTO Actor
VALUES(NULL, NULL, NULL, NULL, 'David Ganly');
INSERT INTO Actor
VALUES(NULL, NULL, NULL, NULL, 'Antonia Salib');
INSERT INTO Actor
VALUES('1.83', '30-DEC-80', NULL, NULL, 'Khalid Abdalla');

--Hawkeye 10 Actors
INSERT INTO Actor
VALUES('1.74', '07-JAN-71', 'Deeply intense understated performances. Intense emotional performances. Gruff yet soft voice. Frequently plays violent yet unstable characters.', 'Renni', 'Jeremy Renner');
INSERT INTO Actor
VALUES('1.74', '11-DEC-96', NULL, NULL, 'Hailee Steinfeld');
INSERT INTO Actor
VALUES('1.62', '03-JAN-96', 'Distinct frown in dramatic scenes.', 'Flossie Rose', 'Florence Pugh');
INSERT INTO Actor
VALUES('1.70', '06-AUG-73', 'Expressive, piercing blue eyes. Frequently plays the mother disturbed children.', NULL, 'Vera Farmiga');
INSERT INTO Actor
VALUES('1.80', '13-FEB-75', NULL, NULL, 'Tony Dalton');
INSERT INTO Actor
VALUES(NULL, '20-MAY-87', NULL, NULL, 'Fra Fee');
INSERT INTO Actor
VALUES('1.96', '29-JUN-69', NULL, NULL, 'Aleks Paunovic');
INSERT INTO Actor
VALUES('1.82', '21-MAR-72', NULL, NULL, 'Piotr Adamczyk');
INSERT INTO Actor
VALUES('1.73', '13-FEB-97', 'Down-to-earth and friendly personality.', NULL, 'Alaqua Cox');
INSERT INTO Actor
VALUES('1.14', '16-FEB-11', NULL, NULL, 'Cade Woodward');
  
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
VALUES(NULL, '17-DEC-87', NULL, NULL, 'Aaron Moorhead');
INSERT INTO Director
VALUES(NULL, NULL, NULL, NULL, 'Dan DeLeeuw');
INSERT INTO Director
VALUES(NULL, NULL, NULL, NULL, 'Kasra Farahani');

--wandavision direct
INSERT INTO Director
VALUES(NULL, '08-AUG-75', NULL, NULL, 'Matt Shakman');

--What if...?
INSERT INTO Director
VALUES(NULL, NULL, NULL, NULL, 'Bryan Andrews');

--Infinity war
INSERT INTO Director
VALUES(NULL, '3-FEB-70', NULL, NULL, 'Anthony Russo');

INSERT INTO Director
VALUES(NULL, '8-JUL-71', NULL, NULL, 'Joe Russo');

--Moon Knight Directors
INSERT INTO Director
VALUES(NULL, '07-DEC-78', NULL, NULL, 'Mohamed Diab');

--Hawkeye Directors
INSERT INTO Director
VALUES(NULL, NULL, NULL, 'Bert', 'Amber Templemore');
INSERT INTO Director
VALUES(NULL, NULL, NULL, 'Bertie', 'Bertie Ellwood');
INSERT INTO Director
VALUES(NULL, NULL, NULL, NULL, 'Rhys Thomas');

--INSERT WRITERS HERE! (Height, Birthday, Trademark, Nickname, name)

--WRITERS

INSERT INTO Writer
VALUES('1.83', '05-AUG-66', 'Heavy use of tongue-in-cheek dialogue. Unconventional characters. His spiky hair.', 'The Sneepers', 'James Gunn');

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
VALUES('1.84', '2-JAN-70', NULL, NULL, 'Christopher Markus');

INSERT INTO Writer
VALUES('1.88', '24-FEB-70', NULL, NULL, 'Stephen McFeely');

INSERT INTO Writer
VALUES('1.57', '28-AUG-17', 'The realistic manner in which he depicted fight scenes. Bold inflation in lettering. Use of Splash paneles (Large panels, sometimes taking up entire pages, often depicting big events). Always started in the middle of a story, then created the beginning and end afterwards. His art was always known to have lots of impact, power and energy. Known for rigorious work ethic and incredible productivity.', 'The King', 'Jack Kirby');

--What If...?
INSERT INTO Writer
VALUES(NULL, NULL, NULL, NULL, 'A.C. Bradley');

INSERT INTO Writer
VALUES(NULL, NULL, NULL, NULL, 'Matthew Chauncey');

INSERT INTO Writer
VALUES(NULL, '22-APR-47', NULL, NULL, 'Steve Englehart');

INSERT INTO Writer
VALUES(NULL, NULL, NULL, NULL, 'Steve Gan');

INSERT INTO Writer
VALUES(NULL, '20-SEP-47', NULL, NULL, 'Steve Gerber');

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

--Moon Knight Writers
INSERT INTO Writer
VALUES(NULL, NULL, NULL, NULL, 'Danielle Iman');
INSERT INTO Writer
VALUES(NULL, NULL, NULL, NULL, 'Alex Meenehan');
INSERT INTO Writer
VALUES(NULL, '23-FEB-48', NULL, NULL, 'Doug Moench');


--Hawkeye Writers
INSERT INTO Writer
VALUES(NULL, NULL, NULL, NULL, 'Erin Cancino');
INSERT INTO Writer
VALUES(NULL, NULL, NULL, NULL, 'Jenna Noel Frazier');



--Making Relations

--Infinity War

INSERT INTO MV_act
VALUES('Vin Diesel','tt4154756');
INSERT INTO MV_act
VALUES('Chris Pratt','tt4154756');
INSERT INTO MV_act
VALUES('Bradley Cooper','tt4154756');
INSERT INTO MV_act
VALUES('Zoe Saldana','tt4154756');
INSERT INTO MV_act
VALUES('Dave Bautista','tt4154756');
INSERT INTO MV_act
VALUES('Pom Klementieff','tt4154756');
INSERT INTO MV_act
VALUES('Sean Gunn','tt4154756');
INSERT INTO MV_act
VALUES('Chris Hemsworth','tt4154756');
INSERT INTO MV_act
VALUES('Peter Dinklage','tt4154756');
INSERT INTO MV_act
VALUES('Tom Hiddleston','tt4154756');

INSERT INTO MV_direct
VALUES('Anthony Russo','tt4154756');
INSERT INTO MV_direct
VALUES('Joe Russo','tt4154756');

INSERT INTO MV_write
VALUES('Christopher Markus','tt4154756');
INSERT INTO MV_write
VALUES('Stephen McFeely','tt4154756');
INSERT INTO MV_write
VALUES('Jack Kirby','tt4154756');

INSERT INTO Movie_awards
VALUES('tt4154756','2019 Best Visual Effects');
INSERT INTO Movie_awards
VALUES('tt4154756','2019 Best Action Movie');
INSERT INTO Movie_awards
VALUES('tt4154756','2019 Favorite Movie');

INSERT INTO Mv_genres
VALUES('tt4154756','Action');
INSERT INTO Mv_genres
VALUES('tt4154756','Adventure');
INSERT INTO Mv_genres
VALUES('tt4154756','Sci-Fi');

INSERT INTO Production_company
VALUES('tt4154756','Marvel Studios');
INSERT INTO Production_company
VALUES('tt4154756','Jason Roberts Productions');
INSERT INTO Production_company
VALUES('tt4154756','South Pictures');
INSERT INTO Production_company
VALUES('tt4154756','Walt Disney Pictures');

--Endgame
INSERT INTO MV_act
VALUES('Vin Diesel','tt4154796');
INSERT INTO MV_act
VALUES('Chris Pratt','tt4154796');
INSERT INTO MV_act
VALUES('Bradley Cooper','tt4154796');
INSERT INTO MV_act
VALUES('Zoe Saldana','tt4154796');
INSERT INTO MV_act
VALUES('Dave Bautista','tt4154796');
INSERT INTO MV_act
VALUES('Pom Klementieff','tt4154796');
INSERT INTO MV_act
VALUES('Sean Gunn','tt4154796');
INSERT INTO MV_act
VALUES('Chris Hemsworth','tt4154796');
INSERT INTO MV_act
VALUES('Paul Rudd','tt4154796');
INSERT INTO MV_act
VALUES('Mark Ruffalo','tt4154796');

INSERT INTO MV_direct
VALUES('Anthony Russo','tt4154796');
INSERT INTO MV_direct
VALUES('Joe Russo','tt4154796');

INSERT INTO MV_write
VALUES('Christopher Markus','tt4154796');
INSERT INTO MV_write
VALUES('Stephen McFeely','tt4154796');
INSERT INTO MV_write
VALUES('Jack Kirby','tt4154796');

INSERT INTO Movie_awards
VALUES('tt4154796','2019 Bogey Award in Gold');
INSERT INTO Movie_awards
VALUES('tt4154796','2020 Best Action Movie');
INSERT INTO Movie_awards
VALUES('tt4154796','2020 Best Visual Effects');

INSERT INTO Mv_genres
VALUES('tt4154796','Action');
INSERT INTO Mv_genres
VALUES('tt4154796','Adventure');
INSERT INTO Mv_genres
VALUES('tt4154796','Drama');

INSERT INTO Production_company
VALUES('tt4154796','Marvel Studios');
INSERT INTO Production_company
VALUES('tt4154796','Walt Disney Pictures');

--What If...?


INSERT INTO TV_act
VALUES('Paul Rudd','tt10168312');
INSERT INTO TV_act
VALUES('Sean Gunn','tt10168312');
INSERT INTO TV_act
VALUES('Tom Hiddleston','tt10168312');
INSERT INTO TV_act
VALUES('Mark Ruffalo','tt10168312');
INSERT INTO TV_act
VALUES('Benedict Cumberbatch','tt10168312');
INSERT INTO TV_act
VALUES('Paul Bettany','tt10168312');
INSERT INTO TV_act
VALUES('Natalie Portman','tt10168312');

INSERT INTO TV_direct
VALUES('Bryan Andrews','tt10168312');

INSERT INTO TV_direct
VALUES('Justin Benson', 'tt10168312');
INSERT INTO TV_direct
VALUES('Aaron Moorhead', 'tt10168312');

INSERT INTO TV_write
VALUES('A.C. Bradley','tt10168312');
INSERT INTO TV_write
VALUES('Matthew Chauncey','tt10168312');
INSERT INTO TV_write
VALUES('Steve Englehart','tt10168312');
INSERT INTO TV_write
VALUES('Steve Gan','tt10168312');
INSERT INTO TV_write
VALUES('Steve Gerber','tt10168312');

INSERT INTO Tv_show_awards
VALUES('tt10168312','2022 Best Animated Series');
INSERT INTO Tv_show_awards
VALUES('tt10168312','2022 Next Big Thing');
INSERT INTO Tv_show_awards
VALUES('tt10168312','2022 Best Animated Show');

--INSERT INTO Tv_show_awards
--VALUES('tt10234724','2022 Best Streaming Limited Event Series');

--INSERT INTO Tv_show_awards
--VALUES('tt10160804','2022 Best Streaming Limited Event Series');


--GOTG vol. 1

INSERT INTO MV_act
VALUES('Chris Pratt','tt2015381');
INSERT INTO MV_act
VALUES('Bradley Cooper','tt2015381');
INSERT INTO MV_act
VALUES('Vin Diesel','tt2015381');
INSERT INTO MV_act
VALUES('Zoe Saldana','tt2015381');
INSERT INTO MV_act
VALUES('Dave Bautista','tt2015381');
INSERT INTO MV_act
VALUES('Lee Pace','tt2015381');
INSERT INTO MV_act
VALUES('Micheal Rooker','tt2015381');
INSERT INTO MV_act
VALUES('Karen Gillan','tt2015381');
INSERT INTO MV_act
VALUES('Djimon Hounsou','tt2015381');
INSERT INTO MV_act
VALUES('John C. Reilly','tt2015381');

INSERT INTO MV_direct
VALUES('James Gunn','tt2015381');

INSERT INTO MV_write
VALUES('Nicole Perlman','tt2015381');
INSERT INTO MV_write
VALUES('James Gunn','tt2015381');
INSERT INTO MV_write
VALUES('Dan Abnett','tt2015381');
INSERT INTO MV_write
VALUES('Jim Starlin','tt2015381');
INSERT INTO MV_write
VALUES('Andy Lanning','tt2015381');
INSERT INTO MV_write
VALUES('Steve Englehart','tt2015381');
INSERT INTO MV_write
VALUES('Steve Gan','tt2015381');
INSERT INTO MV_write
VALUES('Steve Gerber','tt2015381');


--GOTG vol. 2

INSERT INTO MV_act
VALUES('Chris Pratt','tt3896198');
INSERT INTO MV_act
VALUES('Vin Diesel','tt3896198');
INSERT INTO MV_act
VALUES('Micheal Rooker','tt3896198');
INSERT INTO MV_act
VALUES('Dave Bautista','tt3896198');
INSERT INTO MV_act
VALUES('Zoe Saldana','tt3896198');
INSERT INTO MV_act
VALUES('Karen Gillan','tt3896198');
INSERT INTO MV_act
VALUES('Bradley Cooper','tt3896198');
INSERT INTO MV_act
VALUES('Pom Klementieff','tt3896198');
INSERT INTO MV_act
VALUES('Sylvester Stallone','tt3896198');
INSERT INTO MV_act
VALUES('Kurt Russell','tt3896198');

INSERT INTO MV_direct
VALUES('James Gunn','tt3896198');

INSERT INTO MV_write
VALUES('James Gunn','tt3896198');
INSERT INTO MV_write
VALUES('Dan Abnett','tt3896198');
INSERT INTO MV_write
VALUES('Jim Starlin','tt3896198');
INSERT INTO MV_write
VALUES('Andy Lanning','tt3896198');
INSERT INTO MV_write
VALUES('Jack Kirby','tt3896198');
INSERT INTO MV_write
VALUES('Steve Englehart','tt3896198');
INSERT INTO MV_write
VALUES('Steve Gan','tt3896198');
INSERT INTO MV_write
VALUES('Steve Gerber','tt3896198');
INSERT INTO MV_write
VALUES('Stan Lee','tt3896198');


--GOTG vol. 3

INSERT INTO MV_act
VALUES('Chris Pratt','tt6791350');
INSERT INTO MV_act
VALUES('Vin Diesel','tt6791350');
INSERT INTO MV_act
VALUES('Karen Gillan','tt6791350');
INSERT INTO MV_act
VALUES('Dave Bautista','tt6791350');
INSERT INTO MV_act
VALUES('Bradley Cooper','tt6791350');
INSERT INTO MV_act
VALUES('Zoe Saldana','tt6791350');
INSERT INTO MV_act
VALUES('Stephen Blackehart','tt6791350');
INSERT INTO MV_act
VALUES('Terence Rosemore','tt6791350');
INSERT INTO MV_act
VALUES('Sean Gunn','tt6791350');
INSERT INTO MV_act
VALUES('Will Poulter','tt6791350');

INSERT INTO MV_direct
VALUES('James Gunn','tt6791350');

INSERT INTO MV_write
VALUES('James Gunn','tt6791350');
INSERT INTO MV_write
VALUES('Jim Starlin','tt6791350');
INSERT INTO MV_write
VALUES('Jack Kirby','tt6791350');
INSERT INTO MV_write
VALUES('Steve Englehart','tt6791350');
INSERT INTO MV_write
VALUES('Steve Gan','tt6791350');
INSERT INTO MV_write
VALUES('Steve Gerber','tt6791350');
INSERT INTO MV_write
VALUES('Stan Lee','tt6791350');

--Awards for GOTG 1

INSERT INTO Movie_awards
VALUES ('tt2015381', '2015 Best Hair and Make up, Critics Choice Award');
INSERT INTO Movie_awards
VALUES ('tt2015381', '2015 Best Action Movie, Critics Choice Award');
INSERT INTO Movie_awards
VALUES ('tt2015381', '2014 Make-Up of the Year, Hollywood Film Award');
INSERT INTO Movie_awards
VALUES ('tt2015381', '2014 Hollywood Blockbuster Award');
INSERT INTO Movie_awards
VALUES ('tt2015381', '2015 Best Contemporary Makeup Award');

--Awards for GOTG 2

INSERT INTO Movie_awards
VALUES ('tt3896198', '2018 Best Special Effects, Saturn Award');
INSERT INTO Movie_awards
VALUES ('tt3896198', '2017 Sound of the Year, Hollywood Film Award');
INSERT INTO Movie_awards
VALUES ('tt3896198', '2018 Best Contemporary Hair Styling, Artisan Award');
INSERT INTO Movie_awards
VALUES ('tt3896198', '2017 Choice Movie Actor, Teen Choice Award');
INSERT INTO Movie_awards
VALUES ('tt3896198', '2017 Choice Movie, Teen Choice Award');

--Awards for GOTG 3

INSERT INTO Movie_awards
VALUES ('tt6791350', '2023 Most Popular US Film, Golden Angel Award');


--Genres for GOTG 1

INSERT INTO Mv_Genres
VALUES('tt2015381', 'Action');
INSERT INTO Mv_Genres
VALUES('tt2015381', 'Adventure');
INSERT INTO Mv_Genres
VALUES('tt2015381', 'Comedy');
INSERT INTO Mv_Genres
VALUES('tt2015381', 'Sci-Fi');

--Genres for GOTG 2

INSERT INTO Mv_Genres
VALUES('tt3896198', 'Action');
INSERT INTO Mv_Genres
VALUES('tt3896198', 'Adventure');
INSERT INTO Mv_Genres
VALUES('tt3896198', 'Comedy');
INSERT INTO Mv_Genres
VALUES('tt3896198', 'Sci-Fi');

--Genres for GOTG 3

INSERT INTO Mv_Genres
VALUES('tt6791350', 'Action');
INSERT INTO Mv_Genres
VALUES('tt6791350', 'Adventure');
INSERT INTO Mv_Genres
VALUES('tt6791350', 'Comedy');
INSERT INTO Mv_Genres
VALUES('tt6791350', 'Sci-Fi');

--Production Company for GOTG1

INSERT INTO Production_company
VALUES('tt2015381', 'Marvel Studios');
INSERT INTO Production_company
VALUES('tt2015381', 'Walt Disney Pictures');
INSERT INTO Production_company
VALUES('tt2015381', 'Moving Pictures Company');

--Production Company for GOTG2

INSERT INTO Production_company
VALUES('tt3896198', 'Marvel Studios');
INSERT INTO Production_company
VALUES('tt3896198', 'Walt Disney Pictures');

--Production Company for GOTG3

INSERT INTO Production_company
VALUES('tt6791350', 'Marvel Studios');
INSERT INTO Production_company
VALUES('tt6791350', 'Film New Zealand');
INSERT INTO Production_company
VALUES('tt6791350', 'Marvel Entertainment');



--Reviews for GOTG1

INSERT INTO MV_reviews
VALUES('tt2015381', 'auuwws', 'Guardians of Galaxy', '02-NOV-20', '8', '01-MAY-20');
INSERT INTO MV_reviews
VALUES('tt2015381', 'waqassaleem-85201', 'One of the best mcu films', '08-SEP-20', '8', '01-SEP-19');
INSERT INTO MV_reviews
VALUES('tt2015381', 'denise-882-139023', 'Perfect Film Entertainment', '02-JAN-21', '10', '01-DEC-13');

--Reviews for GOTG2

INSERT INTO MV_reviews
VALUES('tt3896198', 'SebMoz', 'Yes. Just yes', '30-NOV-20', '8', '01-MAY-20');
INSERT INTO MV_reviews
VALUES('tt3896198', 'snoozejonc', 'Do me! Do me! Do me!', '14-SEP-21', '8', '01-JUL-20');
INSERT INTO MV_reviews
VALUES('tt3896198', 'aidanratesmovies', 'Fantastic', '24-JUN-21', '10', '01-NOV-13');

--Reviews for GOTG3

INSERT INTO MV_reviews
VALUES('tt6791350', 'AfricanBro', 'I am groot', '03-MAY-23', '8', '01-JUN-20');
INSERT INTO MV_reviews
VALUES('tt6791350', 'georgewhittingham1', 'A perfect send off for the Guardians', '03-MAY-23', '9', '01-JAN-20');
INSERT INTO MV_reviews
VALUES('tt6791350', 'coasteraddict-16796', 'I Cried Four Times', '10-MAY-23', '10', '01-AUG-21');

--Reviews for Endgame

INSERT INTO MV_reviews
VALUES('tt4154796', 'ACollegeStudent', 'Not as good as infiity war but a great movie', '13-Dec-21', '8', '01-May-20');
INSERT INTO MV_reviews
VALUES('tt4154796', 'nickgray-12862', 'Emotional but bit messy.', '27-APR-19', '7', '01-Dec-16');
INSERT INTO MV_reviews
VALUES('tt4154796', 'ahmetkozan', 'The End of an Era!', '25-APR-19', '10', '01-DEC-13');

--Reviews for Infinity War

INSERT INTO MV_reviews
VALUES('tt4154756', 'grztxks', 'Better than Endgame', '14-MAR-21', '10', '01-JAN-21');
INSERT INTO MV_reviews
VALUES('tt4154756', 'andreascaloni', 'EMOTIONAL ROLLER COASTER', '16-FEB-21', '9', '01-FEB-21');
INSERT INTO MV_reviews
VALUES('tt4154756', 'Puroo', 'How MCU should have always been like', '21-APR-21', '10', '01-JUN-20');

--Reviews for What If...?

INSERT INTO TV_reviews
VALUES('tt10168312', 'deepfrieddodo', 'Frustratingly Inconsistent', '17-SEP-21', '6', '01-AUG-20');
INSERT INTO TV_reviews
VALUES('tt10168312', 'UniqueParticle', 'Hits the spot after watching a lot of dark shows', '28-AUG-22', '9', '01-JUL-12');
INSERT INTO TV_reviews
VALUES('tt10168312', 'Swooping_Owl', 'Love it...Want More', '01-SEP-21', '10', '01-MAR-01');



