-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 01, 2022 at 07:34 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbpos`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbbarang`
--

CREATE TABLE `tbbarang` (
  `kode_barang` char(7) NOT NULL,
  `nama_barang` varchar(50) NOT NULL,
  `stok` int(5) NOT NULL,
  `satuan_brg` char(10) NOT NULL,
  `harga_brg` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbbarang`
--

INSERT INTO `tbbarang` (`kode_barang`, `nama_barang`, `stok`, `satuan_brg`, `harga_brg`) VALUES
('BG_001', 'Le Mineral', 30, 'DUS', 20000),
('BG_002', 'Indomie Goreng', 35, 'DUS', 100000);

-- --------------------------------------------------------

--
-- Table structure for table `tbdetail`
--

CREATE TABLE `tbdetail` (
  `id_detail` char(7) NOT NULL,
  `no_transaksi` char(7) NOT NULL,
  `kode_barang` char(7) NOT NULL,
  `qty` int(10) NOT NULL,
  `subtotal` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbdetail`
--

INSERT INTO `tbdetail` (`id_detail`, `no_transaksi`, `kode_barang`, `qty`, `subtotal`) VALUES
('DE001', 'TRA001', 'BG_002', 1, 100000);

-- --------------------------------------------------------

--
-- Table structure for table `tbshift`
--

CREATE TABLE `tbshift` (
  `kode_shift` char(5) NOT NULL,
  `waktu_mulai` time NOT NULL,
  `waktu_akhir` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbshift`
--

INSERT INTO `tbshift` (`kode_shift`, `waktu_mulai`, `waktu_akhir`) VALUES
('SH001', '00:00:00', '08:00:00'),
('SH002', '08:00:00', '16:00:00'),
('SH003', '16:00:00', '00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `tbtoko`
--

CREATE TABLE `tbtoko` (
  `kode_toko` char(7) NOT NULL,
  `nama_toko` varchar(50) NOT NULL,
  `alamat_toko` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbtoko`
--

INSERT INTO `tbtoko` (`kode_toko`, `nama_toko`, `alamat_toko`) VALUES
('TOKO01', 'Toko ke 1', 'xxxxxx'),
('TOKO02', 'Toko ke 2', 'xxxxx'),
('TOKO03', 'Toko ke 3', 'xxxxx');

-- --------------------------------------------------------

--
-- Table structure for table `tbtransaksi`
--

CREATE TABLE `tbtransaksi` (
  `no_transaksi` char(7) NOT NULL,
  `kode_shift` char(5) NOT NULL,
  `kode_toko` char(7) NOT NULL,
  `tgl` datetime NOT NULL,
  `total` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbtransaksi`
--

INSERT INTO `tbtransaksi` (`no_transaksi`, `kode_shift`, `kode_toko`, `tgl`, `total`) VALUES
('TRA001', 'SH002', 'TOKO01', '2022-06-01 12:17:47', 100000);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbbarang`
--
ALTER TABLE `tbbarang`
  ADD PRIMARY KEY (`kode_barang`);

--
-- Indexes for table `tbdetail`
--
ALTER TABLE `tbdetail`
  ADD PRIMARY KEY (`id_detail`),
  ADD KEY `no_transaksi` (`no_transaksi`),
  ADD KEY `kode_barang` (`kode_barang`);

--
-- Indexes for table `tbshift`
--
ALTER TABLE `tbshift`
  ADD PRIMARY KEY (`kode_shift`);

--
-- Indexes for table `tbtoko`
--
ALTER TABLE `tbtoko`
  ADD PRIMARY KEY (`kode_toko`);

--
-- Indexes for table `tbtransaksi`
--
ALTER TABLE `tbtransaksi`
  ADD PRIMARY KEY (`no_transaksi`),
  ADD KEY `kode_shift` (`kode_shift`),
  ADD KEY `kode_toko` (`kode_toko`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbdetail`
--
ALTER TABLE `tbdetail`
  ADD CONSTRAINT `tbdetail_ibfk_1` FOREIGN KEY (`kode_barang`) REFERENCES `tbbarang` (`kode_barang`);

--
-- Constraints for table `tbtransaksi`
--
ALTER TABLE `tbtransaksi`
  ADD CONSTRAINT `tbtransaksi_ibfk_1` FOREIGN KEY (`kode_toko`) REFERENCES `tbtoko` (`kode_toko`),
  ADD CONSTRAINT `tbtransaksi_ibfk_2` FOREIGN KEY (`kode_shift`) REFERENCES `tbshift` (`kode_shift`),
  ADD CONSTRAINT `tbtransaksi_ibfk_3` FOREIGN KEY (`no_transaksi`) REFERENCES `tbdetail` (`no_transaksi`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
