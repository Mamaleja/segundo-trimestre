-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-11-2020 a las 03:46:17
-- Versión del servidor: 10.4.13-MariaDB
-- Versión de PHP: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `dbinstitucion`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblestudiantes`
--

CREATE TABLE `tblestudiantes` (
  `codEst` int(10) NOT NULL,
  `nombreEst` varchar(80) COLLATE utf8_spanish2_ci NOT NULL,
  `gradoEst` varchar(2) COLLATE utf8_spanish2_ci NOT NULL,
  `codInst` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblintitucion`
--

CREATE TABLE `tblintitucion` (
  `codInst` int(11) NOT NULL,
  `nombreInst` varchar(80) COLLATE utf8_spanish2_ci NOT NULL,
  `direccionInst` varchar(80) COLLATE utf8_spanish2_ci NOT NULL,
  `barrioInst` varchar(30) COLLATE utf8_spanish2_ci NOT NULL,
  `telefonoInst` varchar(10) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblpersonal`
--

CREATE TABLE `tblpersonal` (
  `codPersonal` int(10) NOT NULL,
  `nombrePersonal` varchar(80) COLLATE utf8_spanish2_ci NOT NULL,
  `direccionPersonal` varchar(80) COLLATE utf8_spanish2_ci NOT NULL,
  `cargoPersonal` varchar(40) COLLATE utf8_spanish2_ci NOT NULL,
  `telefonoPersonal` varchar(10) COLLATE utf8_spanish2_ci NOT NULL,
  `codInst` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tblestudiantes`
--
ALTER TABLE `tblestudiantes`
  ADD PRIMARY KEY (`codEst`),
  ADD KEY `codInst` (`codInst`);

--
-- Indices de la tabla `tblintitucion`
--
ALTER TABLE `tblintitucion`
  ADD PRIMARY KEY (`codInst`);

--
-- Indices de la tabla `tblpersonal`
--
ALTER TABLE `tblpersonal`
  ADD PRIMARY KEY (`codPersonal`),
  ADD KEY `codInst` (`codInst`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tblintitucion`
--
ALTER TABLE `tblintitucion`
  MODIFY `codInst` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tblestudiantes`
--
ALTER TABLE `tblestudiantes`
  ADD CONSTRAINT `tblestudiantes_ibfk_1` FOREIGN KEY (`codInst`) REFERENCES `tblintitucion` (`codInst`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `tblpersonal`
--
ALTER TABLE `tblpersonal`
  ADD CONSTRAINT `tblpersonal_ibfk_1` FOREIGN KEY (`codInst`) REFERENCES `tblintitucion` (`codInst`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
