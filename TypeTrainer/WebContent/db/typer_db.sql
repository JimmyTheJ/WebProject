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


/* Commented out for now. Will determine best structure and complexity of database later
CREATE TABLE IF NOT EXISTS `typer_db`.`music_genres` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `genre` VARCHAR(128) NOT NULL,
#  `password` VARCHAR(128) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `typer_db`.`music_sentences` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `sentence` VARCHAR(2048) NOT NULL,
  `song` VARCHAR(128) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `typer_db`.`music_songs` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(2048) NOT NULL,
  `album` VARCHAR(128) NULL,
  `artist` VARCHAR(128) NULL,
  `tracknumber` INT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `typer_db`.`music_albums` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(2048) NOT NULL,
  `artist` VARCHAR(128) NULL,
  `genre` VARCHAR(128) NULL,
  `year` VARCHAR(128) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `typer_db`.`music_artists` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(2048) NOT NULL,
  `genre` VARCHAR(128) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `typer_db`.`sentences` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `sentence` VARCHAR(1024) NOT NULL,
  `type` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `typer_db`.`words` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `word` VARCHAR(128) NOT NULL,
  `type` VARCHAR(128) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

*/

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

INSERT INTO users (`username`, `password`, `f_name`, `l_name`, `email`, `user_type`, `user_lang`) 
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
    ;
    
