-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 17, 2023 at 03:00 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rs_fix`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_igd`
--

CREATE TABLE `tb_igd` (
  `id_igd` int(11) NOT NULL,
  `id_pasien` int(11) DEFAULT NULL,
  `id_petugasmedis` int(11) DEFAULT NULL,
  `id_tindakan` int(11) DEFAULT NULL,
  `tanggal` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_jadwalpraktik`
--

CREATE TABLE `tb_jadwalpraktik` (
  `id_jadwalpraktik` int(11) NOT NULL,
  `hari` varchar(20) DEFAULT NULL,
  `jam` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_kamar`
--

CREATE TABLE `tb_kamar` (
  `id_kamar` int(11) NOT NULL,
  `tipe_kamar` varchar(50) DEFAULT NULL,
  `tarif_kamar` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_obat`
--

CREATE TABLE `tb_obat` (
  `id_obat` int(11) NOT NULL,
  `nm_obat` varchar(100) DEFAULT NULL,
  `jenis_obat` varchar(50) DEFAULT NULL,
  `stok` int(11) DEFAULT NULL,
  `harga_obat` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_obatkeluar`
--

CREATE TABLE `tb_obatkeluar` (
  `id_obat_keluar` int(11) NOT NULL,
  `id_obat` int(11) DEFAULT NULL,
  `jml_obat` int(11) DEFAULT NULL,
  `tgl_keluar` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_pasien`
--

CREATE TABLE `tb_pasien` (
  `id_pasien` int(11) NOT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `gender` enum('Laki-laki','Perempuan') DEFAULT NULL,
  `jenis_identitas` enum('KTP','SIM','Paspor') DEFAULT NULL,
  `nomor_identitas` varchar(30) DEFAULT NULL,
  `tempat_lahir` varchar(50) DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `alamat` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_pegawai`
--

CREATE TABLE `tb_pegawai` (
  `id_pegawai` int(11) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `alamat` varchar(200) DEFAULT NULL,
  `nip` varchar(20) DEFAULT NULL,
  `jabatan` varchar(50) DEFAULT NULL,
  `riwayat_pendidikan` varchar(200) DEFAULT NULL,
  `jurusan` varchar(50) DEFAULT NULL,
  `thn_lulus` int(11) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_pembayaran`
--

CREATE TABLE `tb_pembayaran` (
  `id_pembayaran` int(11) NOT NULL,
  `id_resep` int(11) DEFAULT NULL,
  `id_tindakan` int(11) DEFAULT NULL,
  `total` decimal(11,2) DEFAULT NULL,
  `tgl_bayar` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_petugasmedis`
--

CREATE TABLE `tb_petugasmedis` (
  `id_petugasmedis` int(11) NOT NULL,
  `id_pegawai` int(11) DEFAULT NULL,
  `id_jadwalpraktik` int(11) DEFAULT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `spesialisasi` varchar(50) DEFAULT NULL,
  `telepon` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_poliklinik`
--

CREATE TABLE `tb_poliklinik` (
  `id_poliklinik` int(11) NOT NULL,
  `nama_poliklinik` varchar(50) DEFAULT NULL,
  `id_petugasmedis` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_rawatinap`
--

CREATE TABLE `tb_rawatinap` (
  `id_rawatinap` int(5) NOT NULL,
  `id_pasien` int(5) NOT NULL,
  `id_petugasmedis` int(5) NOT NULL,
  `id_tindakan` int(5) NOT NULL,
  `id_kamar` int(5) NOT NULL,
  `tgl_masuk` date DEFAULT NULL,
  `tgl_keluar` date DEFAULT NULL,
  `status` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_rawatjalan`
--

CREATE TABLE `tb_rawatjalan` (
  `id_rawatjalan` int(11) NOT NULL,
  `id_pasien` int(11) DEFAULT NULL,
  `id_petugasmedis` int(11) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `diagnosa` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_resep`
--

CREATE TABLE `tb_resep` (
  `id_resep` int(11) NOT NULL,
  `id_pasien` int(11) DEFAULT NULL,
  `id_petugasmedis` int(11) DEFAULT NULL,
  `resep` int(11) DEFAULT NULL,
  `tgl_resep` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_rm`
--

CREATE TABLE `tb_rm` (
  `id_rm` int(11) NOT NULL,
  `id_petugasmedis` int(11) DEFAULT NULL,
  `id_resep` int(11) DEFAULT NULL,
  `id_pasien` int(11) DEFAULT NULL,
  `tinggi_badan` decimal(5,2) DEFAULT NULL,
  `berat_badan` decimal(5,2) DEFAULT NULL,
  `tekanan_darah` varchar(10) DEFAULT NULL,
  `nadi` int(11) DEFAULT NULL,
  `tgl_pemeriksaan` date DEFAULT NULL,
  `diagnosa` varchar(100) DEFAULT NULL,
  `status_asal` varchar(20) DEFAULT NULL,
  `status_keluar` varchar(20) DEFAULT NULL,
  `ket` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_tindakan`
--

CREATE TABLE `tb_tindakan` (
  `id_tindakan` int(11) NOT NULL,
  `nama_tindakan` varchar(100) DEFAULT NULL,
  `tarif_tindakan` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_igd`
--
ALTER TABLE `tb_igd`
  ADD PRIMARY KEY (`id_igd`),
  ADD KEY `id_pasien` (`id_pasien`),
  ADD KEY `id_petugasmedis` (`id_petugasmedis`),
  ADD KEY `id_tindakan` (`id_tindakan`);

--
-- Indexes for table `tb_jadwalpraktik`
--
ALTER TABLE `tb_jadwalpraktik`
  ADD PRIMARY KEY (`id_jadwalpraktik`);

--
-- Indexes for table `tb_kamar`
--
ALTER TABLE `tb_kamar`
  ADD PRIMARY KEY (`id_kamar`);

--
-- Indexes for table `tb_obat`
--
ALTER TABLE `tb_obat`
  ADD PRIMARY KEY (`id_obat`);

--
-- Indexes for table `tb_obatkeluar`
--
ALTER TABLE `tb_obatkeluar`
  ADD PRIMARY KEY (`id_obat_keluar`),
  ADD KEY `id_obat` (`id_obat`);

--
-- Indexes for table `tb_pasien`
--
ALTER TABLE `tb_pasien`
  ADD PRIMARY KEY (`id_pasien`);

--
-- Indexes for table `tb_pegawai`
--
ALTER TABLE `tb_pegawai`
  ADD PRIMARY KEY (`id_pegawai`);

--
-- Indexes for table `tb_pembayaran`
--
ALTER TABLE `tb_pembayaran`
  ADD PRIMARY KEY (`id_pembayaran`),
  ADD KEY `id_resep` (`id_resep`),
  ADD KEY `id_tindakan` (`id_tindakan`);

--
-- Indexes for table `tb_petugasmedis`
--
ALTER TABLE `tb_petugasmedis`
  ADD PRIMARY KEY (`id_petugasmedis`),
  ADD KEY `id_jadwalpraktik` (`id_jadwalpraktik`),
  ADD KEY `id_pegawai` (`id_pegawai`);

--
-- Indexes for table `tb_poliklinik`
--
ALTER TABLE `tb_poliklinik`
  ADD PRIMARY KEY (`id_poliklinik`),
  ADD KEY `id_petugasmedis` (`id_petugasmedis`);

--
-- Indexes for table `tb_rawatinap`
--
ALTER TABLE `tb_rawatinap`
  ADD PRIMARY KEY (`id_rawatinap`),
  ADD KEY `id_pasien` (`id_pasien`),
  ADD KEY `id_tindakan` (`id_tindakan`),
  ADD KEY `id_kamar` (`id_kamar`),
  ADD KEY `id_petugasmedis` (`id_petugasmedis`);

--
-- Indexes for table `tb_rawatjalan`
--
ALTER TABLE `tb_rawatjalan`
  ADD PRIMARY KEY (`id_rawatjalan`),
  ADD KEY `id_pasien` (`id_pasien`),
  ADD KEY `id_petugasmedis` (`id_petugasmedis`);

--
-- Indexes for table `tb_resep`
--
ALTER TABLE `tb_resep`
  ADD PRIMARY KEY (`id_resep`);

--
-- Indexes for table `tb_rm`
--
ALTER TABLE `tb_rm`
  ADD PRIMARY KEY (`id_rm`),
  ADD KEY `id_petugasmedis` (`id_petugasmedis`),
  ADD KEY `id_pasien` (`id_pasien`),
  ADD KEY `id_resep` (`id_resep`);

--
-- Indexes for table `tb_tindakan`
--
ALTER TABLE `tb_tindakan`
  ADD PRIMARY KEY (`id_tindakan`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_igd`
--
ALTER TABLE `tb_igd`
  ADD CONSTRAINT `tb_igd_ibfk_1` FOREIGN KEY (`id_pasien`) REFERENCES `tb_pasien` (`id_pasien`),
  ADD CONSTRAINT `tb_igd_ibfk_2` FOREIGN KEY (`id_petugasmedis`) REFERENCES `tb_petugasmedis` (`id_petugasmedis`),
  ADD CONSTRAINT `tb_igd_ibfk_3` FOREIGN KEY (`id_tindakan`) REFERENCES `tb_tindakan` (`id_tindakan`);

--
-- Constraints for table `tb_obatkeluar`
--
ALTER TABLE `tb_obatkeluar`
  ADD CONSTRAINT `tb_obatkeluar_ibfk_1` FOREIGN KEY (`id_obat`) REFERENCES `tb_obat` (`id_obat`);

--
-- Constraints for table `tb_pembayaran`
--
ALTER TABLE `tb_pembayaran`
  ADD CONSTRAINT `tb_pembayaran_ibfk_1` FOREIGN KEY (`id_resep`) REFERENCES `tb_resep` (`id_resep`),
  ADD CONSTRAINT `tb_pembayaran_ibfk_2` FOREIGN KEY (`id_tindakan`) REFERENCES `tb_tindakan` (`id_tindakan`);

--
-- Constraints for table `tb_petugasmedis`
--
ALTER TABLE `tb_petugasmedis`
  ADD CONSTRAINT `tb_petugasmedis_ibfk_1` FOREIGN KEY (`id_jadwalpraktik`) REFERENCES `tb_jadwalpraktik` (`id_jadwalpraktik`),
  ADD CONSTRAINT `tb_petugasmedis_ibfk_2` FOREIGN KEY (`id_pegawai`) REFERENCES `tb_pegawai` (`id_pegawai`);

--
-- Constraints for table `tb_poliklinik`
--
ALTER TABLE `tb_poliklinik`
  ADD CONSTRAINT `tb_poliklinik_ibfk_1` FOREIGN KEY (`id_petugasmedis`) REFERENCES `tb_petugasmedis` (`id_petugasmedis`);

--
-- Constraints for table `tb_rawatinap`
--
ALTER TABLE `tb_rawatinap`
  ADD CONSTRAINT `tb_rawatinap_ibfk_1` FOREIGN KEY (`id_pasien`) REFERENCES `tb_pasien` (`id_pasien`),
  ADD CONSTRAINT `tb_rawatinap_ibfk_2` FOREIGN KEY (`id_tindakan`) REFERENCES `tb_tindakan` (`id_tindakan`),
  ADD CONSTRAINT `tb_rawatinap_ibfk_3` FOREIGN KEY (`id_kamar`) REFERENCES `tb_kamar` (`id_kamar`),
  ADD CONSTRAINT `tb_rawatinap_ibfk_4` FOREIGN KEY (`id_petugasmedis`) REFERENCES `tb_petugasmedis` (`id_petugasmedis`);

--
-- Constraints for table `tb_rawatjalan`
--
ALTER TABLE `tb_rawatjalan`
  ADD CONSTRAINT `tb_rawatjalan_ibfk_1` FOREIGN KEY (`id_pasien`) REFERENCES `tb_pasien` (`id_pasien`),
  ADD CONSTRAINT `tb_rawatjalan_ibfk_2` FOREIGN KEY (`id_petugasmedis`) REFERENCES `tb_petugasmedis` (`id_petugasmedis`);

--
-- Constraints for table `tb_resep`
--
ALTER TABLE `tb_resep`
  ADD CONSTRAINT `tb_resep_ibfk_1` FOREIGN KEY (`id_pasien`) REFERENCES `tb_rm` (`id_rm`);

--
-- Constraints for table `tb_rm`
--
ALTER TABLE `tb_rm`
  ADD CONSTRAINT `tb_rm_ibfk_1` FOREIGN KEY (`id_petugasmedis`) REFERENCES `tb_petugasmedis` (`id_petugasmedis`),
  ADD CONSTRAINT `tb_rm_ibfk_2` FOREIGN KEY (`id_resep`) REFERENCES `tb_obat` (`id_obat`),
  ADD CONSTRAINT `tb_rm_ibfk_3` FOREIGN KEY (`id_pasien`) REFERENCES `tb_pasien` (`id_pasien`),
  ADD CONSTRAINT `tb_rm_ibfk_4` FOREIGN KEY (`id_resep`) REFERENCES `tb_resep` (`id_resep`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
