-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 17-06-2024 a las 06:24:35
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `shiros`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `n_categoria` int(10) NOT NULL,
  `nombre_categoria` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`n_categoria`, `nombre_categoria`) VALUES
(1, 'Cafe'),
(2, 'Hamburguesa'),
(3, 'Pizza'),
(4, 'Pasta'),
(5, 'Papas Fritas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `rut` varchar(13) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellido` varchar(30) NOT NULL,
  `correo` varchar(30) NOT NULL,
  `contraseña` varchar(30) NOT NULL,
  `n_telefono` int(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`rut`, `nombre`, `apellido`, `correo`, `contraseña`, `n_telefono`) VALUES
('21369183-k', 'alejandro', 'nuñez', 'alegod@gg.cl', '1234', 23423567),
('21869183-5', 'jorge', 'torres', 'jorgetorres.gg.cl', 'goty', 23423567);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `n_pedido` int(15) NOT NULL,
  `fecha` date NOT NULL,
  `precio_total` int(30) NOT NULL,
  `estado` varchar(15) NOT NULL,
  `rut` varchar(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido-producto`
--

CREATE TABLE `pedido-producto` (
  `n_pedido` int(15) NOT NULL,
  `n_producto` int(15) NOT NULL,
  `cantida` int(10) NOT NULL,
  `precio_unitario` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `n_producto` int(15) NOT NULL,
  `nombre_producto` varchar(40) NOT NULL,
  `precio` int(15) NOT NULL,
  `cantidad_bodega` int(11) NOT NULL,
  `cantidad_vitrina` int(11) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `n_categoria` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`n_producto`, `nombre_producto`, `precio`, `cantidad_bodega`, `cantidad_vitrina`, `descripcion`, `n_categoria`) VALUES
(1, 'Delicioso Cafe negro', 1200, 30, 45, 'Un cafe caliente y energizante y vigorozo', 1),
(2, 'Hamburguesa Deliciosa', 1350, 35, 10, 'Una Hamburguesa abundante y deliciosa', 2),
(3, 'Pizza deliciosa', 2200, 24, 21, 'Una pizza familiar llena de ingredientes', 3),
(4, 'Pasta Deliciosa', 1850, 32, 10, 'Una pasta de las mas finas y llenadoras', 4),
(5, 'Papas fritas Deliciosas', 2300, 41, 20, 'Papas fritas crujientes y calientes', 5);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`n_categoria`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`rut`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`n_pedido`),
  ADD KEY `Relacion_cliente_pedido` (`rut`),
  ADD KEY `Rut` (`rut`);

--
-- Indices de la tabla `pedido-producto`
--
ALTER TABLE `pedido-producto`
  ADD PRIMARY KEY (`n_pedido`,`n_producto`),
  ADD KEY `PK_N_Producto` (`n_producto`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`n_producto`),
  ADD KEY `Relacion_categoria_producto` (`n_categoria`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `n_categoria` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `pedido`
--
ALTER TABLE `pedido`
  MODIFY `n_pedido` int(15) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `n_producto` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `PK_Rut` FOREIGN KEY (`Rut`) REFERENCES `cliente` (`Rut`);

--
-- Filtros para la tabla `pedido-producto`
--
ALTER TABLE `pedido-producto`
  ADD CONSTRAINT `PK_N_Pedido` FOREIGN KEY (`n_pedido`) REFERENCES `pedido` (`N_Pedido`),
  ADD CONSTRAINT `PK_N_Producto` FOREIGN KEY (`n_producto`) REFERENCES `producto` (`N_Producto`);

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `PK_N_Categoria` FOREIGN KEY (`N_Categoria`) REFERENCES `categoria` (`N_Categoria`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
