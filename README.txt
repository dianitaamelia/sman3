------------------------------------------------
# PANDUAN INSTALLASI
------------------------------------------------
1. Pastikan sudah terinstall web server Apache, PHP, MySQL, dan phpmyadmin di komputer. 
	Bagi pengguna OS Windows, untuk memudahkan silahkan download XAMPP atau WAMP SERVER. WAMP SERVER download disini http://www.wampserver.com,XAMPP download disini https://www.apachefriends.org
2. Buat folder dengan nama "cmssekolahku" dalam direktori xampp/htdocs, jika mengunakan XAMPP atau 
	dalam direktori www jika menggunakan WAMP.
3. Extract file cms-sekolahku-v1.4.7.zip folder tersebut
4. Buka phpMyAdmin di browser dengan mengetikan localhost/phpmyadmin
5. Pilih menu "DATABASE" kemudian buat database dengan nama "db_sekolahku"
6. Jika point 5 sukses, database dengan nama db_sekolahku akan muncul disamping kiri. 
7. Klik database tersebut dan pilih menu "IMPORT", kemudian browse file dengan nama db_sekolahku.sql 
	yang saya sertakan dalam folder hasil download.
8.	Selesai.

- Silahkan buka browser dan ketikan URL : localhost/cmssekolahku 
- Untuk login kke halaman backend, ketikan URL: localhost/cmssekolahku/login 
- Default username dan password yaitu administrator
- CATATAN : Sampai langkah 7 seharusnya program sudah bisa dijalankan, untuk memastikan konfigurasi database sudah benar atau belum, silahkan buka file database.php yang ada di dalam folder cmssekolahku/application/config/database.php dengan menggunakan Code Editor sejenis Notepad++ atau Sublime Text. 
Lihat baris 78, 79, dan 80. Silahkan sesuaikan 3 baris tersebut sesuai dengan konfigurasi komputer masing-masing.


------------------------------------------------
# CARA UPDATE DARI VERSI 1.4.6 KE 1.4.7
------------------------------------------------
1. BACKUP semua FILE CMS yang sudah terinstall di server dan simpan di komputer local.
2. Hapus semua file dan folder di server tempat installasi CMS.
3. UPLOAD semua file dan folder yang ada didalam CMS v1.4.7 ke server
4. RENAME FOLDER "guru" di direktori assets/guru pada CMS v1.4.6 yang sudah di backup 
	menjadi "ptk"
5. COPY folder-folder dibawah ini yang ada di folder assets CMS v1.4.6 yang sudah di backup  :
	"banner", "berkas", "gallery", "ptk", "post", "siswa"
6. BACKUP DATABASE yang saat ini digunakan, untuk menghindari kehilangan data.
7. IMPORT file SQL dengan nama UPGRADE.sql yang ada di CMS Sekolahku v1.4.7
8. SELESAI


------------------------------------------------
# UNTUK DIINGAT
------------------------------------------------
1. TIDAK DIPERKENANKAN MEMPERJUALBELIKAN APLIKASI INI TANPA SEIZIN DARI PIHAK PENGEMBANG APLIKASI.
2. TIDAK DIPERKENANKAN MENGHAPUS KODE SUMBER APLIKASI.
3. TIDAK MENYERTAKAN LINK KOMERSIL (JASA LAYANAN HOSTING DAN DOMAIN) YANG MENGUNTUNGKAN SEPIHAK.

-----------------------------------------------------------------------
# DEFAULT THEME ON CURRENT VERSION BY https://www.facebook.com/ciussgw
-----------------------------------------------------------------------