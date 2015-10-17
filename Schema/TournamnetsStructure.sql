/*
SQLyog Community v12.1 (64 bit)
MySQL - 5.5.44 : Database - tournaments
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`tournaments` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `tournaments`;

/*Table structure for table `match` */

DROP TABLE IF EXISTS `match`;

CREATE TABLE `match` (
  `MatchId` int(10) NOT NULL AUTO_INCREMENT,
  `MatchDateTime` int(10) NOT NULL,
  `TeamId` int(11) DEFAULT NULL COMMENT 'Winner of the match',
  PRIMARY KEY (`MatchId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `match_team_mapping` */

DROP TABLE IF EXISTS `match_team_mapping`;

CREATE TABLE `match_team_mapping` (
  `MatchId` int(10) NOT NULL,
  `TeamId` int(10) NOT NULL,
  `Points` int(10) DEFAULT '0',
  `TournamentId` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `player` */

DROP TABLE IF EXISTS `player`;

CREATE TABLE `player` (
  `PlayerId` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL,
  `Image` blob,
  `Description` text,
  PRIMARY KEY (`PlayerId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `player_team_mapping` */

DROP TABLE IF EXISTS `player_team_mapping`;

CREATE TABLE `player_team_mapping` (
  `TeamId` int(11) DEFAULT NULL,
  `PlayerId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `team` */

DROP TABLE IF EXISTS `team`;

CREATE TABLE `team` (
  `TeamId` int(11) NOT NULL,
  `Description` text,
  PRIMARY KEY (`TeamId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `tournament` */

DROP TABLE IF EXISTS `tournament`;

CREATE TABLE `tournament` (
  `TournamentId` int(11) NOT NULL AUTO_INCREMENT,
  `Description` varchar(500) NOT NULL,
  `StrategyId` int(11) NOT NULL,
  PRIMARY KEY (`TournamentId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `tournament_point` */

DROP TABLE IF EXISTS `tournament_point`;

CREATE TABLE `tournament_point` (
  `TournamentId` int(11) DEFAULT NULL,
  `Win_Point` double DEFAULT NULL,
  `Loose_pont` double DEFAULT NULL,
  `Draw_Point` double DEFAULT NULL,
  `Is_Required` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `tournament_strategy` */

DROP TABLE IF EXISTS `tournament_strategy`;

CREATE TABLE `tournament_strategy` (
  `strategyId` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(500) NOT NULL,
  PRIMARY KEY (`strategyId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Table structure for table `tournament_team_mapping` */

DROP TABLE IF EXISTS `tournament_team_mapping`;

CREATE TABLE `tournament_team_mapping` (
  `TournamentTeamMappingId` int(11) NOT NULL AUTO_INCREMENT,
  `TournamentId` int(11) DEFAULT NULL,
  `TeamId` int(11) DEFAULT NULL,
  `TotalPlayed` int(11) DEFAULT NULL,
  PRIMARY KEY (`TournamentTeamMappingId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
