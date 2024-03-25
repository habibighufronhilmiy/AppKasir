-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 25, 2024 at 02:48 PM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kasir2`
--

-- --------------------------------------------------------

--
-- Table structure for table `meja`
--

CREATE TABLE `meja` (
  `idMeja` int NOT NULL,
  `nomorMeja` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `meja`
--

INSERT INTO `meja` (`idMeja`, `nomorMeja`) VALUES
(1, 2),
(3, 1),
(4, 3),
(5, 4),
(7, 5),
(8, 6),
(10, 7),
(11, 8),
(12, 9),
(13, 10),
(14, 11);

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `idMenu` int NOT NULL,
  `namaMenu` varchar(255) NOT NULL,
  `harga` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`idMenu`, `namaMenu`, `harga`) VALUES
(3, 'sate', 20000),
(4, 'mie goreng', 18000),
(5, 'soto', 25000),
(6, 'rendang', 35000),
(9, 'sambalado', 10000),
(12, 'iga bakar', 32000),
(17, 'rica rica', 30000),
(27, 'soto betawi', 22000),
(28, 'tahu goreng', 15000),
(29, 'nasi uduk', 8000),
(30, 'kerak telur', 10000),
(31, 'semur', 22000),
(36, 'sayur jengkol', 15000);

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `idPelanggan` int NOT NULL,
  `namaPelanggan` varchar(255) NOT NULL,
  `jk` varchar(255) NOT NULL,
  `noHp` varchar(255) NOT NULL,
  `alamat` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `pelanggan`
--

INSERT INTO `pelanggan` (`idPelanggan`, `namaPelanggan`, `jk`, `noHp`, `alamat`) VALUES
(1, 'Ukon', 'laki-laki', '081282351196', 'Cibubur'),
(2, 'Farhan', 'laki-laki', '089876241098', 'Condet'),
(3, 'Bagus', 'Laki-Laki', '089876524321', 'Ceger');

-- --------------------------------------------------------

--
-- Table structure for table `pesan`
--

CREATE TABLE `pesan` (
  `idPesanan` int NOT NULL,
  `idPelanggan` int NOT NULL,
  `nomorMeja` int NOT NULL,
  `namaMenu` varchar(255) NOT NULL,
  `idMenu` int NOT NULL,
  `harga` int NOT NULL,
  `jumlah` int NOT NULL,
  `idUser` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `pesan`
--

INSERT INTO `pesan` (`idPesanan`, `idPelanggan`, `nomorMeja`, `namaMenu`, `idMenu`, `harga`, `jumlah`, `idUser`) VALUES
(14, 1, 5, 'rica rica', 17, 30000, 2, 2),
(15, 2, 4, 'rendang', 6, 35000, 2, 2),
(16, 2, 11, 'sambalado', 9, 10000, 2, 2),
(17, 2, 10, 'sayur jengkol', 36, 15000, 10, 2),
(18, 3, 11, 'soto betawi', 27, 22000, 3, 2),
(19, 3, 9, 'soto betawi', 27, 22000, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `idTransaksi` int NOT NULL,
  `idPesanan` int NOT NULL,
  `total` int NOT NULL,
  `bayar` int NOT NULL,
  `kembali` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`idTransaksi`, `idPesanan`, `total`, `bayar`, `kembali`) VALUES
(8, 17, 150000, 150000, 0),
(9, 14, 60000, 80000, 20000),
(10, 15, 70000, 80000, 10000),
(11, 19, 44000, 45000, 1000);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `idUser` int NOT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(255) NOT NULL,
  `level` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`idUser`, `username`, `password`, `level`) VALUES
(1, 'Habibi', '1234', 'admin'),
(2, 'Ghufron', '5678', 'waiter'),
(3, 'Bagus', 'bagus123', 'kasir'),
(4, 'Hilmiy', 'hilmiy123', 'owner');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `meja`
--
ALTER TABLE `meja`
  ADD PRIMARY KEY (`idMeja`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`idMenu`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`idPelanggan`);

--
-- Indexes for table `pesan`
--
ALTER TABLE `pesan`
  ADD PRIMARY KEY (`idPesanan`),
  ADD KEY `idMenu` (`idMenu`),
  ADD KEY `fk_pesan_user` (`idUser`),
  ADD KEY `fk_pesan_pelanggan` (`idPelanggan`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`idTransaksi`),
  ADD KEY `idPesanan` (`idPesanan`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`idUser`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `meja`
--
ALTER TABLE `meja`
  MODIFY `idMeja` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `idMenu` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `idPelanggan` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pesan`
--
ALTER TABLE `pesan`
  MODIFY `idPesanan` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `idTransaksi` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `idUser` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pesan`
--
ALTER TABLE `pesan`
  ADD CONSTRAINT `fk_pesan_pelanggan` FOREIGN KEY (`idPelanggan`) REFERENCES `pelanggan` (`idPelanggan`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_pesan_user` FOREIGN KEY (`idUser`) REFERENCES `user` (`idUser`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pesan_ibfk_1` FOREIGN KEY (`idMenu`) REFERENCES `menu` (`idMenu`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `fk_transaksi_pesan` FOREIGN KEY (`idPesanan`) REFERENCES `pesan` (`idPesanan`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
