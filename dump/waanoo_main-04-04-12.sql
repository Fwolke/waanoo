-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 05, 2012 at 12:47 AM
-- Server version: 5.5.16
-- PHP Version: 5.3.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `waanoo_2`
--

-- --------------------------------------------------------

--
-- Table structure for table `attendees`
--

CREATE TABLE IF NOT EXISTS `attendees` (
  `attend_id` int(20) NOT NULL AUTO_INCREMENT,
  `event_id` int(20) NOT NULL,
  `user_id` int(20) NOT NULL,
  PRIMARY KEY (`attend_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `event_address`
--

CREATE TABLE IF NOT EXISTS `event_address` (
  `address_id` int(20) NOT NULL AUTO_INCREMENT,
  `event_id` int(20) NOT NULL,
  `address_text` varchar(255) NOT NULL,
  `x_coord` float(10,6) NOT NULL,
  `y_coord` float(10,6) NOT NULL,
  PRIMARY KEY (`address_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `event_address`
--

INSERT INTO `event_address` (`address_id`, `event_id`, `address_text`, `x_coord`, `y_coord`) VALUES
(1, 5, '3024 Harrison Ave, Cincinnati, OH 45211, USA', 39.148857, -84.598358),
(2, 6, '8521 Ridge Rd, Cincinnati, OH 45236, USA', 39.215958, -84.426826),
(3, 7, '3040 Harrison Ave, Cincinnati, OH 45211, USA', 39.149223, -84.598038),
(10, 14, '2900 Affirmed Dr, Addyston, OH 45001, USA', 39.143604, -84.715668);

-- --------------------------------------------------------

--
-- Table structure for table `event_images`
--

CREATE TABLE IF NOT EXISTS `event_images` (
  `image_id` int(20) NOT NULL AUTO_INCREMENT,
  `event_id` int(20) NOT NULL,
  `image_url` varchar(100) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date_uploaded` datetime NOT NULL,
  `list_order` int(3) NOT NULL,
  `active` int(1) NOT NULL,
  PRIMARY KEY (`image_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `user_events`
--

CREATE TABLE IF NOT EXISTS `user_events` (
  `event_id` int(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(20) NOT NULL,
  `event_title` varchar(100) NOT NULL,
  `event_description` varchar(500) NOT NULL,
  `end_date` datetime NOT NULL,
  `start_date` datetime NOT NULL,
  `date_created` datetime NOT NULL,
  `public` int(1) NOT NULL,
  PRIMARY KEY (`event_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `user_events`
--

INSERT INTO `user_events` (`event_id`, `user_id`, `event_title`, `event_description`, `end_date`, `start_date`, `date_created`, `public`) VALUES
(7, 1, 'Party Time MOTHAFUCKAS', 'This event will be so super tight that it will be tight. ', '2012-04-06 20:45:00', '2012-04-08 20:45:00', '2012-03-31 20:45:55', 1),
(6, 1, 'Custom Party', 'Testing', '2012-03-31 00:48:00', '2012-04-02 00:48:00', '2012-03-29 00:48:53', 1),
(5, 1, 'Derp', 'derp', '2012-03-30 00:31:00', '2012-03-31 00:31:00', '2012-03-29 00:35:19', 1),
(14, 1, 'The best thing ever', 'Derp derp derp derp. Really should paste some Lorem Ipsum in here but whatev. test', '2012-04-19 17:48:00', '2012-04-28 17:48:00', '2012-04-02 17:48:54', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_images`
--

CREATE TABLE IF NOT EXISTS `user_images` (
  `image_id` int(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(20) NOT NULL,
  `image_url` int(100) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date_uploaded` datetime NOT NULL,
  `active` int(1) NOT NULL,
  PRIMARY KEY (`image_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `user_list`
--

CREATE TABLE IF NOT EXISTS `user_list` (
  `user_id` int(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(35) NOT NULL,
  `password` varchar(50) NOT NULL,
  `first_name` varchar(15) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `date_added` datetime NOT NULL,
  `last_login` datetime NOT NULL,
  `last_ip` varchar(20) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `user_list`
--

INSERT INTO `user_list` (`user_id`, `email`, `password`, `first_name`, `last_name`, `date_added`, `last_login`, `last_ip`) VALUES
(1, 'lol@lol.com', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'hurr', 'durr', '0000-00-00 00:00:00', '2012-04-04 17:45:22', '127.0.0.1'),
(2, 'lol@lol.com2', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'derp', 'derp', '2012-03-26 04:40:18', '2012-03-26 19:39:34', '127.0.0.1'),
(3, 'derp@derp.com', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'aaron', 'derp', '2012-03-26 04:42:19', '0000-00-00 00:00:00', ''),
(4, 'derp@derp.com3', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'aaron', 'derp', '2012-03-26 04:44:36', '0000-00-00 00:00:00', '');

-- --------------------------------------------------------

--
-- Table structure for table `YQL_events`
--

CREATE TABLE IF NOT EXISTS `YQL_events` (
  `event_id` int(20) NOT NULL AUTO_INCREMENT,
  `yql_id` int(20) NOT NULL,
  `event_title` varchar(255) NOT NULL,
  `event_description` varchar(500) NOT NULL,
  `end_date` datetime NOT NULL,
  `start_date` datetime NOT NULL,
  `date_created` datetime NOT NULL,
  `public` int(1) NOT NULL,
  `price` float(5,2) NOT NULL,
  `country_name` varchar(100) NOT NULL,
  `venue_name` varchar(100) NOT NULL,
  `url_link` varchar(150) NOT NULL,
  `venue_state` varchar(30) NOT NULL,
  `venue_zip` varchar(10) NOT NULL,
  PRIMARY KEY (`event_id`),
  UNIQUE KEY `yql_id` (`yql_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=116 ;

--
-- Dumping data for table `YQL_events`
--

INSERT INTO `YQL_events` (`event_id`, `yql_id`, `event_title`, `event_description`, `end_date`, `start_date`, `date_created`, `public`, `price`, `country_name`, `venue_name`, `url_link`, `venue_state`, `venue_zip`) VALUES
(51, 8744007, 'Derek Webb and Sandra McCracken', 'Singer/songwriter Derek Webb continues to make iconoclastic, irresistible, radio-ready pop records about love and war and social justice. However, unlike most pop artists on the scene today, Webb''s engaged, committed fan-base is constantly expanding - in part because Derek Webb has a tendency to give his music away for free.  In 2006, Webb convinced his label, INO Records / Columbia Records, to give away over 80,000 free downloads of his critically acclaimed album, MOCKINGBIRD. This widely publi', '2012-03-24 05:03:00', '2012-03-24 02:03:00', '2012-02-10 05:02:50', 1, 0.00, 'United States', 'Jammin Java', 'http://jamminjava.3dcartstores.com/product.asp?itemid=1840', '', ''),
(52, 8530315, 'Kathy Griffin', 'Kathy Griffin, stand-up comedian, actress, author and television personality best known for her reality show Kathy Griffin: My Life on the D-List. The double Emmy winning Chicago native is a multi-faceted performer with a rapid-fire wit. In Australia she is probably most recognisable for her four-year stint on the NBC sitcom "Suddenly Susan" as Vickie Groener, Brooke Shields'' acerbic colleague. Kathy also had a recurring guest role on Seinfeld as the character Sally Weaver. Famous for her signat', '2012-03-24 06:03:00', '2012-03-24 03:03:00', '2011-10-26 10:10:49', 1, 0.00, 'United States', 'Wilbur Theatre - MA', 'http://www.ticketmaster.com/event/010046B9851F70B8?camefrom=cfc_boswilbur_fl', '', ''),
(53, 8162210, 'Kathy Griffin', 'Event: Kathy Griffin<br>Venue: Wilbur Theatre - MA<br>Start: 3/23/2012 10:00:00 PM<br>Category: CONCERTS COMEDY', '2012-03-24 06:03:00', '2012-03-24 03:03:00', '2011-06-25 10:06:29', 1, 0.00, 'United States', 'Wilbur Theater', 'http://upcomingevents.net/search/redirect/1639064', '', ''),
(57, 8760463, 'Fiona Apple', 'Event: Fiona Apple<br>Venue: Royale Boston<br>Start: 3/27/2012 3:30:00 AM<br>Category: CONCERTS ALTERNATIVE', '2012-03-27 12:03:00', '2012-03-27 09:03:00', '2012-02-24 12:02:04', 1, 0.00, 'United States', 'Royale Boston', 'http://upcomingevents.net/search/redirect/1835659', 'Massachusetts', '02116'),
(56, 8635945, 'Needtobreathe', 'Event: Needtobreathe<br>Venue: Royal Oak Music Theatre<br>Start: 3/27/2012 3:30:00 AM<br>Category: CONCERTS POP / ROCK', '2012-03-27 12:03:00', '2012-03-27 09:03:00', '2012-01-07 13:01:03', 1, 0.00, 'United States', 'Royal Oak Music Theatre', 'http://upcomingevents.net/search/redirect/1775890', 'Michigan', '48067'),
(58, 8791734, '"The Boy, the Uncle, the Jews and the Monk: Norwich 1144 and Its Afterlives" - Miri Rubin, Queen Mar', 'Center for Medieval Studies Colloquium Series 1210 Heller Hall  Miri Rubin is a Professor of History at Queen Mary, University of London where her interests cover a wide range of social relations within the predominantly religious cultures of Europe between 1100-1600. She has found anthropological approaches and an understanding of textuality and visual imagery to be invaluable tools for the appreciation of the complex meanings of ritual, gender, power and community life. Some of her most recent', '2012-03-28 02:03:00', '2012-03-27 23:03:00', '2012-03-20 19:03:42', 1, 0.00, 'United States', 'Heller Hall, University of Minnesota', '', 'Minnesota', '55455'),
(59, 8715545, '7 in Heaven''s Singles FREE MINGLE Psychic Readings Karaoke', 'Starting at 5:30pm Held every last Tuesday of the month, this FREE group gathering has 50+ singles in attendance for this event. The BRICKYARD is a fun place located inside the Holiday Inn Hotel and easy to get to, a central location in Suffolk County. Happy hour drink specials and KARAOKE entertainment starts at 7pm. 7 in Heaven Singles Events  hosts Speed Dating Parties here the first SAT of the month in this hotel too! BONUS OPTIONAL ENTERTAINMENT -  Psychic Readings! available ($20 per readi', '2012-03-28 02:03:00', '2012-03-27 23:03:00', '2012-01-29 12:01:37', 1, 0.00, 'United States', 'Holiday Inn Ronkonkoma', '', 'New York', '11779'),
(60, 8768476, 'Download Zone Workshop', 'We will offer a Download Zone (DZ) audiobook and eBook class in the computer lab.  Learn how to use DZ to search for and place holds on audiobooks and eBooks.  The class will include a demonstration on how to download an eBook and audiobook from DZ.  You will also learn how to create a wish list in DZ.  Registration is required.  To register, stop by or call the Information Desk at 778-6451.', '2012-03-28 02:03:00', '2012-03-27 23:03:00', '2012-03-02 06:03:45', 1, 0.00, 'United States', 'Broome County Public Library', '', 'New York', '13901'),
(61, 8632326, 'Cooking Class - Asian Flavors of Thailand', 'Fun and informative cooking classes in Grand Haven. Click the link below for class description, information and registration.', '2012-03-28 03:03:00', '2012-03-28 00:03:00', '2012-01-04 12:01:47', 1, 0.00, 'United States', 'real cool cooking school at Bekins', '', 'Michigan', '49417'),
(62, 8611601, 'American Heart Association BLS Healthcare Provider Cpr Certification Class - Kansas City MO Metro Ar', 'BLS for Healthcare Providers Course Description: The Basic Life Support (BLS) for Healthcare Providers Course is designed to provide a wide variety of healthcare professionals the ability to recognize several life-threatening emergencies, provide CPR, use an AED, and relieve choking in a safe, timely and effective manner. Covers adult, child and infant modules.   Intended Audience: This is the class that is required for nurses, physicians, EMS professionals, students in a healthcare program at a', '2012-03-28 03:03:00', '2012-03-28 00:03:00', '2011-12-21 12:12:16', 1, 0.00, 'United States', 'Drury Inn & Suites Meeting Room', '', 'Kansas', '66202'),
(63, 8228978, 'Montreal Canadiens vs. Florida Panthers', 'Event: Montreal Canadiens vs. Florida Panthers<br>Venue: Centre Bell<br>Start: 3/27/2012 7:30:00 PM<br>Category: SPORTS HOCKEY', '2012-03-28 04:03:00', '2012-03-28 01:03:00', '2011-07-18 15:07:00', 1, 0.00, 'Canada', 'Bell Centre', 'http://upcomingevents.net/search/redirect/1672014', 'Quebec', 'H3B 5E8'),
(64, 8188701, 'Moscow Festival Ballet - Cinderella', 'Event: Moscow Festival Ballet - Cinderella<br>Venue: University At Buffalo Center For The Arts<br>Start: 3/27/2012 7:30:00 PM<br>Category: THEATRE BALLET', '2012-03-28 04:03:00', '2012-03-28 01:03:00', '2011-07-02 10:07:58', 1, 0.00, 'United States', 'University at Buffalo Center for the Arts', 'http://upcomingevents.net/search/redirect/1673661', 'New York', '14260'),
(65, 8504633, 'Jersey Boys', 'Event: Jersey Boys<br>Venue: Miller Auditorium - Western Michigan University<br>Start: 3/27/2012 7:30:00 PM<br>Category: THEATRE MUSICAL / PLAY', '2012-03-28 04:03:00', '2012-03-28 01:03:00', '2011-10-06 15:10:14', 1, 0.00, 'United States', 'Western Michigan University - James W Miller Auditorium', 'http://upcomingevents.net/search/redirect/1682623', 'Michigan', '49008'),
(66, 8202394, 'The Parchman Hour', 'Mike Wiley Productions presents a powerful account of the struggle of the â€œFreedom Riders.â€', '2012-03-28 04:03:00', '2012-03-28 01:03:00', '2011-07-07 14:07:38', 1, 0.00, 'United States', 'J.E. Broyhill Civic Center', 'http://www.broyhillcenter.com', 'North Carolina', '28645'),
(67, 8495164, '''Moulin Rouge - The Ballet'' presented by the Royal Winnipeg Ballet', 'Premiered in 2009, Moulin RougeÂ® - The Ballet is an original burlesque-inspired storybook ballet with irrepressible â€œGay Pareeâ€ style, razzle-dazzle dancing, eye-popping costumes, twinkling sets and a score made up of well-known French music. Along with a rousing soundtrack featuring Offenbach, Ravel, Strauss, Debussy and a dash of Piazzolla, the ballet features high-kicking choreography and a passionate story of love, ambition and heartbreak. â€œThe Royal Winnipeg Ballet is the first compa', '2012-03-28 04:03:00', '2012-03-28 01:03:00', '2011-09-28 12:09:09', 1, 0.00, 'United States', 'Center College - Norton Center for the Arts', 'http://www.nortoncenter.com/upcoming-schedule/1-the-newlin-hall-series/207-moulin-rouge-the-ballet', 'Kentucky', '40422'),
(68, 8719095, 'Mac Miller', 'Event: Mac Miller<br>Venue: Scope<br>Start: 3/27/2012 7:30:00 PM<br>Category: CONCERTS ALTERNATIVE', '2012-03-28 04:03:00', '2012-03-28 01:03:00', '2012-01-31 10:01:18', 1, 0.00, 'United States', 'Scope Arena', 'http://upcomingevents.net/search/redirect/1814696', 'Virginia', '23510'),
(69, 8162625, 'Million Dollar Quartet', 'Event: Million Dollar Quartet<br>Venue: State Theatre - MN<br>Start: 3/27/2012 7:30:00 PM<br>Category: THEATRE MUSICAL / PLAY', '2012-03-28 05:03:00', '2012-03-28 02:03:00', '2011-06-25 12:06:16', 1, 0.00, 'United States', 'Brave New Workshop Comedy Theatre', 'http://upcomingevents.net/search/redirect/1584498', 'Minnesota', '55408'),
(70, 8758218, 'PopGun Presents... Big Scary, NewVillager, The Echo Friendly, Elvis Depressedly', '21+', '2012-03-28 05:03:00', '2012-03-28 02:03:00', '2012-02-22 09:02:47', 1, 0.00, 'United States', 'Glassland Gallery', '', 'New York', '11122'),
(71, 8765522, 'Jim Lauletta''s Comedy Showcase @ Dick''s Beantown Comedy Vault', 'A favorite act wherever he goes, Jim mixes his cynical, biting, self-deprecating material with some of the most off the wall off the wall and original impressions you''ll EVER see. Quoted by the Boston Globe as "...off-beat and original.". Not only is Jim one of the most popular headliners in New England, he''s a regular performer in Las Vegas and Atlantic City! Jim also has an impressive resume of national television credits which include: HBO''s U.S. Comedy Arts Festival''s "Best of the Fest", NBC', '2012-03-28 05:03:00', '2012-03-28 02:03:00', '2012-02-29 16:02:54', 1, 0.00, 'United States', 'Dick''s Beantown Comedy Vault at Remington''s Restaurant', 'http://www.beantowncomedy.com', 'Massachusetts', '02116'),
(72, 8479992, 'Bring It On', 'Event: Bring It On<br>Venue: Fabulous Fox Theatre - MO<br>Start: 3/27/2012 8:00:00 PM<br>Category: THEATRE MUSICAL / PLAY', '2012-03-28 06:03:00', '2012-03-28 03:03:00', '2011-09-16 13:09:34', 1, 0.00, 'United States', 'The Fabulous Fox Theatre', 'http://upcomingevents.net/search/redirect/1626529', 'Missouri', '63103'),
(73, 8774146, 'Anthony Morrison Free Event Coming to New Jersey!', 'This is your chance to learn how to gain financial freedom in today''s economy in a FREE 90 minute seminar. Anthony Morrison, close to bankruptcy himself, turned to the internet to support his family. He now owns this multimillion dollar company and wants to share his secrets with you! The seminar will teach you how to generate income online with no technical experience, learn the power of social networking, and see how easy it is to run this entire system- from anywhere in the world. Look at the', '2012-04-03 03:04:00', '2012-04-03 00:04:00', '2012-03-07 13:03:21', 1, 0.00, 'United States', 'DoubleTree by Hilton Hotel Princeton', '', 'New Jersey', '08540'),
(74, 8793581, 'Skillshare: Public Speaking', 'Does the thought of speaking in public make you weak in the knees? Are you looking for ways to bolster your public speaking skills and wow your audiences? Join Socializing for Justice for our next skillshare on Public Speaking on April 2nd from 6:00 - 8:30 PM.  RSVP at http://www.sojust.org - newcomers always welcomed!  Cost: $10-$20 (sliding scale) collected at the door.  SoJust hosts events that draw progressives of all stripes that share common values but may work on different issues. We host', '2012-04-03 03:04:00', '2012-04-03 00:04:00', '2012-03-22 19:03:45', 1, 0.00, 'United States', 'Third Sector New England''s Nonprofit Center', '', 'Massachusetts', '02111'),
(75, 8798299, 'Minnesota Virtual Academy Information Session', 'Join an MNVA teacher to learn more about the Minnesota Virtual Academy program. Visit with our teacher and other families get your questions answered, and learn more about virtual public school options available to Minnesota families.   Please visit our website to register. We look forward to meeting you!', '2012-04-03 03:04:00', '2012-04-03 00:04:00', '2012-03-29 16:03:31', 1, 0.00, 'United States', 'Dunn Brothers Coffee', '', 'Minnesota', '55812'),
(76, 8797530, 'Carrie Manolakos album release concert  w/ Chris Ayer and Grace Weber', 'Carrie Manolakos album release concert Carrie Manolakos is not afraid of 2012. Sheâ€™s been waiting for it. As both singer and songwriter her music is a powerful celebration of the human spirit. April 2nd marks the release of her debut album, Echo, a lyrical blend of pop, soul and folk. Her sound dances with the stars of Sara Bareilles and Joni Mitchell, with kiss blown to Jeff Buckley, but a voice that is unmistakably hers alone. This Syracuse native stays true to her New York roots, both in so', '2012-04-03 03:04:00', '2012-04-03 00:04:00', '2012-03-28 13:03:27', 1, 0.00, 'United States', '(le) poisson rouge', '', 'New York', '10013'),
(77, 8770261, 'April Fools Stand-Up Show', 'Jammin'' Java introduces its first ever April Fools comedy event with Adam Belcher, Benjamin Daniels, Aaron Dee, Courtney Fearrington, Philippe Schaffer, and host Drey Dailey. Join a veritable who''s who of no one you have ever heard of to laugh your face off. Add enough social lubricant at our pre-show party and you just might wet your pants. Leave the children at home.', '2012-04-03 03:04:00', '2012-04-03 00:04:00', '2012-03-04 15:03:51', 1, 0.00, 'United States', 'Jammin Java', '', 'Virginia', '22180'),
(78, 8781822, '8minuteDating Speed Dating Event at The Fez', 'Join us at 8minuteDating''s newest venue - The ultra hip and happening Fez!   Youâ€™re going to love this event! Wait â€˜til you see the spread of apps and drink specials. Plus weâ€™ve got door prizes for everyone so you wonâ€™t walk out empty handed and you will not be disappointed!   Of course, the main event is a room full of singles, your age, who are just dying to meet someone as attractive and appealing as you!  Youâ€™ll have pre-mingling, then 8 Great Dates, and then everyone is invited to', '2012-04-03 03:04:00', '2012-04-03 00:04:00', '2012-03-16 19:03:24', 1, 0.00, 'United States', 'The Fez', '', 'Connecticut', '06901'),
(79, 8793216, 'OCDP "People Over Politics" - Affordable Care Act Forum', 'The Oklahoma County Democratic Party (OCDP) is hosting a health care forum to discuss the Affordable Care Act. The event, â€œPeople Over Politics: What You Should Know About the Affordable Care Act,â€ will be held on Monday, April 2, from 5:30 to 8 p.m. at the Local 1141 IBEW Union Hall, 1700 SE 15 St., in Oklahoma City.  Special guest speaker for the event will be retired US Air Force Colonel Katherine Scheirman, MD. Scheirman is the Oklahoma State Director for the eventâ€™s co-sponsor, Doctor', '2012-04-03 03:04:00', '2012-04-03 00:04:00', '2012-03-22 13:03:45', 1, 0.00, 'United States', 'IBEW Local 1141', '', 'Oklahoma', '73129'),
(80, 8772843, 'Mitch Stinson''s Weekend Extender @ Dick''s Beantown Comedy Vault', 'Mitch Stinson is a former aircraft-carrier aviator for the United States Navy who, as a pilot, made over 200 carrier landings during his 10 year military career. Mitch has recently risen through the comedy ranks in the Northeast US by virtue of his original (and clean!) material that offers unique insight into the transition from hot-shot Navy pilot to everyday civilian life, resonating with comedy crowds everywhere.  Dick''s Beantown Comedy Vault @ Remington''s Restaurant Located at 124 Boylston ', '2012-04-03 05:04:00', '2012-04-03 02:04:00', '2012-03-06 13:03:38', 1, 0.00, 'United States', 'Dick''s Beantown Comedy Vault at Remington''s Restaurant', 'http://www.beantowncomedy.com', 'Massachusetts', '02116'),
(81, 8781481, 'Kevin James', 'Event: Kevin James<br>Venue: Ryman Auditorium<br>Start: 4/2/2012 7:30:00 PM<br>Category: CONCERTS COMEDY', '2012-04-03 05:04:00', '2012-04-03 02:04:00', '2012-03-16 12:03:25', 1, 0.00, 'United States', 'Ryman Auditorium', 'http://upcomingevents.net/search/redirect/1824087', 'Tennessee', '37219'),
(82, 8792344, 'T.G.I. Fridayâ€™sÂ® College Basketball Game-Watch Party', 'T.G.I. Fridayâ€™sÂ® is feeding the excitement of basketball in March by hosting game-watch parties for college basketballâ€™s biggest tournament.  T.G.I. Fridayâ€™s will be the go-to destination to watch the tournament for alumni groups, friends and fans. Throughout the tournament, T.G.I. Fridayâ€™s will be hosting a Fandemonium party for guests with a game-like atmosphere including Pop-A-Shot games, halftime flairtending entertainment, basketball trivia and chances to score fun mini-prizes.  Fo', '2012-04-03 06:04:00', '2012-04-03 03:04:00', '2012-03-21 13:03:40', 1, 0.00, 'United States', 'T.G.I. Fridayâ€™s', '', 'Minnesota', '55425'),
(83, 0, '', '', '1970-01-01 01:01:00', '1970-01-01 01:01:00', '1970-01-01 01:01:00', 1, 0.00, '', '', '', '', ''),
(84, 8789821, 'Real Estate Investing in India: Opportunities and Challenges', 'Risks and benefits that come with purchasing real estate in India is the topic of an April 4, 2012, lecture at The John Marshall Law School in Chicago. Guests Shahrookh Cambata, Scott Eisenberg and Marc J. Strauss will speak at the event.', '2012-04-04 18:04:00', '2012-04-04 15:04:00', '2012-03-19 12:03:32', 1, 0.00, 'United States', 'The John Marshall Law School', '', 'Illinois', '60604'),
(85, 8792244, 'Get Cooking at Westfield Annapolis with Free Westfield Family Fun Days', 'Get cooking in Aprilâ€”join Westfield Annapolis and the Westfield Family Program for Family Fun Days featuring â€œYoung Chefs of Westfield.â€ Kids will learn how to fuel their bodies in a healthy way by encouraging them to get in the kitchen and cook with their families.  On April 4th, join us for stories about food and gardening, starting with Pizza at Sallyâ€™s by Monica Wellington, which teaches lessons about where food comes from. The second book, Planting A Rainbow by Lois Ehlert, teaches ', '2012-04-04 19:04:00', '2012-04-04 16:04:00', '2012-03-21 12:03:27', 1, 0.00, 'United States', 'Westfield Annapolis', '', 'Maryland', '21401'),
(86, 8594481, '2012 Kansas City Veterans Career Fair & Benefits Expo', 'You are cordially invited to participate in the 2012 Veterans and Military Personnel Career Expo  Wednesday April 4th, 2012  10:00 AM to 2:30 PM Location: UNION STATION Kansas City 30 West Pershing Road, Kansas City, MO 64108  Please consider a booth for your company and also sponsoring a booth for a non-profit veterans Service Organization. Booths are only $125 each and all funds go to event expenses and marketing of this annual event. (Tax Deductable)  Register at http://www.missourivets.com', '2012-04-04 20:04:00', '2012-04-04 17:04:00', '2011-12-06 11:12:19', 1, 0.00, 'United States', 'Union Station Kansas City', '', 'MO', '64108'),
(87, 8708890, 'The Sound of Music', 'One of the worldâ€™s most beloved musicals returns in director Jim Crabtreeâ€™s powerful new production! On the eve of World War II, widowed Austrian naval hero Captain Von Trapp and his children are shadowed by loss and sensing the looming threat of war. But when the free-spirited Maria arrives to be the childrenâ€™s new governess, she brings music and love back into their lives - even that of the stern, lonely Captain. But will their newfound joy be shattered as the Third Reich occupies their ', '2012-04-04 20:04:00', '2012-04-04 17:04:00', '2012-01-24 14:01:08', 1, 0.00, 'United States', 'Cumberland County Playhouse', 'https://tickets.ccplayhouse.com/public/', 'Tennessee', '38555'),
(88, 8774141, 'Anthony Morrison Free Event Coming to New Jersey!', 'This is your chance to learn how to gain financial freedom in today''s economy in a FREE 90 minute seminar. Anthony Morrison, close to bankruptcy himself, turned to the internet to support his family. He now owns this multimillion dollar company and wants to share his secrets with you! The seminar will teach you how to generate income online with no technical experience, learn the power of social networking, and see how easy it is to run this entire system- from anywhere in the world. Look at the', '2012-04-04 21:04:00', '2012-04-04 18:04:00', '2012-03-07 13:03:42', 1, 0.00, 'United States', 'The Imperia', '', 'New Jersey', '08873'),
(89, 8798344, 'National Poetry Month: Panel Discussion on Poetry and Difficulty', 'April is poetry month, and at the University of Michigan poetry is abundant. This year, U-M Library celebrates the range and diversity of the local scene with three special events designed to appeal to poetry lovers of all sorts, especially the pizza-eating sort. Please join us for readings, free pizza, and the thrill of poetry month raffle?  Panelists for the Poetry and Difficulty discussion will include Benjamin Paloff, Douglas Trevor, and John Whittier-Ferguson.', '2012-04-04 21:04:00', '2012-04-04 18:04:00', '2012-03-29 16:03:00', 1, 0.00, 'United States', 'Harlan Hatcher Graduate Library', '', 'Michigan', '48109'),
(90, 8797353, 'Under Our Skin: Economic Perspectives on Race and Health', 'Presenters share easy to understand information on a wide range of fascinating science topics. Discussions follow presentations. Lunch Break Science is recommended for adults. Pre-registration not required. Grab a lunch and join us! Under Our Skin: Economic Perspectives on Race and Health will be presented by Dr. Tiffany Green.', '2012-04-04 21:04:00', '2012-04-04 18:04:00', '2012-03-28 09:03:16', 1, 0.00, 'United States', 'Science Museum of Virginia', '', 'Virginia', '23220'),
(91, 8791348, 'Friends of the Library Book Review', 'Join us for the Friends of the Library Book Reviews.  Stealing Lincolnâ€™s Body by Thomas J. Craughwell will be reviewed by Gerry Smith, Broome County Historian.  For more information, please call Broome County Public Library at 778-6400.', '2012-04-04 21:04:00', '2012-04-04 18:04:00', '2012-03-20 10:03:25', 1, 0.00, 'United States', 'Broome County Public Library', '', 'New York', '13901'),
(92, 8798461, 'Personal Devotion Time', 'Franconia United Methodist Church, 6037 Franconia Rd, Alexandria, VA, invites you to spend some quite time at our church on Wednesdays, noon - 1 pm, during this season of Lent.  You are free to spend time in our sanctuary and reflect on Jesus Christ - His suffering and His sacrifice, His life, death, burial and resurrection.  Franconia United Methodist Church is located at the corner of Beulah and Franconia, next to the Franconia Elementary School, convenient to the Fairfax Connector routes 231,', '2012-04-04 21:04:00', '2012-04-04 18:04:00', '2012-03-29 17:03:07', 1, 0.00, 'United States', 'Franconia United Methodist Church', '', 'Virginia', '22310'),
(93, 8798449, 'Agora Cyber Charter School Information Session', 'Please join us for an information session to learn more about virtual public school options available to Pennsylvania K-8 and high school students.  This is a great opportunity to see a demonstration of the curriculum and get answers to all of your questions about online schooling!  Please visit our website to register. We look forward to meeting you!', '2012-04-04 21:04:00', '2012-04-04 18:04:00', '2012-03-29 17:03:23', 1, 0.00, 'United States', 'Bosler Memorial Library', '', 'Pennsylvania', '17013'),
(94, 8531995, 'Evita', 'Event: Evita<br>Venue: Marquis Theatre - NY<br>Start: 4/4/2012 2:00:00 PM<br>Category: THEATRE BROADWAY', '2012-04-04 23:04:00', '2012-04-04 20:04:00', '2011-10-27 13:10:13', 1, 0.00, 'United States', 'Marquis Theatre', 'http://upcomingevents.net/search/redirect/1753635', 'New York', '10036'),
(95, 8501764, 'Jersey Boys', 'Event: Jersey Boys<br>Venue: Virginia/August Wilson Theatre - NY<br>Start: 4/4/2012 2:00:00 PM<br>Category: THEATRE BROADWAY', '2012-04-04 23:04:00', '2012-04-04 20:04:00', '2011-10-04 13:10:46', 1, 0.00, 'United States', 'August Wilson Theater', 'http://upcomingevents.net/search/redirect/1715848', 'New York', '10019'),
(96, 8542983, 'Anything Goes', 'Event: Anything Goes<br>Venue: Stephen Sondheim Theatre (Formerly Henry Miller Theatre)<br>Start: 4/4/2012 2:00:00 PM<br>Category: THEATRE BROADWAY', '2012-04-04 23:04:00', '2012-04-04 20:04:00', '2011-11-03 17:11:38', 1, 0.00, 'United States', 'Stephen Sondheim Theater', 'http://upcomingevents.net/search/redirect/1745645', 'New York', '10036'),
(97, 8224973, 'Memphis - The Musical', 'Event: Memphis - The Musical<br>Venue: Shubert Theatre - NY<br>Start: 4/4/2012 2:00:00 PM<br>Category: THEATRE BROADWAY', '2012-04-04 23:04:00', '2012-04-04 20:04:00', '2011-07-16 10:07:14', 1, 0.00, 'United States', 'Little Shubert Theatre NY', 'http://upcomingevents.net/search/redirect/1681105', 'New York', '10036'),
(98, 8781413, 'Marriott Theatre Presents THE PIRATES OF PENZANCE', 'LINCOLNSHIRE, IL- The exuberant musical theater masterpiece from the clever pens of W.S. Gilbert and Arthur Sullivan, THE PIRATES OF PENZANCE will be presented at The Marriott Theatre, 10 Marriott Drive, Lincolnshire, IL, previewing April 4, opening April 13 and running through June 10.  The beloved tale of love, laughter and loyalty will be directed by Multi-Jeff Award Winner Dominic Missimi.  Starring as â€œThe Pirate Kingâ€ will be Jeff Award Winner Kevin Earley (Broadway: Ernest Defarge in ', '2012-04-04 23:04:00', '2012-04-04 20:04:00', '2012-03-16 11:03:44', 1, 0.00, 'United States', 'Marriott Theatre in Lincolnshire', '', 'Illinois', '60069'),
(99, 8792316, 'An Evening with Garth Stein for FETCH a Cure', 'Join FETCH a Cure for â€œAn Evening with Garth Steinâ€ - author of New York Times Bestseller The Art of Racing in the Rain. There will be a VIP cocktail reception at 6, general reception at 6:30, and dinner with Garth Stein at 7:15, followed by Q&A and a book signing.', '2012-04-05 03:04:00', '2012-04-05 00:04:00', '2012-03-21 13:03:05', 1, 0.00, 'United States', 'Virginia Historical Society', 'http://fetchacure.com/donate', 'Virginia', '23220'),
(100, 8779859, 'Feminist Theology - Discussion', 'We will study and discuss in-depth passages from the Bible from a Feminist Theological perspective.', '2012-04-05 03:04:00', '2012-04-05 00:04:00', '2012-03-14 11:03:56', 1, 0.00, 'United States', 'Pilgrim Congregational United Church of Christ', '', 'Michigan', '48912'),
(101, 8714050, 'The Fresh Beat Band', 'Event: The Fresh Beat Band<br>Venue: Merriam Theatre<br>Start: 4/4/2012 6:00:00 PM<br>Category: CONCERTS CHILDREN/FAMILY', '2012-04-05 03:04:00', '2012-04-05 00:04:00', '2012-01-27 13:01:29', 1, 0.00, 'United States', 'Merriam Theater', 'http://upcomingevents.net/search/redirect/1796950', 'Pennsylvania', '19102'),
(102, 8796839, 'Little Falls Happy Hour - for Young Professionals', 'Register: http://www.njyp.org/events/little-falls-happy-hour-4  Your local Happy Hour is back on the calendar!  Join other NJYPers at this memberâ€™s only mix & mingle event.  As always, there is no cover, plus there will be great specials to keep the drinks and the laughter flowing. Whether this is your first event or your fiftieth, you will find yourself surrounded by friendly faces and future friends.  Who should attend: Dues Paying Members who are 21-39 years old. There is no cover but pleas', '2012-04-05 03:04:00', '2012-04-05 00:04:00', '2012-03-27 12:03:15', 1, 0.00, 'United States', '381 Main', '', 'New Jersey', '07424'),
(103, 8798457, 'Agora Cyber Charter School Information Session', 'Please join us for an information session to learn more about virtual public school options available to Pennsylvania K-8 and high school students.  This is a great opportunity to see a demonstration of the curriculum and get answers to all of your questions about online schooling!  Please visit our website to register. We look forward to meeting you!', '2012-04-05 03:04:00', '2012-04-05 00:04:00', '2012-03-29 17:03:31', 1, 0.00, 'United States', 'Manheim Township Public Library', '', 'Pennsylvania', '17601'),
(104, 8797711, 'â€œPath to Happinessâ€ â€“ Enlightening Talks, Yoga and Meditation bySwami Mukundananda', 'Come! Recharge your body, replenish your mind, and nourish your soul! Free admission. Swami Mukundananda will be taking sessions on Yoga, Pranayam, Subtle-body Relaxation, Roop-Dhyan, Science of Healthy Diet, and Enlightening talks on â€œPath to Happiness.â€ Swami Mukundananda imparts various ancient Yogic techniques, viz. Hatha Yoga, Ashtang Yoga, Bhakti Yoga, and Dhyan Yogaâ€”synthesizing their quintessence into a simple Yogic lifestyle, called â€œJagadguru Kripaluji Yogâ€ (JKYog). For furth', '2012-04-07 19:04:00', '2012-04-05 00:04:00', '2012-03-28 22:03:03', 1, 0.00, 'United States', 'Hotel Indigo', '', 'New York', '11901'),
(105, 8795772, '"COUTURE IN ROUGE" FASHION EVENT AT THE DRAKE HOTEL''S PALM COURT', 'On April 4, 2012, the Chicago Red Dress Party, along with the Drake Hotel and Neiman Marcus, will host Couture in Rouge from 5-8 p.m.- an evening dedicated to "red fashion" and raising awareness for the HIV/AIDS movement. Every month, the Drake Hotel partners with various non-profits to raise awareness for their respective causes and provide funds by donating $5 entrance fees and 50% of the bar proceeds directly to the organization. This month, the Drake will be bringing awareness to HIV/AIDS by', '2012-04-05 03:04:00', '2012-04-05 00:04:00', '2012-03-26 07:03:25', 1, 0.00, 'United States', 'The Palm Court at The Drake Hotel', 'http://chicagoreddressparty.org/', 'Illinois', '60611'),
(106, 8802141, 'Sky Room Times Square', 'Wednesday afterwork at Sky Room Times Square is a great rootop venue. This 2 room & 2 floor lounge which gives a classy rooftop experience - host your birthday party or anniversary celebration. VIP and bottle service can be arranged.  Free birthday parties are available on Wednesday at Sky Room Times Square - must RSVP  21+ event Everyone is free w/ guestlist - must be with dresscode  Sky Room Times Square DRESS CODE Neat, Chic, & Trendy attire Men - Collard shirts, shoes, & Fitted attire NO: He', '2012-04-05 03:04:00', '2012-04-05 00:04:00', '2012-04-02 00:04:28', 1, 0.00, 'United States', 'Sky Room Times Square', '', 'New York', '10018'),
(107, 8501718, 'Jersey Boys', 'Event: Jersey Boys<br>Venue: Virginia/August Wilson Theatre - NY<br>Start: 4/4/2012 7:00:00 PM<br>Category: THEATRE BROADWAY', '2012-04-05 04:04:00', '2012-04-05 01:04:00', '2011-10-04 12:10:54', 1, 0.00, 'United States', 'August Wilson Theater', 'http://upcomingevents.net/search/redirect/1715831', 'New York', '10019'),
(108, 8236222, 'Washington Wizards vs. Indiana Pacers', 'Event: Washington Wizards vs. Indiana Pacers<br>Venue: Verizon Center - DC<br>Start: 4/4/2012 7:00:00 PM<br>Category: SPORTS BASKETBALL', '2012-04-05 04:04:00', '2012-04-05 01:04:00', '2011-07-23 08:07:38', 1, 0.00, 'United States', 'Verizon Center', 'http://upcomingevents.net/search/redirect/1688735', 'District of Columbia', '20004'),
(109, 8602215, 'The Naked And Famous', 'Event: The Naked And Famous<br>Venue: Terminal 5<br>Start: 4/4/2012 7:00:00 PM<br>Category: CONCERTS ALTERNATIVE', '2012-04-05 04:04:00', '2012-04-05 01:04:00', '2011-12-13 13:12:10', 1, 0.00, 'United States', 'Terminal 5', 'http://upcomingevents.net/search/redirect/1765076', 'New York', '10019'),
(110, 8498814, 'San Antonio Spurs Tickets at TD Garden (Fleet Center) on 04/04/2012', 'The San Antonio Spurs are an American professional basketball team based in San Antonio, Texas. They are part of the Southwest Division of the Western Conference in the National Basketball Association (NBA).', '2012-04-05 04:04:00', '2012-04-05 01:04:00', '2011-10-01 08:10:50', 1, 0.00, 'United States', 'TD Garden (Fleet Center)', 'http://bit.ly/pnwSt6', 'Massachusetts', '02109'),
(111, 8536964, 'The Naked And Famous', 'If you want to see The Naked And Famous in Concert, now is your chance! The Naked And Famous is coming to New York to perform a show at Terminal 5 on 4/4/2012, and there are still plenty of great seats available. Get New York The Naked And Famous Tickets today!', '2012-04-05 04:04:00', '2012-04-05 01:04:00', '2011-10-31 04:10:16', 1, 0.00, 'United States', 'Terminal 5', 'http://www.broadrippletickets.com/ResultsTicket.html?evtid=1765076', 'New York', '10019'),
(112, 8653865, 'Philadelphia 76ers vs. Toronto Raptors', 'Event: Philadelphia 76ers vs. Toronto Raptors<br>Venue: Wells Fargo Center - PA (formerly Wachovia Center)<br>Start: 4/4/2012 7:00:00 PM<br>Category: SPORTS BASKETBALL', '2012-04-05 04:04:00', '2012-04-05 01:04:00', '2012-01-13 14:01:04', 1, 0.00, 'United States', 'Wells Fargo Center PA', 'http://upcomingevents.net/search/redirect/1790870', 'Pennsylvania', ''),
(113, 8235910, 'Philadelphia 76ers vs. Toronto Raptors', 'Event: Philadelphia 76ers vs. Toronto Raptors<br>Venue: Wells Fargo Center - PA (formerly Wachovia Center)<br>Start: 4/4/2012 7:00:00 PM<br>Category: SPORTS BASKETBALL', '2012-04-05 04:04:00', '2012-04-05 01:04:00', '2011-07-23 06:07:16', 1, 0.00, 'United States', 'Wells Fargo Center PA', 'http://upcomingevents.net/search/redirect/1688212', 'Pennsylvania', ''),
(114, 8234141, 'Boston Celtics vs. San Antonio Spurs', 'Event: Boston Celtics vs. San Antonio Spurs<br>Venue: TD Garden (Fleet Center)<br>Start: 4/4/2012 7:00:00 PM<br>Category: SPORTS BASKETBALL', '2012-04-05 04:04:00', '2012-04-05 01:04:00', '2011-07-22 11:07:24', 1, 0.00, 'United States', 'TD Garden', 'http://upcomingevents.net/search/redirect/1687665', 'Massachusetts', '02114'),
(115, 8594819, 'Boston Celtics vs. San Antonio Spurs', 'The Celtics will be taking on the Spurs on 4/4/2012, and you can be inside TD Garden with a great seat to action by stopping by BroadRippleTickets.com and purchasing Boston Celtics vs. San Antonio Spurs Tickets! Whenever the Celtics take on the Spurs itâ€™s always a hard-fought game, so donâ€™t miss this great NBA action â€“ purchase Tickets for the Celtics vs. Spurs game today!', '2012-04-05 04:04:00', '2012-04-05 01:04:00', '2011-12-06 22:12:43', 1, 0.00, 'United States', 'TD Garden', 'http://www.broadrippletickets.com/ResultsTicket.aspx?evtid=1789911&event=Boston+Celtics+vs.+San+Antonio+Spurs', 'Massachusetts', '02114');

-- --------------------------------------------------------

--
-- Table structure for table `YQL_event_address`
--

CREATE TABLE IF NOT EXISTS `YQL_event_address` (
  `address_id` int(20) NOT NULL AUTO_INCREMENT,
  `event_id` int(20) NOT NULL,
  `address_text` varchar(255) NOT NULL,
  `x_coord` float(10,6) NOT NULL,
  `y_coord` float(10,6) NOT NULL,
  PRIMARY KEY (`address_id`),
  UNIQUE KEY `event_id` (`event_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=107 ;

--
-- Dumping data for table `YQL_event_address`
--

INSERT INTO `YQL_event_address` (`address_id`, `event_id`, `address_text`, `x_coord`, `y_coord`) VALUES
(42, 51, '227 Maple Ave E', 38.903900, -77.262199),
(43, 52, 'Boston, MA', 38.817501, -77.268204),
(44, 53, '246 Tremont St', 42.350300, -71.065002),
(49, 58, '271 19th Avenue S', 44.972099, -93.245697),
(47, 56, '318 W. 4th St.', 42.487301, -83.146896),
(48, 57, '279 Tremont St', 42.349800, -71.065102),
(50, 59, '3845 Veterans Memorial Highway', 40.784698, -73.109596),
(51, 60, '185 Court St', 42.100101, -75.906097),
(52, 61, '735 Washington Ave', 43.061298, -86.222298),
(53, 62, '9009 Shawnee Mission Parkway', 39.014198, -94.689697),
(54, 63, '1260 De La Gauchetiere Ouest', 45.506699, -73.569702),
(55, 64, '103 Center For The Arts', 43.000000, -78.783302),
(56, 65, '1903 W Michigan Ave', 42.284000, -85.612900),
(57, 66, '1913 Hickory Blvd', 35.880600, -81.513000),
(58, 67, '600 W Walnut St', 37.645000, -84.777397),
(59, 68, '201 E Brambleton Ave', 36.854000, -76.287300),
(60, 69, '2605 Hennepin Avenue South', 44.965302, -93.296898),
(61, 70, '289 Kent Ave', 40.724800, -73.966698),
(62, 71, '124 Boylston St', 42.352402, -71.065804),
(63, 72, '527 N. Grand Blvd.', 38.638802, -90.231697),
(64, 73, '4355 US-1', 40.366100, -74.595901),
(65, 74, '89 South St.', 42.351601, -71.057098),
(66, 75, '2407 London Road', 46.806999, -92.064400),
(67, 76, '158 Bleecker St. btwn Thompson and Sullivan', 40.721199, -74.008598),
(68, 77, '227 Maple Ave E', 38.903900, -77.262199),
(69, 78, '227 Summer Street', 41.054798, -73.540604),
(70, 79, '1700 Southeast 15th Street', 35.449799, -97.479797),
(71, 80, '124 Boylston St', 42.352402, -71.065804),
(72, 81, '116 5th Ave N', 36.161098, -86.778801),
(73, 82, '2201 Killebrew Drive', 44.851799, -93.240196),
(74, 83, '', 0.000000, 0.000000),
(75, 84, '315 S. Plymouth Court', 41.877899, -87.628700),
(76, 85, '2002 Annapolis Mall', 38.992199, -76.544098),
(77, 86, '30 W Pershing Rd', 39.094002, -94.584396),
(78, 87, '221 Tennessee Ave', 35.963600, -85.074898),
(79, 88, '1714 Easton Ave', 40.535301, -74.506401),
(80, 89, '913 S. University Ave', 42.274899, -83.737900),
(81, 90, '2500 W Broad St', 37.560398, -77.466599),
(82, 91, '185 Court St', 42.099998, -75.906197),
(83, 92, '6037 Franconia Road', 38.782299, -77.144600),
(84, 93, '158 W High St', 40.201698, -77.192802),
(85, 94, '211 West 45th St.', 40.758099, -73.985901),
(86, 95, '245 W 52nd St', 40.762901, -73.983704),
(87, 96, '124 W 43rd St', 40.755699, -73.984200),
(88, 97, '422 W 42nd St', 40.758801, -73.993500),
(89, 98, '10 Marriott Drive', 42.194801, -87.930199),
(90, 99, '428 N Boulevard', 37.557800, -77.472702),
(91, 100, '125 S. Pennsylvania Ave', 42.733200, -84.537903),
(92, 101, '250 S Broad St', 39.947701, -75.164803),
(93, 102, '381 Main St', 40.885799, -74.240402),
(94, 103, '595 Granite Run Drive', 40.077499, -76.326797),
(95, 104, 'East end 1830 West Main Street,Route 25', 40.941299, -72.637703),
(96, 105, '140 E. Walton St.', 41.900002, -87.623596),
(97, 106, '330 West 40th Street 33rd Floor', 40.756302, -73.991699),
(98, 107, '245 W 52nd St', 40.762901, -73.983704),
(99, 108, '601 F St Nw', 38.897301, -77.020103),
(100, 109, '610 W 56th St', 40.769798, -73.992302),
(101, 110, 'Boston, MA, USA', 42.365398, -71.052803),
(102, 111, '610 W 56th St', 40.769798, -73.992302),
(103, 112, 'Philadelphia', 39.952202, -75.162300),
(104, 113, 'Philadelphia', 39.952202, -75.162300),
(105, 114, '100 Legends Way', 42.365200, -71.061699),
(106, 115, '100 Legends Way', 42.365200, -71.061699);

-- --------------------------------------------------------

--
-- Table structure for table `YQL_event_images`
--

CREATE TABLE IF NOT EXISTS `YQL_event_images` (
  `image_id` int(20) NOT NULL AUTO_INCREMENT,
  `event_id` int(20) NOT NULL,
  `image_url` varchar(100) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date_uploaded` datetime NOT NULL,
  `list_order` int(3) NOT NULL,
  `active` int(1) NOT NULL,
  PRIMARY KEY (`image_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
