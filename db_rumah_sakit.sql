-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 26, 2026 at 03:21 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_rumah_sakit`
--

-- --------------------------------------------------------

--
-- Table structure for table `dokter`
--

CREATE TABLE `dokter` (
  `id_dokter` int(11) NOT NULL,
  `nama_dokter` varchar(100) DEFAULT NULL,
  `id_poli` int(11) DEFAULT NULL,
  `spesialisasi` varchar(100) DEFAULT NULL,
  `tarif_konsultasi` decimal(12,2) DEFAULT NULL,
  `status_dokter` varchar(20) DEFAULT NULL
) ;

--
-- Dumping data for table `dokter`
--

INSERT INTO `dokter` (`id_dokter`, `nama_dokter`, `id_poli`, `spesialisasi`, `tarif_konsultasi`, `status_dokter`) VALUES
(1, 'Dr. cyaacantik', 1, 'Dokter umum', 75000.00, 'Aktif'),
(2, 'Dr. laras', 2, 'Dokter anak', 100000.00, 'Aktif'),
(3, 'Dr. eka', 3, 'Dokter gigi', 125000.00, 'Aktif'),
(4, 'Dr. arsyad', 4, 'Dokter mata', 150000.00, 'Aktif'),
(5, 'Dr. calista', 5, 'Dokter jantung', 200000.00, 'Aktif'),
(6, 'Dr. Safira', 6, 'Dokter Kulit', 125000.00, 'Cuti'),
(7, 'Dr. aji', 7, 'Dokter Saraf', 175000.00, 'Aktif'),
(8, 'Dr. rehan', 8, 'Dokter THT', 150000.00, 'Aktif'),
(9, 'Dr. caca', 9, 'Dokter Bedah', 250000.00, 'Aktif'),
(10, 'Dr. syahira', 10, 'Dokter Gizi', 100000.00, 'Aktif');

-- --------------------------------------------------------

--
-- Table structure for table `kunjungan`
--

CREATE TABLE `kunjungan` (
  `id_kunjungan` int(11) NOT NULL,
  `id_pasien` int(11) DEFAULT NULL,
  `id_dokter` int(11) DEFAULT NULL,
  `tanggal_kunjungan` date DEFAULT NULL,
  `jenis_kunjungan` varchar(30) DEFAULT NULL,
  `diagnosis` varchar(200) DEFAULT NULL,
  `status_kunjungan` varchar(30) DEFAULT NULL
) ;

--
-- Dumping data for table `kunjungan`
--

INSERT INTO `kunjungan` (`id_kunjungan`, `id_pasien`, `id_dokter`, `tanggal_kunjungan`, `jenis_kunjungan`, `diagnosis`, `status_kunjungan`) VALUES
(1, 1, 1, '2026-10-01', 'Umum', 'Demam', 'Selesai'),
(2, 2, 2, '2026-10-02', 'Umum', 'Flu', 'Selesai'),
(3, 3, 3, '2026-10-03', 'Kontrol', 'Gigi berlubang', 'Selesai'),
(4, 4, 4, '2026-10-04', 'Umum', 'Iritasi mata', 'Selesai'),
(5, 5, 5, '2026-10-05', 'Darurat', 'Nyeri dada', 'Diperiksa'),
(6, 6, 6, '2026-10-06', 'Kontrol', 'Alergi kulit', 'Selesai'),
(7, 7, 7, '2026-10-07', 'Darurat', 'Sakit kepala berat', 'Batal'),
(8, 8, 8, '2026-10-08', 'Umum', 'Radang tenggorokan', 'Selesai'),
(9, 1, 9, '2026-10-09', 'Kontrol', 'Pemeriksaan lanjutan', 'Selesai'),
(10, 2, 1, '2026-10-10', 'Umum', 'Batuk', 'Menunggu'),
(11, 3, 2, '2026-10-11', 'Darurat', 'Demam tinggi', 'Selesai');

-- --------------------------------------------------------

--
-- Table structure for table `pasien`
--

CREATE TABLE `pasien` (
  `id_pasien` int(11) NOT NULL,
  `nama_pasien` varchar(100) DEFAULT NULL,
  `jenis_kelamin` char(1) DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `alamat` varchar(200) DEFAULT NULL,
  `no_hp` varchar(15) DEFAULT NULL
) ;

--
-- Dumping data for table `pasien`
--

INSERT INTO `pasien` (`id_pasien`, `nama_pasien`, `jenis_kelamin`, `tanggal_lahir`, `alamat`, `no_hp`) VALUES
(1, 'abi', 'L', '2002-05-10', 'Bandar Lampung', '081234567801'),
(2, 'Rama', 'P', '2003-08-15', 'Kedaton', '081234567802'),
(3, 'Sisi', 'L', '2001-02-20', 'Rajabasa', '081234567803'),
(4, 'Ira', 'P', '2004-11-25', 'Sukarame', '081234567804'),
(5, 'Riri', 'L', '2002-07-12', 'Kemiling', '081234567805'),
(6, 'Putri ', 'P', '2003-04-18', 'Way Halim', '081234567806'),
(7, 'Queen', 'L', '2001-09-30', 'Teluk Betung', '081234567807'),
(8, 'Nadia ', 'P', '2004-01-05', 'Tanjung Karang', '081234567808'),
(9, 'Hanafi', 'L', '2002-12-22', 'Sukabumi', '081234567809'),
(10, 'Intan ', 'P', '2003-06-14', 'Langkapura', '081234567810');

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id_pembayaran` int(11) NOT NULL,
  `id_kunjungan` int(11) DEFAULT NULL,
  `tanggal_bayar` date DEFAULT NULL,
  `biaya_konsultasi` decimal(12,2) DEFAULT NULL,
  `biaya_obat` decimal(12,2) DEFAULT NULL,
  `biaya_laboratorium` decimal(12,2) DEFAULT NULL,
  `diskon` decimal(12,2) DEFAULT NULL,
  `metode_bayar` varchar(30) DEFAULT NULL,
  `status_bayar` varchar(20) DEFAULT NULL
) ;

--
-- Dumping data for table `pembayaran`
--

INSERT INTO `pembayaran` (`id_pembayaran`, `id_kunjungan`, `tanggal_bayar`, `biaya_konsultasi`, `biaya_obat`, `biaya_laboratorium`, `diskon`, `metode_bayar`, `status_bayar`) VALUES
(1, 1, '2026-10-01', 75000.00, 20000.00, 0.00, 5000.00, 'Tunai', 'Lunas'),
(2, 2, '2026-10-02', 100000.00, 30000.00, 0.00, 0.00, 'Transfer', 'Lunas'),
(3, 3, '2026-10-03', 125000.00, 50000.00, 25000.00, 10000.00, 'Asuransi', 'Lunas'),
(4, 4, '2026-10-04', 150000.00, 25000.00, 0.00, 0.00, 'Tunai', 'Lunas'),
(5, 5, '2026-10-05', 200000.00, 100000.00, 150000.00, 25000.00, 'Transfer', 'Belum Lunas'),
(6, 6, '2026-10-06', 125000.00, 50000.00, 0.00, 5000.00, 'Asuransi', 'Lunas'),
(7, 7, '2026-10-07', 175000.00, 0.00, 0.00, 0.00, 'Tunai', 'Belum Lunas'),
(8, 8, '2026-10-08', 150000.00, 40000.00, 50000.00, 10000.00, 'Transfer', 'Lunas'),
(9, 9, '2026-10-09', 250000.00, 75000.00, 100000.00, 25000.00, 'Asuransi', 'Lunas'),
(10, 11, '2026-10-11', 100000.00, 50000.00, 25000.00, 0.00, 'Tunai', 'Belum Lunas');

-- --------------------------------------------------------

--
-- Table structure for table `poli`
--

CREATE TABLE `poli` (
  `id_poli` int(11) NOT NULL,
  `nama_poli` varchar(100) DEFAULT NULL,
  `lantai` int(11) DEFAULT NULL,
  `status_poli` varchar(20) DEFAULT NULL
) ;

--
-- Dumping data for table `poli`
--

INSERT INTO `poli` (`id_poli`, `nama_poli`, `lantai`, `status_poli`) VALUES
(1, 'Poli Umum', 1, 'Aktif'),
(2, 'Poli Anak', 2, 'Aktif'),
(3, 'Poli Gigi', 1, 'Aktif'),
(4, 'Poli Mata', 2, 'Aktif'),
(5, 'Poli Jantung', 3, 'Aktif'),
(6, 'Poli Kulit', 2, 'Aktif'),
(7, 'Poli Saraf', 3, 'Aktif'),
(8, 'Poli THT', 2, 'Aktif'),
(9, 'Poli Bedah', 3, 'Aktif'),
(10, 'Poli Gizi', 1, 'Nonaktif');

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_no4`
-- (See below for the actual view)
--
CREATE TABLE `view_no4` (
`id_pasien` int(11)
,`nama_pasien` varchar(100)
,`id_dokter` int(11)
,`nama_dokter` varchar(100)
,`nama_poli` varchar(100)
,`spesialisasi` varchar(100)
,`tanggal_kunjungan` date
,`status_kunjungan` varchar(30)
,`diagnosis` varchar(200)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_no5`
-- (See below for the actual view)
--
CREATE TABLE `view_no5` (
`id_pasien` int(11)
,`nama_pasien` varchar(100)
,`no_hp` varchar(15)
,`jumlah_kunjungan` bigint(21)
,`kunjungan_terakhir` date
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_no6`
-- (See below for the actual view)
--
CREATE TABLE `view_no6` (
`nama_dokter` varchar(100)
,`spesialisasi` varchar(100)
,`nama_poli` varchar(100)
,`id_kunjungan` int(11)
,`status_kunjungan` varchar(30)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_no7`
-- (See below for the actual view)
--
CREATE TABLE `view_no7` (
`nama_pasien` varchar(100)
,`nama_dokter` varchar(100)
,`nama_poli` varchar(100)
,`tanggal_kunjungan` date
,`diagnosis` varchar(200)
,`total_sebelum_diskon` decimal(14,2)
,`diskon` decimal(12,2)
,`total_tagihan` decimal(15,2)
,`metode_bayar` varchar(30)
,`status_bayar` varchar(20)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_no8`
-- (See below for the actual view)
--
CREATE TABLE `view_no8` (
`id_pembayaran` int(11)
,`id_kunjungan` int(11)
,`tanggal_bayar` date
,`biaya_konsultasi` decimal(12,2)
,`biaya_obat` decimal(12,2)
,`biaya_laboratorium` decimal(12,2)
,`diskon` decimal(12,2)
,`metode_bayar` varchar(30)
,`status_bayar` varchar(20)
,`keterangan_diskon` varchar(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_no9`
-- (See below for the actual view)
--
CREATE TABLE `view_no9` (
`id_pembayaran` int(11)
,`id_kunjungan` int(11)
,`total_biaya` decimal(15,2)
,`klasifikasi_biaya` varchar(8)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_no10`
-- (See below for the actual view)
--
CREATE TABLE `view_no10` (
`id_kunjungan` int(11)
,`id_pasien` int(11)
,`id_dokter` int(11)
,`jenis_kunjungan` varchar(30)
,`status_kunjungan` varchar(30)
,`status_bayar` varchar(20)
,`status_prioritas` varchar(17)
);

-- --------------------------------------------------------

--
-- Structure for view `view_no4`
--
DROP TABLE IF EXISTS `view_no4`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_no4`  AS SELECT `p`.`id_pasien` AS `id_pasien`, `p`.`nama_pasien` AS `nama_pasien`, `d`.`id_dokter` AS `id_dokter`, `d`.`nama_dokter` AS `nama_dokter`, `po`.`nama_poli` AS `nama_poli`, `d`.`spesialisasi` AS `spesialisasi`, `k`.`tanggal_kunjungan` AS `tanggal_kunjungan`, `k`.`status_kunjungan` AS `status_kunjungan`, `k`.`diagnosis` AS `diagnosis` FROM (((`kunjungan` `k` join `pasien` `p` on(`k`.`id_pasien` = `p`.`id_pasien`)) join `dokter` `d` on(`k`.`id_dokter` = `d`.`id_dokter`)) join `poli` `po` on(`d`.`id_poli` = `po`.`id_poli`)) ;

-- --------------------------------------------------------

--
-- Structure for view `view_no5`
--
DROP TABLE IF EXISTS `view_no5`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_no5`  AS SELECT `p`.`id_pasien` AS `id_pasien`, `p`.`nama_pasien` AS `nama_pasien`, `p`.`no_hp` AS `no_hp`, count(`k`.`id_kunjungan`) AS `jumlah_kunjungan`, max(`k`.`tanggal_kunjungan`) AS `kunjungan_terakhir` FROM (`pasien` `p` left join `kunjungan` `k` on(`p`.`id_pasien` = `k`.`id_pasien`)) GROUP BY `p`.`id_pasien`, `p`.`nama_pasien`, `p`.`no_hp` ;

-- --------------------------------------------------------

--
-- Structure for view `view_no6`
--
DROP TABLE IF EXISTS `view_no6`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_no6`  AS SELECT `d`.`nama_dokter` AS `nama_dokter`, `d`.`spesialisasi` AS `spesialisasi`, `po`.`nama_poli` AS `nama_poli`, `k`.`id_kunjungan` AS `id_kunjungan`, `k`.`status_kunjungan` AS `status_kunjungan` FROM ((`dokter` `d` left join `kunjungan` `k` on(`k`.`id_dokter` = `d`.`id_dokter`)) join `poli` `po` on(`d`.`id_poli` = `po`.`id_poli`)) ;

-- --------------------------------------------------------

--
-- Structure for view `view_no7`
--
DROP TABLE IF EXISTS `view_no7`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_no7`  AS SELECT `p`.`nama_pasien` AS `nama_pasien`, `d`.`nama_dokter` AS `nama_dokter`, `po`.`nama_poli` AS `nama_poli`, `k`.`tanggal_kunjungan` AS `tanggal_kunjungan`, `k`.`diagnosis` AS `diagnosis`, `pb`.`biaya_konsultasi`+ `pb`.`biaya_obat` + `pb`.`biaya_laboratorium` AS `total_sebelum_diskon`, `pb`.`diskon` AS `diskon`, `pb`.`biaya_konsultasi`+ `pb`.`biaya_obat` + `pb`.`biaya_laboratorium` - `pb`.`diskon` AS `total_tagihan`, `pb`.`metode_bayar` AS `metode_bayar`, `pb`.`status_bayar` AS `status_bayar` FROM ((((`kunjungan` `k` join `pasien` `p` on(`k`.`id_pasien` = `p`.`id_pasien`)) join `dokter` `d` on(`k`.`id_dokter` = `d`.`id_dokter`)) join `poli` `po` on(`d`.`id_poli` = `po`.`id_poli`)) left join `pembayaran` `pb` on(`k`.`id_kunjungan` = `pb`.`id_kunjungan`)) ;

-- --------------------------------------------------------

--
-- Structure for view `view_no8`
--
DROP TABLE IF EXISTS `view_no8`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_no8`  AS SELECT `pembayaran`.`id_pembayaran` AS `id_pembayaran`, `pembayaran`.`id_kunjungan` AS `id_kunjungan`, `pembayaran`.`tanggal_bayar` AS `tanggal_bayar`, `pembayaran`.`biaya_konsultasi` AS `biaya_konsultasi`, `pembayaran`.`biaya_obat` AS `biaya_obat`, `pembayaran`.`biaya_laboratorium` AS `biaya_laboratorium`, `pembayaran`.`diskon` AS `diskon`, `pembayaran`.`metode_bayar` AS `metode_bayar`, `pembayaran`.`status_bayar` AS `status_bayar`, if(`pembayaran`.`diskon` > 0,'Mendapat Diskon','Tidak Mendapat Diskon') AS `keterangan_diskon` FROM `pembayaran` ;

-- --------------------------------------------------------

--
-- Structure for view `view_no9`
--
DROP TABLE IF EXISTS `view_no9`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_no9`  AS SELECT `pembayaran`.`id_pembayaran` AS `id_pembayaran`, `pembayaran`.`id_kunjungan` AS `id_kunjungan`, `pembayaran`.`biaya_konsultasi`+ `pembayaran`.`biaya_obat` + `pembayaran`.`biaya_laboratorium` - `pembayaran`.`diskon` AS `total_biaya`, if(`pembayaran`.`biaya_konsultasi` + `pembayaran`.`biaya_obat` + `pembayaran`.`biaya_laboratorium` - `pembayaran`.`diskon` < 100000,'Ekonomis',if(`pembayaran`.`biaya_konsultasi` + `pembayaran`.`biaya_obat` + `pembayaran`.`biaya_laboratorium` - `pembayaran`.`diskon` < 300000,'Menengah','Premium')) AS `klasifikasi_biaya` FROM `pembayaran` ;

-- --------------------------------------------------------

--
-- Structure for view `view_no10`
--
DROP TABLE IF EXISTS `view_no10`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_no10`  AS SELECT `k`.`id_kunjungan` AS `id_kunjungan`, `k`.`id_pasien` AS `id_pasien`, `k`.`id_dokter` AS `id_dokter`, `k`.`jenis_kunjungan` AS `jenis_kunjungan`, `k`.`status_kunjungan` AS `status_kunjungan`, `pb`.`status_bayar` AS `status_bayar`, if(`k`.`jenis_kunjungan` = 'Darurat' and `k`.`status_kunjungan` <> 'Batal','Prioritas Tinggi',if(`k`.`jenis_kunjungan` = 'Kontrol' and `k`.`status_kunjungan` = 'Selesai','Kontrol Selesai',if(`k`.`status_kunjungan` = 'Batal','Tidak Dilayani','Pelayanan Reguler'))) AS `status_prioritas` FROM (`kunjungan` `k` left join `pembayaran` `pb` on(`k`.`id_kunjungan` = `pb`.`id_kunjungan`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dokter`
--
ALTER TABLE `dokter`
  ADD PRIMARY KEY (`id_dokter`),
  ADD KEY `id_poli` (`id_poli`);

--
-- Indexes for table `kunjungan`
--
ALTER TABLE `kunjungan`
  ADD PRIMARY KEY (`id_kunjungan`),
  ADD KEY `id_pasien` (`id_pasien`),
  ADD KEY `id_dokter` (`id_dokter`);

--
-- Indexes for table `pasien`
--
ALTER TABLE `pasien`
  ADD PRIMARY KEY (`id_pasien`);

--
-- Indexes for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id_pembayaran`),
  ADD UNIQUE KEY `id_kunjungan` (`id_kunjungan`);

--
-- Indexes for table `poli`
--
ALTER TABLE `poli`
  ADD PRIMARY KEY (`id_poli`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `dokter`
--
ALTER TABLE `dokter`
  ADD CONSTRAINT `dokter_ibfk_1` FOREIGN KEY (`id_poli`) REFERENCES `poli` (`id_poli`);

--
-- Constraints for table `kunjungan`
--
ALTER TABLE `kunjungan`
  ADD CONSTRAINT `kunjungan_ibfk_1` FOREIGN KEY (`id_pasien`) REFERENCES `pasien` (`id_pasien`),
  ADD CONSTRAINT `kunjungan_ibfk_2` FOREIGN KEY (`id_dokter`) REFERENCES `dokter` (`id_dokter`);

--
-- Constraints for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD CONSTRAINT `pembayaran_ibfk_1` FOREIGN KEY (`id_kunjungan`) REFERENCES `kunjungan` (`id_kunjungan`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
