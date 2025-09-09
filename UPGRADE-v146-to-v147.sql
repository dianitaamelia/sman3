-- ----------------------------
-- Table structure for agenda
-- ----------------------------
INSERT INTO posts(`post_title`, `post_date`, `post_type`)
SELECT kegiatan, mulai, "agenda" as agenda FROM agenda;
DROP TABLE `agenda`;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO ptk(
	`nik`
	, `nip`
	, `nuptk`
	, `nama`
	, `jenis_kelamin`
	, `alamat`
	, `telp`
	, `email`
	, `tempat_lahir`
	, `tanggal_lahir`
	, `jurusan`
	, `photo`
)
SELECT nip
	, nip
	, nuptk
	, nama
	, jenis_kelamin
	, alamat
	, telp
	, email
	, tempat_lahir
	, tanggal_lahir
	, jurusan
	, photo
FROM guru;
DROP TABLE `guru`;

-- ----------------------------
-- Table structure for siswa
-- ----------------------------

RENAME TABLE `siswa` TO `temp_siswa`;
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

INSERT INTO siswa(
`no_daftar`
, `nis`
, `nisn`
, `nama`
, `kelas_id`
, `status_siswa`
, `tempat_lahir`
, `tanggal_lahir`
, `jenis_kelamin`
, `agama`
, `status_anak`
, `anak_ke`
, `alamat`
, `telp_rumah`
, `email`
, `sekolah_asal`
, `diterima_dikelas`
, `pada_tanggal`
, `ayah`
, `ibu`
, `alamat_ortu`
, `telp_ortu`
, `pekerjaan_ayah`
, `pekerjaan_ibu`
, `photo`
, `jalur_pendaftaran_id`
, `tanggal_daftar`
, `pilihan_1`
, `pilihan_2`
, `hasil_seleksi`
, `tahun_lulus`
)
SELECT 
nisn
, nisn
, nisn
, nama
, kelas_id
, status_siswa
, tempat_lahir
, tanggal_lahir
, jenis_kelamin
, agama
, status_anak
, anak_ke
, alamat
, telp_rumah
, email
, sekolah_asal
, diterima_dikelas
, pada_tanggal
, ayah
, ibu
, alamat_ortu
, telp_ortu
, pekerjaan_ayah
, pekerjaan_ibu
, photo
, jalur_pendaftaran_id
, tanggal_daftar
, pilihan_1
, pilihan_2
, hasil_seleksi
, tahun_lulus
FROM temp_siswa;
DROP TABLE `temp_siswa`;

-- ----------------------------
-- Table structure for posts
-- ----------------------------
RENAME TABLE `posts` TO `temp_posts`;
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
  KEY `username` (`user_id`),
  KEY `category_id` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO posts(
`post_id`
, `post_title`
, `post_date`
, `post_type`
, `post_content`
, `post_parent`
, `category_id`
, `post_image`
, `order_pages`
, `slug`
)
SELECT
post_id
, post_title
, post_date
, post_type
, post_content
, post_parent
, category_id
, post_image
, order_pages
, slug
FROM temp_posts;
DROP TABLE `temp_posts`;


-- ----------------------------
-- Table structure for users
-- ----------------------------
RENAME TABLE `users` TO `temp_users`;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO users(
`username`
, `password`
, `level`
, `last_logged_in`
, `ip_address`
, `display_name`
, `email`
, `activation_key`
)
SELECT 
username
, password
, level
, last_logged_in
, ip_address
, display_name
, email
 , activation_key
FROM temp_users;
DROP TABLE `temp_users`;


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
select x1.kelas_id
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
INSERT INTO `options` VALUES ('1', 'npsn', '');
INSERT INTO `options` VALUES ('2', 'nama_sekolah', '');
INSERT INTO `options` VALUES ('3', 'jenjang', 'SMA');
INSERT INTO `options` VALUES ('4', 'alamat', '');
INSERT INTO `options` VALUES ('5', 'kelurahan', '');
INSERT INTO `options` VALUES ('6', 'kecamatan', '');
INSERT INTO `options` VALUES ('7', 'kabupaten', '');
INSERT INTO `options` VALUES ('8', 'propinsi', '');
INSERT INTO `options` VALUES ('9', 'website', '');
INSERT INTO `options` VALUES ('10', 'email', '');
INSERT INTO `options` VALUES ('11', 'telp', '');
INSERT INTO `options` VALUES ('12', 'ptk_id', '');
INSERT INTO `options` VALUES ('13', 'sambutan_kepala_sekolah', '');
INSERT INTO `options` VALUES ('14', 'logo', '');
INSERT INTO `options` VALUES ('15', 'ppdb_tahun', '');
INSERT INTO `options` VALUES ('16', 'ppdb_status', '');
INSERT INTO `options` VALUES ('17', 'header_image', '');
INSERT INTO `options` VALUES ('18', 'facebook', '');
INSERT INTO `options` VALUES ('19', 'twitter', '');
INSERT INTO `options` VALUES ('20', 'youtube', '');
INSERT INTO `options` VALUES ('21', 'google_plus', '');
INSERT INTO `options` VALUES ('22', 'yahoo', '');
INSERT INTO `options` VALUES ('23', 'word_filter', '');
INSERT INTO `options` VALUES ('24', 'set_menu_label', '');
INSERT INTO `options` VALUES ('25', 'cache_file', 'n');
INSERT INTO `options` VALUES ('26', 'themes', '');
INSERT INTO `options` VALUES ('27', 'meta_keywords', '');
INSERT INTO `options` VALUES ('28', 'meta_description', '');
INSERT INTO `options` VALUES ('29', 'google_map', '-6.225233, 106.802700');

UPDATE options x1, pengaturan x2
SET x1.value = x2.npsn
WHERE x1.variable = 'npsn';

UPDATE options x1, pengaturan x2
SET x1.value = x2.nama_sekolah
WHERE x1.variable = 'nama_sekolah';

UPDATE options x1, pengaturan x2
SET x1.value = x2.jenjang
WHERE x1.variable = 'jenjang';

UPDATE options x1, pengaturan x2
SET x1.value = x2.alamat
WHERE x1.variable = 'alamat';

UPDATE options x1, pengaturan x2
SET x1.value = x2.kelurahan
WHERE x1.variable = 'kelurahan';

UPDATE options x1, pengaturan x2
SET x1.value = x2.kecamatan
WHERE x1.variable = 'kecamatan';

UPDATE options x1, pengaturan x2
SET x1.value = x2.kabupaten
WHERE x1.variable = 'kabupaten';

UPDATE options x1, pengaturan x2
SET x1.value = x2.propinsi
WHERE x1.variable = 'propinsi';

UPDATE options x1, pengaturan x2
SET x1.value = x2.website
WHERE x1.variable = 'website';

UPDATE options x1, pengaturan x2
SET x1.value = x2.email
WHERE x1.variable = 'email';

UPDATE options x1, pengaturan x2
SET x1.value = x2.telp
WHERE x1.variable = 'telp';

UPDATE options x1, pengaturan x2
SET x1.value = x2.sambutan_kepala_sekolah
WHERE x1.variable = 'sambutan_kepala_sekolah';

UPDATE options x1, pengaturan x2
SET x1.value = x2.logo
WHERE x1.variable = 'logo';

UPDATE options x1, pengaturan x2
SET x1.value = x2.ppdb_tahun
WHERE x1.variable = 'ppdb_tahun';

UPDATE options x1, pengaturan x2
SET x1.value = x2.ppdb_status
WHERE x1.variable = 'ppdb_status';

UPDATE options x1, pengaturan x2
SET x1.value = x2.header_image
WHERE x1.variable = 'header_image';

UPDATE options x1, pengaturan x2
SET x1.value = x2.facebook
WHERE x1.variable = 'facebook';

UPDATE options x1, pengaturan x2
SET x1.value = x2.twitter
WHERE x1.variable = 'twitter';

UPDATE options x1, pengaturan x2
SET x1.value = x2.youtube
WHERE x1.variable = 'youtube';

UPDATE options x1, pengaturan x2
SET x1.value = x2.google_plus
WHERE x1.variable = 'google_plus';

UPDATE options x1, pengaturan x2
SET x1.value = x2.yahoo
WHERE x1.variable = 'yahoo';

UPDATE options x1, pengaturan x2
SET x1.value = x2.word_filter
WHERE x1.variable = 'word_filter';

UPDATE options x1, pengaturan x2
SET x1.value = x2.set_menu_label
WHERE x1.variable = 'set_menu_label';

UPDATE options x1 SET x1.value = 'default' WHERE x1.variable = 'themes';

-- DROP TABLE Pengaturan
DROP TABLE `pengaturan`;
DROP TABLE `guru_mata_pelajaran`;


-- ----------------------------
-- Table structure for mata_pelajaran
-- ----------------------------
RENAME TABLE `mata_pelajaran` TO `temp_mata_pelajaran`;
DROP TABLE IF EXISTS `mata_pelajaran`;
CREATE TABLE `mata_pelajaran` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kode` varchar(20) DEFAULT NULL,
  `mata_pelajaran` varchar(50) DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `kode` (`kode`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
INSERT INTO mata_pelajaran(`kode`, `mata_pelajaran`)
SELECT kode, mata_pelajaran FROM temp_mata_pelajaran;
DROP TABLE `temp_mata_pelajaran`;

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