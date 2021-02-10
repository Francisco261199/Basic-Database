USE work;

DROP TABLE IF EXISTS GAMES;
DROP TABLE IF EXISTS PLAYERS;
DROP TABLE IF EXISTS DEVELOPERS;
DROP TABLE IF EXISTS POSTS;
DROP TABLE IF EXISTS REVIEWS;
DROP TABLE IF EXISTS GROUPS;
DROP TABLE IF EXISTS FRIENDS;
DROP TABLE IF EXISTS GAME_LIBRARY;
DROP TABLE IF EXISTS DEVELOPER_GAMES;
DROP TABLE IF EXISTS IS_PART_OF;
DROP TABLE IF EXISTS ASSOCIATED_GAMES;
DROP TABLE IF EXISTS REVIEWED_GAMES;
DROP TABLE IF EXISTS GROUP_POSTS;
/*****************Entidades***********************/

CREATE TABLE
GAMES(
	Id int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
	Name varchar(255) NOT NULL,
	Price decimal(5,2) NOT NULL,
	DeveloperName varchar(255) NOT NULL,
	ReleaseDate DATE NOT NULL
	/*CONSTRAINT Game_developer FOREIGN KEY (DeveloperName) REFERENCES DEVELOPER(Name)*/
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
GROUPS(
	Id int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
	Name varchar(254) NOT NULL
);

/**********************************************/
CREATE TABLE
ACHIEVEMENTS


/******************RELAÇÕES*******************/
CREATE TABLE
FRIENDS(
	PlayerId1 int(11) NOT NULL,
	PlayerId2 int(11) NOT NULL,
	PRIMARY KEY(PlayerId1,PlayerId2)
	/*CONSTRAINT Friends_1 FOREIGN KEY (PlayerId1) REFERENCES PLAYERS(Id) ON DELETE CASCADE,
	CONSTRAINT Friends_2 FOREIGN KEY (PlayerId2) REFERENCES PLAYERS(Id) ON DELETE CASCADE*/
);

CREATE TABLE
GAME_LIBRARY(
	PlayerId int(11) NOT NULL,
	GameId int(11) NOT NULL,
	PRIMARY KEY(PlayerId,GameId)
);

CREATE TABLE
DEVELOPER_GAMES(
	DeveloperName int(11) NOT NULL,
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

/******************************************************************/


/************************INSERT VALUES****************************/

INSERT INTO
GAMES(Name,Price,DeveloperName,Achievements,ReleaseDate)
VALUES
/*1*/	('Witcher 3',8.99,'CD PROJEKT RED','Melhor RPG do Ano','2015-05-19'),
/*2*/	('Counter-Strike 1.6',8.99,'Valve Corporation',NULL,'2000-11-08'),
/*3*/	('Counter-Strike Global Offensive',0.00,'VALVE Corporation','Melhor FPS do Ano','2012-08-21'),
/*4*/	('DOTA 2',0.00,'Valve Corporation','Best MOBA','2013-07-09'),
/*5*/	('GTA V',8.99,'ROCKSTAR GAMES','Melhor Modo Multiplayer','2013-09-17'),
/*6*/	('The Last of Us',19.99,'Naughty Dog','Jogo do Ano','2013-06-14'),
/*7*/	('ARK: Survival Evolved',54.99,'Studio Wildcard',NULL,'2017-08-27'),
/*8*/	('Garry\'s Mod',9.99,'Valve Corporation',NULL,'2006-11-29'),
/*9*/	('The Elder Scrols V: Skyrim',4.99,'Bethesda Game Studio',NULL,'2011-11-11'),
/*10*/('Tomb Raider(2013)',4.99,'Crystal Dynamics','Best Action Game','2013-03-05'),
/*12*/('Divinity: Original Sin 2',44.99,'Larian Studios',NULL,'2017-09-14'),
/*13*/('Team Fortress 2',0.00,'Valve Corporation',NULL,'2007-09-10'),
/*14*/('Rocket League',19.99,'Psyonix LLC','Best independent game','2015-07-07'),
/*15*/('Borderlands 2',7.49,'Gearbox Software','Game of the Year','2012-09-20'),
/*16*/('FINAL FANTASY XIV Online',9.99,'Square Enix',NULL,'2014-02-18'),
/*17*/('METAL GEAR SOLID V: THE PHANTOM PAIN',8.99,'Konami Digital Entertainment',NULL,'2006-09-01'),
/*18*/('Middle-earth™: Shadow of Mordor™',39.99,'Monolith Productions',NULL,'2017-10-10'),
/*19*/('DARK SOULS™ III',14.99,'FromSoftware','Hardest Game of the Year','2016-04-11'),
/*20*/('Saints Row: The Third',9.99,'Volition',NULL,'2011-11-14'),
/*21*/('Starbound',13.99,'Chucklefish',NULL,'2016-07-22'),
/*24*/('The Elder Scrolls Online',19.99,'Zenimax Online Studios',NULL,'2014-04-04'),
/*25*/('Portal 2',8.19,'Valve Corporation','Mellhor jogo para Pc','2011-04-19'),
/*26*/('Sid Meier\'s Civilization V',39.99,'Firaxis Games',NULL,'2019-02-14'),
/*27*/('Total War: SHOGUN 2',7.49,'CREATIVE ASSEMBLY',NULL,'2011-03-15'),
/*28*/('Hades',20.99,'Supergiant Games',NULL,'2019-12-10'),
/*29*/('Far Cry® 3',19.99,'Ubisoft Montreal','Melhor Jogo de Ação','2012-11-29'),
/*30*/('PLAYERUNKNOWN\'S BATTLEGROUNDS',19.99,'Ubisoft Montreal','Best Multiplayer Game','2017-12-21');

INSERT INTO
PLAYERS(Nickname,SignUpDate,Wallet,Country)
VALUES
	('Roger Kings','2003-04-22',25.39,'Portugal'),
	('Roberto_A(l)berto','2003-06-09',99.99,'Portugal'),
	('Felix Berta','2003-06-10',99.98,'França'),
	('Vladimir','2003-09-11',99.97,'Russia'),
	('Marxum','2011-10-08',20.00,'Portugal'),
	('Netcan','2012-04-21',23.00,'Portugal'),
	('SNH','2012-08-28',2.63,'Portugal'),
	('Dudas','2015-03-05',20.00,'Portugal'),
	('Petroski','2016-03-06',0.00,'Polónia'),
	('Bolsonas','2019-01-01',9.99,'Brasil');

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
/*18*/('Ubisoft Montreal','França');

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
GROUPS(Name)
VALUES
/*1*/ ('Zulmira Lovers'),
/*2*/ ('Framerate Police'),
/*3*/ ('Steam Trading Cards Group'),
/*4*/ ('Matosinhos'),
/*5*/ ('Programadores do Tetris'),
/*6*/ ('Fãs do Tiagovski');


/******************************************************************/
select * from GAMES;
select * from PLAYERS;
select * from DEVELOPERS;
select * from POSTS;
select * from REVIEWS;
select * from GROUPS;
