-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-11-2020 a las 04:04:42
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
-- Base de datos: `dbempresa`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblclientes`
--

CREATE TABLE `tblclientes` (
  `codCliente` int(12) NOT NULL,
  `nombreCliente` varchar(80) COLLATE utf8_spanish2_ci NOT NULL,
  `telefonoCliente` varchar(10) COLLATE utf8_spanish2_ci NOT NULL,
  `direccionCliente` varchar(40) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblempleados`
--

CREATE TABLE `tblempleados` (
  `codEmp` int(12) NOT NULL,
  `nombreEmp` varchar(80) COLLATE utf8_spanish2_ci NOT NULL,
  `direccionEmp` varchar(80) COLLATE utf8_spanish2_ci NOT NULL,
  `cargoEmp` varchar(30) COLLATE utf8_spanish2_ci NOT NULL,
  `telefonoEmp` varchar(10) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblpedidos`
--

CREATE TABLE `tblpedidos` (
  `codPed` int(11) NOT NULL,
  `fecPed` date NOT NULL,
  `unidadesPed` int(11) NOT NULL,
  `codCliente` int(11) NOT NULL,
  `refProd` int(11) NOT NULL,
  `codEmp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblproductos`
--

CREATE TABLE `tblproductos` (
  `refProd` int(11) NOT NULL,
  `nombreProd` varchar(80) COLLATE utf8_spanish2_ci NOT NULL,
  `descripcionProd` varchar(80) COLLATE utf8_spanish2_ci NOT NULL,
  `pvpProd` float NOT NULL,
  `pcProd` float NOT NULL,
  `unidadesDispProd` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tblclientes`
--
ALTER TABLE `tblclientes`
  ADD PRIMARY KEY (`codCliente`);

--
-- Indices de la tabla `tblempleados`
--
ALTER TABLE `tblempleados`
  ADD PRIMARY KEY (`codEmp`);

--
-- Indices de la tabla `tblpedidos`
--
ALTER TABLE `tblpedidos`
  ADD PRIMARY KEY (`codPed`),
  ADD KEY `codEmp` (`codEmp`),
  ADD KEY `refProd` (`refProd`),
  ADD KEY `codCliente` (`codCliente`);

--
-- Indices de la tabla `tblproductos`
--
ALTER TABLE `tblproductos`
  ADD PRIMARY KEY (`refProd`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tblpedidos`
--
ALTER TABLE `tblpedidos`
  MODIFY `codPed` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tblproductos`
--
ALTER TABLE `tblproductos`
  MODIFY `refProd` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tblpedidos`
--
ALTER TABLE `tblpedidos`
  ADD CONSTRAINT `tblpedidos_ibfk_1` FOREIGN KEY (`codEmp`) REFERENCES `tblempleados` (`codEmp`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tblpedidos_ibfk_2` FOREIGN KEY (`refProd`) REFERENCES `tblproductos` (`refProd`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tblpedidos_ibfk_3` FOREIGN KEY (`codCliente`) REFERENCES `tblclientes` (`codCliente`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
