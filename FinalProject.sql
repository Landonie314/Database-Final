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


--Add info: Quardians of the Galaxy 1

INSERT INTO Movie (Id, Title, Age_Rating, Runtime, Year, Storyline, Description, Metascore)
VALUES('tt2015381', 'Guardians of the Galaxy', 'PG-13', '2h 1m', 2014,'After stealing a mysterious orb in the far reaches of outer space, Peter Quill from Earth is now the main target of a manhunt led by the villain known as Ronan the Accuser. To help fight Ronan and his team and save the galaxy from his power, Quill creates a team of space heroes known as the "Guardians of the Galaxy" to save the galaxy.','A group of intergalactic criminals must pull together to stop a fanatical warrior with plans to purge the universe.',
76);
    