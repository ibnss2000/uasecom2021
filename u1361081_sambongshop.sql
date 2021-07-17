-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 17, 2021 at 05:30 PM
-- Server version: 10.3.29-MariaDB-cll-lve
-- PHP Version: 7.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `u1361081_tokobuah`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `idcart` int(11) NOT NULL,
  `orderid` varchar(100) NOT NULL,
  `userid` int(11) NOT NULL,
  `tglorder` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` varchar(10) NOT NULL DEFAULT 'Cart'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`idcart`, `orderid`, `userid`, `tglorder`, `status`) VALUES
(10, '15wKVT0nej25Y', 2, '2020-03-16 12:10:42', 'Selesai'),
(11, '15Swf8Ye0Fm.M', 2, '2020-03-16 12:17:34', 'Cart'),
(12, '15PzF03ejd8W2', 1, '2020-05-13 02:40:48', 'Confirmed'),
(13, '162I1LwSQbjLw', 3, '2021-07-17 08:03:58', 'Confirmed'),
(14, '166puItAvV3Nc', 3, '2021-07-17 09:16:40', 'Cart');

-- --------------------------------------------------------

--
-- Table structure for table `detailorder`
--

CREATE TABLE `detailorder` (
  `detailid` int(11) NOT NULL,
  `orderid` varchar(100) NOT NULL,
  `idproduk` int(11) NOT NULL,
  `qty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `detailorder`
--

INSERT INTO `detailorder` (`detailid`, `orderid`, `idproduk`, `qty`) VALUES
(16, '162I1LwSQbjLw', 9, 2),
(20, '166puItAvV3Nc', 11, 1);

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `idkategori` int(11) NOT NULL,
  `namakategori` varchar(20) NOT NULL,
  `tgldibuat` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`idkategori`, `namakategori`, `tgldibuat`) VALUES
(7, 'aksesoris ibadah', '2021-07-17 07:35:06'),
(8, 'pakaian pria', '2021-07-17 07:35:26'),
(9, 'pakaian wanita', '2021-07-17 07:35:40');

-- --------------------------------------------------------

--
-- Table structure for table `konfirmasi`
--

CREATE TABLE `konfirmasi` (
  `idkonfirmasi` int(11) NOT NULL,
  `orderid` varchar(100) NOT NULL,
  `userid` int(11) NOT NULL,
  `payment` varchar(10) NOT NULL,
  `namarekening` varchar(25) NOT NULL,
  `tglbayar` date NOT NULL,
  `tglsubmit` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `konfirmasi`
--

INSERT INTO `konfirmasi` (`idkonfirmasi`, `orderid`, `userid`, `payment`, `namarekening`, `tglbayar`, `tglsubmit`) VALUES
(1, '15PzF03ejd8W2', 1, 'Bank BCA', 'Admin', '2020-05-16', '2020-05-13 02:41:51'),
(2, '162I1LwSQbjLw', 3, 'Bank Mandi', 'ibnu', '2021-07-17', '2021-07-17 08:05:49');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `userid` int(11) NOT NULL,
  `namalengkap` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(150) NOT NULL,
  `notelp` varchar(15) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `tgljoin` timestamp NOT NULL DEFAULT current_timestamp(),
  `role` varchar(7) NOT NULL DEFAULT 'Member',
  `lastlogin` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`userid`, `namalengkap`, `email`, `password`, `notelp`, `alamat`, `tgljoin`, `role`, `lastlogin`) VALUES
(1, 'Admin', 'admin', '$2y$10$GJVGd4ji3QE8ikTBzNyA0uLQhiGd6MirZeSJV1O6nUpjSVp1eaKzS', '01234567890', 'Indonesia', '2020-03-16 11:31:17', 'Admin', NULL),
(2, 'Guest', 'guest', '$2y$10$xXEMgj5pMT9EE0QAx3QW8uEn155Je.FHH5SuIATxVheOt0Z4rhK6K', '01234567890', 'Indonesia', '2020-03-16 11:30:40', 'Member', NULL),
(3, 'ibnu', 'ibnu@gmail.com', '$2y$10$YHFgJv5qdJnuYheztLWo0uoANpNYEXfcIOzkByGuqMtgfr3400LQ6', '038932572', 'brebes', '2021-07-17 08:02:39', 'Member', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran`
--

CREATE TABLE `pembayaran` (
  `no` int(11) NOT NULL,
  `metode` varchar(25) NOT NULL,
  `norek` varchar(25) NOT NULL,
  `logo` text DEFAULT NULL,
  `an` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pembayaran`
--

INSERT INTO `pembayaran` (`no`, `metode`, `norek`, `logo`, `an`) VALUES
(1, 'Bank BCA', '13131231231', 'images/bca.jpg', 'SambongShop'),
(2, 'Bank Mandiri', '943248844843', 'images/mandiri.jpg', 'Sambongshop'),
(3, 'DANA', '0882313132123', 'images/dana.png', 'Sambongshop');

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `idproduk` int(11) NOT NULL,
  `idkategori` int(11) NOT NULL,
  `namaproduk` varchar(30) NOT NULL,
  `gambar` varchar(100) NOT NULL,
  `deskripsi` varchar(200) NOT NULL,
  `rate` int(11) NOT NULL,
  `hargabefore` int(11) NOT NULL,
  `hargaafter` int(11) NOT NULL,
  `tgldibuat` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`idproduk`, `idkategori`, `namaproduk`, `gambar`, `deskripsi`, `rate`, `hargabefore`, `hargaafter`, `tgldibuat`) VALUES
(7, 7, 'Peci Jahitan', 'produk/16SgSdbrkvLEY.jfif', 'Murah Dan Awet', 4, 37, 30, '2021-07-17 07:45:16'),
(8, 7, 'Krudung ', 'produk/16PP4KDO2IqEM.jpg', 'Bahan mulus dan halus', 3, 19, 17, '2021-07-17 07:46:41'),
(9, 7, 'Krudung Hitam', 'produk/16xaCtKAEEEaY.jpg', 'Bahan Mulus', 2, 50, 34, '2021-07-17 07:49:34'),
(10, 7, 'krudung coklat', 'produk/16HSJzTuwuZ8g.jpg', 'halus dan tidak bikin panas', 3, 48, 38, '2021-07-17 07:50:21'),
(11, 8, 'Celana Kolor', 'produk/16P7wh0ajgA3A.jpg', 'halus dan lembut', 3, 43, 34, '2021-07-17 07:51:33'),
(12, 9, 'celana gamis', 'produk/16Br271rFqxNw.jfif', 'enak di pakai', 4, 59, 56, '2021-07-17 07:52:21'),
(13, 9, 'Gamis lorek Merah', 'produk/16dEMZ0doswYI.jfif', 'bagus dan halus', 4, 89, 78, '2021-07-17 07:53:11'),
(14, 8, 'Celana Pendek', 'produk/16Z1MAVVSfMJo.jpg', 'warna seger dan cerah', 4, 98, 89, '2021-07-17 07:53:54'),
(15, 8, 'Kaos Item', 'produk/16kcrBMck3pnA.jpg', 'bahan Katun', 5, 78, 67, '2021-07-17 07:54:35'),
(16, 9, 'Kaos Putih', 'produk/16uPl50LKWjV..jpg', 'bahan halus', 5, 67, 56, '2021-07-17 07:55:08'),
(17, 9, 'Kaos Pendek', 'produk/16Su0CUoXaq76.jfif', 'bagus dan halus', 4, 56, 55, '2021-07-17 07:58:57'),
(18, 8, 'switer', 'produk/16BE9H0jHxItU.jpg', 'bahan halus', 5, 99, 89, '2021-07-17 07:59:39'),
(27, 7, 'Sarung Tenun', 'produk/168VfjoqUQGgY.jfif', 'bahan halus', 5, 76, 56, '2021-07-17 09:58:20'),
(28, 7, 'Sarung Tenun', 'produk/1648chrFYQWPw.jpg', 'bahan mulus', 4, 57, 56, '2021-07-17 09:59:03');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`idcart`),
  ADD UNIQUE KEY `orderid` (`orderid`),
  ADD KEY `orderid_2` (`orderid`);

--
-- Indexes for table `detailorder`
--
ALTER TABLE `detailorder`
  ADD PRIMARY KEY (`detailid`),
  ADD KEY `orderid` (`orderid`),
  ADD KEY `idproduk` (`idproduk`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`idkategori`);

--
-- Indexes for table `konfirmasi`
--
ALTER TABLE `konfirmasi`
  ADD PRIMARY KEY (`idkonfirmasi`),
  ADD KEY `userid` (`userid`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`userid`);

--
-- Indexes for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`no`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`idproduk`),
  ADD KEY `idkategori` (`idkategori`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `idcart` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `detailorder`
--
ALTER TABLE `detailorder`
  MODIFY `detailid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `idkategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `konfirmasi`
--
ALTER TABLE `konfirmasi`
  MODIFY `idkonfirmasi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `userid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `produk`
--
ALTER TABLE `produk`
  MODIFY `idproduk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `detailorder`
--
ALTER TABLE `detailorder`
  ADD CONSTRAINT `idproduk` FOREIGN KEY (`idproduk`) REFERENCES `produk` (`idproduk`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orderid` FOREIGN KEY (`orderid`) REFERENCES `cart` (`orderid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `konfirmasi`
--
ALTER TABLE `konfirmasi`
  ADD CONSTRAINT `userid` FOREIGN KEY (`userid`) REFERENCES `login` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `produk`
--
ALTER TABLE `produk`
  ADD CONSTRAINT `idkategori` FOREIGN KEY (`idkategori`) REFERENCES `kategori` (`idkategori`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
