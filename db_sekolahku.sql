-- ----------------------------
-- Table structure for album
-- ----------------------------
DROP TABLE IF EXISTS `album`;
CREATE TABLE `album` (
  `album_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `album` varchar(255) NOT NULL,
  PRIMARY KEY (`album_id`),
  UNIQUE KEY `album` (`album`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of album
-- ----------------------------

-- ----------------------------
-- Table structure for banner
-- ----------------------------
DROP TABLE IF EXISTS `banner`;
CREATE TABLE `banner` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `url` varchar(100) NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `gambar` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of banner
-- ----------------------------

-- ----------------------------
-- Table structure for captcha
-- ----------------------------
DROP TABLE IF EXISTS `captcha`;
CREATE TABLE `captcha` (
  `captcha_id` bigint(13) unsigned NOT NULL AUTO_INCREMENT,
  `captcha_time` int(10) unsigned NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `word` varchar(20) NOT NULL,
  PRIMARY KEY (`captcha_id`),
  KEY `word` (`word`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of captcha
-- ----------------------------

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `category_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `category` varchar(255) NOT NULL,
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `category` (`category`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------

-- ----------------------------
-- Table structure for ci_sessions
-- ----------------------------
DROP TABLE IF EXISTS `ci_sessions`;
CREATE TABLE `ci_sessions` (
  `id` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) unsigned NOT NULL DEFAULT '0',
  `data` blob NOT NULL,
  KEY `ci_sessions_timestamp` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for file
-- ----------------------------
DROP TABLE IF EXISTS `file`;
CREATE TABLE `file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` smallint(6) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `type` varchar(50) NOT NULL,
  `size` int(11) NOT NULL,
  `file` varchar(100) NOT NULL,
  `counter` int(11) NOT NULL,
  `access` enum('public','private') NOT NULL DEFAULT 'public',
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`) USING BTREE,
  KEY `category_id` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of file
-- ----------------------------

-- ----------------------------
-- Table structure for file_category
-- ----------------------------
DROP TABLE IF EXISTS `file_category`;
CREATE TABLE `file_category` (
  `category_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `category` varchar(255) NOT NULL,
  `parent` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of file_category
-- ----------------------------

-- ----------------------------
-- Table structure for hubungi_kami
-- ----------------------------
DROP TABLE IF EXISTS `hubungi_kami`;
CREATE TABLE `hubungi_kami` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `url` varchar(100) DEFAULT NULL,
  `pertanyaan` text NOT NULL,
  `jawaban` text,
  `tanggal` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ip_address` varchar(20) NOT NULL DEFAULT '0.0.0.0',
  `access` enum('public','private') NOT NULL DEFAULT 'private',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hubungi_kami
-- ----------------------------

-- ----------------------------
-- Table structure for jalur_pendaftaran
-- ----------------------------
DROP TABLE IF EXISTS `jalur_pendaftaran`;
CREATE TABLE `jalur_pendaftaran` (
  `jalur_pendaftaran_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `jalur_pendaftaran` varchar(255) NOT NULL,
  PRIMARY KEY (`jalur_pendaftaran_id`),
  UNIQUE KEY `jalur_pendaftaran` (`jalur_pendaftaran`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jalur_pendaftaran
-- ----------------------------

-- ----------------------------
-- Table structure for jawaban
-- ----------------------------
DROP TABLE IF EXISTS `jawaban`;
CREATE TABLE `jawaban` (
  `jawaban_id` int(11) NOT NULL AUTO_INCREMENT,
  `pertanyaan_id` int(11) NOT NULL,
  `jawaban` varchar(255) NOT NULL,
  PRIMARY KEY (`jawaban_id`),
  KEY `pertanyaan_id` (`pertanyaan_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jawaban
-- ----------------------------
INSERT INTO `jawaban` VALUES ('1', '1', 'Sangat Bagus');
INSERT INTO `jawaban` VALUES ('2', '1', 'Bagus');
INSERT INTO `jawaban` VALUES ('3', '1', 'Cukup Bagus');
INSERT INTO `jawaban` VALUES ('4', '1', 'Kurang menarik');

-- ----------------------------
-- Table structure for jurusan
-- ----------------------------
DROP TABLE IF EXISTS `jurusan`;
CREATE TABLE `jurusan` (
  `jurusan_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `jurusan` varchar(255) NOT NULL,
  `nama_singkat` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`jurusan_id`),
  UNIQUE KEY `jurusan` (`jurusan`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jurusan
-- ----------------------------

-- ----------------------------
-- Table structure for kata_motivasi
-- ----------------------------
DROP TABLE IF EXISTS `kata_motivasi`;
CREATE TABLE `kata_motivasi` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) NOT NULL,
  `author` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of kata_motivasi
-- ----------------------------

-- ----------------------------
-- Table structure for kelas
-- ----------------------------
DROP TABLE IF EXISTS `kelas`;
CREATE TABLE `kelas` (
  `kelas_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `kelas` varchar(100) NOT NULL,
  `sub_kelas` varchar(100) NOT NULL,
  `jurusan_id` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`kelas_id`),
  KEY `jurusan_id` (`jurusan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of kelas
-- ----------------------------

-- ----------------------------
-- Table structure for mata_pelajaran
-- ----------------------------
DROP TABLE IF EXISTS `mata_pelajaran`;
CREATE TABLE `mata_pelajaran` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kode` varchar(20) DEFAULT NULL,
  `mata_pelajaran` varchar(50) DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `kode` (`kode`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mata_pelajaran
-- ----------------------------

-- ----------------------------
-- Table structure for options
-- ----------------------------
DROP TABLE IF EXISTS `options`;
CREATE TABLE `options` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `variable` varchar(255) DEFAULT NULL,
  `value` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of options
-- ----------------------------
INSERT INTO `options` VALUES ('1', 'npsn', '100');
INSERT INTO `options` VALUES ('2', 'nama_sekolah', 'SMA Negeri 9 Kuningan');
INSERT INTO `options` VALUES ('3', 'jenjang', 'SMA');
INSERT INTO `options` VALUES ('4', 'alamat', 'Jalan Raya Kadugede No. 11 Desa/Kec. Kadugede - Kuningan Jawa Barat 45561');
INSERT INTO `options` VALUES ('5', 'kelurahan', 'kadugede');
INSERT INTO `options` VALUES ('6', 'kecamatan', 'Kadugede');
INSERT INTO `options` VALUES ('7', 'kabupaten', 'Kuningan');
INSERT INTO `options` VALUES ('8', 'propinsi', 'Jawa Barat');
INSERT INTO `options` VALUES ('9', 'website', 'sekolahku.web.id');
INSERT INTO `options` VALUES ('10', 'email', 'cmssekolahku@gmail.com');
INSERT INTO `options` VALUES ('11', 'telp', '123456789');
INSERT INTO `options` VALUES ('12', 'ptk_id', '1');
INSERT INTO `options` VALUES ('13', 'sambutan_kepala_sekolah', 'Assalamu\'alaikum wr.wb');
INSERT INTO `options` VALUES ('14', 'logo', 'logo-sekolah.jpg');
INSERT INTO `options` VALUES ('15', 'ppdb_tahun', '2016');
INSERT INTO `options` VALUES ('16', 'ppdb_status', 'open');
INSERT INTO `options` VALUES ('17', 'header_image', 'header-default.png');
INSERT INTO `options` VALUES ('18', 'facebook', 'https://www.facebook.com/sekolahkuwebid-369673026533366');
INSERT INTO `options` VALUES ('19', 'twitter', '@sman9kuningan');
INSERT INTO `options` VALUES ('20', 'youtube', 'SMAN 9 Kuningan');
INSERT INTO `options` VALUES ('21', 'google_plus', 'sman9kuningan');
INSERT INTO `options` VALUES ('22', 'yahoo', 'sman9kuningan');
INSERT INTO `options` VALUES ('23', 'word_filter', '');
INSERT INTO `options` VALUES ('24', 'set_menu_label', '');
INSERT INTO `options` VALUES ('25', 'cache_file', 'n');
INSERT INTO `options` VALUES ('26', 'themes', 'default');
INSERT INTO `options` VALUES ('27', 'meta_keywords', 'CMS Sekolah, Website Sekolah, website Sekolah Gratis, CMS sekolahku');
INSERT INTO `options` VALUES ('28', 'meta_description', 'CMS Sekolahku | CMS (Content Management System) dan PPDB Online GRATIS untuk sekolah SD, SMP/Sederajat, SMA/Sederajat');
INSERT INTO `options` VALUES ('29', 'google_map', '-6.225233, 106.802700');

-- ----------------------------
-- Table structure for pertanyaan
-- ----------------------------
DROP TABLE IF EXISTS `pertanyaan`;
CREATE TABLE `pertanyaan` (
  `pertanyaan_id` int(11) NOT NULL AUTO_INCREMENT,
  `pertanyaan` varchar(255) NOT NULL,
  `tanggal` date NOT NULL,
  `status` enum('y','n') NOT NULL DEFAULT 'n',
  PRIMARY KEY (`pertanyaan_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pertanyaan
-- ----------------------------
INSERT INTO `pertanyaan` VALUES ('1', 'Apakah website ini bagus ?', '2016-04-30', 'y');

-- ----------------------------
-- Table structure for photo
-- ----------------------------
DROP TABLE IF EXISTS `photo`;
CREATE TABLE `photo` (
  `photo_id` int(11) NOT NULL AUTO_INCREMENT,
  `photo_title` text NOT NULL,
  `photo_thumb` varchar(255) DEFAULT NULL,
  `photo_original` varchar(255) NOT NULL,
  `album_id` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`photo_id`),
  KEY `album_id` (`album_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of photo
-- ----------------------------

-- ----------------------------
-- Table structure for polling
-- ----------------------------
DROP TABLE IF EXISTS `polling`;
CREATE TABLE `polling` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `jawaban_id` int(11) NOT NULL,
  `ip_address` varchar(20) NOT NULL,
  `tanggal` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jawaban_id` (`jawaban_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of polling
-- ----------------------------

-- ----------------------------
-- Table structure for posts
-- ----------------------------
DROP TABLE IF EXISTS `posts`;
CREATE TABLE `posts` (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `post_title` varchar(255) NOT NULL,
  `post_date` date NOT NULL DEFAULT '0000-00-00',
  `post_type` enum('post','page','pengumuman','sekilas_info','sambutan_kepala_sekolah','prestasi_sekolah','prestasi_ptk','prestasi_siswa','agenda') NOT NULL DEFAULT 'post',
  `post_content` text NOT NULL,
  `user_id` bigint(20) DEFAULT '1',
  `post_parent` bigint(20) DEFAULT '0',
  `category_id` smallint(6) DEFAULT NULL,
  `post_image` varchar(100) DEFAULT NULL,
  `order_pages` smallint(6) NOT NULL DEFAULT '0',
  `slug` varchar(255) DEFAULT NULL,
  `counter` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`post_id`),
  KEY `user_id` (`user_id`),
  KEY `category_id` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of posts
-- ----------------------------

-- ----------------------------
-- Table structure for ptk
-- ----------------------------
DROP TABLE IF EXISTS `ptk`;
CREATE TABLE `ptk` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nik` varchar(100) DEFAULT NULL,
  `nip` varchar(100) DEFAULT NULL,
  `nuptk` varchar(100) DEFAULT NULL,
  `nama` varchar(100) NOT NULL DEFAULT '',
  `jenis_kelamin` enum('Laki-laki','Perempuan') NOT NULL DEFAULT 'Laki-laki',
  `alamat` varchar(255) DEFAULT NULL,
  `telp` varchar(15) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `tempat_lahir` varchar(255) DEFAULT NULL,
  `tanggal_lahir` date DEFAULT '0000-00-00',
  `pendidikan` smallint(6) NOT NULL DEFAULT '15',
  `jurusan` varchar(100) DEFAULT NULL,
  `status_kepegawaian` tinyint(2) DEFAULT '11',
  `jenis_ptk` tinyint(2) DEFAULT '11',
  `photo` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ptk
-- ----------------------------
INSERT INTO `ptk` VALUES ('1', '100', '100', '100', 'Anton Sofyan', 'Laki-laki', 'Kuningan', '123456789', 'info@gmail.com', 'Kuningan', '1986-10-16', '0', 'Sistem Informasi', '11', '11', 'photo.jpg');

-- ----------------------------
-- Table structure for siswa
-- ----------------------------
DROP TABLE IF EXISTS `siswa`;
CREATE TABLE `siswa` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `no_daftar` varchar(10) DEFAULT NULL,
  `nis` varchar(50) DEFAULT NULL,
  `nisn` varchar(100) DEFAULT NULL,
  `nama` varchar(100) NOT NULL,
  `kelas_id` smallint(6) DEFAULT NULL,
  `status_siswa` enum('baru','aktif','pindah','dropout','lulus') NOT NULL DEFAULT 'aktif',
  `tempat_lahir` varchar(100) DEFAULT NULL,
  `tanggal_lahir` date DEFAULT '0000-00-00',
  `jenis_kelamin` enum('Laki-Laki','Perempuan') NOT NULL DEFAULT 'Laki-Laki',
  `agama` enum('Islam','Kristen','Katholik','Hindu','Budha') NOT NULL DEFAULT 'Islam',
  `status_anak` enum('Anak Kandung','Anak Angkat') NOT NULL DEFAULT 'Anak Kandung',
  `anak_ke` smallint(6) DEFAULT NULL,
  `alamat` varchar(100) DEFAULT NULL,
  `telp_rumah` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `sekolah_asal` varchar(100) DEFAULT NULL,
  `diterima_dikelas` smallint(6) DEFAULT NULL,
  `pada_tanggal` date DEFAULT '0000-00-00',
  `ayah` varchar(100) DEFAULT NULL,
  `ibu` varchar(100) DEFAULT NULL,
  `alamat_ortu` varchar(255) DEFAULT NULL,
  `telp_ortu` varchar(50) DEFAULT NULL,
  `pekerjaan_ayah` varchar(255) DEFAULT NULL,
  `pekerjaan_ibu` varchar(255) DEFAULT NULL,
  `nama_wali` varchar(100) DEFAULT NULL,
  `alamat_wali` varchar(255) DEFAULT NULL,
  `telp_wali` varchar(50) DEFAULT NULL,
  `pekerjaan_wali` varchar(255) DEFAULT NULL,
  `photo` varchar(100) DEFAULT NULL,
  `jalur_pendaftaran_id` smallint(6) DEFAULT NULL,
  `tanggal_daftar` date DEFAULT '0000-00-00',
  `pilihan_1` smallint(6) DEFAULT NULL,
  `pilihan_2` smallint(6) DEFAULT NULL,
  `hasil_seleksi` varchar(100) DEFAULT NULL,
  `tahun_lulus` year(4) DEFAULT NULL,
  `pin_bb` varchar(20) DEFAULT NULL,
  `facebook` varchar(255) DEFAULT NULL,
  `aktivitas_sekarang` text,
  `twitter` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `diterima_dikelas` (`diterima_dikelas`),
  KEY `kelas_id` (`kelas_id`),
  KEY `jalur_pendaftaran_id` (`jalur_pendaftaran_id`),
  KEY `pilihan_1` (`pilihan_1`),
  KEY `pilihan_2` (`pilihan_2`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of siswa
-- ----------------------------

-- ----------------------------
-- Table structure for tautan
-- ----------------------------
DROP TABLE IF EXISTS `tautan`;
CREATE TABLE `tautan` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tautan
-- ----------------------------

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `level` enum('administrator','operator','ptk','siswa') NOT NULL DEFAULT 'operator',
  `last_logged_in` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ip_address` varchar(20) NOT NULL DEFAULT '0.0.0.0',
  `display_name` varchar(100) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `activation_key` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'administrator', '$2y$10$qLgN1yw69/Xsy7W57RiZ8OkFcIGGqRakhqKQzJ5DQeJE2l/jEqRX6', 'administrator', '2016-04-30 21:48:28', '127.0.0.1', 'Administrator', 'admin@gmail.com', null);

-- ----------------------------
-- Table structure for video
-- ----------------------------
DROP TABLE IF EXISTS `video`;
CREATE TABLE `video` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `unique_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- VIEW KELAS
CREATE OR REPLACE VIEW view_kelas AS 
SELECT x1.kelas_id
, CONCAT(x1.kelas, IF((x2.nama_singkat <> ''), CONCAT(' ',x2.nama_singkat),''),IF((x1.sub_kelas <> ''),CONCAT(' - ',x1.sub_kelas),'')) AS kelas
FROM kelas x1 
LEFT JOIN jurusan x2 
  ON x1.jurusan_id = x2.jurusan_id;

-- VIEW SISWA
CREATE OR REPLACE VIEW view_siswa AS
SELECT x1.*
  , x2.jalur_pendaftaran AS jalur_pendaftaran
  , x3.jurusan AS pilihan_satu
  , x4.jurusan AS pilihan_dua
  , x5.kelas
  , x6.kelas AS dikelas
FROM siswa x1
LEFT JOIN jalur_pendaftaran x2
    ON x2.jalur_pendaftaran_id = x1.jalur_pendaftaran_id
LEFT JOIN jurusan x3
    ON x3.jurusan_id = x1.pilihan_1
LEFT JOIN jurusan x4
    ON x4.jurusan_id = x1.pilihan_2
LEFT JOIN view_kelas x5
    ON x1.kelas_id = x5.kelas_id
LEFT JOIN view_kelas x6
    ON x1.diterima_dikelas = x6.kelas_id;

-- VIEW POOLING
CREATE OR REPLACE VIEW view_polling AS
  SELECT x1.id
    , x1.jawaban_id
    , x1.ip_address
    , x1.tanggal
    , x2.pertanyaan_id
    , x2.jawaban
FROM polling x1
LEFT JOIN jawaban x2
  ON x2.jawaban_id = x1.jawaban_id;