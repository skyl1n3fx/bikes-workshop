-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-11-2022 a las 04:42:33
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `basenegrotono`
--
CREATE DATABASE IF NOT EXISTS `basenegrotono` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `basenegrotono`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `afp`
--

CREATE TABLE `afp` (
  `id` int(10) NOT NULL,
  `descripcion` varchar(150) NOT NULL,
  `descuento` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `afp`
--

INSERT INTO `afp` (`id`, `descripcion`, `descuento`) VALUES
(1, 'AFP Capital', 9),
(2, 'AFP Hábitat ', 12),
(3, 'ProVida AFP', 14);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `anticipo`
--

CREATE TABLE `anticipo` (
  `id` int(10) NOT NULL,
  `descripcion` varchar(150) NOT NULL,
  `cantidad` int(10) NOT NULL,
  `fecha_antici` date NOT NULL,
  `id_empleado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrito`
--

CREATE TABLE `carrito` (
  `id` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `carrito`
--

INSERT INTO `carrito` (`id`, `id_producto`, `id_cliente`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `id` int(50) NOT NULL,
  `descripcion` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`id`, `descripcion`) VALUES
(1, 'Bicicletas de Ruta'),
(2, 'Bicicletas de Triatlón'),
(3, 'Bicicletas MTB'),
(4, 'Bicicletas de Cyclocross');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id` int(9) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `apellido` varchar(255) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `telefono` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `id_tipoCuenta` int(1) NOT NULL,
  `contrasena` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id`, `nombre`, `apellido`, `direccion`, `telefono`, `email`, `id_tipoCuenta`, `contrasena`) VALUES
(1, 'Jhon', 'Perez', 'Puente Alto', 9123123, 'jhon@gmail.com', 1, '123'),
(2, 'jose', 'perez', 'puente', 2254135, 'jose@duoc.cl', 1, '123'),
(3, 'jose', 'perez', 'puente', 2254135, 'jose@duoc.cl', 1, '123'),
(4, 'Jhonnn', 'Perez', 'Puente Alto', 9123123, 'jhon@gmail.com', 1, '123'),
(5, 'fsd', 'fds', 'fsd', 3443, 'ola@gmail.com', 1, 'xd'),
(6, 'gfd', 'gdfg', 'gdfg', 5345, 'olffa@gmail.com', 1, 'xd'),
(7, ' mati', 'a', 'fdsfsd', 23321, 'prueba@gmail.com', 1, 'prueba'),
(8, 'juan ', 'sanchez', 'luis matte ', 12334, 'juan@123.com', 1, '123'),
(9, 'juan', 'sanchez', 'nosee', 1234, 'juan@hotmai.com', 1, '123'),
(10, 'queso', 'sanchez', 'luis matte ', 123, 'queso@hotmai.com', 1, '123'),
(11, 'sebastian', 'sanchez', 'luis matte ', 123, 'sebastian@hotmail.com', 1, '123');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `consulta`
--

CREATE TABLE `consulta` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(1000) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `estado` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `consulta`
--

INSERT INTO `consulta` (`id`, `descripcion`, `id_cliente`, `estado`) VALUES
(4, 'xd', 1, 'REVISADO'),
(5, 'respuesta', 1, 'REVISADO'),
(6, 'yes', 1, 'REVISADO'),
(7, 'si', 1, 'REVISADO'),
(8, 'bi', 9, 'PENDIENTE'),
(9, 'si', 10, 'REVISADO'),
(10, 'yes', 11, 'REVISADO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `id` int(11) NOT NULL,
  `rut` varchar(100) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `sueldo_base` int(50) NOT NULL,
  `id_afp` int(10) NOT NULL,
  `id_salud` int(11) NOT NULL,
  `user_empe` varchar(30) NOT NULL,
  `contra_emp` varchar(30) NOT NULL,
  `id_tipoCuenta` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`id`, `rut`, `nombre`, `apellido`, `email`, `sueldo_base`, `id_afp`, `id_salud`, `user_empe`, `contra_emp`, `id_tipoCuenta`) VALUES
(1, '256425166-2', 'fifer', 'flores', 'fifer@admin.cl', 350000, 1, 1, 'fifer', '123', 2),
(2, '2251614-2', 'fifer', 'Flores', 'fifer@empleado.cl', 350000, 1, 1, 'fif', '123', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `liquidacione`
--

CREATE TABLE `liquidacione` (
  `id` int(10) NOT NULL,
  `descripcion` varchar(150) NOT NULL,
  `descuento_afp` int(15) NOT NULL,
  `descuento_salud` int(15) NOT NULL,
  `total_liquido` int(15) NOT NULL,
  `id_empleado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marca`
--

CREATE TABLE `marca` (
  `id` int(9) NOT NULL,
  `descripcion` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `marca`
--

INSERT INTO `marca` (`id`, `descripcion`) VALUES
(1, 'shimano'),
(2, 'sram'),
(8, 'Prueba');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id` int(9) NOT NULL,
  `precio` int(8) NOT NULL,
  `stock` int(3) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `id_marca` int(9) NOT NULL,
  `imagen` varchar(255) NOT NULL,
  `id_categoria` int(50) NOT NULL,
  `descuento` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id`, `precio`, `stock`, `descripcion`, `id_marca`, `imagen`, `id_categoria`, `descuento`) VALUES
(3, 350000, 110, 'bicicleta', 8, 'https://images.lider.cl/wmtcl?source=url[file:/productos/1325384a.jpg]&sink', 4, 70000),
(22, 200000, 3, 'Bicicletita', 2, 'https://home.ripley.cl/store/Attachment/WOP/D192/2000386350667/2000386350667-2.jpg', 2, 100000),
(23, 300000, 6, 'Bicicleta', 2, 'https://www.lapolar.cl/dw/image/v2/BCPP_PRD/on/demandware.static/-/Sites-master-catalog/default/dw54b4dc9c/images/large/25325176.jpg?sw=400&sh=400&sm=fit', 4, 0),
(24, 250000, 8, 'Bicicleta', 2, 'https://pedalia.cc/wp-content/uploads/2016/07/FeatureBiciMontana-770x513.jpg', 1, 0),
(25, 250000, 8, 'Bicicleta', 2, 'https://pedalia.cc/wp-content/uploads/2016/07/FeatureBiciMontana-770x513.jpg', 1, 0),
(31, 50000, 50, 'ddd', 2, 'https://www.oxfordstore.cl/media/catalog/product/cache/cb1ea22e42c95eeb3d4e77abf38ffa96/l/a/lanai_1_1.jpg', 3, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto_venta`
--

CREATE TABLE `producto_venta` (
  `id` int(10) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `total` int(9) NOT NULL,
  `id_venta` int(10) NOT NULL,
  `id_producto` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `producto_venta`
--

INSERT INTO `producto_venta` (`id`, `cantidad`, `total`, `id_venta`, `id_producto`) VALUES
(10, 1, 1, 10, 23),
(11, 1, 1, 11, 23),
(12, 1, 1, 12, 24);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `renuncia`
--

CREATE TABLE `renuncia` (
  `id` int(10) NOT NULL,
  `descripcion` varchar(150) NOT NULL,
  `fecha_renuncia` date NOT NULL,
  `id_empleado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reparacion`
--

CREATE TABLE `reparacion` (
  `id` int(9) NOT NULL,
  `nombre_repa` varchar(150) NOT NULL,
  `descripcion` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `reparacion`
--

INSERT INTO `reparacion` (`id`, `nombre_repa`, `descripcion`) VALUES
(1, 'cleta', 'rota'),
(3, 'gd', 'gfd'),
(4, 'dsfsd', 'fds'),
(5, 'SERVICIO', 'FSDFSD'),
(6, 'servicio de mantencion', 'mantencion'),
(7, 'reparacion', 'si'),
(8, 'mantencion de bicicleta', 'bicicleta');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `salud`
--

CREATE TABLE `salud` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(150) NOT NULL,
  `descuento` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `salud`
--

INSERT INTO `salud` (`id`, `descripcion`, `descuento`) VALUES
(1, 'Fonasa', 7),
(2, 'Isapre', 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipocuenta`
--

CREATE TABLE `tipocuenta` (
  `id` int(1) NOT NULL,
  `descripcion` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipocuenta`
--

INSERT INTO `tipocuenta` (`id`, `descripcion`) VALUES
(0, 'Ola'),
(1, 'Usuario'),
(2, 'Administrador'),
(3, 'Empleado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE `venta` (
  `id` int(10) NOT NULL,
  `fecha_venta` date NOT NULL,
  `id_cliente` int(9) NOT NULL,
  `id_empleado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `venta`
--

INSERT INTO `venta` (`id`, `fecha_venta`, `id_cliente`, `id_empleado`) VALUES
(10, '2022-11-23', 9, 1),
(11, '2022-11-23', 10, 1),
(12, '2022-11-23', 11, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `afp`
--
ALTER TABLE `afp`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `anticipo`
--
ALTER TABLE `anticipo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_empleado` (`id_empleado`);

--
-- Indices de la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tipo_usuario` (`id_tipoCuenta`);

--
-- Indices de la tabla `consulta`
--
ALTER TABLE `consulta`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_afp` (`id_afp`),
  ADD KEY `id_salud` (`id_salud`),
  ADD KEY `id_tipoCuenta` (`id_tipoCuenta`);

--
-- Indices de la tabla `liquidacione`
--
ALTER TABLE `liquidacione`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_empleado` (`id_empleado`);

--
-- Indices de la tabla `marca`
--
ALTER TABLE `marca`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `prod_marca` (`id_marca`),
  ADD KEY `id_categoria` (`id_categoria`);

--
-- Indices de la tabla `producto_venta`
--
ALTER TABLE `producto_venta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_venta` (`id_venta`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indices de la tabla `renuncia`
--
ALTER TABLE `renuncia`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_empleado` (`id_empleado`);

--
-- Indices de la tabla `reparacion`
--
ALTER TABLE `reparacion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `salud`
--
ALTER TABLE `salud`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipocuenta`
--
ALTER TABLE `tipocuenta`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `venta`
--
ALTER TABLE `venta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_cliente` (`id_cliente`),
  ADD KEY `id_empleado` (`id_empleado`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `anticipo`
--
ALTER TABLE `anticipo`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `carrito`
--
ALTER TABLE `carrito`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `consulta`
--
ALTER TABLE `consulta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `empleado`
--
ALTER TABLE `empleado`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `liquidacione`
--
ALTER TABLE `liquidacione`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `marca`
--
ALTER TABLE `marca`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT de la tabla `producto_venta`
--
ALTER TABLE `producto_venta`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `renuncia`
--
ALTER TABLE `renuncia`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `reparacion`
--
ALTER TABLE `reparacion`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `salud`
--
ALTER TABLE `salud`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `venta`
--
ALTER TABLE `venta`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `anticipo`
--
ALTER TABLE `anticipo`
  ADD CONSTRAINT `anticipo_ibfk_1` FOREIGN KEY (`id_empleado`) REFERENCES `empleado` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `tipo_usuario` FOREIGN KEY (`id_tipoCuenta`) REFERENCES `tipocuenta` (`id`);

--
-- Filtros para la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD CONSTRAINT `empleado_ibfk_1` FOREIGN KEY (`id_afp`) REFERENCES `afp` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `empleado_ibfk_2` FOREIGN KEY (`id_salud`) REFERENCES `salud` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `empleado_ibfk_3` FOREIGN KEY (`id_tipoCuenta`) REFERENCES `tipocuenta` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `liquidacione`
--
ALTER TABLE `liquidacione`
  ADD CONSTRAINT `liquidacione_ibfk_1` FOREIGN KEY (`id_empleado`) REFERENCES `empleado` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `prod_marca` FOREIGN KEY (`id_marca`) REFERENCES `marca` (`id`),
  ADD CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `producto_venta`
--
ALTER TABLE `producto_venta`
  ADD CONSTRAINT `producto_venta_ibfk_1` FOREIGN KEY (`id_venta`) REFERENCES `venta` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `producto_venta_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `renuncia`
--
ALTER TABLE `renuncia`
  ADD CONSTRAINT `renuncia_ibfk_1` FOREIGN KEY (`id_empleado`) REFERENCES `empleado` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `venta`
--
ALTER TABLE `venta`
  ADD CONSTRAINT `venta_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `venta_ibfk_2` FOREIGN KEY (`id_empleado`) REFERENCES `empleado` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
