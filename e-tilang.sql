-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Waktu pembuatan: 10 Nov 2023 pada 16.16
-- Versi server: 10.4.28-MariaDB
-- Versi PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `e-tilang`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `DriverViolation`
--

CREATE TABLE `DriverViolation` (
  `DriverViolationID` int(11) NOT NULL,
  `DriverID` int(11) DEFAULT NULL,
  `ViolationID` int(11) DEFAULT NULL,
  `TanggalPelanggaran` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `EtilangTransaction`
--

CREATE TABLE `EtilangTransaction` (
  `TransactionID` int(11) NOT NULL,
  `DriverID` int(11) DEFAULT NULL,
  `ViolationID` int(11) DEFAULT NULL,
  `TanggalTransaksi` date DEFAULT NULL,
  `StatusPembayaran` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `User`
--

CREATE TABLE `User` (
  `UserID` int(11) NOT NULL,
  `Username` varchar(255) DEFAULT NULL,
  `Password` varchar(255) DEFAULT NULL,
  `Nama` varchar(255) DEFAULT NULL,
  `Alamat` varchar(255) DEFAULT NULL,
  `Role` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `Vehicle`
--

CREATE TABLE `Vehicle` (
  `VehicleID` int(11) NOT NULL,
  `NomorPolisi` varchar(20) DEFAULT NULL,
  `Merk` varchar(50) DEFAULT NULL,
  `Tipe` varchar(50) DEFAULT NULL,
  `DriverID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `Violation`
--

CREATE TABLE `Violation` (
  `ViolationID` int(11) NOT NULL,
  `NamaPelanggaran` varchar(255) DEFAULT NULL,
  `Denda` decimal(10,2) DEFAULT NULL,
  `Deskripsi` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `DriverViolation`
--
ALTER TABLE `DriverViolation`
  ADD PRIMARY KEY (`DriverViolationID`),
  ADD KEY `DriverID` (`DriverID`),
  ADD KEY `ViolationID` (`ViolationID`);

--
-- Indeks untuk tabel `EtilangTransaction`
--
ALTER TABLE `EtilangTransaction`
  ADD PRIMARY KEY (`TransactionID`),
  ADD KEY `DriverID` (`DriverID`),
  ADD KEY `ViolationID` (`ViolationID`);

--
-- Indeks untuk tabel `User`
--
ALTER TABLE `User`
  ADD PRIMARY KEY (`UserID`);

--
-- Indeks untuk tabel `Vehicle`
--
ALTER TABLE `Vehicle`
  ADD PRIMARY KEY (`VehicleID`),
  ADD KEY `DriverID` (`DriverID`);

--
-- Indeks untuk tabel `Violation`
--
ALTER TABLE `Violation`
  ADD PRIMARY KEY (`ViolationID`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `DriverViolation`
--
ALTER TABLE `DriverViolation`
  ADD CONSTRAINT `driverviolation_ibfk_1` FOREIGN KEY (`DriverID`) REFERENCES `User` (`UserID`),
  ADD CONSTRAINT `driverviolation_ibfk_2` FOREIGN KEY (`ViolationID`) REFERENCES `Violation` (`ViolationID`);

--
-- Ketidakleluasaan untuk tabel `EtilangTransaction`
--
ALTER TABLE `EtilangTransaction`
  ADD CONSTRAINT `etilangtransaction_ibfk_1` FOREIGN KEY (`DriverID`) REFERENCES `User` (`UserID`),
  ADD CONSTRAINT `etilangtransaction_ibfk_2` FOREIGN KEY (`ViolationID`) REFERENCES `Violation` (`ViolationID`);

--
-- Ketidakleluasaan untuk tabel `Vehicle`
--
ALTER TABLE `Vehicle`
  ADD CONSTRAINT `vehicle_ibfk_1` FOREIGN KEY (`DriverID`) REFERENCES `User` (`UserID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
