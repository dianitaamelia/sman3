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