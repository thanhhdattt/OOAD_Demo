-- MySQL dump 10.13  Distrib 8.0.21, for macos10.15 (x86_64)
--
-- Host: localhost    Database: ucm
-- ------------------------------------------------------
-- Server version	8.0.21

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Assignments`
--

CREATE DATABASE ucm;
USE ucm;

DROP TABLE IF EXISTS `Assignments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Assignments` (
  `assignment_id` int NOT NULL AUTO_INCREMENT,
  `course_id` int NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `create_at` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `due_date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`assignment_id`),
  KEY `course_id` (`course_id`),
  CONSTRAINT `assignments_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `Courses` (`course_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Assignments`
--

LOCK TABLES `Assignments` WRITE;
/*!40000 ALTER TABLE `Assignments` DISABLE KEYS */;
/*!40000 ALTER TABLE `Assignments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AssignmentSubmissions`
--

DROP TABLE IF EXISTS `AssignmentSubmissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AssignmentSubmissions` (
  `assignment_submission_id` int NOT NULL AUTO_INCREMENT,
  `author_id` int NOT NULL,
  `assignment_id` int NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`assignment_submission_id`),
  KEY `assignment_id` (`assignment_id`),
  CONSTRAINT `assignmentsubmissions_ibfk_1` FOREIGN KEY (`assignment_id`) REFERENCES `Assignments` (`assignment_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AssignmentSubmissions`
--

LOCK TABLES `AssignmentSubmissions` WRITE;
/*!40000 ALTER TABLE `AssignmentSubmissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `AssignmentSubmissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CourseMembers`
--

DROP TABLE IF EXISTS `CourseMembers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CourseMembers` (
  `course_member_id` int NOT NULL AUTO_INCREMENT,
  `course_id` int NOT NULL,
  `user_id` int NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `status` enum('Pending','Accepted','Rejected') COLLATE utf8mb4_unicode_ci DEFAULT 'Pending',
  PRIMARY KEY (`course_member_id`),
  UNIQUE KEY `course_members_course_id_user_id` (`course_id`,`user_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `coursemembers_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `Courses` (`course_id`) ON UPDATE CASCADE,
  CONSTRAINT `coursemembers_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `Users` (`user_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CourseMembers`
--

LOCK TABLES `CourseMembers` WRITE;
/*!40000 ALTER TABLE `CourseMembers` DISABLE KEYS */;
INSERT INTO `CourseMembers` VALUES (1,1,1,NULL,'Pending'),(2,1,2,NULL,'Pending'),(3,1,3,'Miêu tả cho course member 3','Accepted'),(4,1,4,NULL,'Accepted'),(5,1,7,'Miêu tả cho course member 5','Rejected'),(6,2,1,NULL,'Pending'),(7,2,2,'Miêu tả cho course member 7','Accepted'),(8,2,4,NULL,'Pending'),(9,2,5,NULL,'Accepted'),(10,2,6,NULL,'Pending'),(11,2,8,'Miêu tả cho course member 11','Rejected'),(12,3,1,NULL,'Pending'),(13,3,2,NULL,'Accepted'),(14,4,5,NULL,'Accepted'),(15,4,6,NULL,'Pending');
/*!40000 ALTER TABLE `CourseMembers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Courses`
--

DROP TABLE IF EXISTS `Courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Courses` (
  `course_id` int NOT NULL AUTO_INCREMENT,
  `host_id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`course_id`),
  KEY `host_id` (`host_id`),
  CONSTRAINT `courses_ibfk_1` FOREIGN KEY (`host_id`) REFERENCES `Users` (`user_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Courses`
--

LOCK TABLES `Courses` WRITE;
/*!40000 ALTER TABLE `Courses` DISABLE KEYS */;
INSERT INTO `Courses` VALUES (1,10,'Đồ họa máy tính','miêu tả môn đồ họa'),(2,11,'Quản lý dự án',NULL),(3,11,'Công nghệ phần mềm','miêu tả môn cnpm'),(4,10,'Lý thuyết thông tin',NULL);
/*!40000 ALTER TABLE `Courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DocumentFiles`
--

DROP TABLE IF EXISTS `DocumentFiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DocumentFiles` (
  `document_file_id` int NOT NULL AUTO_INCREMENT,
  `document_id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `format` enum('pdf','doc','docx','xlsx','png','jpg') COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`document_file_id`),
  KEY `document_id` (`document_id`),
  CONSTRAINT `documentfiles_ibfk_1` FOREIGN KEY (`document_id`) REFERENCES `Documents` (`document_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DocumentFiles`
--

LOCK TABLES `DocumentFiles` WRITE;
/*!40000 ALTER TABLE `DocumentFiles` DISABLE KEYS */;
/*!40000 ALTER TABLE `DocumentFiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Documents`
--

DROP TABLE IF EXISTS `Documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Documents` (
  `document_id` int NOT NULL AUTO_INCREMENT,
  `course_id` int NOT NULL,
  `author_id` int NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `update_at` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `create_at` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`document_id`),
  KEY `course_id` (`course_id`),
  KEY `author_id` (`author_id`),
  CONSTRAINT `documents_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `Courses` (`course_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `documents_ibfk_2` FOREIGN KEY (`author_id`) REFERENCES `Users` (`user_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Documents`
--

LOCK TABLES `Documents` WRITE;
/*!40000 ALTER TABLE `Documents` DISABLE KEYS */;
/*!40000 ALTER TABLE `Documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ForumThreads`
--

DROP TABLE IF EXISTS `ForumThreads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ForumThreads` (
  `forum_thread_id` int NOT NULL AUTO_INCREMENT,
  `course_id` int NOT NULL,
  `author_id` int NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `create_at` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `update_at` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`forum_thread_id`),
  KEY `course_id` (`course_id`),
  KEY `author_id` (`author_id`),
  CONSTRAINT `forumthreads_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `Courses` (`course_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `forumthreads_ibfk_2` FOREIGN KEY (`author_id`) REFERENCES `Users` (`user_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ForumThreads`
--

LOCK TABLES `ForumThreads` WRITE;
/*!40000 ALTER TABLE `ForumThreads` DISABLE KEYS */;
INSERT INTO `ForumThreads` VALUES (1,2,2,'tiêu đề 1','nội dung cho 1','1603957918640','1603957918640'),(2,2,2,'tiêu đề 2','nội dung cho 2','1603957918644','1603957918644'),(3,2,2,'tiêu đề 3','nội dung cho 3','1603957918652','1603957918652'),(4,2,2,'tiêu đề 4','nội dung cho 4','1603957918655','1603957918655'),(5,2,5,'tiêu đề 5','nội dung cho 5','1603957918659','1603957918659'),(6,2,5,'tiêu đề 6','nội dung cho 6','1603957918662','1603957918662'),(7,2,5,'tiêu đề 7','nội dung cho 7','1603957918667','1603957918667'),(8,1,3,'tiêu đề 8','nội dung cho 8','1603957918671','1603957918671'),(9,1,3,'tiêu đề 9','nội dung cho 9','1603957918674','1603957918674'),(10,1,3,'tiêu đề 10','nội dung cho 10','1603957918678','1603957918678'),(11,1,3,'tiêu đề 11','nội dung cho 11','1603957918681','1603957918681'),(12,3,2,'tiêu đề 12','nội dung cho 12','1603957918686','1603957918686'),(13,3,2,'tiêu đề 13','nội dung cho 13','1603957918689','1603957918689');
/*!40000 ALTER TABLE `ForumThreads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SubmissionFiles`
--

DROP TABLE IF EXISTS `SubmissionFiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SubmissionFiles` (
  `submission_file_id` int NOT NULL AUTO_INCREMENT,
  `assignment_submission_id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `format` enum('pdf','doc','docx','xlsx','png','jpg') COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`submission_file_id`),
  KEY `assignment_submission_id` (`assignment_submission_id`),
  CONSTRAINT `submissionfiles_ibfk_1` FOREIGN KEY (`assignment_submission_id`) REFERENCES `AssignmentSubmissions` (`assignment_submission_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SubmissionFiles`
--

LOCK TABLES `SubmissionFiles` WRITE;
/*!40000 ALTER TABLE `SubmissionFiles` DISABLE KEYS */;
/*!40000 ALTER TABLE `SubmissionFiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ThreadPosts`
--

DROP TABLE IF EXISTS `ThreadPosts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ThreadPosts` (
  `thread_post_id` int NOT NULL AUTO_INCREMENT,
  `forum_thread_id` int NOT NULL,
  `author_id` int NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `create_at` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `update_at` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`thread_post_id`),
  KEY `forum_thread_id` (`forum_thread_id`),
  KEY `author_id` (`author_id`),
  CONSTRAINT `threadposts_ibfk_1` FOREIGN KEY (`forum_thread_id`) REFERENCES `ForumThreads` (`forum_thread_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `threadposts_ibfk_2` FOREIGN KEY (`author_id`) REFERENCES `Users` (`user_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ThreadPosts`
--

LOCK TABLES `ThreadPosts` WRITE;
/*!40000 ALTER TABLE `ThreadPosts` DISABLE KEYS */;
/*!40000 ALTER TABLE `ThreadPosts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Users`
--

DROP TABLE IF EXISTS `Users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('Teacher','Student') COLLATE utf8mb4_unicode_ci DEFAULT 'Student',
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birthday` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `picture_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Users`
--

LOCK TABLES `Users` WRITE;
/*!40000 ALTER TABLE `Users` DISABLE KEYS */;
INSERT INTO `Users` VALUES (1,'username1','$2b$10$vtlA5IiGMWYE1.BZW4nthe27b1wlawLiLmt7AmjN79GPYjs9Yw9N6','Student','first 1','last 1',NULL,NULL,NULL,NULL,NULL),(2,'username2','$2b$10$LdsYxRBtfbgpTzgDKf4ILulIwr09iJqapqJzVY8qcRRA/XV7z5o7W','Student','first 2','last 2',NULL,NULL,NULL,NULL,NULL),(3,'username3','$2b$10$UBNataVcGQ83s.GSg2olU.PnTClaO7csL.TgxMWRVj2W.w.N/U5ae','Student',NULL,NULL,'phone 3',NULL,NULL,NULL,NULL),(4,'username4','$2b$10$SGWvfHfcRtBKDnJ/zZYdee43m5XuzprF1jgSSkDvyOwCcZkN6pAhC','Student',NULL,NULL,NULL,'address 4',NULL,NULL,NULL),(5,'username5','$2b$10$mMK2Vxj0EaNF2tpG5IWGi.06Er9.XaFqwED3OoP6g9m7Szf0Bj37C','Student',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(6,'username6','$2b$10$P57DrkdhtNvR9Rkpr5hqv.rgcuGlHEFqokTEYJEphW3bsQjdaoWji','Student',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(7,'username7','$2b$10$aZkdZDpDFMGSoEnqEGY6ZOVymJtcc4ywc64O3qu3wEXiYb9Xzc70q','Student',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(8,'username8','$2b$10$3yfHAhm0MfxZXFnVTkwsxOOL10lUiGP0h1pnfrVVms7cTjL1Cfysy','Student',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(9,'username9','$2b$10$D1T4tELN2rsbnjX4TYduReTzBEFR9OKeHUo1eRytnqBF.2xqTlp0y','Student',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10,'username10','$2b$10$8YORPRDtKN7vHeXaGiCpOeNn.nUZu0ITcb8kyB4pmc/jpooOkcYgK','Teacher',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(11,'username11','$2b$10$04ncysEyTBu/AhJa0hg6bOltLOFhInHJAgscH730zpZOWVt2ybCk6','Teacher',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(12,'username12','$2b$10$EphtuMcOE/R8eqlTEAAZp.qNPl8nk2p.8.0Jdu52G7Z.vquucS2xO','Teacher','ABC','DFF',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `Users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-07 10:14:28
