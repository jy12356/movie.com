-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: jspdb1
-- ------------------------------------------------------
-- Server version	5.7.31-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `board`
--

DROP TABLE IF EXISTS `board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `board` (
  `num` int(11) NOT NULL,
  `writer` varchar(20) DEFAULT NULL,
  `pass` varchar(20) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `content` varchar(2000) DEFAULT NULL,
  `readcount` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `modifyDate` datetime DEFAULT NULL,
  `file` varchar(50) DEFAULT NULL,
  `re_ref` int(11) DEFAULT NULL,
  `re_leb` int(11) DEFAULT NULL,
  `re_seq` int(11) DEFAULT NULL,
  PRIMARY KEY (`num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board`
--

LOCK TABLES `board` WRITE;
/*!40000 ALTER TABLE `board` DISABLE KEYS */;
INSERT INTO `board` VALUES (3,'kin','123','영화추천합니다.','영화추천합니다.',4,'2020-09-10 09:33:39','2020-10-12 10:01:01',NULL,NULL,NULL,NULL),(5,'삼성','123','영화추천합니다.','영화추천합니다.',2,'2020-09-10 09:35:14','2020-10-12 10:00:42',NULL,NULL,NULL,NULL),(6,'요일','123','영화추천합니다.','오늘은 목요일',2,'2020-09-10 09:35:28','2020-10-12 10:01:14',NULL,NULL,NULL,NULL),(7,'요일','123','오늘의 영화','오늘의 영화',3,'2020-09-10 09:35:43','2020-10-12 10:01:37',NULL,NULL,NULL,NULL),(8,'itwill','123','java 영화 추천','java',2,'2020-09-10 09:35:55','2020-10-12 10:01:49',NULL,NULL,NULL,NULL),(13,'펭수','123','펭수의 추천','오늘의 영화',44,'2020-09-14 09:59:51','2020-10-12 10:02:04',NULL,NULL,NULL,NULL),(14,'jy12356','123','영화추천','영화추천',109,'2020-09-22 17:42:49','2020-10-12 10:02:25',NULL,NULL,NULL,NULL),(15,'jy12356','123','영화추천','영화추천',3,'2020-09-28 09:24:23','2020-10-12 10:02:38',NULL,NULL,NULL,NULL),(16,'jy12356','123','영화리뷰','test',2,'2020-09-28 09:24:30','2020-10-12 10:02:55',NULL,NULL,NULL,NULL),(17,'jy12356','123','국제수사','국제수사',15,'2020-09-28 09:24:37','2020-10-12 10:03:09',NULL,NULL,NULL,NULL),(18,'jy12356','123','영화리뷰입니다.','영화리뷰입니다.',285,'2020-09-28 09:24:46','2020-10-07 16:32:21',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `cmtNum` int(11) NOT NULL,
  `cmtCnt` varchar(1000) DEFAULT NULL,
  `depthCmt` int(11) DEFAULT NULL,
  `boardNum` int(11) DEFAULT NULL,
  `inxCmt` int(11) DEFAULT NULL,
  `id` varchar(20) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `cmtSubNum` int(11) DEFAULT NULL,
  `contNum` int(11) DEFAULT NULL,
  `isDel` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`cmtNum`),
  KEY `boardNum` (`boardNum`),
  KEY `cmtNumRef` (`cmtSubNum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,'삭제된 댓글입니다.',1,14,0,'admin','2020-09-28 12:04:11',NULL,1,'y'),(3,'testset',1,18,0,'admin','2020-09-28 14:45:44',NULL,1,'n'),(4,'삭제된 댓글입니다.',1,1,0,'admin','2020-10-06 14:15:17',NULL,0,'y'),(5,'영화좋아요',1,10,0,'admin','2020-10-06 16:00:06',NULL,0,'n'),(6,'재밌어요',1,10,0,'admin','2020-10-06 16:00:12',NULL,0,'y'),(7,'test',1,18,0,'admin','2020-10-07 15:36:14',NULL,1,'n'),(8,'안안안안안',1,18,0,'admin','2020-10-07 15:36:21',NULL,1,'n'),(9,'안안안녕',2,18,0,'admin','2020-10-07 15:43:41',8,1,'n'),(10,'안녕하',2,18,0,'admin','2020-10-07 15:49:56',3,1,'n'),(12,'안녕gktpdy',1,18,0,'jy12356','2020-10-07 16:27:13',NULL,1,'y'),(13,'안녕?\r\n',1,18,0,'jy12356','2020-10-07 16:39:35',NULL,1,'y'),(14,'아안녕?\r\n',2,18,0,'jy12356','2020-10-07 16:39:45',13,1,'y'),(18,'test11111!!!!!\r\n',1,10,0,'jy12356','2020-10-08 09:50:19',NULL,0,'y'),(20,'삭제된댓글 알려주실분',2,20,0,'jy12356','2020-10-12 10:13:31',19,1,'y'),(21,'추천합니다.',1,17,0,'admin','2020-10-12 11:08:48',NULL,1,'n'),(22,'동의합니다.',2,17,0,'admin','2020-10-12 11:09:01',21,1,'n'),(23,'추천합니다.',1,8,0,'admin','2020-10-12 12:41:29',NULL,0,'n'),(24,'추천합니다.',1,8,0,'admin','2020-10-12 12:46:43',NULL,0,'n'),(25,'123\r\n',1,1,0,'admin','2020-10-12 13:49:52',NULL,0,'n'),(26,'123',1,1,0,'admin','2020-10-12 13:49:55',NULL,0,'n');
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genre`
--

DROP TABLE IF EXISTS `genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genre` (
  `gCode` varchar(20) NOT NULL,
  `gName` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`gCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genre`
--

LOCK TABLES `genre` WRITE;
/*!40000 ALTER TABLE `genre` DISABLE KEYS */;
INSERT INTO `genre` VALUES ('ac','액션'),('an','애니메이션'),('cm','코미디'),('dr','드라마'),('hr','공포'),('rm','로맨스'),('sf','SF');
/*!40000 ALTER TABLE `genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member` (
  `id` varchar(20) NOT NULL,
  `pass` varchar(20) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `mobile` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES ('admin','123','관리자1','2020-09-17 10:12:38',NULL,NULL,'admin@moviedotcom.co.kr','13473/경기 성남시 분당구 경부고속도로 409/508호','0277777777','01077777777'),('jy12356','123','서지연','2020-09-02 14:15:13',NULL,NULL,'jy12356@naver.com','13473/경기 성남시 분당구 경부고속도로 409/606호','01012345678','01012345678');
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie`
--

DROP TABLE IF EXISTS `movie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movie` (
  `num` int(11) NOT NULL,
  `title` varchar(20) DEFAULT NULL,
  `thumImg` varchar(20) DEFAULT NULL,
  `genre` varchar(20) DEFAULT NULL,
  `spectator` int(11) DEFAULT NULL,
  `runtime` varchar(20) DEFAULT NULL,
  `openDate` varchar(20) DEFAULT NULL,
  `director` varchar(20) DEFAULT NULL,
  `cast` varchar(1000) DEFAULT NULL,
  `grade` decimal(3,2) DEFAULT NULL,
  `depTitle` varchar(1000) DEFAULT NULL,
  `content` varchar(1000) DEFAULT NULL,
  `recommend` int(11) DEFAULT NULL,
  `pass` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`num`),
  KEY `genre` (`genre`),
  KEY `spectator` (`spectator`),
  CONSTRAINT `movie_ibfk_1` FOREIGN KEY (`genre`) REFERENCES `genre` (`gCode`),
  CONSTRAINT `movie_ibfk_2` FOREIGN KEY (`spectator`) REFERENCES `spectator` (`sCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie`
--

LOCK TABLES `movie` WRITE;
/*!40000 ALTER TABLE `movie` DISABLE KEYS */;
INSERT INTO `movie` VALUES (1,'담보','mv915.jpg','dr',1,'113','2020-09-29','강대규 ','성동일(두석), 하지원(승이), 김희원(종배), 박소이(어린승이)',9.45,'빚 떼려다 혹 붙였다! 책임지고 받아 키워 드립니다!','1993년 인천\r\n거칠고 까칠한 사채업자 두석(성동일)과 종배(김희원)는\r\n떼인 돈 받으러 갔다가 얼떨결에 9살 승이(박소이)를 담보로 맡게 된다.\r\n\r\n“담보가 무슨 뜻이에요?”\r\n\r\n뜻도 모른 채 담보가 된 승이와 승이 엄마의 사정으로 아이의 입양까지 책임지게 된 두석과 종배.\r\n하지만 부잣집으로 간 줄 알았던 승이가 엉뚱한 곳에 있다는 것을 알게 된 두 사람은\r\n승이를 데려와 돌보게 된다.\r\n\r\n예고 없이 찾아온 아이에게 인생을 담보 잡힌 두석과 종배.\r\n빚 때문에 아저씨들에게 맡겨진 담보 승이.\r\n두석, 종배, 승이 세 사람은 어느덧 서로에게 특별한 존재가 되는데..\r\n\r\n돈 받으러 갔다가 인생의 보물을 만났다!\r\n올 가을, 담보가 보물이 됩니다!',20,'123'),(3,'언힌지드','mv1111.jpg','hr',0,'90','2020-10-07','데릭보트','러셀 크로우(더 맨), 카렌 피스토리우스(레이첼), 가브리엘 베이트먼(카일), 지미심슨(앤드), 오스틴P.맥켄지(프레드), 앤레이턴(데보라),루시포스트(로지), 스티븐루이스(레오)',8.87,'월요일 아침, 학교에 늦은 아들을 데려다 주고 출근을 해야하는 레이첼.','꽉 막힌 도로, 직진 신호가 되었는데도 앞 차가 움직일 생각을 하지 않는다.\r\n 짜증이 난 레이첼은 필요 이상으로 경적을 크게 울리고, 앞 차의 운전자는 그녀의 무례한 행동에 사과를 요구한다.\r\n 이를 무시한 채 그녀는 황급히 자리를 벗어나지만, 앞에 있던 차가 그녀를 따라오기 시작한다.\r\n \r\n 그리고 곧 레이첼은 무서운 사실을 알게 된다.\r\n 그녀로 인해 분노가 폭발한 남자가 자신뿐 아니라 친구와 가족, 그리고 아들까지\r\n 노리고 있다는 것을...',0,''),(4,'테스와 보낸 여름','mv41.jpg','dr',0,'84','2020-09-10','스티븐 바우터루드','소니 코프스 판 우테렌(샘), 조세핀 아렌센(테스), 트에보 게리츠마(샘 아버지), 제니퍼 호프만(테스 어머니 역)',8.84,'세상 진지한 4차원 소년 ‘샘’ X 저세상 텐션 5차원 소녀 ‘테스’','엉뚱한 소년 ‘샘’은 가족과 함께 떠난 바닷가 휴양지에서도 죽음에 대해 고민하는 중이다.\r\n 지구에 남은 마지막 공룡은 어떤 마음이었을까 상상하던 ‘샘’은\r\n  언젠가 혼자 남겨질 경우를 대비해 ‘외로움 적응 훈련’에 돌입한다.\r\n 그런데 섬에서 만난 소녀 ‘테스’로 인해 계획에 차질이 생기기 시작한다.\r\n 첫 만남에 다짜고짜 살사 춤을 추자고 하는 더 엉뚱한 소녀 ‘테스’는\r\n  어디로 튈지 알 수 없는 행동으로 ‘샘’을 놀라게 한다.\r\n 그러던 중 어른들은 모르는 ‘테스’의 비밀스러운 계획을 알게 된 ‘샘’은 이에 동참하게 되는데…\r\n 얼마 남지 않은 여름의 끝, 그전에 미션을 수행해야 한다!\r\n \r\n 혼자도 좋지만… 함께여서 더욱 좋은!\r\n ‘샘’과 ‘테스’의 인생을 건 여름 프로젝트가 시작된다!',1,'1234'),(5,'애프터: 그 후','mv123.jpg','cm',2,'105','2020-10-07','로저 컴블','히어로 파인즈 티핀(하딘), 조세핀 랭포드(테사), 딜란 스프로즈(트레버), 루이스롬바드, 찰리웨버, 셀마블레어, 캔디스아콜라, 아난나사키스, 피아미아, 셰인폴맥기',9.06,'거부할 수 없는 마성의 캠퍼스 전남친 VS 젠틀하게 선 넘는 직장인 남사친','당신의 연애 판타지를 채워줄 빨간맛 삼각 로맨스!\r\n\"너만의 테사는 더 이상 없어!\"\r\n 첫사랑 하딘이 자신과의 연애를 내기에 걸었다는 비밀을 알게 된 \'테사\'\r\n 둘은 헤어지지만 서로의 살결과 숨결을 끊지 못하며 아슬아슬한 썸을 이어간다.\r\n \r\n 이후 대학 졸업을 앞둔 취준생 테사는 대형 출판사의 인턴십에 합격하고\r\n 거친 하딘과는 180도 다른 젠틀한 직장 남사친 \'트레버\'를 만나게 된다.\r\n \r\n \"테사의 두 번째 남자를 만났다\"\r\n 런던으로 떠나기 전에 테사를 향한 진심을 전하고 싶었던 \'하딘\'\r\n 테사의 용서를 기다리며 과거의 잘못을 하나씩 고쳐나간다.\r\n \r\n 워크숍 파티에서 취한 테사의 연락에 하딘은 기대 반, 걱정 반 마음으로\r\n 결국 테사의 호텔 룸에 찾아가고, 샤워실에서 그녀석 \'트레버\'와 마주치는데…',0,'1234'),(7,'다만 악에서 구하소서','mv141.jpg','hr',0,'108','2020-08-05','홍원찬','황정민(인남), 이정재(레이), 박정민(유이), 박소이(유민), 최희서(영주), 박명훈(사만다), 오대환(한종수), 송영창(춘성), 이서환(영배), 심영은 (린린)',8.56,'태국에서 충격적인 납치사건이 발생하고','마지막 청부살인 미션을 끝낸 암살자 인남(황정민)은 그것이 자신과 관계된 것임을 알게 된다.\r\n 인남은 곧바로 태국으로 향하고, 조력자 유이(박정민)를 만나 사건을 쫓기 시작한다.\r\n 한편, 자신의 형제가 인남에게 암살당한 것을 알게 된 레이(이정재).\r\n 무자비한 복수를 계획한 레이는 인남을 추격하기 위해 태국으로 향하는데...\r\n \r\n 처절한 암살자 VS 무자비한 추격자\r\n 멈출 수 없는 두 남자의 지독한 추격이 시작된다!',0,'1234'),(8,'test','mv124.jpg','cm',0,'111','2020-09-29','강대규','출연성동일(두석), 하지원(승이), 김희원(종배), 박소이(어린승이)',9.45,'빚 떼려다 혹 붙였다! 책임지고 받아 키워 드립니다!','빚 떼려다 혹 붙였다! 책임지고 받아 키워 드립니다!',0,'123');
/*!40000 ALTER TABLE `movie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notice`
--

DROP TABLE IF EXISTS `notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notice` (
  `num` int(50) NOT NULL,
  `writer` varchar(20) DEFAULT NULL,
  `pass` varchar(20) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `content` varchar(2000) DEFAULT NULL,
  `readcount` int(100) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `modifyDate` datetime DEFAULT NULL,
  `fileName1` varchar(50) DEFAULT NULL,
  `fileName2` varchar(50) DEFAULT NULL,
  `file` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notice`
--

LOCK TABLES `notice` WRITE;
/*!40000 ALTER TABLE `notice` DISABLE KEYS */;
INSERT INTO `notice` VALUES (1,'무비닷컴','123','무비닷컴이용방법입니다.','무비닷컴이용방법입니다.',1,'2020-10-12 11:13:01','2020-10-12 11:13:01','무비닷컴이용방법입니다.1.txt',NULL,NULL);
/*!40000 ALTER TABLE `notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recomendchk`
--

DROP TABLE IF EXISTS `recomendchk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recomendchk` (
  `id` varchar(20) DEFAULT NULL,
  `boardNum` int(11) DEFAULT NULL,
  `rocommendYN` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recomendchk`
--

LOCK TABLES `recomendchk` WRITE;
/*!40000 ALTER TABLE `recomendchk` DISABLE KEYS */;
INSERT INTO `recomendchk` VALUES ('jy12356',1,'y'),('jy12356',1,'y'),('jy12356',1,'y'),('jy12356',1,'y'),('jy12356',1,'y'),('jy12356',1,'y');
/*!40000 ALTER TABLE `recomendchk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spectator`
--

DROP TABLE IF EXISTS `spectator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spectator` (
  `sCode` int(11) NOT NULL,
  `sName` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`sCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spectator`
--

LOCK TABLES `spectator` WRITE;
/*!40000 ALTER TABLE `spectator` DISABLE KEYS */;
INSERT INTO `spectator` VALUES (0,'전체관람가'),(1,'12세관람가'),(2,'15세관람가'),(3,'19세관람가');
/*!40000 ALTER TABLE `spectator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `num` int(11) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (2,'kim'),(3,'lee'),(4,'이순신'),(5,'kin'),(6,'park');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-12 15:42:51
