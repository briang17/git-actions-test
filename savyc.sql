-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-03-2025 a las 17:14:11
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `savyc`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cambio_divisa`
--

CREATE TABLE `cambio_divisa` (
  `cod_cambio` int(11) NOT NULL,
  `cod_divisa` int(11) NOT NULL,
  `tasa` decimal(10,2) NOT NULL,
  `fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `cambio_divisa`
--

INSERT INTO `cambio_divisa` (`cod_cambio`, `cod_divisa`, `tasa`, `fecha`) VALUES
(1, 1, 1.00, '0000-00-00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carga`
--

CREATE TABLE `carga` (
  `cod_carga` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `cod_categoria` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `cod_cliente` int(11) NOT NULL,
  `nombre` varchar(80) NOT NULL,
  `apellido` varchar(80) NOT NULL,
  `cedula_rif` varchar(12) NOT NULL,
  `telefono` varchar(12) DEFAULT NULL,
  `email` varchar(70) DEFAULT NULL,
  `direccion` varchar(200) DEFAULT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--

CREATE TABLE `compras` (
  `cod_compra` int(11) NOT NULL,
  `cod_prov` int(11) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `impuesto_total` decimal(10,2) NOT NULL,
  `fecha` date NOT NULL,
  `descuento` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `descarga`
--

CREATE TABLE `descarga` (
  `cod_descarga` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_carga`
--

CREATE TABLE `detalle_carga` (
  `cod_det_carga` int(11) NOT NULL,
  `cod_detallep` int(11) NOT NULL,
  `cod_carga` int(11) NOT NULL,
  `cantidad` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_compras`
--

CREATE TABLE `detalle_compras` (
  `cod_detallec` int(11) NOT NULL,
  `cod_compra` int(11) NOT NULL,
  `cod_detallep` int(11) NOT NULL,
  `cantidad` decimal(10,2) NOT NULL,
  `monto` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_descarga`
--

CREATE TABLE `detalle_descarga` (
  `cod_det_descarga` int(11) NOT NULL,
  `cod_detallep` int(11) NOT NULL,
  `cod_descarga` int(11) NOT NULL,
  `cantidad` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_pagos`
--

CREATE TABLE `detalle_pagos` (
  `cod_detallepago` int(11) NOT NULL,
  `cod_pago` int(11) NOT NULL,
  `cod_tipo_pago` int(11) NOT NULL,
  `monto` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_productos`
--

CREATE TABLE `detalle_productos` (
  `cod_detallep` int(11) NOT NULL,
  `cod_presentacion` int(11) NOT NULL,
  `stock` float NOT NULL,
  `fecha_vencimiento` date DEFAULT NULL,
  `lote` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_ventas`
--

CREATE TABLE `detalle_ventas` (
  `cod_detallev` int(11) NOT NULL,
  `cod_venta` int(11) NOT NULL,
  `cod_detallep` int(11) NOT NULL,
  `importe` decimal(10,2) NOT NULL,
  `cantidad` float(10,3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `divisas`
--

CREATE TABLE `divisas` (
  `cod_divisa` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `abreviatura` varchar(5) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `divisas`
--

INSERT INTO `divisas` (`cod_divisa`, `nombre`, `abreviatura`, `status`) VALUES
(1, 'Bolívares', 'Bs', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa`
--

CREATE TABLE `empresa` (
  `rif` varchar(15) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `nombre` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `direccion` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `telefono` varchar(12) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `email` varchar(70) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `descripcion` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marcas`
--

CREATE TABLE `marcas` (
  `cod_marca` int(11) NOT NULL,
  `nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos`
--

CREATE TABLE `pagos` (
  `cod_pago` int(11) NOT NULL,
  `cod_venta` int(11) NOT NULL,
  `monto_total` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisos`
--

CREATE TABLE `permisos` (
  `cod_permiso` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `permisos`
--

INSERT INTO `permisos` (`cod_permiso`, `nombre`) VALUES
(1, 'producto'),
(2, 'inventario'),
(3, 'categoria'),
(4, 'compra'),
(5, 'venta'),
(6, 'cliente'),
(7, 'proveedor'),
(8, 'usuario'),
(9, 'reporte'),
(10, 'configuracion');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `presentacion_producto`
--

CREATE TABLE `presentacion_producto` (
  `cod_presentacion` int(11) NOT NULL,
  `cod_unidad` int(11) NOT NULL,
  `cod_producto` int(11) NOT NULL,
  `presentacion` varchar(30) DEFAULT NULL,
  `cantidad_presentacion` varchar(20) DEFAULT NULL,
  `costo` decimal(10,2) NOT NULL,
  `porcen_venta` int(11) NOT NULL,
  `excento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `cod_producto` int(11) NOT NULL,
  `cod_categoria` int(11) NOT NULL,
  `nombre` varchar(40) NOT NULL,
  `cod_marca` int(11) NOT NULL,
  `imagen` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `cod_prov` int(11) NOT NULL,
  `rif` varchar(15) NOT NULL,
  `razon_social` varchar(50) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `direccion` varchar(250) DEFAULT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prov_representantes`
--

CREATE TABLE `prov_representantes` (
  `cod_representante` int(11) NOT NULL,
  `cod_prov` int(11) NOT NULL,
  `cedula` varchar(12) NOT NULL,
  `nombre` varchar(80) NOT NULL,
  `apellido` varchar(80) DEFAULT NULL,
  `telefono` varchar(12) DEFAULT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_pago`
--

CREATE TABLE `tipo_pago` (
  `cod_tipo_pago` int(11) NOT NULL,
  `cod_cambio` int(11) NOT NULL,
  `medio_pago` varchar(50) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `tipo_pago`
--

INSERT INTO `tipo_pago` (`cod_tipo_pago`, `cod_cambio`, `medio_pago`, `status`) VALUES
(1, 1, 'Efectivo en Bs', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_usuario`
--

CREATE TABLE `tipo_usuario` (
  `cod_tipo_usuario` int(11) NOT NULL,
  `rol` varchar(50) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `tipo_usuario`
--

INSERT INTO `tipo_usuario` (`cod_tipo_usuario`, `rol`, `status`) VALUES
(1, 'Administrador', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tlf_proveedores`
--

CREATE TABLE `tlf_proveedores` (
  `cod_tlf` int(11) NOT NULL,
  `cod_prov` int(11) NOT NULL,
  `telefono` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tpu_permisos`
--

CREATE TABLE `tpu_permisos` (
  `cod_tipo_usuario` int(11) NOT NULL,
  `cod_permiso` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `tpu_permisos`
--

INSERT INTO `tpu_permisos` (`cod_tipo_usuario`, `cod_permiso`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(1, 9),
(1, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unidades_medida`
--

CREATE TABLE `unidades_medida` (
  `cod_unidad` int(11) NOT NULL,
  `tipo_medida` char(10) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `cod_usuario` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `user` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `cod_tipo_usuario` int(11) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`cod_usuario`, `nombre`, `user`, `password`, `cod_tipo_usuario`, `status`) VALUES
(1, 'Administrador', 'admin', '$2y$10$.nbh0vwGWNkBgsVzkBSoYurftn9Mg.TLYkxmK32KhMKOzaTjaRS3.', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `cod_venta` int(11) NOT NULL,
  `cod_cliente` int(11) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `fecha` datetime NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bitacora`
--

CREATE TABLE `bitacora` (
  `id` int(11) NOT NULL,
  `cod_usuario` int(11) NOT NULL,
  `accion` varchar(255) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `detalles` text DEFAULT NULL,
  `modulo` varchar(220) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


--
-- Indices de la tabla `bitacora`
--
ALTER TABLE `bitacora`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de la tabla `bitacora`
--
ALTER TABLE `bitacora`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;
COMMIT;


--
-- Indices de la tabla `cambio_divisa`
--
ALTER TABLE `cambio_divisa`
  ADD PRIMARY KEY (`cod_cambio`),
  ADD KEY `cambiodivisa-divisa` (`cod_divisa`);

--
-- Indices de la tabla `carga`
--
ALTER TABLE `carga`
  ADD PRIMARY KEY (`cod_carga`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`cod_categoria`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`cod_cliente`);

--
-- Indices de la tabla `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`cod_compra`),
  ADD KEY `compras-proveedores` (`cod_prov`);

--
-- Indices de la tabla `descarga`
--
ALTER TABLE `descarga`
  ADD PRIMARY KEY (`cod_descarga`);

--
-- Indices de la tabla `detalle_carga`
--
ALTER TABLE `detalle_carga`
  ADD PRIMARY KEY (`cod_det_carga`),
  ADD KEY `detalle_carga-carga` (`cod_carga`),
  ADD KEY `detalle_carga-detallep` (`cod_detallep`);

--
-- Indices de la tabla `detalle_compras`
--
ALTER TABLE `detalle_compras`
  ADD PRIMARY KEY (`cod_detallec`),
  ADD KEY `detalle_compras-compras` (`cod_compra`),
  ADD KEY `detalle_compras-detalle_productos` (`cod_detallep`);

--
-- Indices de la tabla `detalle_descarga`
--
ALTER TABLE `detalle_descarga`
  ADD PRIMARY KEY (`cod_det_descarga`),
  ADD KEY `detalle_descarga-detallep` (`cod_detallep`),
  ADD KEY `detalle_descarga-descarga` (`cod_descarga`);

--
-- Indices de la tabla `detalle_pagos`
--
ALTER TABLE `detalle_pagos`
  ADD PRIMARY KEY (`cod_detallepago`),
  ADD KEY `detalle_pago-pago` (`cod_pago`),
  ADD KEY `tipo_pago-detalle_pago` (`cod_tipo_pago`);

--
-- Indices de la tabla `detalle_productos`
--
ALTER TABLE `detalle_productos`
  ADD PRIMARY KEY (`cod_detallep`),
  ADD KEY `detalle_producto-productos` (`cod_presentacion`);

--
-- Indices de la tabla `detalle_ventas`
--
ALTER TABLE `detalle_ventas`
  ADD PRIMARY KEY (`cod_detallev`),
  ADD KEY `cod_venta` (`cod_venta`),
  ADD KEY `detalle_ventas-detalle_productos` (`cod_detallep`);

--
-- Indices de la tabla `divisas`
--
ALTER TABLE `divisas`
  ADD PRIMARY KEY (`cod_divisa`);

--
-- Indices de la tabla `empresa`
--
ALTER TABLE `empresa`
  ADD PRIMARY KEY (`rif`);

--
-- Indices de la tabla `marcas`
--
ALTER TABLE `marcas`
  ADD PRIMARY KEY (`cod_marca`),
  ADD UNIQUE KEY `marca_unica` (`nombre`);

--
-- Indices de la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD PRIMARY KEY (`cod_pago`),
  ADD KEY `pagos-ventas` (`cod_venta`);

--
-- Indices de la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD PRIMARY KEY (`cod_permiso`);

--
-- Indices de la tabla `presentacion_producto`
--
ALTER TABLE `presentacion_producto`
  ADD PRIMARY KEY (`cod_presentacion`),
  ADD KEY `cod_producto` (`cod_producto`),
  ADD KEY `cod_unidad` (`cod_unidad`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`cod_producto`),
  ADD KEY `productos-categorias` (`cod_categoria`),
  ADD KEY `productos-marcas` (`cod_marca`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`cod_prov`);

--
-- Indices de la tabla `prov_representantes`
--
ALTER TABLE `prov_representantes`
  ADD PRIMARY KEY (`cod_representante`),
  ADD KEY `prov_representantes_ibfk_1` (`cod_prov`);

--
-- Indices de la tabla `tipo_pago`
--
ALTER TABLE `tipo_pago`
  ADD PRIMARY KEY (`cod_tipo_pago`),
  ADD KEY `cod_cambio` (`cod_cambio`);

--
-- Indices de la tabla `tipo_usuario`
--
ALTER TABLE `tipo_usuario`
  ADD PRIMARY KEY (`cod_tipo_usuario`);

--
-- Indices de la tabla `tlf_proveedores`
--
ALTER TABLE `tlf_proveedores`
  ADD PRIMARY KEY (`cod_tlf`),
  ADD KEY `cod_prov` (`cod_prov`);

--
-- Indices de la tabla `tpu_permisos`
--
ALTER TABLE `tpu_permisos`
  ADD KEY `cod_tipo_usuario` (`cod_tipo_usuario`),
  ADD KEY `cod_permiso` (`cod_permiso`);

--
-- Indices de la tabla `unidades_medida`
--
ALTER TABLE `unidades_medida`
  ADD PRIMARY KEY (`cod_unidad`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`cod_usuario`),
  ADD UNIQUE KEY `user` (`user`),
  ADD KEY `usuario-tipousuario` (`cod_tipo_usuario`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`cod_venta`),
  ADD KEY `ventas-clientes` (`cod_cliente`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cambio_divisa`
--
ALTER TABLE `cambio_divisa`
  MODIFY `cod_cambio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `carga`
--
ALTER TABLE `carga`
  MODIFY `cod_carga` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `cod_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `cod_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `compras`
--
ALTER TABLE `compras`
  MODIFY `cod_compra` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `descarga`
--
ALTER TABLE `descarga`
  MODIFY `cod_descarga` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `detalle_carga`
--
ALTER TABLE `detalle_carga`
  MODIFY `cod_det_carga` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `detalle_compras`
--
ALTER TABLE `detalle_compras`
  MODIFY `cod_detallec` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `detalle_descarga`
--
ALTER TABLE `detalle_descarga`
  MODIFY `cod_det_descarga` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `detalle_pagos`
--
ALTER TABLE `detalle_pagos`
  MODIFY `cod_detallepago` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `detalle_productos`
--
ALTER TABLE `detalle_productos`
  MODIFY `cod_detallep` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `detalle_ventas`
--
ALTER TABLE `detalle_ventas`
  MODIFY `cod_detallev` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `divisas`
--
ALTER TABLE `divisas`
  MODIFY `cod_divisa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `marcas`
--
ALTER TABLE `marcas`
  MODIFY `cod_marca` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `pagos`
--
ALTER TABLE `pagos`
  MODIFY `cod_pago` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `permisos`
--
ALTER TABLE `permisos`
  MODIFY `cod_permiso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `presentacion_producto`
--
ALTER TABLE `presentacion_producto`
  MODIFY `cod_presentacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `cod_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `cod_prov` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `prov_representantes`
--
ALTER TABLE `prov_representantes`
  MODIFY `cod_representante` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tipo_pago`
--
ALTER TABLE `tipo_pago`
  MODIFY `cod_tipo_pago` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tipo_usuario`
--
ALTER TABLE `tipo_usuario`
  MODIFY `cod_tipo_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tlf_proveedores`
--
ALTER TABLE `tlf_proveedores`
  MODIFY `cod_tlf` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `unidades_medida`
--
ALTER TABLE `unidades_medida`
  MODIFY `cod_unidad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `cod_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `cod_venta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cambio_divisa`
--
ALTER TABLE `cambio_divisa`
  ADD CONSTRAINT `cambiodivisa-divisa` FOREIGN KEY (`cod_divisa`) REFERENCES `divisas` (`cod_divisa`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `compras`
--
ALTER TABLE `compras`
  ADD CONSTRAINT `compras-proveedores` FOREIGN KEY (`cod_prov`) REFERENCES `proveedores` (`cod_prov`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `detalle_carga`
--
ALTER TABLE `detalle_carga`
  ADD CONSTRAINT `detalle_carga-carga` FOREIGN KEY (`cod_carga`) REFERENCES `carga` (`cod_carga`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detalle_carga-detallep` FOREIGN KEY (`cod_detallep`) REFERENCES `detalle_productos` (`cod_detallep`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `detalle_compras`
--
ALTER TABLE `detalle_compras`
  ADD CONSTRAINT `detalle_compras-compras` FOREIGN KEY (`cod_compra`) REFERENCES `compras` (`cod_compra`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detalle_compras-detalle_productos` FOREIGN KEY (`cod_detallep`) REFERENCES `detalle_productos` (`cod_detallep`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `detalle_descarga`
--
ALTER TABLE `detalle_descarga`
  ADD CONSTRAINT `detalle_descarga-descarga` FOREIGN KEY (`cod_descarga`) REFERENCES `descarga` (`cod_descarga`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detalle_descarga-detallep` FOREIGN KEY (`cod_detallep`) REFERENCES `detalle_productos` (`cod_detallep`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `detalle_pagos`
--
ALTER TABLE `detalle_pagos`
  ADD CONSTRAINT `detalle_pago-pago` FOREIGN KEY (`cod_pago`) REFERENCES `pagos` (`cod_pago`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tipo_pago-detalle_pago` FOREIGN KEY (`cod_tipo_pago`) REFERENCES `tipo_pago` (`cod_tipo_pago`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `detalle_productos`
--
ALTER TABLE `detalle_productos`
  ADD CONSTRAINT `detalle_productos_ibfk_1` FOREIGN KEY (`cod_presentacion`) REFERENCES `presentacion_producto` (`cod_presentacion`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `detalle_ventas`
--
ALTER TABLE `detalle_ventas`
  ADD CONSTRAINT `detalle_ventas-detalle_productos` FOREIGN KEY (`cod_detallep`) REFERENCES `detalle_productos` (`cod_detallep`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detalle_ventas_ibfk_1` FOREIGN KEY (`cod_venta`) REFERENCES `ventas` (`cod_venta`);

--
-- Filtros para la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD CONSTRAINT `pagos-ventas` FOREIGN KEY (`cod_venta`) REFERENCES `ventas` (`cod_venta`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `presentacion_producto`
--
ALTER TABLE `presentacion_producto`
  ADD CONSTRAINT `presentacion_producto_ibfk_1` FOREIGN KEY (`cod_producto`) REFERENCES `productos` (`cod_producto`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `presentacion_producto_ibfk_2` FOREIGN KEY (`cod_unidad`) REFERENCES `unidades_medida` (`cod_unidad`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos-categorias` FOREIGN KEY (`cod_categoria`) REFERENCES `categorias` (`cod_categoria`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `productos-marcas` FOREIGN KEY (`cod_marca`) REFERENCES `marcas` (`cod_marca`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `prov_representantes`
--
ALTER TABLE `prov_representantes`
  ADD CONSTRAINT `prov_representantes_ibfk_1` FOREIGN KEY (`cod_prov`) REFERENCES `proveedores` (`cod_prov`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tipo_pago`
--
ALTER TABLE `tipo_pago`
  ADD CONSTRAINT `tipo_pago_ibfk_1` FOREIGN KEY (`cod_cambio`) REFERENCES `cambio_divisa` (`cod_cambio`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tlf_proveedores`
--
ALTER TABLE `tlf_proveedores`
  ADD CONSTRAINT `tlf_proveedores_ibfk_1` FOREIGN KEY (`cod_prov`) REFERENCES `proveedores` (`cod_prov`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tpu_permisos`
--
ALTER TABLE `tpu_permisos`
  ADD CONSTRAINT `tpu_permisos_ibfk_1` FOREIGN KEY (`cod_tipo_usuario`) REFERENCES `tipo_usuario` (`cod_tipo_usuario`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tpu_permisos_ibfk_2` FOREIGN KEY (`cod_permiso`) REFERENCES `permisos` (`cod_permiso`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuario-tipousuario` FOREIGN KEY (`cod_tipo_usuario`) REFERENCES `tipo_usuario` (`cod_tipo_usuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `ventas-clientes` FOREIGN KEY (`cod_cliente`) REFERENCES `clientes` (`cod_cliente`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;