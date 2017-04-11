DROP DATABASE IF EXISTS `typer_db`;

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema typer_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `typer_db` DEFAULT CHARACTER SET utf8 ;
USE `typer_db`;

CREATE TABLE IF NOT EXISTS `typer_db`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `f_name` VARCHAR(45) NULL,
  `l_name` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `user_type` VARCHAR(45) NULL,
  `user_lang` VARCHAR(45) NULL, 
  `join_date` DATETIME,
  `last_login` DATETIME,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `typer_db`.`user_stats` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `min_wpm` DOUBLE NULL,
  `avg_wpm` DOUBLE NULL,
  `max_wpm` DOUBLE NULL,
  `min_accuracy` DOUBLE NULL,
  `avg_accuracy` DOUBLE NULL,
  `max_accuracy` DOUBLE NULL,
  `num_sentences` INT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `typer_db`.`music_sentences` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `album` VARCHAR(128) NULL,
  `artist` VARCHAR(128) NULL,
  `song` VARCHAR(128) NULL,
  `sentence` VARCHAR(2048) NOT NULL,
  `year_released` VARCHAR(8) NOT NULL, 
  `song_language` VARCHAR(40) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

INSERT INTO `music_sentences` VALUES (1,'Doggystyle','Snoop Dogg','Gin and Juice','Rollin\' down the street, smokin\' indo. Sippin\' on gin and juice, laid back. With my mind on my money and my money on my mind.','1993','English'),(2,'Rubber Soul','The Beatles','Drive My Car','Asked a girl what she wanted to be. She said baby, Can\'t you see. I wanna be famous, a star on the screen. But you can do something in between.','1965','English'),(3,'Rubber Soul','The Beatles','Drive My Car','I told a girl that my prospects were good. And she said baby, It\'s understood. Working for peanuts is all very fine. But I can show you a better time.','1965','English'),(4,'Rubber Soul','The Beatles','Drive My Car','I told that girl I can start right away. And she said, \'Listen baby I got something to say. I got no car and it\'s breaking my heart. But I\'ve found a driver and that\'s a start.','1965','English'),(5,'Rubber Soul','The Beatles','Drive My Car','Baby you can drive my car. Yes I\'m gonna be a star. Baby you can drive my car. And maybe I love you.','1965','English'),(6,'Revolver','The Beatles','Taxman','Let me tell you how it will be. There\'s one for you, nineteen for me. Cos I\'m the taxman, yeah, I\'m the taxman.','1966','English'),(7,'Revolver','The Beatles','Taxman','Should five per cent appear too small. Be thankful I don\'t take it all. Cos I\'m the taxman, yeah I\'m the taxman.','1966','English'),(8,'Revolver','The Beatles','Taxman','If you drive a car, I\'ll tax the street. If you try to sit, I\'ll tax your seat. If you get too cold I\'ll tax the heat. If you take a walk, I\'ll tax your feet.','1966','English'),(9,'Revolver','The Beatles','Taxman','Don\'t ask me what I want it for (Aahh Mr. Wilson). If you don\'t want to pay some more (Aahh Mr. Heath). Cos I\'m the taxman, yeah, I\'m the taxman.','1966','English'),(10,'Revolver','The Beatles','Taxman','Now my advice for those who die. Declare the pennies on your eyes. Cos I\'m the taxman, yeah, I\'m the taxman. And you\'re working for no one but me, Taxman!','1966','English'),(11,'Revolver','The Beatles','Eleanor Rigby','Eleanor Rigby picks up the rice in the church where a wedding has been. Lives in a dream. Waits at the window, wearing the face that she keeps in a jar by the door. Who is it for?','1966','English'),(12,'Revolver','The Beatles','Eleanor Rigby','All the lonely people. Where do they all come from? All the lonely people. Where do they all belong?','1966','English'),(13,'Revolver','The Beatles','Eleanor Rigby','Father McKenzie writing the words of a sermon that no one will hear. No one comes near. Look at him working, darning his socks in the night when there\'s nobody there. What does he care?','1966','English'),(14,'Revolver','The Beatles','Eleanor Rigby','Eleanor Rigby died in the church and was buried along with her name. Nobody came. Father McKenzie wiping the dirt from his hands as he walks from the grave. No one was saved.','1966','English'),(15,'Revolver','The Beatles','Yellow Submarine','In the town where I was born. Lived a man who sailed to sea. And he told us of his life. In the land of submarines.','1966','English'),(16,'Revolver','The Beatles','Yellow Submarine','So we sailed up to the sun. Till we found the sea of green. And we lived beneath the waves. In our yellow submarine.','1966','English'),(17,'Revolver','The Beatles','Yellow Submarine','We all live in a yellow submarine. Yellow submarine, yellow submarine. We all live in a yellow submarine. Yellow submarine, yellow submarine.','1966','English'),(18,'Revolver','The Beatles','Yellow Submarine','And our friends are all on board. Many more of them live next door. And the band begins to play.','1966','English'),(19,'Revolver','The Beatles','Yellow Submarine','Full speed ahead, Mr. Boatswain, full speed ahead! Full speed it is, Sgt.! Cut the cable, drop the cable! Aye, sir, aye! Captain, captain!','1966','English'),(20,'Revolver','The Beatles','Yellow Submarine','As we live a life of ease (A life of ease). Everyone of us (Everyone of us) has all we need (Has all we need). Sky of blue (Sky of blue) and sea of green (Sea of green). In our yellow (In our yellow) submarine (Submarine, ha, ha)','1966','English'),(21,'We Love Disney','Délivrée','La Reine Des Neiges Libérée','L\'hiver s\'installe doucement dans la nuit. La neige est reine à son tour. Un royaume de solitude. Ma place est là pour toujours','','French'),(22,'','Fréro Delavega','Chansons Le Chant Des Sirènes','Quand les souvenirs s\'en mêlent, les larmes me viennent, Et le chant des sirènes me replonge en hiver Oh mélancolie cruelle, harmonie fluette, euphorie solitaire','2015','French'),(23,'','Fréro Delavega','Chansons Le Chant Des Sirènes','Combien de farces, combien de frasques. Combien de traces, combien de masques. Avons-nous laissé là-bas. Poser les armes, prendre le large. Trouver le calme dans ce vacarme avant que je ne m\'y noie','2015','French'),(24,'','Fréro Delavega','Chansons Le Chant Des Sirènes','Au gré des saisons, des photomatons, Je m\'abandonne à ces lueurs d\'autrefois. Au gré des saisons, des décisions, je m\'abandonne','2015','French'),(25,'Black Sabbath','Black Sabbath','The Wizard','Misty morning, clouds in the sky. Without warning, the wizard walks by. Casting his shadow, weaving his spell. Funny clothes, tinkling bell.','1970','English'),(26,'Black Sabbath','Black Sabbath','The Wizard','Evil power disappears. Demons worry when the wizard is near. He turns tears into joy. Everyone\'s happy when the wizard walks by.','1970','English'),(27,'Black Sabbath','Black Sabbath','The Wizard','Sun is shining, clouds have gone by. All the people give a happy sigh. He has passed by, giving his sign. Left all the people feeling so fine.\r\n','1970','English'),(28,'Paranoid','Black Sabbath','Paranoid','Finished with my woman \'cause she couldn\'t help me with my mind. people think I\'m insane because I am frowning all the time. All day long I think of things but nothing seems to satisfy. Think I\'ll lose my mind if I don\'t find something to pacify.','1970','English'),(29,'Paranoid','Black Sabbath','Paranoid','I need someone to show me the things in life that I can\'t find. I can\'t see the things that make true happiness, I must be blind. Make a joke and I will sigh and you will laugh and I will cry. Happiness I cannot feel and love to me is so unreal.','1970','English'),(30,'Paranoid','Black Sabbath','Electric Funeral','Reflex in the sky warn you you\'re gonna die. Storm coming, you\'d better hide from the atomic tide. Flashes in the sky turns houses into sties. Turns people into clay, radiation minds decay.','1970','English'),(31,'Paranoid','Black Sabbath','Electric Funeral','Robot minds of robot slaves lead them to atomic rage. plastic flowers, melting sun, fading moon falls upon. dying world of radiation, victims of mad frustration. Burning globe of oxy\'n fire, like electric funeral pyre.','1970','English'),(32,'Paranoid','Black Sabbath','Electric Funeral','Buildings crashing down to a cracking ground. Rivers turn to wood, ice melting to flood. Earth lies in death bed, clouds cry water dead. Tearing life away, here\'s the burning pay.','1970','English'),(33,'Paranoid','Black Sabbath','Electric Funeral','And so in the sky shines the electric eye. supernatural king takes earth under his wing. Heaven\'s golden chorus sings, Hell\'s angels flap their wings. Evil souls fall to Hell, ever trapped in burning cells!','1970','English'),(34,'Wave Like Home','Future Islands','Old Friend','I whisper the tongue like an old friend. I cherish my time here alone. I wait in the eyes of the passing nights, To help me laugh brushfires again. By the swallows sleeve, I\'m a new hand. Cutting out the shapes that burn me. I can touch the mouths of these child gods. And these true minds that hurt man.','2008','English'),(35,'The Far Field','Future Islands','Ran','Ingest, where it goes, nobody sees but me. So perfect and so sweet. But the rest, feels incomplete. Like the rabbit\'s foot I keep. In the locket, with no key.\r\n','2017','English'),(36,'The Far Field','Future Islands','Ran','On these roads. Out of love, so it goes. How it feels when we fall, when we fold. How we lose control, on these roads. How it sings as it goes. Flight of field, driving snow. Knows the cold.','2017','English'),(37,'St. Elsewhere','Gnarls Barkley','Crazy','My heroes had the heart to lose their lives out on a limb. And all I remember is thinking, I want to be like them. Ever since I was little, ever since I was little it looked like fun. And it\'s no coincidence I\'ve come. And I can die when I\'m done.','2006','English'),(38,'Fear of the Dark','Iron Maiden','Fear of the Dark','I am a man who walks alone. And when I\'m walking a dark road. At night or strolling through the park. When the light begins to change. I sometimes feel a little strange. A little anxious when it\'s dark.','1992','English'),(39,'Fear of the Dark','Iron Maiden','Fear of the Dark','Fear of the dark, fear of the dark. I have a constant fear that something\'s always near. Fear of the dark, fear of the dark. I have a phobia that someone\'s always there.','1992','English'),(40,'Fear of the Dark','Iron Maiden','Fear of the Dark','Have you run your fingers down the wall. And have you felt your neck skin crawl. When you\'re searching for the light? Sometimes when you\'re scared to take a look. At the corner of the room. You\'ve sensed that something\'s watching you.','1992','English'),(41,'Surrealistic Pillow','Jefferson Airplane','Somebody to Love','When the truth is found. To be lies. And all the joy. Within you dies.\r\nDon\'t you want somebody to love? Don\'t you need somebody to love? Wouldn\'t you love somebody to love? You better find somebody to love. Love.','1967','English'),(42,'Led Zeppelin IV','Led Zeppelin','Stairway to Heaven','There\'s a lady who\'s sure all that glitters is gold. And she\'s buying a stairway to heaven. When she gets there she knows, if the stores are all closed. With a word she can get what she came for. Ooh, ooh, and she\'s buying a stairway to heaven.','1971','English'),(43,'Led Zeppelin IV','Led Zeppelin','Stairway to Heaven','There\'s a sign on the wall but she wants to be sure. \'Cause you know sometimes words have two meanings. In a tree by the brook, there\'s a songbird who sings, Sometimes all of our thoughts are misgiven.','1971','English'),(44,'Led Zeppelin IV','Led Zeppelin','Stairway to Heaven','Ooh, it makes me wonder, Ooh, it makes me wonder. There\'s a feeling I get when I look to the west, And my spirit is crying for leaving. In my thoughts I have seen rings of smoke through the trees, And the voices of those who stand looking.','1971','English'),(45,'Led Zeppelin IV','Led Zeppelin','Stairway to Heaven','Ooh, it makes me wonder, Ooh, it really makes me wonder. And it\'s whispered that soon, if we all call the tune, Then the piper will lead us to reason. And a new day will dawn for those who stand long, And the forests will echo with laughter.','1971','English'),(46,'Led Zeppelin IV','Led Zeppelin','Stairway to Heaven','If there\'s a bustle in your hedgerow, don\'t be alarmed now, It\'s just a spring clean for the May queen. Yes, there are two paths you can go by, but in the long run.There\'s still time to change the road you\'re on. And it makes me wonder.','1971','English'),(47,'Led Zeppelin IV','Led Zeppelin','Stairway to Heaven','Your head is humming and it won\'t go, in case you don\'t know, The piper\'s calling you to join him, Dear lady, can you hear the wind blow, and did you know. Your stairway lies on the whispering wind?','1971','English'),(48,'Led Zeppelin IV','Led Zeppelin','Stairway to Heaven','And as we wind on down the road. Our shadows taller than our soul. There walks a lady we all know. Who shines white light and wants to show. How everything still turns to gold. And if you listen very hard. The tune will come to you at last. When all are one and one is all. To be a rock and not to roll. And she\'s buying a stairway to heaven.','1971','English'),(49,'Hot Space','Queen','Under Pressure','It\'s the terror of knowing. What this world is about. Watching some good friends. Screaming, \"Let me out!\". Tomorrow gets me higher, higher, higher... Pressure on people - people on streets.\r\n','1982','English'),(50,'Renegades','Rage Against the Machine','Renegades of Funk','Since the Prehistoric ages and the days of ancient Greece. Right down through the Middle Ages. Planet earth kept going through changes. And then the Renaissance came and times continued to change. Nothing stayed the same but there were always renegades\r\nLike Chief Sitting Bull, Tom Paine. Dr. Martin Luther King, Malcolm X\r\nThey were renegades of their time and age. So many renegades.','2000','English');
INSERT INTO `users` VALUES (1,'sigl0003','6368bb2c5c4e974b9b377ceacd184e5e','James','Sigler','jamussigler@algonquinlive.com','admin','english',NULL,NULL),(2,'rice0061','317c22ba7cb17d9a721190a3ad92d90e','Cameron','Rice','rice0061@algonquinlive.com','admin','english',NULL,NULL),(3,'attf0006','5184ee6c419bba0370ceab5b0aa99afa','Gary','Attfield','attf0006@algonquinlive.com','admin','english',NULL,NULL),(4,'testuser1','5184ee6c419bba0370ceab5b0aa99afa','random','person','fake@email.com','user','english',NULL,NULL),(5,'testuser2','5184ee6c419bba0370ceab5b0aa99afa','random','person','fake1@email.com','user','english',NULL,NULL),(6,'testuser3','5184ee6c419bba0370ceab5b0aa99afa','random','person','fake2@email.com','user','english',NULL,NULL),(7,'testuser4','5184ee6c419bba0370ceab5b0aa99afa','random','person','fake3@email.com','user','english',NULL,NULL),(8,'testuser5','5184ee6c419bba0370ceab5b0aa99afa','random','person','fake4@email.com','user','english',NULL,NULL),(9,'testuser6','5184ee6c419bba0370ceab5b0aa99afa','random','person','fake5@email.com','user','english',NULL,NULL),(10,'testuser7','5184ee6c419bba0370ceab5b0aa99afa','random','person','fake6@email.com','user','english',NULL,NULL),(11,'testuser8','5184ee6c419bba0370ceab5b0aa99afa','random','person','fake7@email.com','user','english',NULL,NULL),(12,'testuser9','5184ee6c419bba0370ceab5b0aa99afa','random','person','fake8@email.com','user','english',NULL,NULL),(13,'testuser10','5184ee6c419bba0370ceab5b0aa99afa','random','person','fake9@email.com','user','english',NULL,NULL),(14,'testuser11','5184ee6c419bba0370ceab5b0aa99afa','random','person','fake10@email.com','user','english',NULL,NULL),(15,'testuser12','5184ee6c419bba0370ceab5b0aa99afa','random','person','fake11@email.com','user','english',NULL,NULL),(16,'testuser13','5184ee6c419bba0370ceab5b0aa99afa','random','person','fake12@email.com','user','english',NULL,NULL),(17,'testuser14','5184ee6c419bba0370ceab5b0aa99afa','random','person','fake13@email.com','user','english',NULL,NULL),(18,'testuser15','5184ee6c419bba0370ceab5b0aa99afa','random','person','fake14@email.com','user','english',NULL,NULL),(19,'testuser16','5184ee6c419bba0370ceab5b0aa99afa','random','person','fake15@email.com','user','english',NULL,NULL),(20,'testuser17','5184ee6c419bba0370ceab5b0aa99afa','random','person','fake16@email.com','user','english',NULL,NULL),(21,'testuser18','5184ee6c419bba0370ceab5b0aa99afa','random','person','fake17@email.com','user','english',NULL,NULL),(22,'testuser19','5184ee6c419bba0370ceab5b0aa99afa','random','person','fake18@email.com','user','english',NULL,NULL),(23,'testuser20','5184ee6c419bba0370ceab5b0aa99afa','random','person','fake19@email.com','user','english',NULL,NULL),(24,'testuser21','5184ee6c419bba0370ceab5b0aa99afa','random','person','fake20@email.com','user','english',NULL,NULL),(25,'testuser22','5184ee6c419bba0370ceab5b0aa99afa','random','person','fake21@email.com','user','english',NULL,NULL),(26,'testuser23','5184ee6c419bba0370ceab5b0aa99afa','random','person','fake22@email.com','user','english',NULL,NULL),(27,'testuser24','5184ee6c419bba0370ceab5b0aa99afa','random','person','fake23@email.com','user','english',NULL,NULL),(28,'testuser25','5184ee6c419bba0370ceab5b0aa99afa','random','person','fake24@email.com','user','english',NULL,NULL),(29,'testuser26','5184ee6c419bba0370ceab5b0aa99afa','random','person','fake25@email.com','user','english',NULL,NULL);
INSERT INTO `user_stats` VALUES (1,1,120,120,120,100,100,100,1),(2,2,80,80,80,100,100,100,1),(3,3,60,60,60,100,100,100,1),(4,4,4,4,4,76,76,76,1),(5,5,5,5,5,77,77,77,1),(6,6,7,7,7,76,76,76,1),(7,7,8,8,8,78,78,78,1),(8,8,5,10,15,75,82.5,90,2),(9,9,0,0,0,0,0,0,0),(10,10,0,0,0,0,0,0,0),(11,11,0,0,0,0,0,0,0),(12,12,0,0,0,0,0,0,0),(13,13,0,0,0,0,0,0,0),(14,14,0,0,0,0,0,0,0),(15,15,0,0,0,0,0,0,0),(16,16,0,0,0,0,0,0,0),(17,17,0,0,0,0,0,0,0),(18,18,0,0,0,0,0,0,0),(19,19,0,0,0,0,0,0,0),(20,20,0,0,0,0,0,0,0),(21,21,0,0,0,0,0,0,0),(22,22,0,0,0,0,0,0,0),(23,23,0,0,0,0,0,0,0),(24,24,0,0,0,0,0,0,0),(25,25,0,0,0,0,0,0,0),(26,26,0,0,0,0,0,0,0),(27,27,0,0,0,0,0,0,0),(28,28,0,0,0,0,0,0,0),(29,29,0,0,0,0,0,0,0);

/*INSERT INTO users (`username`, `password`, `f_name`, `l_name`, `email`, `user_type`, `user_lang`) 
VALUES ('sigl0003', '6368bb2c5c4e974b9b377ceacd184e5e', 'James', 'Sigler', 'jamussigler@algonquinlive.com', 'admin', 'english')
	,('rice0061', '317c22ba7cb17d9a721190a3ad92d90e', 'Cameron', 'Rice', 'rice0061@algonquinlive.com', 'admin', 'english')
    ,('attf0006', '5184ee6c419bba0370ceab5b0aa99afa', 'Gary', 'Attfield', 'attf0006@algonquinlive.com', 'admin', 'english')
    ,('testuser1', '5184ee6c419bba0370ceab5b0aa99afa', 'random', 'person', 'fake@email.com', 'user', 'english')
    ,('testuser2', '5184ee6c419bba0370ceab5b0aa99afa', 'random', 'person', 'fake1@email.com', 'user', 'english')
	,('testuser3', '5184ee6c419bba0370ceab5b0aa99afa', 'random', 'person', 'fake2@email.com', 'user', 'english')
    ,('testuser4', '5184ee6c419bba0370ceab5b0aa99afa', 'random', 'person', 'fake3@email.com', 'user', 'english')
    ,('testuser5', '5184ee6c419bba0370ceab5b0aa99afa', 'random', 'person', 'fake4@email.com', 'user', 'english')
    ,('testuser6', '5184ee6c419bba0370ceab5b0aa99afa', 'random', 'person', 'fake5@email.com', 'user', 'english')
    ,('testuser7', '5184ee6c419bba0370ceab5b0aa99afa', 'random', 'person', 'fake6@email.com', 'user', 'english')
    ,('testuser8', '5184ee6c419bba0370ceab5b0aa99afa', 'random', 'person', 'fake7@email.com', 'user', 'english')
    ,('testuser9', '5184ee6c419bba0370ceab5b0aa99afa', 'random', 'person', 'fake8@email.com', 'user', 'english')
    ,('testuser10', '5184ee6c419bba0370ceab5b0aa99afa', 'random', 'person', 'fake9@email.com', 'user', 'english')
    ,('testuser11', '5184ee6c419bba0370ceab5b0aa99afa', 'random', 'person', 'fake10@email.com', 'user', 'english')
	,('testuser12', '5184ee6c419bba0370ceab5b0aa99afa', 'random', 'person', 'fake11@email.com', 'user', 'english')
    ,('testuser13', '5184ee6c419bba0370ceab5b0aa99afa', 'random', 'person', 'fake12@email.com', 'user', 'english')
    ,('testuser14', '5184ee6c419bba0370ceab5b0aa99afa', 'random', 'person', 'fake13@email.com', 'user', 'english')
    ,('testuser15', '5184ee6c419bba0370ceab5b0aa99afa', 'random', 'person', 'fake14@email.com', 'user', 'english')
    ,('testuser16', '5184ee6c419bba0370ceab5b0aa99afa', 'random', 'person', 'fake15@email.com', 'user', 'english')
    ,('testuser17', '5184ee6c419bba0370ceab5b0aa99afa', 'random', 'person', 'fake16@email.com', 'user', 'english')
    ,('testuser18', '5184ee6c419bba0370ceab5b0aa99afa', 'random', 'person', 'fake17@email.com', 'user', 'english')    
    ,('testuser19', '5184ee6c419bba0370ceab5b0aa99afa', 'random', 'person', 'fake18@email.com', 'user', 'english')
    ,('testuser20', '5184ee6c419bba0370ceab5b0aa99afa', 'random', 'person', 'fake19@email.com', 'user', 'english')
    ,('testuser21', '5184ee6c419bba0370ceab5b0aa99afa', 'random', 'person', 'fake20@email.com', 'user', 'english')
    ,('testuser22', '5184ee6c419bba0370ceab5b0aa99afa', 'random', 'person', 'fake21@email.com', 'user', 'english')
    ,('testuser23', '5184ee6c419bba0370ceab5b0aa99afa', 'random', 'person', 'fake22@email.com', 'user', 'english')
	,('testuser24', '5184ee6c419bba0370ceab5b0aa99afa', 'random', 'person', 'fake23@email.com', 'user', 'english')
    ,('testuser25', '5184ee6c419bba0370ceab5b0aa99afa', 'random', 'person', 'fake24@email.com', 'user', 'english')
	,('testuser26', '5184ee6c419bba0370ceab5b0aa99afa', 'random', 'person', 'fake25@email.com', 'user', 'english')
    ;

INSERT INTO user_stats (user_id, min_wpm, avg_wpm, max_wpm, min_accuracy, avg_accuracy, max_accuracy, num_sentences) 
VALUES (1, 0, 0, 0, 0, 0, 0, 0)
	,(2, 0, 0, 0, 0, 0, 0, 0)
	,(3, 0, 0, 0, 0, 0, 0, 0)
	,(4, 0, 0, 0, 0, 0, 0, 0)
	,(5, 0, 0, 0, 0, 0, 0, 0)
	,(6, 0, 0, 0, 0, 0, 0, 0)
	,(7, 0, 0, 0, 0, 0, 0, 0)
	,(8, 0, 0, 0, 0, 0, 0, 0)
	,(9, 0, 0, 0, 0, 0, 0, 0)
	,(10, 0, 0, 0, 0, 0, 0, 0)
	,(11, 0, 0, 0, 0, 0, 0, 0)
	,(12, 0, 0, 0, 0, 0, 0, 0)
	,(13, 0, 0, 0, 0, 0, 0, 0)
	,(14, 0, 0, 0, 0, 0, 0, 0)
	,(15, 0, 0, 0, 0, 0, 0, 0)
	,(16, 0, 0, 0, 0, 0, 0, 0)
	,(17, 0, 0, 0, 0, 0, 0, 0)
	,(18, 0, 0, 0, 0, 0, 0, 0)
	,(19, 0, 0, 0, 0, 0, 0, 0)  
	,(20, 0, 0, 0, 0, 0, 0, 0)
	,(21, 0, 0, 0, 0, 0, 0, 0)
	,(22, 0, 0, 0, 0, 0, 0, 0)
	,(23, 0, 0, 0, 0, 0, 0, 0)
	,(24, 0, 0, 0, 0, 0, 0, 0)
	,(25, 0, 0, 0, 0, 0, 0, 0)
	,(26, 0, 0, 0, 0, 0, 0, 0) 
	,(27, 0, 0, 0, 0, 0, 0, 0)
	,(28, 0, 0, 0, 0, 0, 0, 0)
	,(29, 0, 0, 0, 0, 0, 0, 0)     
    ;
	
INSERT INTO music_sentences (`artist`, `album`, `song`, `year_released`, `sentence`, `song_language`)
VALUES ("Snoop Dogg", "Doggystyle", "Gin and Juice", "1993", "Rollin' down the street, smokin' indo. Sippin' on gin and juice, laid back. With my mind on my money and my money on my mind.", "English")
	,("The Beatles", "Rubber Soul", "Drive My Car", "1965", "Asked a girl what she wanted to be. She said baby, Can't you see. I wanna be famous, a star on the screen. But you can do something in between.", "English")
    ,("The Beatles", "Rubber Soul", "Drive My Car", "1965", "I told a girl that my prospects were good. And she said baby, It's understood. Working for peanuts is all very fine. But I can show you a better time.", "English")
    ,("The Beatles", "Rubber Soul", "Drive My Car", "1965", "I told that girl I can start right away. And she said, 'Listen baby I got something to say. I got no car and it's breaking my heart. But I've found a driver and that's a start.", "English")
    ,("The Beatles", "Rubber Soul", "Drive My Car", "1965", "Baby you can drive my car. Yes I'm gonna be a star. Baby you can drive my car. And maybe I love you.", "English")
    ,("The Beatles", "Revolver", "Taxman", "1966", "Let me tell you how it will be. There's one for you, nineteen for me. Cos I'm the taxman, yeah, I'm the taxman.", "English")
    ,("The Beatles", "Revolver", "Taxman", "1966", "Should five per cent appear too small. Be thankful I don't take it all. Cos I'm the taxman, yeah I'm the taxman.", "English")
    ,("The Beatles", "Revolver", "Taxman", "1966", "If you drive a car, I'll tax the street. If you try to sit, I'll tax your seat. If you get too cold I'll tax the heat. If you take a walk, I'll tax your feet.", "English")
    ,("The Beatles", "Revolver", "Taxman", "1966", "Don't ask me what I want it for (Aahh Mr. Wilson). If you don't want to pay some more (Aahh Mr. Heath). Cos I'm the taxman, yeah, I'm the taxman.", "English")
    ,("The Beatles", "Revolver", "Taxman", "1966", "Now my advice for those who die. Declare the pennies on your eyes. Cos I'm the taxman, yeah, I'm the taxman. And you're working for no one but me, Taxman!", "English")
    ,("The Beatles", "Revolver", "Eleanor Rigby", "1966", "Eleanor Rigby picks up the rice in the church where a wedding has been. Lives in a dream. Waits at the window, wearing the face that she keeps in a jar by the door. Who is it for?", "English")
    ,("The Beatles", "Revolver", "Eleanor Rigby", "1966", "All the lonely people. Where do they all come from? All the lonely people. Where do they all belong?", "English")
    ,("The Beatles", "Revolver", "Eleanor Rigby", "1966", "Father McKenzie writing the words of a sermon that no one will hear. No one comes near. Look at him working, darning his socks in the night when there's nobody there. What does he care?", "English")
    ,("The Beatles", "Revolver", "Eleanor Rigby", "1966", "Eleanor Rigby died in the church and was buried along with her name. Nobody came. Father McKenzie wiping the dirt from his hands as he walks from the grave. No one was saved.", "English")
    ,("The Beatles", "Revolver", "Yellow Submarine", "1966", "In the town where I was born. Lived a man who sailed to sea. And he told us of his life. In the land of submarines.", "English")
    ,("The Beatles", "Revolver", "Yellow Submarine", "1966", "So we sailed up to the sun. Till we found the sea of green. And we lived beneath the waves. In our yellow submarine.", "English")
    ,("The Beatles", "Revolver", "Yellow Submarine", "1966", "We all live in a yellow submarine. Yellow submarine, yellow submarine. We all live in a yellow submarine. Yellow submarine, yellow submarine.", "English")
    ,("The Beatles", "Revolver", "Yellow Submarine", "1966", "And our friends are all on board. Many more of them live next door. And the band begins to play.", "English")
    ,("The Beatles", "Revolver", "Yellow Submarine", "1966", "Full speed ahead, Mr. Boatswain, full speed ahead! Full speed it is, Sgt.! Cut the cable, drop the cable! Aye, sir, aye! Captain, captain!", "English")
    ,("The Beatles", "Revolver", "Yellow Submarine", "1966", "As we live a life of ease (A life of ease). Everyone of us (Everyone of us) has all we need (Has all we need). Sky of blue (Sky of blue) and sea of green (Sea of green). In our yellow (In our yellow) submarine (Submarine, ha, ha)", "English")
    ,("Délivrée", "We Love Disney", "La Reine Des Neiges Libérée", "", "L'hiver s'installe doucement dans la nuit. La neige est reine à son tour. Un royaume de solitude. Ma place est là pour toujours", "French")
    ,("Fréro Delavega", "", "Chansons Le Chant Des Sirènes", "2015", "Quand les souvenirs s'en mêlent, les larmes me viennent, Et le chant des sirènes me replonge en hiver Oh mélancolie cruelle, harmonie fluette, euphorie solitaire", "French")
    ,("Fréro Delavega", "", "Chansons Le Chant Des Sirènes", "2015", "Combien de farces, combien de frasques. Combien de traces, combien de masques. Avons-nous laissé là-bas. Poser les armes, prendre le large. Trouver le calme dans ce vacarme avant que je ne m'y noie", "French")
    ,("Fréro Delavega", "", "Chansons Le Chant Des Sirènes", "2015", "Au gré des saisons, des photomatons, Je m'abandonne à ces lueurs d'autrefois. Au gré des saisons, des décisions, je m'abandonne", "French")
    ;
   */ 