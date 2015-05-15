CREATE TABLE `place` (
  `place_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL DEFAULT '',
  `county` varchar(128) NOT NULL DEFAULT '',
  `latitude` decimal(8,4) NOT NULL DEFAULT '0.0000',
  `longitude` decimal(8,4) NOT NULL DEFAULT '0.0000',
  `grid_east` int(11) NOT NULL DEFAULT '0',
  `grid_north` int(11) NOT NULL DEFAULT '0',
  `search_weight` smallint(5) unsigned NOT NULL DEFAULT '0',
  `landmass_id` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `city_centre` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`place_id`),
  KEY `name` (`name`),
  KEY `city_centre` (`city_centre`)
) ENGINE=InnoDB AUTO_INCREMENT=30905 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `place`
--

--
CREATE TABLE `place_preferred_hotel` (
  `place_id` int(10) unsigned NOT NULL DEFAULT '0',
  `hotel_id` int(10) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `place_id` (`place_id`,`hotel_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `place_preferred_hotel`
--

LOCK TABLES `place_preferred_hotel` WRITE;
/*!40000 ALTER TABLE `place_preferred_hotel` DISABLE KEYS */;
INSERT INTO `place_preferred_hotel` VALUES (8434,205),(8434,206),(8434,207),(8434,353),(8434,394),(8434,418),(8434,419),(8434,428),(8434,543),(8434,546),(16180,155),(29415,311),(29415,513),(29415,574),(29416,311),(29416,513),(29417,311),(29417,513),(29417,574),(29446,260),(29446,271),(29446,513),(29661,260),(29661,271),(29661,311),(29740,311),(29740,513),(29740,574);
/*!40000 ALTER TABLE `place_preferred_hotel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poi_category`
--

