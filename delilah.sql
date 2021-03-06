
-- Servidor: localhost:3306

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Base de datos: `delilah`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_pedidos`
--

CREATE TABLE `detalle_pedidos` (
  `id` int(11) NOT NULL,
  `id_pedido` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `nombre_producto` text COLLATE utf8_spanish_ci NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `detalle_pedidos`
--

INSERT INTO `detalle_pedidos` (`id`, `id_pedido`, `id_producto`, `nombre_producto`, `cantidad`, `precio`) VALUES
(1, 1, 1, 'salchipapas ', 2, 20000),
(2, 1, 6, 'filet mignon', 4, 61000),
(3, 2, 1, 'aguardiente con carne', 4, 60000),
(4, 2, 6, 'frijoles', 2, 61000),
(5, 21, 1, 'bandeja paisa', 2, 60000),
(6, 21, 6, 'huevos con arroz', 3, 61000),
(7, 22, 1, 'sancocho', 2, 60),
(8, 22, 6, 'sopa de tortilla', 3, 61000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `total` float NOT NULL,
  `fecha_pedido` datetime NOT NULL,
  `estado` enum('pedido','preparando','completado','entregado') COLLATE utf8_spanish_ci NOT NULL,
  `fecha_estado` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`id`, `id_usuario`, `total`, `fecha_pedido`, `estado`, `fecha_estado`) VALUES
(1, 2, 5000, '2022-11-30 17:47:41', 'pedido', '2022-11-30 17:47:41'),
(2, 3, 1000, '2022-11-30 18:37:37', 'preparando', '2022-11-30 18:01:38'),
(21, 3, 1200, '2022-12-01 17:07:17', 'pedido', '2022-12-01 17:07:17'),
(22, 6, 1200, '2022-12-01 23:45:57', 'pedido', '2022-12-01 23:45:57');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(40) COLLATE utf8_spanish_ci NOT NULL,
  `precio` float NOT NULL,
  `imagen` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` varchar(150) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `nombre`, `precio`, `imagen`, `descripcion`) VALUES
(1, 'salchipapas', 10000, 'salchipapas.png', 'deliciosas salchipapas con salsa de tomate y tocineta'),
(2, 'filet mignon', 20000, 'filetmignon.png', 'disfruta de una deliciosa carne a la parrilla con los mejores jugos de ella'),
(3, 'aguardiente con carne', 15000, 'guarocarne.png', 'que mejor que un guaro con una buena carne , res , pollo o cerdo '),
(4, 'frijoles', 13000, 'frijoles.png', 'comete unos frijolitos bien paisas acompa??ados de chicharron'),
(9, 'bandeja paisa', 10000, 'bandeja.png', 'deliciosa bandeja paisa con  3 crnesdiferentes '),
(10, 'huevos con arroz', 3000, 'milanesa.png', 'come tradicional  huevo con arroz y salsa de tomate'),
(12, 'sancocho', 20000, 'sancocho.png', 'delicioso sancocho para el guayabo , revive muertos '),
(13, 'sopa de tortilla', 5000, 'sopa_tortilla.png', 'deliciosa sopa de tortilla acompa??ada con arroz ');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `apellido` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `usuario` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `email` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `contrasena` text COLLATE utf8_spanish_ci NOT NULL,
  `telefono` text COLLATE utf8_spanish_ci NOT NULL,
  `domicilio` text COLLATE utf8_spanish_ci NOT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `apellido`, `usuario`, `email`, `contrasena`, `telefono`, `domicilio`, `admin`) VALUES
(1, 'Santiago', 'arboleda', 'sanarbmar', 'sanarbmar@gmail.com', '123', '3053074863', 'calle 8 # 84f-25 , medellin colombia', 1),
(2, 'Acamica', 'DWFS', 'Acamica', 'hola@acamica.com', '123', '3259878', 'Medellin, colombia', 0),
(3, 'armando', 'Bareto', 'ArmandoBareto', 'armando@gmail.com.', '123', '8796547', 'medellin colombia', 0),
(5, 'soplando', 'Perico', 'elperiquero', 'elperiquero@gmail.com', 'secret', '5697852', 'medellin , colombia', 0),
(6, 'montando', 'skate', 'monandoSkate', 'montando@gmail.com', 'secret', '543652', 'roue avenue 45 , paris france', 0);

--
-- ??ndices para tablas volcadas
--

--
-- Indices de la tabla `detalle_pedidos`
--
ALTER TABLE `detalle_pedidos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `detalle_pedidos`
--
ALTER TABLE `detalle_pedidos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

