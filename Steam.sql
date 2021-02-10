USE Steam;

DROP TABLE IF EXISTS GAMES;
DROP TABLE IF EXISTS PLAYERS;
DROP TABLE IF EXISTS DEVELOPERS;
DROP TABLE IF EXISTS POSTS;
DROP TABLE IF EXISTS REVIEWS;
DROP TABLE IF EXISTS REVIEWED;
DROP TABLE IF EXISTS WROTE;
DROP TABLE IF EXISTS GROUPS_;
DROP TABLE IF EXISTS FRIENDS;
DROP TABLE IF EXISTS GAME_LIBRARY;
DROP TABLE IF EXISTS DEVELOPER_GAMES;
DROP TABLE IF EXISTS DEVELOPED;
DROP TABLE IF EXISTS IS_PART_OF;
DROP TABLE IF EXISTS ASSOCIATED_GAMES;
DROP TABLE IF EXISTS REVIEWED_GAMES;
DROP TABLE IF EXISTS GROUP_POSTS;
DROP TABLE IF EXISTS GAME_ACHIEVEMENTS;

/*****************Entidades***********************/

CREATE TABLE
GAMES(
	Id int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
	Name varchar(255) NOT NULL,
	Price decimal(5,2) NOT NULL,
	DeveloperName varchar(255) NOT NULL,
	ReleaseDate DATE NOT NULL,
	MinimumPlayerAge int(3)NULL
);

CREATE TABLE
PLAYERS(
	Id int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
	NickName varchar(255) NOT NULL,
	SignUpDate date NOT NULL,
	Wallet decimal(5,2) NOT NULL,
	Country varchar(255) NOT NULL
);

CREATE TABLE
DEVELOPERS(
	Name varchar(255) PRIMARY KEY NOT NULL,
	Country varchar(255) NOT NULL
);

CREATE TABLE
POSTS(
	Id int(20) PRIMARY KEY NOT NULL AUTO_INCREMENT,
	PostDate datetime NOT NULL,
	PostText varchar(1000) NOT NULL,
	GroupId int(11) NOT NULL,
	UserId int(11) NOT NULL
);

CREATE TABLE
REVIEWS(
	Id int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    UserId int(11) NOT NULL,
	GameName varchar(255) NOT NULL,
	ReviewDate datetime NOT NULL,
	ReviewText varchar(255) DEFAULT NULL,
	Score decimal(3,1) NOT NULL,
	CONSTRAINT Score_Inv CHECK (Score BETWEEN 1 AND 5)
);

CREATE TABLE
GROUPS_(
	Id int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
	Name varchar(254) NOT NULL
);

/**********************************************/

CREATE TABLE
GAME_ACHIEVEMENTS(
	GameId int(11) NOT NULL,
	Achievement varchar(255) NOT NULL,
	PRIMARY KEY( GameId,Achievement)
);

/******************RELAÇÕES*******************/
CREATE TABLE
FRIENDS(
	PlayerId1 int(11) NOT NULL,
	PlayerId2 int(11) NOT NULL,
	PRIMARY KEY(PlayerId1,PlayerId2)
);

CREATE TABLE
GAME_LIBRARY(
	PlayerId int(11) NOT NULL,
	GameId int(11) NOT NULL,
	PRIMARY KEY(PlayerId,GameId)
);

CREATE TABLE
DEVELOPED(
	DeveloperName varchar(255) NOT NULL,
	GameId int(11) NOT NULL,
	PRIMARY KEY(DeveloperName,GameId)
);

CREATE TABLE
IS_PART_OF(
	GroupId int(11) NOT NULL,
	PlayerId int(11) NOT NULL,
	PRIMARY KEY(GroupId,PlayerId)
);

CREATE TABLE
ASSOCIATED_GAMES(
	GroupId int(11) NOT NULL,
	GameId int(11) NOT NULL,
	PRIMARY KEY(GroupId,GameId)
);

CREATE TABLE
REVIEWED_GAMES(
	ReviewId int(11) NOT NULL,
	GameId int(11) NOT NULL,
	PRIMARY KEY(ReviewId,GameId)
);

CREATE TABLE
GROUP_POSTS(
	GroupId int(11) NOT NULL,
	PostId int(11) NOT NULL,
	PRIMARY KEY(GroupId,PostId)
);

CREATE TABLE
REVIEWED(
	ReviewId int(11) NOT NULL,
	PlayerId int(11) NOT NULL,
	PRIMARY KEY(ReviewId,PlayerId)
);

CREATE TABLE
WROTE(
	PostId int(11) NOT NULL,
	PlayerId int(11) NOT NULL,
	PRIMARY KEY(PostId,PlayerId)
);

/******************************************************************/


/************************INSERT VALUES****************************/
--                       Entidades                                
INSERT INTO
GAMES(Name,Price,DeveloperName,ReleaseDate,MinimumPlayerAge)
VALUES
/*1*/	('Witcher 3',8.99,'CD PROJEKT RED','2015-05-19',18),
/*2*/	('Counter-Strike 1.6',8.99,'Valve Corporation','2000-11-08',18),
/*3*/	('Counter-Strike Global Offensive',0.00,'VALVE Corporation','2012-08-21',18),
/*4*/	('DOTA 2',0.00,'Valve Corporation','2013-07-09',NULL),
/*5*/	('GTA V',8.99,'ROCKSTAR GAMES','2013-09-17',16),
/*6*/	('The Last of Us',19.99,'Naughty Dog','2013-06-14',NULL),
/*7*/	('ARK: Survival Evolved',54.99,'Studio Wildcard','2017-08-27',NULL),
/*8*/	('Garry\'s Mod',9.99,'Valve Corporation','2006-11-29',NULL),
/*9*/	('The Elder Scrols V: Skyrim',4.99,'Bethesda Game Studio','2011-11-11',NULL),
/*10*/  ('Tomb Raider(2013)',4.99,'Crystal Dynamics','2013-03-05',14),
/*11*/  ('Left 4 Dead',8.19,'Valve Corporation','2008-11-17',16),
/*12*/  ('Divinity: Original Sin 2',44.99,'Larian Studios','2017-09-14',NULL),
/*13*/  ('Team Fortress 2',0.00,'Valve Corporation','2007-09-10',NULL),
/*14*/  ('Rocket League',19.99,'Psyonix LLC','2015-07-07',NULL),
/*15*/  ('Borderlands 2',7.49,'Gearbox Software','2012-09-20',NULL),
/*16*/  ('FINAL FANTASY XIV Online',9.99,'Square Enix','2014-02-18',NULL),
/*17*/  ('METAL GEAR SOLID V: THE PHANTOM PAIN',8.99,'Konami Digital Entertainment','2006-09-01',NULL),
/*18*/  ('Middle-earth™: Shadow of Mordor™',39.99,'Monolith Productions','2017-10-10',NULL),
/*19*/  ('DARK SOULS™ III',14.99,'FromSoftware','2016-04-11',NULL),
/*20*/  ('Saints Row: The Third',9.99,'Volition','2011-11-14',NULL),
/*21*/  ('Starbound',13.99,'Chucklefish','2016-07-22',NULL),
/*22*/  ('The Elder Scrolls Online',19.99,'Zenimax Online Studios','2014-04-04',NULL),
/*23*/  ('Portal 2',8.19,'Valve Corporation','2011-04-19',NULL),
/*24*/  ('Sid Meier\'s Civilization V',39.99,'Firaxis Games','2019-02-14',NULL),
/*25*/  ('Total War: SHOGUN 2',7.49,'CREATIVE ASSEMBLY','2011-03-15',NULL),
/*26*/  ('Hades',20.99,'Supergiant Games','2019-12-10',16),
/*27*/  ('Far Cry® 3',19.99,'Ubisoft Montreal','2012-11-29',18),
/*28*/  ('PLAYERUNKNOWN\'S BATTLEGROUNDS',19.99,'Ubisoft Montreal','2017-12-21',16);

INSERT INTO
PLAYERS(Nickname,SignUpDate,Wallet,Country)
VALUES
/*1*/	('Roger Kings','2003-04-22',25.39,'Portugal'),
/*2*/	('Roberto_A(l)berto','2003-06-09',99.99,'Portugal'),
/*3*/	('Felix Berta','2003-06-10',99.98,'França'),
/*4*/	('Vladimir','2003-09-11',99.97,'Russia'),
/*5*/	('Marxum','2011-10-08',20.00,'Portugal'),
/*6*/	('Netcan','2012-04-21',23.00,'Portugal'),
/*7*/	('SNH','2012-08-28',2.63,'Portugal'),
/*8*/	('Dudas','2015-03-05',20.00,'Portugal'),
/*9*/	('Petroski','2016-03-06',0.00,'Polónia'),
/*10*/	('Bolsonas','2019-01-01',9.99,'Brasil');

INSERT INTO
DEVELOPERS(Name,Country)
VALUES
/*1*/ ('Valve Corporation','Estados Unidos'),
/*2*/ ('CD PROJECKT RED','Polónia'),
/*3*/ ('ROCKSTAR GAMES','Estados Unidos'),
/*4*/ ('Naughty Dog','Estados Unidos'),
/*5*/ ('Studio Wildcard','Estados Unidos'),
/*6*/ ('Bethesda Game Studio','Estados Unidos'),
/*7*/ ('Crystal Dynamics','Estados Unidos'),
/*8*/ ('Larian Studios','Bélgica'),
/*9*/ ('Gearbox Software','Estados Unidos'),
/*10*/('Facepunch Studios','Reino Unido'),
/*11*/('Konami Digital Entertainment','Japão'),
/*12*/('Monolith Productions','Estados Unidos'),
/*13*/('FromSoftware','Japão'),
/*14*/('Volition','Estados Unidos'),
/*15*/('Zenimax Online Studios','Estados Unidos'),
/*15*/('Firaxis Games','Estados Unidos'),
/*16*/('CREATIVE ASSEMBLY','Reino Unido'),
/*17*/('Supergiant Games','Estados Unidos'),
/*18*/('Ubisoft Montreal','França'),
/*19*/('Square Enix','Japão'),
/*20*/('Psyonix LLC','Estados Unidos'),
/*21*/('Chucklefish','Reino Unido');

INSERT INTO
POSTS(PostDate,PostText,GroupId,UserId)
VALUES
	('2020-04-27 10:54:23','Anyone got the link for Zulmira\'s new stream?',1,6),
	('2020-01-09 22:10:23','Bros tirei uma foto com o Grande que sorteeeeeee XDDD',6,6),
	('2016-02-26 06:30:52','Pessoal acabei de criar o Tetris em mysql 0.0',5,7),
	('2016-05-11 05:14:12','Sobe Xõooes!!!',4,8),
 	('2020-05-11 22:54:13','Sobe Xõooes!!!',4,8),
	('2015-04-23 22:39:12','I just managed to play Witcher 3 in Windows 95',2,7),
	('2017-11-23 15:43:13','Anyone wants to trade for Zulmira\'s card?',3,7);

INSERT INTO
REVIEWS(UserId,GameName,ReviewDate,ReviewText,Score)
VALUES
/*1*/(7,'GTA V','2016-11-23 00:01:23','Jogo muito cansativo',1),
/*2*/(4,'Counter-Strike 1.6','2006-06-30 12:01:07','I love Lara Croft',5),
/*3*/(1,'The Elder Scrols V: Skyrim','2019-11-04 11:53:27',NULL,3),
/*4*/(3,'Tomb Raider(2013)','2013-07-22 11:47:12','J\'aime Lara Croft',5),
/*5*/(10,'ARK: Survival Evolved','2018-04-05 17:21:14','Bad FPS and optimization',1),
/*6*/(5,'Witcher 3','2015-06-11 22:12:54','Amazing story and characters but my pc can\'t handle well its graphics',4),
/*7*/(2,'The Elder Scrols V: Skyrim','2011-03-25 23:17:36',NULL,5),
/*8*/(9,'Saints Row: The Third','2011-07-13 05:02:01',NULL,2);

INSERT INTO
GROUPS_(Name)
VALUES
/*1*/ ('Zulmira Lovers'),
/*2*/ ('Framerate Police'),
/*3*/ ('Steam Trading Cards Group'),
/*4*/ ('Matosinhos'),
/*5*/ ('Programadores do Tetris'),
/*6*/ ('Fãs do Tiagovski');

--                                   LIGAÇÔES

INSERT INTO
GAME_ACHIEVEMENTS(GameId,Achievement)
VALUES
	(1,'Best RPG of the Year'),
	(1,'Game of the Year'),
	(3,'Best FPS of the Year'),
	(4,'Best MOBA'),
	(5,'Best Multiplayer Game'),
	(6,'Game of the Year'),
	(10,'Best Action Game'),
	(14,'Best Independent Game'),
	(15,'Game of the Year'),
	(19,'Hardest Game of the Year'),	
	(25,'Best Game for Pc'),
	(27,'Best Action Game'),
	(28,'Best Multiplayer Game');

INSERT INTO 
FRIENDS(PlayerId1,PlayerId2)
VALUES
	(1,2),
	(1,3),
	(1,4),
	(1,5),
	(1,6),
	(1,7),
	(1,8),
	(1,9),

	(2,3),
	(2,5),
	(2,6),
	(2,7),
	(2,8),

	(4,9),

	(5,6),
	(5,7),
	(5,8),

	(6,7),
	(6,8),

	(7,8);

INSERT INTO
GAME_LIBRARY(PlayerId,GameId)
VALUES
	(1,2),
	(1,8),
	(1,13),
	(1,17),

	(2,4),
	(2,7),
	(2,15),

	(3,4),
	(3,7),
	(3,15),

	(4,3),

	(5,1),
	(5,2),
	(5,3),
	(5,4),
	(5,5),
	(5,6),
	(5,10),
	(5,14),
	(5,19),
	(5,28),

	(6,1),
	(6,2),
	(6,3),
	(6,4),
	(6,5),
	(6,6),
	(6,10),
	(6,14),
	(6,19),
	(6,28),	

	(7,1),
	(7,2),
	(7,3),
	(7,4),
	(7,5),
	(7,6),
	(7,10),
	(7,14),
	(7,19),
	(7,28),

	(8,3),
	(8,5),
	(8,6),
	(8,10),
	(8,14),

	(9,3),

	(10,1),
	(10,2),
	(10,3),
	(10,4),
	(10,5),
	(10,6),
	(10,7),
	(10,8),
	(10,9),
	(10,10),
	(10,11),
	(10,12),
	(10,13),
	(10,14),
	(10,15),
	(10,16),
	(10,17),
	(10,18),
	(10,19),
	(10,20),
	(10,21),
	(10,22),
	(10,23),
	(10,24),
	(10,25),
	(10,26),
	(10,27),
	(10,28);

INSERT INTO
DEVELOPED(DeveloperName,GameId)
VALUES
	('CD PROJEKT RED',1),
	('Valve Corporation',2),
	('Valve Corporation',3),
	('Valve Corporation',4),
	('ROCKSTAR GAMES',5),
	('Naughty Dog',6),
	('Studio Wildcard',7),
	('Valve Corporation',8),
	('Bethesda Game Studio',9),
	('Crystal Dynamics',10),
	('Valve Corporation',11),
	('Larian Studios',12),
	('Valve Corporation',13),
	('Psyonix LLC',14),
	('Gearbox Software',15),
	('Square Enix',16),
	('Konami Digital Entertainment',17),
	('Monolith Productions',18),
	('FromSoftware',19),
	('Volition',20),
	('Chucklefish',21),
	('Zenimax Online Studios',22),
	('Valve Corporation',23),
	('Firaxis Games',24),
	('CREATIVE ASSEMBLY',25),
	('Supergiant Games',26),
	('Ubisoft Montreal',27),
	('Ubisoft Montreal',28);

INSERT INTO 
IS_PART_OF(GroupId,PlayerId)
VALUES
	(1,5),
	(1,6),
	(1,7),
	(1,8),
	
	(2,1),
	(2,6),
	(2,7),

	(3,1),
	(3,5),
	(3,6),
	(3,7),

	(4,7),
	(4,8),

	(5,1),
	(5,7),

	(6,2),
	(6,3),
	(6,5),
	(6,6),
	(6,7),
	(6,8);

INSERT INTO
ASSOCIATED_GAMES(GroupId,GameId)
VALUES

	(1,3),
	(1,14),
	(2,2),
	(2,4),
	(2,13),
	(2,20),
	(2,28),
	(3,2),
	(3,4),
	(3,13),
	(3,20),
	(3,28),
	(6,1),
	(6,3),
	(6,5),
	(6,7),
	(6,28);


INSERT INTO 
REVIEWED_GAMES(ReviewId,GameId)
VALUES
	(1,5),
	(2,2),
	(3,9),
	(4,10),
	(5,7),
	(6,1),
	(7,9),
	(8,20);

INSERT INTO 
GROUP_POSTS(GroupId,PostId)
VALUES
	(1,1),
	(6,2),
	(5,3),
	(4,4),
 	(4,5),
	(2,6),
	(3,7);

/******************************************************************/

/*                 SELECT                                 */

/*PLAYER*/

	/*CONTA*/
/*
SELECT Nickname,Wallet,Country,CONVERT(DATEDIFF('2020-05-09' ,PLAYERS.SignUpDate)/365 -0.5 ,signed) AS Age 
from PLAYERS
ORDER BY Nickname;
*/
	/*AMIGOS*/
/*
SELECT P1.Nickname JOGADOR,P2.Nickname AMIGOS
from PLAYERS as P1
	Join FRIENDS 
		ON (P1.Id=FRIENDS.PlayerId1)
	join PLAYERS as P2
		ON (FRIENDS.PlayerId2=P2.Id)
UNION
SELECT P1.Nickname JOGADOR,P2.Nickname AMIGOS
from PLAYERS as P1
	Join FRIENDS 
		ON (P1.Id=FRIENDS.PlayerId2)
	join PLAYERS as P2
		ON (FRIENDS.PlayerId1=P2.Id)
ORDER BY JOGADOR, AMIGOS;
*/
	/*JOGOS*/
/*
SELECT Nickname,GAMES.Name
from PLAYERS
	Join GAME_LIBRARY 
		ON (GAME_LIBRARY.PlayerId=PLAYERS.Id)
	Join GAMES
		ON (GAME_LIBRARY.GameId=GAMES.Id)
ORDER BY Nickname,GAMES.Name;
*/

/*GAME*/

	/*carateristicas*/
/*
SELECT Name,MinimumPlayerAge,DeveloperName,CONVERT(DATEDIFF('2020-05-08' ,GAMES.ReleaseDate)/365 -0.5 ,signed) AS Age ,Price
FROM GAMES
ORDER BY Name;
*/

	/*premios*/
/*
SELECT Name,GAME_ACHIEVEMENTS.Achievement
FROM GAMES
	join GAME_ACHIEVEMENTS
	ON (GAME_ACHIEVEMENTS.GameId=GAMES.Id)
	ORDER BY Name;
*/

	/*REVIEWS*/

/*
SELECT Name,PLAYERS.Nickname,REVIEWS.ReviewText,REVIEWS.Score
FROM GAMES
	JOIN REVIEWED_GAMES
	ON(GAMES.Id=REVIEWED_GAMES.GameId)
	JOIN REVIEWS
	ON(REVIEWED_GAMES.ReviewId=REVIEWS.Id)
	JOIN PLAYERS
	ON(REVIEWS.UserId=PLAYERS.Id)
	ORDER BY Name;
*/

/*DEVELOPER*/

	/*Detalhes*/
/*
SELECT * FROM DEVELOPERS;
*/
	/*jogos*/
/*
SELECT DEVELOPERS.Name,GAMES.Name
FROM DEVELOPERS
	JOIN DEVELOPED
	ON(DEVELOPERS.Name=DEVELOPED.DeveloperName)
	JOIN GAMES
	ON(DEVELOPED.GameId=GAMES.Id)
	ORDER BY DEVELOPERS.Name;
*/

/*GROUPS_*/

	/*nomes*/
/*
SELECT Name
FROM GROUPS_;
*/
	/*jogos associados*/
/*
	SELECT GROUPS_.Name,GAMES.Name
	from GROUPS_
		JOIN ASSOCIATED_GAMES
		ON(GROUPS_.Id=ASSOCIATED_GAMES.GroupId)
		JOIN GAMES
		ON(ASSOCIATED_GAMES.GameId=GAMES.Id)
*/
	/*posts*/	
		/*todos os grupos*/
/*
		SELECT GROUPS_.Name,PLAYERS.Nickname,POSTS.PostText,POSTS.PostDate
		FROM GROUPS_
			JOIN GROUP_POSTS
			ON(GROUPS_.Id=GROUP_POSTS.GroupId)
			JOIN POSTS
			ON(GROUP_POSTS.PostId=POSTS.Id)
			JOIN PLAYERS
			ON(POSTS.UserId=PLAYERS.Id)
			ORDER BY GROUPS_.Name,POSTS.PostDate;
*/
		/*por grupo*/
		/*
		SELECT GROUPS_.Name , PLAYERS.Nickname , POSTS.PostText , POSTS.PostDate
		FROM GROUPS_
			JOIN GROUP_POSTS
			ON(GROUPS_.Id=GROUP_POSTS.GroupId)
			JOIN POSTS
			ON(GROUP_POSTS.PostId=POSTS.Id)
			JOIN PLAYERS
			ON(POSTS.UserId=PLAYERS.Id)
			where POSTS.GroupId=3	/* numero do grupo desejado*//*
			ORDER BY GROUPS_.Name,POSTS.PostDate;
		*/
		/*por data(num dia/mês/ano*/
/*
		SELECT GROUPS_.Name , PLAYERS.Nickname , POSTS.PostText , POSTS.PostDate
		FROM GROUPS_
			JOIN GROUP_POSTS
			ON(GROUPS_.Id=GROUP_POSTS.GroupId)
			JOIN POSTS
			ON(GROUP_POSTS.PostId=POSTS.Id)
			JOIN PLAYERS
			ON(POSTS.UserId=PLAYERS.Id)
			where Year(POSTS.PostDate)=2020 and Month(POSTS.PostDate)=5 and Day(POSTS.PostDate)=4/*escolher a data pretendida*//*
			ORDER BY GROUPS_.Name,POSTS.PostDate;
*/
		/*por palavra ou excerto*/
		/*
		SELECT GROUPS_.Name , PLAYERS.Nickname , POSTS.PostText , POSTS.PostDate
		FROM GROUPS_
			JOIN GROUP_POSTS
			ON(GROUPS_.Id=GROUP_POSTS.GroupId)
			JOIN POSTS
			ON(GROUP_POSTS.PostId=POSTS.Id)
			JOIN PLAYERS
			ON(POSTS.UserId=PLAYERS.Id)
			where POSTS.PostText like '%Tetris%'/*palavra ou excerto pretendida*//*
			ORDER BY GROUPS_.Name,POSTS.PostDate;
			*/
		/* por pessoa*/
/*
		SELECT GROUPS_.Name , PLAYERS.Nickname , POSTS.PostText , POSTS.PostDate
		FROM GROUPS_
			JOIN GROUP_POSTS
			ON(GROUPS_.Id=GROUP_POSTS.GroupId)
			JOIN POSTS
			ON(GROUP_POSTS.PostId=POSTS.Id)
			JOIN PLAYERS
			ON(POSTS.UserId=PLAYERS.Id)
			where PLAYERS.Id=8 /*id do jogador*//*
			ORDER BY GROUPS_.Name,POSTS.PostDate;*/
			
