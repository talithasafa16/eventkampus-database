DROP DATABASE IF EXISTS event_kampus;
CREATE DATABASE event_kampus
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;
USE event_kampus;

CREATE TABLE users (
  id            BIGINT       NOT NULL AUTO_INCREMENT,
  nama          VARCHAR(100) NOT NULL,
  email         VARCHAR(100) NOT NULL,
  password_hash VARCHAR(255) NOT NULL,
  role          VARCHAR(20)  NOT NULL DEFAULT 'Panitia',
  created_at    DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  CONSTRAINT uq_users_email UNIQUE (email),
  CONSTRAINT chk_users_role CHECK (role IN ('Admin', 'Panitia'))
) ENGINE=InnoDB;

CREATE TABLE events (
  id              BIGINT        NOT NULL AUTO_INCREMENT,
  nama_event      VARCHAR(150)  NOT NULL,
  kategori        VARCHAR(50),
  deskripsi       TEXT,
  gambar          VARCHAR(255),
  tanggal_mulai   DATETIME      NOT NULL,
  tanggal_selesai DATETIME,
  lokasi          VARCHAR(150),
  biaya           DECIMAL(12,2) NOT NULL DEFAULT 0,
  kuota           INT           NOT NULL,
  status          VARCHAR(20)   NOT NULL DEFAULT 'Aktif',
  PRIMARY KEY (id),
  CONSTRAINT chk_events_kuota  CHECK (kuota >= 0),
  CONSTRAINT chk_events_biaya  CHECK (biaya >= 0),
  CONSTRAINT chk_events_status CHECK (status IN ('Aktif', 'Nonaktif')),
  CONSTRAINT chk_events_tanggal
    CHECK (tanggal_selesai IS NULL OR tanggal_selesai >= tanggal_mulai)
) ENGINE=InnoDB;

CREATE TABLE participants (
  id      BIGINT       NOT NULL AUTO_INCREMENT,
  nim     VARCHAR(20),
  nama    VARCHAR(100) NOT NULL,
  email   VARCHAR(100) NOT NULL,
  telepon VARCHAR(20)  NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT uq_participants_email UNIQUE (email)
) ENGINE=InnoDB;

CREATE TABLE registrations (
  id                 BIGINT      NOT NULL AUTO_INCREMENT,
  event_id           BIGINT      NOT NULL,
  participant_id     BIGINT      NOT NULL,
  tanggal_daftar     DATETIME    NOT NULL DEFAULT CURRENT_TIMESTAMP,
  status_pendaftaran VARCHAR(30) NOT NULL DEFAULT 'Menunggu Verifikasi',
  status_pembayaran  VARCHAR(20) NOT NULL DEFAULT 'Menunggu',
  status_kehadiran   VARCHAR(20) NOT NULL DEFAULT 'Tidak Hadir',
  PRIMARY KEY (id),
  CONSTRAINT uq_registration UNIQUE (event_id, participant_id),
  CONSTRAINT fk_reg_event
    FOREIGN KEY (event_id) REFERENCES events (id)
    ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT fk_reg_participant
    FOREIGN KEY (participant_id) REFERENCES participants (id)
    ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT chk_reg_bayar
    CHECK (status_pembayaran IN ('Menunggu', 'Lunas', 'Tidak Valid')),
  CONSTRAINT chk_reg_hadir
    CHECK (status_kehadiran IN ('Hadir', 'Tidak Hadir'))
) ENGINE=InnoDB;
