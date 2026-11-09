USE event_kampus;

-- Akun login (hanya untuk pengembangan)
-- admin@eventkampus.test    / password: admin123
-- panitia@eventkampus.test  / password: panitia123
INSERT INTO users (nama, email, password_hash, role) VALUES
('Admin EventKampus', 'admin@eventkampus.test',   '$2a$10$s5zwHWxTS4dd81EaeZdmf.HFRL3TvmkoFXNjr0x3zP6DpA8qbvp5S', 'Admin'),
('Panitia Kampus',    'panitia@eventkampus.test', '$2a$10$XjR0Y609eIGHXhZ9YIE/P./oXsKO79f0YeZlr0ApiCukJC4PTvwse', 'Panitia');

INSERT INTO events
(nama_event, kategori, deskripsi, gambar, tanggal_mulai, tanggal_selesai, lokasi, biaya, kuota, status) VALUES
('Seminar Nasional Teknologi Informasi', 'Seminar',    'Seminar tentang tren teknologi informasi terkini.',        'seminar-ti.jpg',   '2026-12-05 09:00:00', '2026-12-05 12:00:00', 'Aula Utama Kampus',    0,      100, 'Aktif'),
('Workshop UI/UX Design',                'Workshop',   'Workshop dasar desain antarmuka untuk pemula.',            'workshop-uiux.jpg','2026-12-12 13:00:00', '2026-12-12 16:00:00', 'Lab Komputer 2',       50000,  3,   'Aktif'),
('Lomba Pemrograman Antar Mahasiswa',    'Kompetisi',  'Kompetisi pemrograman tingkat kampus.',                    'lomba-coding.jpg', '2026-12-20 08:00:00', '2026-12-20 17:00:00', 'Gedung Fakultas Ilmu Komputer', 75000, 50, 'Aktif'),
('Pelatihan Data Analysis dengan Excel', 'Pelatihan',  'Pelatihan analisis data menggunakan Excel.',               'pelatihan-excel.jpg','2027-01-10 09:00:00','2027-01-10 15:00:00', 'Ruang Seminar 3',      100000, 30,  'Aktif'),
('Seminar Karier dan Dunia Kerja',       'Seminar',    'Seminar persiapan karier untuk mahasiswa tingkat akhir.',  'seminar-karier.jpg','2026-10-20 09:00:00','2026-10-20 12:00:00', 'Aula Utama Kampus',    0,      100, 'Nonaktif');

INSERT INTO participants (nim, nama, email, telepon) VALUES
('2210512001', 'Andi Pratama',   'andi@mail.test',   '081200000001'),
('2210512002', 'Budi Santoso',   'budi@mail.test',   '081200000002'),
('2210512003', 'Citra Lestari',  'citra@mail.test',  '081200000003'),
('2210512004', 'Dewi Anggraini', 'dewi@mail.test',   '081200000004'),
('2210512005', 'Eko Wijaya',     'eko@mail.test',    '081200000005'),
(NULL,         'Fajar Nugroho',  'fajar@mail.test',  '081200000006');

INSERT INTO registrations
(event_id, participant_id, tanggal_daftar, status_pendaftaran, status_pembayaran, status_kehadiran) VALUES
(1, 1, '2026-11-01 10:00:00', 'Menunggu Verifikasi', 'Menunggu',    'Tidak Hadir'),
(1, 2, '2026-11-02 11:30:00', 'Terverifikasi',       'Menunggu',    'Tidak Hadir'),
(2, 1, '2026-11-03 09:15:00', 'Terverifikasi',       'Lunas',       'Tidak Hadir'),
(2, 2, '2026-11-03 14:00:00', 'Menunggu Verifikasi', 'Menunggu',    'Tidak Hadir'),
(2, 3, '2026-11-04 08:45:00', 'Menunggu Verifikasi', 'Tidak Valid', 'Tidak Hadir'),
(3, 4, '2026-11-05 16:20:00', 'Terverifikasi',       'Lunas',       'Tidak Hadir'),
(5, 5, '2026-10-10 10:00:00', 'Terverifikasi',       'Lunas',       'Hadir'),
(5, 6, '2026-10-11 13:00:00', 'Terverifikasi',       'Lunas',       'Tidak Hadir');
