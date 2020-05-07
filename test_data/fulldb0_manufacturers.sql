#
# TABLE STRUCTURE FOR: manufacturers_2
#

DROP TABLE IF EXISTS `manufacturers_2`;

CREATE TABLE `manufacturers_2` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'название компании поставщика',
  `address_id` int(10) unsigned DEFAULT NULL COMMENT 'указатель на запись в таблице addresses',
  `phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'номер телефона',
  `email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'адрес электронной почты',
  `contact_person` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'контактное лицо',
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `manufacturers_2` (`id`, `name`, `address_id`, `phone`, `email`, `contact_person`, `created_at`, `updated_at`) VALUES (1, NULL, 169, '02211379516', 'janessa22@example.com', 'Prof. Murray Gerlach II', '2011-12-23 02:19:03', '2013-10-06 13:33:24');
INSERT INTO `manufacturers_2` (`id`, `name`, `address_id`, `phone`, `email`, `contact_person`, `created_at`, `updated_at`) VALUES (2, NULL, 179, '1-778-962-1459x45222', 'blanda.aisha@example.com', 'Loraine McClure', '2010-12-26 16:35:52', '2013-01-01 11:08:46');
INSERT INTO `manufacturers_2` (`id`, `name`, `address_id`, `phone`, `email`, `contact_person`, `created_at`, `updated_at`) VALUES (3, NULL, 156, '00882105403', 'renner.ottilie@example.com', 'Miss Romaine Kihn IV', '2016-03-05 05:23:50', '2011-03-03 15:59:20');
INSERT INTO `manufacturers_2` (`id`, `name`, `address_id`, `phone`, `email`, `contact_person`, `created_at`, `updated_at`) VALUES (4, NULL, 176, '(871)455-2960x83359', 'nmayert@example.com', 'Kimberly Marks', '2011-09-04 16:30:50', '2019-06-20 23:46:08');
INSERT INTO `manufacturers_2` (`id`, `name`, `address_id`, `phone`, `email`, `contact_person`, `created_at`, `updated_at`) VALUES (5, NULL, 156, '251-289-6686', 'hugh.murphy@example.com', 'Mr. Kurtis Boyer', '2018-10-23 01:53:58', '2012-02-07 08:22:08');
INSERT INTO `manufacturers_2` (`id`, `name`, `address_id`, `phone`, `email`, `contact_person`, `created_at`, `updated_at`) VALUES (6, NULL, 196, '(740)109-2924x5830', 'kian.konopelski@example.org', 'Bennett Dare', '2015-08-06 00:01:57', '2020-04-03 03:27:08');
INSERT INTO `manufacturers_2` (`id`, `name`, `address_id`, `phone`, `email`, `contact_person`, `created_at`, `updated_at`) VALUES (7, NULL, 181, '050-480-5602', 'rgerhold@example.org', 'Dr. Enos Howe Jr.', '2015-02-05 00:54:41', '2013-09-11 01:26:14');
INSERT INTO `manufacturers_2` (`id`, `name`, `address_id`, `phone`, `email`, `contact_person`, `created_at`, `updated_at`) VALUES (8, NULL, 141, '1-930-812-3117', 'powlowski.anastacio@example.org', 'Lyda Bernhard', '2014-08-30 05:52:39', '2017-02-28 15:12:09');
INSERT INTO `manufacturers_2` (`id`, `name`, `address_id`, `phone`, `email`, `contact_person`, `created_at`, `updated_at`) VALUES (9, NULL, 114, '07664412861', 'ezekiel.parisian@example.org', 'Mrs. Ursula Boyer MD', '2015-10-05 20:01:32', '2011-03-11 12:05:00');
INSERT INTO `manufacturers_2` (`id`, `name`, `address_id`, `phone`, `email`, `contact_person`, `created_at`, `updated_at`) VALUES (10, NULL, 118, '672.409.4445x716', 'dickens.frederick@example.com', 'Jonathan McClure DVM', '2019-06-25 03:13:53', '2019-11-04 19:52:48');
INSERT INTO `manufacturers_2` (`id`, `name`, `address_id`, `phone`, `email`, `contact_person`, `created_at`, `updated_at`) VALUES (11, NULL, 157, '665.964.8153x245', 'flatley.hassan@example.com', 'Bella Haag', '2019-12-31 08:44:48', '2016-09-07 05:05:26');
INSERT INTO `manufacturers_2` (`id`, `name`, `address_id`, `phone`, `email`, `contact_person`, `created_at`, `updated_at`) VALUES (12, NULL, 128, '476-523-3661x967', 'hollie.morissette@example.org', 'Dr. Ernie Russel', '2011-09-07 15:48:24', '2017-11-17 23:47:37');
INSERT INTO `manufacturers_2` (`id`, `name`, `address_id`, `phone`, `email`, `contact_person`, `created_at`, `updated_at`) VALUES (13, NULL, 134, '(235)636-3618x50747', 'beau70@example.com', 'Ms. Kaitlin Crona I', '2015-11-04 14:34:50', '2019-05-19 21:18:57');
INSERT INTO `manufacturers_2` (`id`, `name`, `address_id`, `phone`, `email`, `contact_person`, `created_at`, `updated_at`) VALUES (14, NULL, 163, '02802586668', 'marlene37@example.org', 'Pasquale Lynch I', '2018-11-01 16:04:12', '2020-01-04 16:36:02');
INSERT INTO `manufacturers_2` (`id`, `name`, `address_id`, `phone`, `email`, `contact_person`, `created_at`, `updated_at`) VALUES (15, NULL, 141, '752.524.9720x366', 'xritchie@example.com', 'Bailee Schmitt', '2018-06-11 16:02:57', '2013-08-03 09:34:50');
INSERT INTO `manufacturers_2` (`id`, `name`, `address_id`, `phone`, `email`, `contact_person`, `created_at`, `updated_at`) VALUES (16, NULL, 133, '08811553281', 'kullrich@example.net', 'Alisha Stroman', '2014-04-23 04:52:15', '2018-06-07 16:11:17');
INSERT INTO `manufacturers_2` (`id`, `name`, `address_id`, `phone`, `email`, `contact_person`, `created_at`, `updated_at`) VALUES (17, NULL, 122, '+94(9)7103971906', 'estark@example.com', 'Mr. Hal Schmitt II', '2016-05-07 04:49:22', '2020-03-28 20:43:44');
INSERT INTO `manufacturers_2` (`id`, `name`, `address_id`, `phone`, `email`, `contact_person`, `created_at`, `updated_at`) VALUES (18, NULL, 197, '1-526-674-3606', 'rosella92@example.com', 'Jonas Lindgren', '2017-12-16 14:27:59', '2013-11-25 21:52:53');
INSERT INTO `manufacturers_2` (`id`, `name`, `address_id`, `phone`, `email`, `contact_person`, `created_at`, `updated_at`) VALUES (19, NULL, 146, '285.161.3530x5357', 'marlon.schmeler@example.com', 'Ms. Mercedes Keeling', '2018-09-14 10:39:12', '2015-01-02 01:17:07');
INSERT INTO `manufacturers_2` (`id`, `name`, `address_id`, `phone`, `email`, `contact_person`, `created_at`, `updated_at`) VALUES (20, NULL, 121, '613-339-6624', 'watson.metz@example.net', 'Mrs. Hilda Kreiger Jr.', '2010-07-10 12:44:56', '2010-06-16 00:58:50');
INSERT INTO `manufacturers_2` (`id`, `name`, `address_id`, `phone`, `email`, `contact_person`, `created_at`, `updated_at`) VALUES (21, NULL, 188, '061.971.2068', 'jwillms@example.net', 'Dr. Elmo Cruickshank', '2013-07-04 13:54:17', '2010-09-07 09:19:15');
INSERT INTO `manufacturers_2` (`id`, `name`, `address_id`, `phone`, `email`, `contact_person`, `created_at`, `updated_at`) VALUES (22, NULL, 126, '1-541-966-9435x26625', 'reuben23@example.net', 'Dr. Sharon Kessler', '2014-10-12 05:00:33', '2010-06-26 13:00:58');
INSERT INTO `manufacturers_2` (`id`, `name`, `address_id`, `phone`, `email`, `contact_person`, `created_at`, `updated_at`) VALUES (23, NULL, 150, '706.710.7102x6429', 'hermann.jesus@example.org', 'Wallace Shields IV', '2013-09-04 21:57:29', '2013-02-03 10:15:34');
INSERT INTO `manufacturers_2` (`id`, `name`, `address_id`, `phone`, `email`, `contact_person`, `created_at`, `updated_at`) VALUES (24, NULL, 154, '973.639.2409x7500', 'thomas04@example.org', 'Ruben Schuster', '2019-03-01 01:45:51', '2015-08-29 19:33:22');
INSERT INTO `manufacturers_2` (`id`, `name`, `address_id`, `phone`, `email`, `contact_person`, `created_at`, `updated_at`) VALUES (25, NULL, 173, '1-600-567-3170', 'fisher.eryn@example.org', 'Mr. Edgar Nienow I', '2018-02-20 22:50:01', '2018-08-21 04:48:26');
INSERT INTO `manufacturers_2` (`id`, `name`, `address_id`, `phone`, `email`, `contact_person`, `created_at`, `updated_at`) VALUES (26, NULL, 198, '+04(0)9361028564', 'lorna80@example.org', 'Mrs. Rosella Gislason', '2010-08-15 17:16:52', '2012-08-01 01:55:05');
INSERT INTO `manufacturers_2` (`id`, `name`, `address_id`, `phone`, `email`, `contact_person`, `created_at`, `updated_at`) VALUES (27, NULL, 186, '+42(7)7760789123', 'colten41@example.net', 'Koby Simonis I', '2016-08-08 18:47:49', '2014-07-20 14:24:53');
INSERT INTO `manufacturers_2` (`id`, `name`, `address_id`, `phone`, `email`, `contact_person`, `created_at`, `updated_at`) VALUES (28, NULL, 191, '743-534-7363x7387', 'ledner.rebekah@example.com', 'Miss Valentine Mitchell', '2015-10-19 03:12:37', '2015-01-26 22:18:32');
INSERT INTO `manufacturers_2` (`id`, `name`, `address_id`, `phone`, `email`, `contact_person`, `created_at`, `updated_at`) VALUES (29, NULL, 147, '326.144.0384x521', 'domenick09@example.net', 'Trever Leuschke', '2016-11-25 16:20:51', '2020-03-22 15:18:13');
INSERT INTO `manufacturers_2` (`id`, `name`, `address_id`, `phone`, `email`, `contact_person`, `created_at`, `updated_at`) VALUES (30, NULL, 152, '01367115570', 'klocko.andy@example.org', 'Dr. Leo Jenkins II', '2016-02-11 20:47:49', '2017-06-11 19:42:54');
INSERT INTO `manufacturers_2` (`id`, `name`, `address_id`, `phone`, `email`, `contact_person`, `created_at`, `updated_at`) VALUES (31, NULL, 132, '(848)356-0049x693', 'plockman@example.net', 'Joe Leuschke', '2015-05-11 10:33:20', '2011-10-17 14:19:35');
INSERT INTO `manufacturers_2` (`id`, `name`, `address_id`, `phone`, `email`, `contact_person`, `created_at`, `updated_at`) VALUES (32, NULL, 127, '(815)148-9562x21548', 'uortiz@example.com', 'Prof. Clovis Kris', '2013-07-15 03:05:11', '2018-10-26 11:55:50');
INSERT INTO `manufacturers_2` (`id`, `name`, `address_id`, `phone`, `email`, `contact_person`, `created_at`, `updated_at`) VALUES (33, NULL, 202, '+08(4)5378916285', 'aurelia.kunde@example.net', 'Ashlynn Dooley', '2014-11-24 15:24:04', '2015-01-28 08:30:31');
INSERT INTO `manufacturers_2` (`id`, `name`, `address_id`, `phone`, `email`, `contact_person`, `created_at`, `updated_at`) VALUES (34, NULL, 146, '380-450-5247x4808', 'frami.tyrique@example.com', 'Prof. Nathan Runolfsson', '2011-09-22 17:46:20', '2015-12-02 22:43:16');
INSERT INTO `manufacturers_2` (`id`, `name`, `address_id`, `phone`, `email`, `contact_person`, `created_at`, `updated_at`) VALUES (35, NULL, 155, '1-801-777-2104x3687', 'xmaggio@example.net', 'Mrs. Mallie Kirlin', '2015-07-09 20:24:37', '2011-04-19 12:23:23');
INSERT INTO `manufacturers_2` (`id`, `name`, `address_id`, `phone`, `email`, `contact_person`, `created_at`, `updated_at`) VALUES (36, NULL, 141, '797.067.9420', 'elise.dietrich@example.org', 'Ettie Lowe', '2019-01-23 05:37:30', '2011-03-04 15:52:32');
INSERT INTO `manufacturers_2` (`id`, `name`, `address_id`, `phone`, `email`, `contact_person`, `created_at`, `updated_at`) VALUES (37, NULL, 198, '(584)358-3764x5139', 'beier.karelle@example.com', 'Dr. Jarrell Steuber Sr.', '2018-05-24 07:21:23', '2017-06-19 17:21:18');
INSERT INTO `manufacturers_2` (`id`, `name`, `address_id`, `phone`, `email`, `contact_person`, `created_at`, `updated_at`) VALUES (38, NULL, 184, '1-845-696-9905x9772', 'christ98@example.org', 'Ewald Marvin', '2013-08-19 18:06:47', '2010-06-24 19:51:45');
INSERT INTO `manufacturers_2` (`id`, `name`, `address_id`, `phone`, `email`, `contact_person`, `created_at`, `updated_at`) VALUES (39, NULL, 201, '(636)015-0092x339', 'botsford.florine@example.net', 'Omer Boyle', '2019-11-06 23:17:55', '2014-03-08 02:31:56');
INSERT INTO `manufacturers_2` (`id`, `name`, `address_id`, `phone`, `email`, `contact_person`, `created_at`, `updated_at`) VALUES (40, NULL, 112, '+58(5)4397186329', 'norval86@example.org', 'Fiona Jakubowski PhD', '2012-06-05 16:20:57', '2011-07-04 19:24:28');
INSERT INTO `manufacturers_2` (`id`, `name`, `address_id`, `phone`, `email`, `contact_person`, `created_at`, `updated_at`) VALUES (41, NULL, 182, '874.880.2253x25598', 'steuber.lou@example.net', 'Uriah Schaefer', '2016-07-01 17:49:07', '2015-02-13 02:56:27');
INSERT INTO `manufacturers_2` (`id`, `name`, `address_id`, `phone`, `email`, `contact_person`, `created_at`, `updated_at`) VALUES (42, NULL, 179, '1-018-969-5066', 'feeney.ford@example.net', 'Ms. Madilyn Schamberger', '2014-04-06 06:29:23', '2012-02-03 06:41:11');
INSERT INTO `manufacturers_2` (`id`, `name`, `address_id`, `phone`, `email`, `contact_person`, `created_at`, `updated_at`) VALUES (43, NULL, 187, '+08(1)8745858279', 'kcole@example.net', 'Lois Wilkinson', '2017-11-27 22:35:42', '2013-11-15 18:08:29');
INSERT INTO `manufacturers_2` (`id`, `name`, `address_id`, `phone`, `email`, `contact_person`, `created_at`, `updated_at`) VALUES (44, NULL, 166, '(904)609-7064', 'angelina47@example.net', 'Juliet Abshire I', '2012-05-09 18:10:58', '2018-05-06 08:40:31');
INSERT INTO `manufacturers_2` (`id`, `name`, `address_id`, `phone`, `email`, `contact_person`, `created_at`, `updated_at`) VALUES (45, NULL, 179, '673-187-8447', 'eveline40@example.com', 'Dr. Dayne Wisozk', '2013-10-28 20:14:26', '2018-11-26 17:54:04');
INSERT INTO `manufacturers_2` (`id`, `name`, `address_id`, `phone`, `email`, `contact_person`, `created_at`, `updated_at`) VALUES (46, NULL, 182, '(182)495-6266x8178', 'hilll.oceane@example.org', 'Alvah Frami', '2019-12-11 03:49:53', '2013-01-14 08:30:19');
INSERT INTO `manufacturers_2` (`id`, `name`, `address_id`, `phone`, `email`, `contact_person`, `created_at`, `updated_at`) VALUES (47, NULL, 199, '(231)899-2387', 'esteban50@example.com', 'Eino Hand Sr.', '2018-01-01 13:36:13', '2014-04-23 00:18:13');
INSERT INTO `manufacturers_2` (`id`, `name`, `address_id`, `phone`, `email`, `contact_person`, `created_at`, `updated_at`) VALUES (48, NULL, 180, '538-792-2604x10560', 'zemlak.raphael@example.net', 'Anita Schuppe', '2014-07-27 20:26:41', '2015-09-02 03:01:32');
INSERT INTO `manufacturers_2` (`id`, `name`, `address_id`, `phone`, `email`, `contact_person`, `created_at`, `updated_at`) VALUES (49, NULL, 137, '283-713-9460x05442', 'thompson.forest@example.net', 'Marcelo Kuhic', '2014-02-28 13:26:34', '2016-06-27 14:06:01');
INSERT INTO `manufacturers_2` (`id`, `name`, `address_id`, `phone`, `email`, `contact_person`, `created_at`, `updated_at`) VALUES (50, NULL, 142, '00222833978', 'mrosenbaum@example.net', 'Dillan Schowalter', '2012-05-09 20:21:53', '2016-06-01 13:46:40');
INSERT INTO `manufacturers_2` (`id`, `name`, `address_id`, `phone`, `email`, `contact_person`, `created_at`, `updated_at`) VALUES (51, NULL, 120, '906.628.1035x292', 'trey73@example.net', 'Marian Hilll', '2018-11-09 20:54:07', '2012-01-01 08:06:14');
INSERT INTO `manufacturers_2` (`id`, `name`, `address_id`, `phone`, `email`, `contact_person`, `created_at`, `updated_at`) VALUES (52, NULL, 170, '+17(9)3816378598', 'monserrate02@example.com', 'Kristofer Kuhn', '2016-09-23 04:27:04', '2013-07-24 08:06:29');
INSERT INTO `manufacturers_2` (`id`, `name`, `address_id`, `phone`, `email`, `contact_person`, `created_at`, `updated_at`) VALUES (53, NULL, 132, '(352)527-9409', 'destinee.o\'kon@example.net', 'Jack Botsford', '2015-05-29 01:10:05', '2015-05-06 11:58:42');
INSERT INTO `manufacturers_2` (`id`, `name`, `address_id`, `phone`, `email`, `contact_person`, `created_at`, `updated_at`) VALUES (54, NULL, 121, '812-004-7899', 'plangworth@example.org', 'Lempi Kulas IV', '2020-02-14 14:45:18', '2012-01-21 12:02:55');
INSERT INTO `manufacturers_2` (`id`, `name`, `address_id`, `phone`, `email`, `contact_person`, `created_at`, `updated_at`) VALUES (55, NULL, 182, '530.462.9365x193', 'koch.hortense@example.net', 'Deshawn DuBuque', '2014-12-25 06:05:25', '2015-02-01 06:37:28');
INSERT INTO `manufacturers_2` (`id`, `name`, `address_id`, `phone`, `email`, `contact_person`, `created_at`, `updated_at`) VALUES (56, NULL, 150, '+54(4)4435978088', 'selena.langosh@example.org', 'Mr. Devin Crooks', '2013-05-07 14:22:49', '2013-09-10 22:11:57');
INSERT INTO `manufacturers_2` (`id`, `name`, `address_id`, `phone`, `email`, `contact_person`, `created_at`, `updated_at`) VALUES (57, NULL, 148, '436.196.3897', 'jadyn46@example.com', 'Dr. Ervin Feest V', '2017-10-10 00:01:20', '2018-10-24 08:32:09');
INSERT INTO `manufacturers_2` (`id`, `name`, `address_id`, `phone`, `email`, `contact_person`, `created_at`, `updated_at`) VALUES (58, NULL, 179, '712.193.3820x4613', 'mable.gulgowski@example.net', 'Dallas Gusikowski', '2019-12-23 19:40:42', '2013-06-10 03:01:12');
INSERT INTO `manufacturers_2` (`id`, `name`, `address_id`, `phone`, `email`, `contact_person`, `created_at`, `updated_at`) VALUES (59, NULL, 131, '458-616-7165', 'uparker@example.net', 'Libby Hackett', '2010-07-04 09:07:28', '2014-08-29 15:59:57');
INSERT INTO `manufacturers_2` (`id`, `name`, `address_id`, `phone`, `email`, `contact_person`, `created_at`, `updated_at`) VALUES (60, NULL, 144, '229.199.4042x308', 'annabelle.dare@example.net', 'Zelda Nader', '2016-03-14 16:05:30', '2011-11-13 08:17:20');
INSERT INTO `manufacturers_2` (`id`, `name`, `address_id`, `phone`, `email`, `contact_person`, `created_at`, `updated_at`) VALUES (61, NULL, 170, '501.786.2133x7703', 'kiera.kreiger@example.net', 'Dr. Miguel Dickens II', '2020-01-28 18:03:29', '2017-02-07 16:48:42');
INSERT INTO `manufacturers_2` (`id`, `name`, `address_id`, `phone`, `email`, `contact_person`, `created_at`, `updated_at`) VALUES (62, NULL, 144, '174-771-8474x596', 'chad39@example.org', 'Mr. Marlin Mann DVM', '2020-05-03 20:59:10', '2011-02-19 00:14:26');
INSERT INTO `manufacturers_2` (`id`, `name`, `address_id`, `phone`, `email`, `contact_person`, `created_at`, `updated_at`) VALUES (63, NULL, 115, '(074)874-6953x4337', 'rowe.norval@example.com', 'Ernie Hagenes', '2016-07-05 14:50:31', '2013-05-06 01:33:45');
INSERT INTO `manufacturers_2` (`id`, `name`, `address_id`, `phone`, `email`, `contact_person`, `created_at`, `updated_at`) VALUES (64, NULL, 125, '1-232-706-7589x699', 'iadams@example.org', 'Eldora Reichel', '2018-05-10 10:47:18', '2013-01-13 00:00:19');
INSERT INTO `manufacturers_2` (`id`, `name`, `address_id`, `phone`, `email`, `contact_person`, `created_at`, `updated_at`) VALUES (65, NULL, 167, '497.424.4056x687', 'betty04@example.net', 'Clinton Stokes', '2012-11-05 13:00:04', '2020-05-04 09:42:58');
INSERT INTO `manufacturers_2` (`id`, `name`, `address_id`, `phone`, `email`, `contact_person`, `created_at`, `updated_at`) VALUES (66, NULL, 118, '(875)009-8704x834', 'herman96@example.net', 'Rubye Langosh', '2015-04-20 13:28:59', '2016-02-16 11:50:58');
INSERT INTO `manufacturers_2` (`id`, `name`, `address_id`, `phone`, `email`, `contact_person`, `created_at`, `updated_at`) VALUES (67, NULL, 112, '1-683-384-3950', 'jasmin.d\'amore@example.net', 'Glenna Abbott Sr.', '2013-02-15 07:43:34', '2010-10-03 22:48:34');
INSERT INTO `manufacturers_2` (`id`, `name`, `address_id`, `phone`, `email`, `contact_person`, `created_at`, `updated_at`) VALUES (68, NULL, 161, '1-459-831-5636x3093', 'dschuster@example.com', 'Miss Ivy Hoeger', '2020-02-29 04:12:51', '2014-01-05 18:17:18');
INSERT INTO `manufacturers_2` (`id`, `name`, `address_id`, `phone`, `email`, `contact_person`, `created_at`, `updated_at`) VALUES (69, NULL, 121, '(213)892-9835x37211', 'kunde.deja@example.org', 'Neha Johns', '2018-02-19 09:28:48', '2013-10-10 02:29:21');
INSERT INTO `manufacturers_2` (`id`, `name`, `address_id`, `phone`, `email`, `contact_person`, `created_at`, `updated_at`) VALUES (70, NULL, 165, '1-746-375-0083', 'wava55@example.net', 'Ansley Stark', '2017-02-20 16:13:06', '2010-12-01 18:42:50');
INSERT INTO `manufacturers_2` (`id`, `name`, `address_id`, `phone`, `email`, `contact_person`, `created_at`, `updated_at`) VALUES (71, NULL, 168, '+51(7)8535394455', 'zieme.lily@example.com', 'Christ Buckridge V', '2010-06-08 08:56:50', '2012-04-25 01:36:15');
INSERT INTO `manufacturers_2` (`id`, `name`, `address_id`, `phone`, `email`, `contact_person`, `created_at`, `updated_at`) VALUES (72, NULL, 168, '+95(0)6672441823', 'thiel.erica@example.com', 'Miss Providenci O\'Reilly II', '2015-12-10 08:17:50', '2011-11-30 15:21:14');
INSERT INTO `manufacturers_2` (`id`, `name`, `address_id`, `phone`, `email`, `contact_person`, `created_at`, `updated_at`) VALUES (73, NULL, 136, '(624)012-8987x73107', 'feil.sincere@example.net', 'Ms. Juana Bayer V', '2016-04-28 05:57:26', '2018-12-12 10:11:09');
INSERT INTO `manufacturers_2` (`id`, `name`, `address_id`, `phone`, `email`, `contact_person`, `created_at`, `updated_at`) VALUES (74, NULL, 193, '(373)991-3210x916', 'ana.ortiz@example.com', 'Prof. Elissa Hane', '2012-11-30 22:46:05', '2018-05-20 04:14:01');
INSERT INTO `manufacturers_2` (`id`, `name`, `address_id`, `phone`, `email`, `contact_person`, `created_at`, `updated_at`) VALUES (75, NULL, 170, '454.767.6479', 'candido.hilpert@example.org', 'Raphaelle Aufderhar I', '2011-12-10 09:31:22', '2013-08-31 22:42:56');
INSERT INTO `manufacturers_2` (`id`, `name`, `address_id`, `phone`, `email`, `contact_person`, `created_at`, `updated_at`) VALUES (76, NULL, 176, '247.921.5752', 'jayda.steuber@example.net', 'Nelda Kris', '2014-08-30 02:42:38', '2020-03-28 02:13:17');
INSERT INTO `manufacturers_2` (`id`, `name`, `address_id`, `phone`, `email`, `contact_person`, `created_at`, `updated_at`) VALUES (77, NULL, 114, '+05(6)0865823642', 'norene05@example.org', 'Carolina Waters', '2019-10-23 14:05:20', '2013-09-21 06:52:49');
INSERT INTO `manufacturers_2` (`id`, `name`, `address_id`, `phone`, `email`, `contact_person`, `created_at`, `updated_at`) VALUES (78, NULL, 161, '860-784-7199', 'dorris12@example.org', 'Mrs. Carli Rosenbaum', '2013-05-27 17:26:11', '2014-11-19 22:28:45');
INSERT INTO `manufacturers_2` (`id`, `name`, `address_id`, `phone`, `email`, `contact_person`, `created_at`, `updated_at`) VALUES (79, NULL, 142, '152.988.1932x4720', 'zella.kiehn@example.com', 'Otho Maggio', '2010-12-08 23:56:00', '2012-06-30 19:38:27');
INSERT INTO `manufacturers_2` (`id`, `name`, `address_id`, `phone`, `email`, `contact_person`, `created_at`, `updated_at`) VALUES (80, NULL, 163, '558-910-4032x958', 'runolfsdottir.mateo@example.net', 'Mrs. Freida Lowe', '2012-04-19 12:59:43', '2010-11-07 06:43:27');
INSERT INTO `manufacturers_2` (`id`, `name`, `address_id`, `phone`, `email`, `contact_person`, `created_at`, `updated_at`) VALUES (81, NULL, 146, '561-352-2317', 'casper.russell@example.com', 'Monserrate Halvorson', '2011-03-08 10:51:28', '2010-08-31 23:02:53');
INSERT INTO `manufacturers_2` (`id`, `name`, `address_id`, `phone`, `email`, `contact_person`, `created_at`, `updated_at`) VALUES (82, NULL, 152, '923.394.2000', 'ymills@example.com', 'Scotty Parisian', '2013-05-25 02:35:31', '2018-08-24 11:31:08');
INSERT INTO `manufacturers_2` (`id`, `name`, `address_id`, `phone`, `email`, `contact_person`, `created_at`, `updated_at`) VALUES (83, NULL, 164, '777-347-6370', 'jordyn.becker@example.org', 'Theresa Daugherty', '2011-08-11 02:54:29', '2011-05-25 08:47:59');
INSERT INTO `manufacturers_2` (`id`, `name`, `address_id`, `phone`, `email`, `contact_person`, `created_at`, `updated_at`) VALUES (84, NULL, 114, '672-133-3225x350', 'desiree09@example.org', 'Elmore Spencer', '2010-07-19 15:58:22', '2011-01-14 17:01:08');
INSERT INTO `manufacturers_2` (`id`, `name`, `address_id`, `phone`, `email`, `contact_person`, `created_at`, `updated_at`) VALUES (85, NULL, 130, '258.352.3214', 'bgreenholt@example.org', 'Immanuel Lubowitz', '2019-10-13 17:06:15', '2011-02-11 16:28:52');
INSERT INTO `manufacturers_2` (`id`, `name`, `address_id`, `phone`, `email`, `contact_person`, `created_at`, `updated_at`) VALUES (86, NULL, 158, '1-896-121-6413x26818', 'callie26@example.com', 'Buddy Parker IV', '2014-02-22 02:40:53', '2018-02-08 00:42:52');
INSERT INTO `manufacturers_2` (`id`, `name`, `address_id`, `phone`, `email`, `contact_person`, `created_at`, `updated_at`) VALUES (87, NULL, 126, '1-718-348-5851', 'annamarie38@example.com', 'Dr. Jasmin Heaney', '2017-12-17 19:19:33', '2011-08-09 18:54:28');
INSERT INTO `manufacturers_2` (`id`, `name`, `address_id`, `phone`, `email`, `contact_person`, `created_at`, `updated_at`) VALUES (88, NULL, 178, '404-929-9853', 'pmayert@example.com', 'Alejandrin Grant', '2015-03-27 18:27:08', '2015-04-09 11:09:41');
INSERT INTO `manufacturers_2` (`id`, `name`, `address_id`, `phone`, `email`, `contact_person`, `created_at`, `updated_at`) VALUES (89, NULL, 146, '907.881.2372', 'nina.ryan@example.net', 'Donna Conn', '2015-01-01 19:54:03', '2011-09-02 16:43:50');
INSERT INTO `manufacturers_2` (`id`, `name`, `address_id`, `phone`, `email`, `contact_person`, `created_at`, `updated_at`) VALUES (90, NULL, 134, '537.435.5561x757', 'cali86@example.org', 'Brenna Reilly', '2014-02-07 07:30:37', '2011-02-07 08:21:26');
INSERT INTO `manufacturers_2` (`id`, `name`, `address_id`, `phone`, `email`, `contact_person`, `created_at`, `updated_at`) VALUES (91, NULL, 163, '520.019.4756', 'runolfsdottir.melody@example.net', 'Brown Marvin', '2016-08-19 12:03:43', '2010-11-19 15:58:57');
INSERT INTO `manufacturers_2` (`id`, `name`, `address_id`, `phone`, `email`, `contact_person`, `created_at`, `updated_at`) VALUES (92, NULL, 116, '1-941-602-8500', 'alvena18@example.com', 'Otto Schneider', '2017-01-04 15:53:57', '2012-12-19 02:16:28');
INSERT INTO `manufacturers_2` (`id`, `name`, `address_id`, `phone`, `email`, `contact_person`, `created_at`, `updated_at`) VALUES (93, NULL, 182, '(353)116-0553x68085', 'nienow.darion@example.org', 'Tobin Bernier II', '2018-09-11 00:18:41', '2019-11-16 02:23:11');


