DROP DATABASE IF EXISTS `sql_project`;
CREATE DATABASE `sql_project`; 
USE `sql_project`;

SET NAMES utf8 ;
SET character_set_client = utf8mb4 ;	

CREATE TABLE `DiseaseType` (
	`id` int UNIQUE,
	`description` varchar(140) DEFAULT NULL,
    PRIMARY KEY(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
INSERT INTO `DiseaseType` VALUES (1, 'infectious diseases');
INSERT INTO `DiseaseType` VALUES (2, 'virology');
INSERT INTO `DiseaseType` VALUES (3, 'lethal diseases');
INSERT INTO `DiseaseType` VALUES (4, 'chronic');
INSERT INTO `DiseaseType` VALUES (5, 'zhonic');
INSERT INTO `DiseaseType` VALUES (6, 'degenerative');
INSERT INTO `DiseaseType` VALUES (7, 'self-inflicted');
INSERT INTO `DiseaseType` VALUES (8, 'social');
INSERT INTO `DiseaseType` VALUES (9, 'physical');
INSERT INTO `DiseaseType` VALUES (10, 'mental');

CREATE TABLE `Country` (
	`cname` varchar(50) UNIQUE,
	`population` bigint NOT NULL DEFAULT '0',
    PRIMARY KEY(`cname`)	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
INSERT INTO `Country` VALUES ('England', 56000000);
INSERT INTO `Country` VALUES ('Kazakhstan', 19300000);
INSERT INTO `Country` VALUES ('Kyrgyzstan', 6600000);
INSERT INTO `Country` VALUES ('Canada', 38520000);
INSERT INTO `Country` VALUES ('Mexico', 130000000);
INSERT INTO `Country` VALUES ('Mongolia', 3300000);
INSERT INTO `Country` VALUES ('Afghanistan', 40000000);
INSERT INTO `Country` VALUES ('Turkey', 85000000);
INSERT INTO `Country` VALUES ('Japan', 125700000);
INSERT INTO `Country` VALUES ('South Korea', 51700000);

CREATE TABLE `Disease` (
	`disease_code` varchar(50) UNIQUE,
    `pathogen` varchar(20) NOT NULL,
    `description` varchar(140) DEFAULT NULL,
	`id` int NOT NULL,
    PRIMARY KEY(`disease_code`),
    FOREIGN KEY(`id`) REFERENCES `DiseaseType` (`id`) ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
INSERT INTO `Disease` VALUES ('diabetes', 'virus', 'very bad disease', 2);
INSERT INTO `Disease` VALUES ('tuberculosis', 'bacteria', 'person dies fast', 1);
INSERT INTO `Disease` VALUES ('pneumonia', 'virus', 'wash hands', 9);
INSERT INTO `Disease` VALUES ('paralysis', 'virus', 'no move', 5);
INSERT INTO `Disease` VALUES ('covid-19', 'bacteria', 'new disease', 2);
INSERT INTO `Disease` VALUES ('influenza', 'bacteria', 'wash hands', 1);
INSERT INTO `Disease` VALUES ('cancer', 'parasite', 'same as zodiac sign', 4);
INSERT INTO `Disease` VALUES ('allergy', 'bacteria', 'milk, egg are common allergies', 7);
INSERT INTO `Disease` VALUES ('ebola', 'parasite', 'deadly disease', 3);
INSERT INTO `Disease` VALUES ('hiv', 'bacteria', 'no cure at the moment', 1);
INSERT INTO `Disease` VALUES ('headache', 'bacteria', 'sleep may help', 2);
INSERT INTO `Disease` VALUES ('cold', 'parasite', 'dress up warm', 1);
INSERT INTO `Disease` VALUES ('malaria', 'bacteria', 'very serious disease', 4);
INSERT INTO `Disease` VALUES ('amoebiasis', 'bacteria', 'spread through feces', 10);
INSERT INTO `Disease` VALUES ('conjunctivitis', 'virus', 'eye disease', 9);

CREATE TABLE `Discover` (
	`cname` varchar(50),
    `disease_code` varchar(50) ,
    `first_enc_date` date DEFAULT NULL	,	
    PRIMARY KEY(`cname`, `disease_code`),
	FOREIGN KEY(`disease_code`) REFERENCES `Disease` (disease_code) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY(`cname`) REFERENCES `Country` (cname) ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
INSERT INTO `Discover` VALUES ('Japan', 'diabetes', '2001-01-12');
INSERT INTO `Discover` VALUES ('Mongolia', 'tuberculosis', '2001-02-28');
INSERT INTO `Discover` VALUES ('South Korea', 'pneumonia', '1970-12-31');
INSERT INTO `Discover` VALUES ('Kazakhstan', 'paralysis', '1962-12-10');
INSERT INTO `Discover` VALUES ('Turkey', 'covid-19', '2019-12-12');
INSERT INTO `Discover` VALUES ('Afghanistan', 'influenza', '2006-06-12');
INSERT INTO `Discover` VALUES ('Canada', 'cancer', '1980-03-29');
INSERT INTO `Discover` VALUES ('Japan', 'allergy', '1999-11-11');
INSERT INTO `Discover` VALUES ('Turkey', 'ebola', '2011-06-18');
INSERT INTO `Discover` VALUES ('England', 'hiv', '1989-01-12');
INSERT INTO `Discover` VALUES ('Turkey', 'hiv', '1999-04-12');
INSERT INTO `Discover` VALUES ('Afghanistan', 'amoebiasis', '1990-01-02');
INSERT INTO `Discover` VALUES ('Japan', 'cold', '1995-06-12');
INSERT INTO `Discover` VALUES ('Mongolia', 'malaria', '2004-03-18');
INSERT INTO `Discover` VALUES ('Kazakhstan', 'covid-19', '2019-12-12');
INSERT INTO `Discover` VALUES ('South Korea', 'covid-19', '2019-12-12');
INSERT INTO `Discover` VALUES ('Japan', 'covid-19', '2019-12-12');
INSERT INTO `Discover` VALUES ('Mongolia', 'covid-19', '2019-12-12');
INSERT INTO `Discover` VALUES ('England', 'covid-19', '2019-12-12');

CREATE TABLE `Users` (
	`email` varchar(60) UNIQUE,
    `name` varchar(30) NOT NULL,
    `surname` varchar(40) NOT NULL,
	`salary` int NOT NULL DEFAULT '0',
    `phone` varchar(20) NOT NULL,
    `cname` varchar(50) NOT NULL,
    PRIMARY KEY(`email`),
	FOREIGN KEY(`cname`) REFERENCES `Country` (`cname`) ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
INSERT INTO `Users` VALUES ('tallulah.yvon@mail.net', 'Tallulah', 'Yvon', 60000, '7-111-222-4444', 'Kyrgyzstan');
INSERT INTO `Users` VALUES ('solomon.yeva@mail.net', 'Solomon ', 'Yeva', 40000, '7-222-444-7777', 'Mexico');
INSERT INTO `Users` VALUES ('brian.lee@mail.net', 'Brian', 'Lee', 70000, '7-705-222-1621', 'England');
INSERT INTO `Users` VALUES ('smith.free@mail.net', 'Smith', 'Free', 65000, '7-124-427-3414', 'Mongolia');
INSERT INTO `Users` VALUES ('saul.goodman@mail.net', 'Saul', 'Goodman', 1000000, '7-124-167-5483', 'Mexico');
INSERT INTO `Users` VALUES ('madgalini.solvig@mail.net', 'Madgalini', 'Solvig', 135980, '7-214-215-1254', 'Turkey');
INSERT INTO `Users` VALUES ('dobroslav.pushkin@mail.net', 'Dobroslav', 'Pushkin', 248000, '7-135-137-8653', 'Japan');
INSERT INTO `Users` VALUES ('nikita.vys@mail.net', 'Nikita', 'Vys', 132000, '7-124-613-6427', 'South Korea');
INSERT INTO `Users` VALUES ('alibek.strasop@mail.net', 'Alibek', 'Strasop', 26000, '7-125-123-1251', 'Canada');
INSERT INTO `Users` VALUES ('gulsim.zhibek@mail.net', 'Gulsim', 'Zhibek', 180000, '7-777-123-1777', 'Kazakhstan');
INSERT INTO `Users` VALUES ('gulnur.yusif@mail.net', 'Gulnur', 'Yusif', 18000, '7-705-126-1256', 'Kazakhstan');
INSERT INTO `Users` VALUES ('yemrah.lee@gmail.com', 'Yemrah', 'Lee', 500000, '7-705-210-1245', 'Turkey');
INSERT INTO `Users` VALUES ('afos.shipok@mail.net', 'Afos', 'Shipok', 123000, '7-707-777-8888', 'Afghanistan');
INSERT INTO `Users` VALUES ('aslan.nurbekov@mail.net', 'Aslan', 'Nurbekov', 5000, '7-111-222-4444', 'Mongolia');
INSERT INTO `Users` VALUES ('viktor.sans@mail.net', 'Viktor', 'Sans', 600000, '7-123-136-5938', 'Kazakhstan');
INSERT INTO `Users` VALUES ('aser.soy@mail.net', 'Aser', 'Soy', 12030, '7-124-612-4626', 'South Korea');
INSERT INTO `Users` VALUES ('besh.kol@mail.net', 'Besh', 'Kol', 180000, '7-235-236-2362', 'Mexico');
INSERT INTO `Users` VALUES ('qower.senlip@mail.net', 'Qower', 'Senlip', 90000, '7-777-777-7777', 'Japan');
INSERT INTO `Users` VALUES ('som.nom@mail.net', 'Som', 'Nom', 68000, '7-124-614-1245', 'Japan');
INSERT INTO `Users` VALUES ('wes.nes@mail.net', 'Wes', 'Nes', 120000, '7-123-456-7890', 'Turkey');

CREATE TABLE `PublicServant` (
	`email` varchar(60),
    `department` varchar(50) NOT NULL,
    PRIMARY KEY(`email`),
	FOREIGN KEY(`email`) REFERENCES `Users` (`email`) ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
INSERT INTO `PublicServant` VALUES ('tallulah.yvon@mail.net', 'Dept1');
INSERT INTO `PublicServant` VALUES ('solomon.yeva@mail.net', 'Dept2');
INSERT INTO `PublicServant` VALUES ('brian.lee@mail.net', 'Dept1');
INSERT INTO `PublicServant` VALUES ('smith.free@mail.net', 'Dept3');
INSERT INTO `PublicServant` VALUES ('alibek.strasop@mail.net', 'Dept2');
INSERT INTO `PublicServant` VALUES ('gulsim.zhibek@mail.net', 'Dept1');
INSERT INTO `PublicServant` VALUES ('gulnur.yusif@mail.net', 'Dept2');
INSERT INTO `PublicServant` VALUES ('afos.shipok@mail.net', 'Dept1');
INSERT INTO `PublicServant` VALUES ('aslan.nurbekov@mail.net', 'Dept3');
INSERT INTO `PublicServant` VALUES ('aser.soy@mail.net', 'Dept2');

CREATE TABLE `Doctor` (
	`email` varchar(60),
    `degree` varchar(20) NOT NULL,
    PRIMARY KEY(`email`),
	FOREIGN KEY(`email`) REFERENCES `Users` (`email`) ON UPDATE CASCADE ON DELETE CASCADE	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
INSERT INTO `Doctor` VALUES ('saul.goodman@mail.net', 'PhD');
INSERT INTO `Doctor` VALUES ('madgalini.solvig@mail.net', 'Bachelor');
INSERT INTO `Doctor` VALUES ('dobroslav.pushkin@mail.net', 'Bachelor');
INSERT INTO `Doctor` VALUES ('nikita.vys@mail.net', 'Master');
INSERT INTO `Doctor` VALUES ('yemrah.lee@gmail.com', 'Master');
INSERT INTO `Doctor` VALUES ('besh.kol@mail.net', 'Master');
INSERT INTO `Doctor` VALUES ('qower.senlip@mail.net', 'Bachelor');
INSERT INTO `Doctor` VALUES ('som.nom@mail.net', 'Bachelor');
INSERT INTO `Doctor` VALUES ('wes.nes@mail.net', 'Master');
INSERT INTO `Doctor` VALUES ('viktor.sans@mail.net', 'PhD');

CREATE TABLE `Specialize` (
	`id` int NOT NULL,
    `email` varchar(60) NOT NULL,
    PRIMARY KEY(`id`, `email`),
	FOREIGN KEY(`id`) REFERENCES `DiseaseType` (`id`) ON UPDATE CASCADE ON DELETE CASCADE,    
	FOREIGN KEY(`email`) REFERENCES `Doctor` (`email`) ON UPDATE CASCADE ON DELETE CASCADE	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
INSERT INTO `Specialize` VALUES (1, 'saul.goodman@mail.net');
INSERT INTO `Specialize` VALUES (2, 'saul.goodman@mail.net');
INSERT INTO `Specialize` VALUES (9, 'saul.goodman@mail.net');
INSERT INTO `Specialize` VALUES (4, 'madgalini.solvig@mail.net');
INSERT INTO `Specialize` VALUES (5, 'dobroslav.pushkin@mail.net');
INSERT INTO `Specialize` VALUES (3, 'nikita.vys@mail.net');
INSERT INTO `Specialize` VALUES (7, 'yemrah.lee@gmail.com');
INSERT INTO `Specialize` VALUES (1, 'yemrah.lee@gmail.com');
INSERT INTO `Specialize` VALUES (9, 'yemrah.lee@gmail.com');
INSERT INTO `Specialize` VALUES (8, 'besh.kol@mail.net');
INSERT INTO `Specialize` VALUES (2, 'besh.kol@mail.net');
INSERT INTO `Specialize` VALUES (6, 'qower.senlip@mail.net');
INSERT INTO `Specialize` VALUES (9, 'som.nom@mail.net');
INSERT INTO `Specialize` VALUES (10, 'wes.nes@mail.net');
INSERT INTO `Specialize` VALUES (1, 'viktor.sans@mail.net');
INSERT INTO `Specialize` VALUES (2, 'viktor.sans@mail.net');

CREATE TABLE `Record` (
	`email` varchar(60),
    `cname` varchar(50),
    `disease_code` varchar(50),
	`total_deaths` int NOT NULL,
    `total_patients` int NOT NULL,	
    PRIMARY KEY(`email` , `cname`, `disease_code`),
	FOREIGN KEY(`disease_code`) REFERENCES `Disease` (`disease_code`) ON UPDATE CASCADE ON DELETE CASCADE,    
	FOREIGN KEY(`cname`) REFERENCES `Country` (`cname`) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY(`email`) REFERENCES `PublicServant` (`email`) ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;	
INSERT INTO `Record` VALUES ('tallulah.yvon@mail.net', 'Kazakhstan', 'paralysis', 200, 1500);
INSERT INTO `Record` VALUES ('solomon.yeva@mail.net', 'Japan', 'diabetes', 15888, 99999);
INSERT INTO `Record` VALUES ('brian.lee@mail.net', 'South Korea', 'covid-19', 30000, 999999);
INSERT INTO `Record` VALUES ('brian.lee@mail.net', 'Turkey', 'covid-19', 50000, 600000);
INSERT INTO `Record` VALUES ('smith.free@mail.net', 'Afghanistan', 'influenza', 12000, 90000);
INSERT INTO `Record` VALUES ('gulsim.zhibek@mail.net', 'Japan', 'covid-19', 47000, 1500000);
INSERT INTO `Record` VALUES ('gulsim.zhibek@mail.net', 'England', 'covid-19', 113000, 1200000);
INSERT INTO `Record` VALUES ('gulsim.zhibek@mail.net', 'Kazakhstan', 'covid-19', 13000, 144444);
INSERT INTO `Record` VALUES ('gulsim.zhibek@mail.net', 'Mongolia', 'covid-19', 2000, 80000);
INSERT INTO `Record` VALUES ('gulnur.yusif@mail.net', 'Mongolia', 'malaria', 1500, 20000);
INSERT INTO `Record` VALUES ('afos.shipok@mail.net', 'Turkey', 'hiv', 15000, 150000);
INSERT INTO `Record` VALUES ('aslan.nurbekov@mail.net', 'Japan', 'cold', 10000, 95000);
INSERT INTO `Record` VALUES ('aser.soy@mail.net', 'South Korea', 'pneumonia', 8000, 100001);
