-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1:3306
-- Üretim Zamanı: 31 Tem 2026, 10:45:20
-- Sunucu sürümü: 8.4.7
-- PHP Sürümü: 8.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `envanterdb`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kategoriler`
--

DROP TABLE IF EXISTS `kategoriler`;
CREATE TABLE IF NOT EXISTS `kategoriler` (
  `KategoriID` int NOT NULL AUTO_INCREMENT,
  `KategoriADI` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`KategoriID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `kategoriler`
--

INSERT INTO `kategoriler` (`KategoriID`, `KategoriADI`) VALUES
(1, 'Dokunmatik Ekranlar'),
(2, 'Yazıcılar'),
(3, 'Barkod Okuyucular'),
(4, 'Çekmece'),
(5, 'POS Cihazları'),
(6, 'Switch'),
(7, 'Router'),
(8, 'Klavye Mouse'),
(9, 'Güç Kaynağı'),
(10, 'SSD'),
(11, 'RAM'),
(12, 'Kablolar');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `urunler`
--

DROP TABLE IF EXISTS `urunler`;
CREATE TABLE IF NOT EXISTS `urunler` (
  `UrunID` int NOT NULL AUTO_INCREMENT,
  `UrunADI` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `StokAdedi` int NOT NULL,
  `KritikStokSeviyesi` int NOT NULL,
  `KategoriID` int NOT NULL,
  PRIMARY KEY (`UrunID`),
  KEY `KategoriID` (`KategoriID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `urunler`
--

INSERT INTO `urunler` (`UrunID`, `UrunADI`, `StokAdedi`, `KritikStokSeviyesi`, `KategoriID`) VALUES
(1, 'Dokunmatik Panel', 16, 5, 1),
(2, 'HP Yazıcı', 17, 3, 2),
(3, 'Barkod Okuyucu', 24, 2, 3),
(4, 'POS Cihazı', 8, 4, 4),
(5, 'Switch 24 Port', 9, 2, 5),
(6, 'Router', 9, 3, 6),
(7, 'Klavye Mouse Set', 25, 5, 7),
(8, 'SSD 512GB', 9, 3, 8),
(9, 'RAM 16GB', 9, 2, 9);

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `urunler`
--
ALTER TABLE `urunler`
  ADD CONSTRAINT `urunler_ibfk_1` FOREIGN KEY (`KategoriID`) REFERENCES `kategoriler` (`KategoriID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
