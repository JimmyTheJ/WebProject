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
  `join_date` DATETIME,
  `last_login` DATETIME,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `typer_db`.`user_stats` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `min_wpm` INT NULL,
  `avg_wpm` INT NULL,
  `max_wpm` INT NULL,
  `min_accuracy` INT NULL,
  `avg_accuracy` INT NULL,
  `max_accuracy` INT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `typer_db`.`music_sentences` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `album` VARCHAR(128) NULL,
  `artist` VARCHAR(128) NULL,
  `song` VARCHAR(128) NULL,
  `sentence` VARCHAR(2048) NOT NULL,
  `year_released` VARCHAR(8) NOT NULL, 
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

INSERT INTO users (`username`, `password`, `f_name`, `l_name`, `email`, `user_type`) 
VALUES ('sigl0003', 'jajaBot1123', 'James', 'Sigler', 'jamussigler@algonquinlive.com', 'admin')
	,('rice0061', 'hotNspicy42', 'Cameron', 'Rice', 'rice0061@algonquinlive.com', 'admin')
    ,('attf0006', 'gundam-Wings01', 'Gary', 'Attfield', 'attf0006@algonquinlive.com', 'admin')
    ;

INSERT INTO music_sentences (`artist`, `album`, `song`, `year_released`, `sentence`)
VALUES ("Snoop Dogg", "Doggystyle", "Gin and Juice", "1993", "Rollin' down the street, smokin' indo. Sippin' on gin and juice, laid back. With my mind on my money and my money on my mind.")
	,("The Beatles", "Rubber Soul", "Drive My Car", "1965", "Asked a girl what she wanted to be. She said baby, Can't you see. I wanna be famous, a star on the screen. But you can do something in between.")
    ,("The Beatles", "Rubber Soul", "Drive My Car", "1965", "I told a girl that my prospects were good. And she said baby, It's understood. Working for peanuts is all very fine. But I can show you a better time.")
    ,("The Beatles", "Rubber Soul", "Drive My Car", "1965", "I told that girl I can start right away. And she said, 'Listen baby I got something to say. I got no car and it's breaking my heart. But I've found a driver and that's a start.")
    ,("The Beatles", "Rubber Soul", "Drive My Car", "1965", "Baby you can drive my car. Yes I'm gonna be a star. Baby you can drive my car. And maybe I love you.")
    ,("The Beatles", "Revolver", "Taxman", "1966", "Let me tell you how it will be. There's one for you, nineteen for me. Cos I'm the taxman, yeah, I'm the taxman.")
    ,("The Beatles", "Revolver", "Taxman", "1966", "Should five per cent appear too small. Be thankful I don't take it all. Cos I'm the taxman, yeah I'm the taxman.")
    ,("The Beatles", "Revolver", "Taxman", "1966", "If you drive a car, I'll tax the street. If you try to sit, I'll tax your seat. If you get too cold I'll tax the heat. If you take a walk, I'll tax your feet.")
    ,("The Beatles", "Revolver", "Taxman", "1966", "Don't ask me what I want it for (Aahh Mr. Wilson). If you don't want to pay some more (Aahh Mr. Heath). Cos I'm the taxman, yeah, I'm the taxman.")
    ,("The Beatles", "Revolver", "Taxman", "1966", "Now my advice for those who die. Declare the pennies on your eyes. Cos I'm the taxman, yeah, I'm the taxman. And you're working for no one but me, Taxman!")
    ,("The Beatles", "Revolver", "Eleanor Rigby", "1966", "Eleanor Rigby picks up the rice in the church where a wedding has been. Lives in a dream. Waits at the window, wearing the face that she keeps in a jar by the door. Who is it for?")
    ,("The Beatles", "Revolver", "Eleanor Rigby", "1966", "All the lonely people. Where do they all come from? All the lonely people. Where do they all belong?")
    ,("The Beatles", "Revolver", "Eleanor Rigby", "1966", "Father McKenzie writing the words of a sermon that no one will hear. No one comes near. Look at him working, darning his socks in the night when there's nobody there. What does he care?")
    ,("The Beatles", "Revolver", "Eleanor Rigby", "1966", "Eleanor Rigby died in the church and was buried along with her name. Nobody came. Father McKenzie wiping the dirt from his hands as he walks from the grave. No one was saved.")
    ,("The Beatles", "Revolver", "Yellow Submarine", "1966", "In the town where I was born. Lived a man who sailed to sea. And he told us of his life. In the land of submarines.")
    ,("The Beatles", "Revolver", "Yellow Submarine", "1966", "So we sailed up to the sun. Till we found the sea of green. And we lived beneath the waves. In our yellow submarine.")
    ,("The Beatles", "Revolver", "Yellow Submarine", "1966", "We all live in a yellow submarine. Yellow submarine, yellow submarine. We all live in a yellow submarine. Yellow submarine, yellow submarine.")
    ,("The Beatles", "Revolver", "Yellow Submarine", "1966", "And our friends are all on board. Many more of them live next door. And the band begins to play.")
    ,("The Beatles", "Revolver", "Yellow Submarine", "1966", "Full speed ahead, Mr. Boatswain, full speed ahead! Full speed it is, Sgt.! Cut the cable, drop the cable! Aye, sir, aye! Captain, captain!")
    ,("The Beatles", "Revolver", "Yellow Submarine", "1966", "As we live a life of ease (A life of ease). Everyone of us (Everyone of us) has all we need (Has all we need). Sky of blue (Sky of blue) and sea of green (Sea of green). In our yellow (In our yellow) submarine (Submarine, ha, ha)")
    ;
    