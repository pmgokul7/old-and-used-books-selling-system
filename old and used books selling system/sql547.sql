/*
SQLyog Community Edition- MySQL GUI v8.03 
MySQL - 5.6.12-log : Database - old_books
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`old_books` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `old_books`;

/*Table structure for table `book` */

DROP TABLE IF EXISTS `book`;

CREATE TABLE `book` (
  `Book_id` int(12) NOT NULL AUTO_INCREMENT,
  `Book_name` varchar(250) NOT NULL,
  `Author` varchar(250) NOT NULL,
  `Price` decimal(64,0) NOT NULL,
  `Category_id` varchar(250) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`Book_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

/*Data for the table `book` */

insert  into `book`(`Book_id`,`Book_name`,`Author`,`Price`,`Category_id`,`user_id`) values (1,'Wings of Fire','A.P.J','500','Autobiography',NULL),(2,'War and Peace','Leo Tolstoy','900','Novel',NULL),(3,'ss','s','0','l',0),(4,'s','s','0','l',0),(5,'a','a','0','l',0),(6,'a','a','0','l',0),(7,'a','sd','0','l',0),(8,'af','af','0','l',0),(9,'ad','ad','0','l',0),(10,'a','a','0','l',0),(11,'sad','da','0','l',0),(12,'agf','ga','0','l',0),(13,'dad','a','0','l',0),(14,'adda','adad','0','l',0),(15,'adaf','dafaf','0','l',0),(16,'','dafaf','0','l',0),(17,'ss','ss','0','l',0),(18,'dad','dd','0','l',0),(19,'srrerat','shaju','123','l',19),(20,'a','a','123','l',19),(21,'dad','dafaf','98','l',19);

/*Table structure for table `category` */

DROP TABLE IF EXISTS `category`;

CREATE TABLE `category` (
  `category_id` int(10) NOT NULL AUTO_INCREMENT,
  `category` varchar(250) NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

/*Data for the table `category` */

insert  into `category`(`category_id`,`category`) values (11,'poem'),(12,'stories'),(13,'short story'),(14,'auto biography'),(15,'novel'),(16,'sreerag');

/*Table structure for table `complaints` */

DROP TABLE IF EXISTS `complaints`;

CREATE TABLE `complaints` (
  `Complaint_id` int(11) NOT NULL AUTO_INCREMENT,
  `User_id` int(11) NOT NULL,
  `Complaint` varchar(250) NOT NULL,
  `Complaint_date` date DEFAULT NULL,
  `Reply_date` date DEFAULT NULL,
  `Reply` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`Complaint_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `complaints` */

insert  into `complaints`(`Complaint_id`,`User_id`,`Complaint`,`Complaint_date`,`Reply_date`,`Reply`) values (1,7437,'unable to purchase','2022-02-01','2022-04-30','cool\r\n'),(2,0,'sreerad','0000-00-00','0000-00-00',''),(3,0,'albin',NULL,'0000-00-00',''),(4,19,'gokul','0000-00-00','0000-00-00',''),(5,19,'gokulssss','0000-00-00','0000-00-00','');

/*Table structure for table `delivery_staff` */

DROP TABLE IF EXISTS `delivery_staff`;

CREATE TABLE `delivery_staff` (
  `STAFF_ID` int(12) NOT NULL AUTO_INCREMENT,
  `NAME` char(250) DEFAULT NULL,
  `DELIVERY_ITEMS` varchar(250) DEFAULT NULL,
  `PHONE_NUMBER` int(10) DEFAULT NULL,
  PRIMARY KEY (`STAFF_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `delivery_staff` */

insert  into `delivery_staff`(`STAFF_ID`,`NAME`,`DELIVERY_ITEMS`,`PHONE_NUMBER`) values (1,'albin','wings of fire',2255);

/*Table structure for table `delivery_staffs` */

DROP TABLE IF EXISTS `delivery_staffs`;

CREATE TABLE `delivery_staffs` (
  `Staff_id` int(100) NOT NULL AUTO_INCREMENT,
  `Staff_name` char(250) NOT NULL,
  PRIMARY KEY (`Staff_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `delivery_staffs` */

/*Table structure for table `feedback` */

DROP TABLE IF EXISTS `feedback`;

CREATE TABLE `feedback` (
  `User_id` int(12) NOT NULL AUTO_INCREMENT,
  `User_name` varchar(250) NOT NULL,
  `Rating` int(6) NOT NULL,
  `Feedback` varchar(250) NOT NULL,
  PRIMARY KEY (`User_id`)
) ENGINE=InnoDB AUTO_INCREMENT=68788 DEFAULT CHARSET=latin1;

/*Data for the table `feedback` */

insert  into `feedback`(`User_id`,`User_name`,`Rating`,`Feedback`) values (68787,'gokul',5,'Good sevice');

/*Table structure for table `login` */

DROP TABLE IF EXISTS `login`;

CREATE TABLE `login` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `EMAIL` varchar(250) NOT NULL,
  `PASSWORD` varchar(250) NOT NULL,
  `USER_TYPE` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

/*Data for the table `login` */

insert  into `login`(`id`,`EMAIL`,`PASSWORD`,`USER_TYPE`) values (1,'gokul@friig','fgfg','gdhgd'),(18,'alb@gmail.com','123','admin'),(19,'gokul@gmail.com','123','user'),(20,'d@ggmail.com','k','waiting'),(21,'d@ggmail.com','d','user'),(22,'d@ggmail.com','d','store');

/*Table structure for table `profile` */

DROP TABLE IF EXISTS `profile`;

CREATE TABLE `profile` (
  `Profile_id` int(100) NOT NULL AUTO_INCREMENT,
  `User_name` char(1) NOT NULL,
  PRIMARY KEY (`Profile_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `profile` */

/*Table structure for table `review` */

DROP TABLE IF EXISTS `review`;

CREATE TABLE `review` (
  `REVIEW_ID` int(12) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(12) NOT NULL,
  `REVIEW` varchar(250) NOT NULL,
  `DATE` date NOT NULL,
  PRIMARY KEY (`REVIEW_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `review` */

/*Table structure for table `store` */

DROP TABLE IF EXISTS `store`;

CREATE TABLE `store` (
  `Store_id` int(11) NOT NULL AUTO_INCREMENT,
  `Store_name` char(1) NOT NULL,
  `Store_place` varchar(250) NOT NULL,
  `email` varchar(250) DEFAULT NULL,
  `post` varchar(250) DEFAULT NULL,
  `pin` int(250) DEFAULT NULL,
  PRIMARY KEY (`Store_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `store` */

insert  into `store`(`Store_id`,`Store_name`,`Store_place`,`email`,`post`,`pin`) values (1,'v','sreekandapuram','pm','dd',12),(2,'d','f','d@ggmail.com','f',0),(3,'d','d','d@ggmail.com','d',0);

/*Table structure for table `user_data` */

DROP TABLE IF EXISTS `user_data`;

CREATE TABLE `user_data` (
  `user_id` int(50) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) DEFAULT NULL,
  `mobile_num` int(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `place` varchar(100) DEFAULT NULL,
  `post` varchar(100) DEFAULT NULL,
  `pin` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

/*Data for the table `user_data` */

insert  into `user_data`(`user_id`,`Name`,`mobile_num`,`email`,`place`,`post`,`pin`) values (1,'gokul',3,NULL,NULL,NULL,NULL),(2,'cvncnv',0,'gokul@friig','dggd','dgdg',0),(3,'cvncnv',0,'gokul@friig','dggd','dgdg',0),(4,'www',0,'www@friig','ww','dgwwdg',0),(6,'rjttud',99,'riss.muraleekrishnanvv@gmail.comg','ewkijuerf','jgvdgjf',0),(7,'afffgfg',0,'pmgokul7@halijpi','ss','ss',0),(8,'fvef',0,'riss.muraleekrishnanvv@gmail.com','ffer','freref',0),(9,'fvef',0,'riss.muraleekrishnanvv@gmail.com','ffer','freref',0),(10,'fvef',0,'riss.muraleekrishnanvv@gmail.com','ffer','freref',0),(11,'g',99,'riss.muraleekrishnanvv@gmail.com','g','g',0),(12,'g',99,'riss.muraleekrishnanvv@gmail.com','g','g',0),(13,'g',99,'riss.muraleekrishnanvv@gmail.com','g','g',0),(14,'g',99,'riss.muraleekrishnanvv@gmail.com','g','g',0),(15,'ss',0,'riss.muraleekrishnanvv@gmail.com','ss','ss',0),(16,'d',0,'d@ggmail.com','d','d',0);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
