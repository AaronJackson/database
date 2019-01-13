CREATE TABLE IF NOT EXISTS `doors` (
  `door_id` int(11) NOT NULL,
  `door_description` varchar(100) NOT NULL,
  `door_short_name` varchar(16) NOT NULL,
  `door_state` varchar(10) NOT NULL,
  `door_state_change` datetime NOT NULL,
  `permission_code` varchar(16) DEFAULT NULL,
  `side_a_zone_id` int(11) DEFAULT NULL,
  `side_b_zone_id` int(11) DEFAULT NULL,
  PRIMARY KEY `door_id` (`door_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;