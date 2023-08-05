-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-07-2023 a las 18:20:05
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `food_and_drink`
--
CREATE DATABASE IF NOT EXISTS `food_and_drink` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `food_and_drink`;

DELIMITER $$
--
-- Procedimientos
--
DROP PROCEDURE IF EXISTS `CIdUsuario`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `CIdUsuario` (IN `N_IdUsuario` INT)   BEGIN SELECT *FROM food_and_drink.usuario WHERE  IdUsuario = N_IdUsuario; END$$

DROP PROCEDURE IF EXISTS `CNoDocumento`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `CNoDocumento` (IN `N_NoDocumento` INT)   SELECT *FROM food_and_drink.usuario WHERE  NoDocumento = N_NoDocumento$$

DROP PROCEDURE IF EXISTS `CNombreUsuario`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `CNombreUsuario` (IN `N_Nombre` VARCHAR(40))   SELECT *FROM food_and_drink.usuario WHERE Nombre = N_Nombre$$

DROP PROCEDURE IF EXISTS `ConsultaDomiciliarioDomicilio`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ConsultaDomiciliarioDomicilio` ()   BEGIN
select d.IdDomiciliario,d.TipoDocumento,d.NoDocumento,d.Nombre,d.Apellido,d.Direccion,d.Telefono,d.Correo,d.Contrasena,d.Estado,e.IdDomicilio,e.Hora,e.Estado,e.IdPedido,e.IdDomiciliario from domiciliario as d inner join domicilio as e on d.IdDomiciliario=e.IdDomiciliario;
END$$

DROP PROCEDURE IF EXISTS `ConsultaPedidoProducto`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ConsultaPedidoProducto` ()  SQL SECURITY INVOKER BEGIN
select p.IdPedido,p.Fecha,p.Hora,p.Total,p.Estado,p.Pedido,p.IdUsuario,p.IdProducto,po.IdProducto,po.Descripcion,po.Precio,po.Categoria,po.Estado from pedido as p LEFT join producto as po on p.IdProducto=po.IdProducto;
END$$

DROP PROCEDURE IF EXISTS `ConsultaTodo`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ConsultaTodo` ()   BEGIN SELECT *FROM domiciliario, domicilio; END$$

DROP PROCEDURE IF EXISTS `CTelefonoUsuario`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `CTelefonoUsuario` (IN `N_telefono` DOUBLE)   SELECT *FROM food_and_drink.usuario WHERE telefono = N_telefono$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `domiciliario`
--

DROP TABLE IF EXISTS `domiciliario`;
CREATE TABLE `domiciliario` (
  `IdDomiciliario` int(11) NOT NULL,
  `TipoDocumento` varchar(60) DEFAULT NULL,
  `NoDocumento` varchar(60) DEFAULT NULL,
  `Nombre` varchar(40) DEFAULT NULL,
  `Apellido` varchar(40) DEFAULT NULL,
  `Direccion` varchar(40) DEFAULT NULL,
  `Telefono` double DEFAULT NULL,
  `Correo` varchar(60) DEFAULT NULL,
  `Contrasena` varchar(50) DEFAULT NULL,
  `Estado` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `domiciliario`
--

INSERT INTO `domiciliario` (`IdDomiciliario`, `TipoDocumento`, `NoDocumento`, `Nombre`, `Apellido`, `Direccion`, `Telefono`, `Correo`, `Contrasena`, `Estado`) VALUES
(1, 'TI', '1028784124', 'Camilo', 'García', 'DG 53 No. 32-55 S', 3225478796, 'camilog1@gmail.com', 'sr700', 'Activo'),
(2, 'CC', '1027781124', 'Cristian', 'Garzón', 'Cll 53 No 20-57 S', 3125472790, 'camilocrg2@gmail.com', 'ir720', 'Activo'),
(3, 'TI', '1068784057', 'David', 'Díaz', 'Cll 13 No 36-11 S', 3052669871, 'DDdiaz114@gmail.com', 'DDdavidz18', 'Activo'),
(4, 'CC', '1018781359', 'Daniel', 'Rojas', 'Cll 10 No 31-91 N', 3152768891, 'Danielrr1994@gmail.com', 'DDdanielz12', 'Activo'),
(5, 'CC', '1169484057', 'Leidy', 'López', 'Cll 23 No 76-01 O', 3182464874, 'DLeidyLo1142@gmail.com', 'LDdavidz1833', 'Activo'),
(6, 'CC', '1969484577', 'Luis', 'Wilchez', 'DG 53 No 96-41 E', 3222669830, 'LDWilchez45@gmail.com', 'LwChezz184', 'Activo'),
(7, 'CC', '1969481051', 'Luisa', 'Jaramillo', 'Cll 19 No 16-01 N', 3152669975, 'luisaDdiaz@gmail.com', 'luisAz11896', 'Activo'),
(8, 'CC', '1109080057', 'Sebastián', 'Montaña', 'Cra 10 No 06-31 S', 3052668876, 'SebasDdiaz@gmail.com', 'seDDdavidz12', 'Activo'),
(9, 'CC', '1169484057', 'Juan', 'Montero', 'Cll 13 No 26-41 S', 3152909811, 'juanRmon5@gmail.com', 'juanEsDs', 'Inactivo'),
(10, 'CC', '8169384057', 'Stiven', 'Gómez', 'Cra 43 No 86-01 S', 3153639376, 'stivenxd14@gmail.com', 'stivendz18', 'Activo'),
(11, 'TI', '6199484022', 'Alejandro', 'Palacio', 'Cll 23 No 26-15 S', 3192609873, 'alejoBGP6@gmail.com', 'alejo20068', 'Activo'),
(12, 'CC', '1369454858', 'Viviana', 'Suárez', 'DG 60 No 16-71 S', 3132361811, 'viviAsu1@gmail.com', 'vivana1780', 'Inactivo'),
(13, 'CC', '1269384090', 'Carlos', 'Palacios', 'Cll 16 No 76-13 N', 3222699271, 'carlitosGP@gmail.com', 'cPalacios17', 'Activo'),
(14, 'TI', '1169481051', 'Esteban', 'Herrera', 'DG 23 No 26-18 O', 3152115171, 'estebanH120@gmail.com', 'es234h1', 'Activo'),
(15, 'CC', '1369740258', 'Jessua', 'López', 'DG 9 No 6-11 O', 3052699970, 'jessLo114@gmail.com', 'jessuall8', 'Activo'),
(16, 'CC', '8169484057', 'José', 'Díaz', 'Cra 13 No 3-21 E', 3142269071, 'StiwDD13@gmail.com', 'warDiaz1936', 'Activo'),
(17, 'CC', '4169484056', 'Brayan', 'Cárdenas', 'DG 53 No 30-98 O', 3229169891, 'brayancar@gmail.com', 'brayancardenas23', 'Activo'),
(18, 'TI', '2169467528', 'Daniel', 'Rodríguez', 'DG 12 No 3-56 S', 3059969894, 'DaniRorX@gmail.com', 'DanielRodri1987', 'Activo'),
(19, 'CC', '1102487957', 'Javier', 'Sierra', 'Cra 11 No 76-03 O', 3152969371, 'javierSdiaz@gmail.com', 'sierraDdavid', 'Activo'),
(20, 'TI', '9659484157', 'Johan', 'González', 'Cll 13 No 37-11 N', 3052609861, 'johanGon47@hotmail.com', 'johanvid18', 'Activo'),
(21, 'CC', '8349484957', 'Santiago', 'Quintero', 'DG 33 No 86-04 S', 3222666473, 'santiQuintero0@hotmail.com', 'santi1988z', 'Inactivo'),
(22, 'CC', '1029484158', 'Leidy', 'Caballero', 'Cra 13 No 39-11 N', 3149169870, 'leidy1166@outlook.com', 'leidy66caba', 'Activo'),
(23, 'TI', '2163485027', 'Mateo', 'Triana', 'DG 23 No 38-31 E', 3162659812, 'mathtri14@gmail.com', 'mateoTriana2003', 'Activo'),
(24, 'TI', '1229284257', 'Andrés', 'Marín', 'Cll 13 No 36-12 S', 3152669803, 'andresmar10@outlook.com', 'anMDdavidz9', 'Activo'),
(25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

--
-- Disparadores `domiciliario`
--
DROP TRIGGER IF EXISTS `DDomiciliario_BD`;
DELIMITER $$
CREATE TRIGGER `DDomiciliario_BD` BEFORE DELETE ON `domiciliario` FOR EACH ROW BEGIN INSERT INTO FOOD_AND_DRINK.lostdomiciliario (Tipocrud,UserCrud,
    FechaCrud,
    OLDIdDomiciliario,OLDTipoDocumento,OLDNoDocumento,OLDNombre,OLDApellido,OLDDireccion,OLDTelefono,OLDCorreo,OLDContrasena,OLDEstado)
    VALUES (
'Delete',CURRENT_USER(),NOW(),OLD.IdDomiciliario,OLD.TipoDocumento,OLD.NoDocumento,OLD.Nombre,OLD.Apellido,OLD.Direccion,OLD.Telefono,OLD.Correo,OLD.Contrasena,OLD.Estado); END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `Domiciliario_AI`;
DELIMITER $$
CREATE TRIGGER `Domiciliario_AI` AFTER INSERT ON `domiciliario` FOR EACH ROW BEGIN INSERT INTO FOOD_AND_DRINK.lostdomiciliario (Tipocrud,UserCrud,
    FechaCrud,
    NEWIdDomiciliario,NEWTipoDocumento,NEWNoDocumento,NEWNombre,NEWApellido,NEWDireccion,NEWTelefono,NEWCorreo,NEWContrasena,NEWEstado)
    VALUES (
'Insert',CURRENT_USER(),NOW(),NEW.IdDomiciliario,NEW.TipoDocumento,NEW.NoDocumento,NEW.Nombre,NEW.Apellido,NEW.Direccion,NEW.Telefono,NEW.Correo,NEW.Contrasena,NEW.Estado); END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `UDomiciliario_BU`;
DELIMITER $$
CREATE TRIGGER `UDomiciliario_BU` BEFORE UPDATE ON `domiciliario` FOR EACH ROW BEGIN INSERT INTO FOOD_AND_DRINK.lostdomiciliario (Tipocrud,UserCrud,
    FechaCrud,
    OLDIdDomiciliario,OLDTipoDocumento,OLDNoDocumento,OLDNombre,OLDApellido,OLDDireccion,OLDTelefono,OLDCorreo,OLDContrasena,OLDEstado,
    NEWIdDomiciliario,NEWTipoDocumento,NEWNoDocumento,NEWNombre,NEWApellido,NEWDireccion,NEWTelefono,NEWCorreo,NEWContrasena,NEWEstado)
    VALUES (
'Update',CURRENT_USER(),NOW(),OLD.IdDomiciliario,OLD.TipoDocumento,OLD.NoDocumento,OLD.Nombre,OLD.Apellido,OLD.Direccion,OLD.Telefono,OLD.Correo,OLD.Contrasena,OLD.Estado,
    NEW.IdDomiciliario,NEW.TipoDocumento,NEW.NoDocumento,NEW.Nombre,NEW.Apellido,NEW.Direccion,NEW.Telefono,NEW.Correo,NEW.Contrasena,NEW.Estado); END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `domiciliario_ia`;
DELIMITER $$
CREATE TRIGGER `domiciliario_ia` AFTER INSERT ON `domiciliario` FOR EACH ROW begin INSERT INTO lostdomiciliario(Tipocrud,UserCrud,FechaCrud,NEWIdDomiciliario,NEWTipoDocumento,NEWNoDocumento,NEWNombre,NEWApellido,NEWDireccion,
NEWTelefono,NEWCorreo,NEWConstrasena,NEWEstado)VALUES('Insert',CURRENT_USER(),NOW(),new.IdDomiciliario,new.TipoDocumento,new.NoDocumento,new.Nombre,new.Apellido,New.Direccion,New.Telefono,new.Correo,New.Contrasena,new.Estado); end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `domicilio`
--

DROP TABLE IF EXISTS `domicilio`;
CREATE TABLE `domicilio` (
  `IdDomicilio` int(11) NOT NULL,
  `Hora` time DEFAULT NULL,
  `Estado` varchar(50) DEFAULT NULL,
  `IdPedido` int(11) DEFAULT NULL,
  `IdDomiciliario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `domicilio`
--

INSERT INTO `domicilio` (`IdDomicilio`, `Hora`, `Estado`, `IdPedido`, `IdDomiciliario`) VALUES
(1, '02:30:00', 'Activo', 1, 1),
(2, '02:45:00', 'Activo', 2, 2),
(3, '02:50:00', 'Activo', 3, 3),
(4, '02:20:00', 'Activo', 4, 4),
(5, '02:10:00', 'Activo', 5, 5),
(6, '02:15:00', 'Activo', 6, 6),
(7, '02:05:00', 'Activo', 7, 7),
(8, '01:00:00', 'Activo', 8, 8),
(9, '01:30:00', 'Activo', 9, 9),
(10, '01:35:00', 'Activo', 10, 10),
(11, '01:40:00', 'Activo', 11, 11),
(12, '03:00:00', 'Activo', 12, 12),
(13, '03:35:00', 'Inactivo', 13, 13),
(14, '03:45:00', 'Activo', 14, 14),
(15, '03:50:00', 'Activo', 15, 15),
(16, '04:00:00', 'Activo', 16, 16),
(17, '12:30:00', 'Activo', 17, 17),
(18, '12:00:00', 'Inactivo', 18, 18),
(19, '12:05:00', 'Activo', 19, 19),
(20, '12:15:00', 'Activo', 20, 20),
(21, '04:05:00', 'Activo', 21, 21),
(22, '04:10:00', 'Inactivo', 22, 22),
(23, '05:15:00', 'inactivo', 23, 23),
(24, '06:00:00', 'Activo', 24, 24),
(25, '07:00:00', 'Inactivo', 25, 25);

--
-- Disparadores `domicilio`
--
DROP TRIGGER IF EXISTS `ActualizarEstadoDomicilio`;
DELIMITER $$
CREATE TRIGGER `ActualizarEstadoDomicilio` AFTER UPDATE ON `domicilio` FOR EACH ROW INSERT INTO domicilio(estado) VALUES(new.estado)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lostdomiciliario`
--

DROP TABLE IF EXISTS `lostdomiciliario`;
CREATE TABLE `lostdomiciliario` (
  `IDLost` int(11) NOT NULL,
  `Tipocrud` varchar(30) DEFAULT NULL,
  `UserCrud` varchar(30) DEFAULT NULL,
  `FechaCrud` date DEFAULT NULL,
  `OLDIdDomiciliario` int(11) DEFAULT NULL,
  `OLDTipoDocumento` varchar(60) DEFAULT NULL,
  `OLDNoDocumento` varchar(60) DEFAULT NULL,
  `OLDNombre` varchar(60) DEFAULT NULL,
  `OLDApellido` varchar(60) DEFAULT NULL,
  `OLDDireccion` varchar(70) DEFAULT NULL,
  `OLDTelefono` double DEFAULT NULL,
  `OLDCorreo` varchar(60) DEFAULT NULL,
  `OLDContrasena` varchar(50) DEFAULT NULL,
  `OLDEstado` varchar(50) DEFAULT NULL,
  `NEWIdDomiciliario` int(11) DEFAULT NULL,
  `NEWTipoDocumento` varchar(60) DEFAULT NULL,
  `NEWNoDocumento` varchar(60) DEFAULT NULL,
  `NEWNombre` varchar(60) DEFAULT NULL,
  `NEWApellido` varchar(60) DEFAULT NULL,
  `NEWDireccion` varchar(70) DEFAULT NULL,
  `NEWTelefono` double DEFAULT NULL,
  `NEWCorreo` varchar(60) DEFAULT NULL,
  `NEWContrasena` varchar(50) DEFAULT NULL,
  `NEWEstado` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

DROP TABLE IF EXISTS `pedido`;
CREATE TABLE `pedido` (
  `IdPedido` int(11) NOT NULL,
  `Fecha` date NOT NULL,
  `Hora` time NOT NULL,
  `Total` double NOT NULL,
  `Estado` varchar(50) NOT NULL,
  `Pedido` int(3) DEFAULT NULL,
  `IdUsuario` int(11) NOT NULL,
  `IdProducto` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `pedido`
--

INSERT INTO `pedido` (`IdPedido`, `Fecha`, `Hora`, `Total`, `Estado`, `Pedido`, `IdUsuario`, `IdProducto`) VALUES
(1, '2022-01-01', '11:00:00', 8900, 'Activo', 1, 1, NULL),
(2, '2022-01-02', '11:05:00', 10900, 'Activo', 2, 2, NULL),
(3, '2022-01-01', '11:00:00', 15900, 'Activo', 3, 3, NULL),
(4, '2022-01-02', '11:00:00', 9900, 'Activo', 4, 4, NULL),
(5, '2022-01-01', '11:05:00', 11900, 'Activo', 5, 5, NULL),
(6, '2022-01-01', '11:10:00', 11900, 'Activo', 6, 6, NULL),
(7, '2022-01-30', '11:00:00', 2900, 'Activo', 7, 7, NULL),
(8, '2022-01-12', '12:10:00', 11500, 'Inactivo', 8, 8, NULL),
(9, '2022-01-11', '12:15:00', 21500, 'Inactivo', 9, 9, NULL),
(10, '2022-01-11', '12:20:00', 50600, 'Inactivo', 10, 10, NULL),
(11, '2022-01-11', '11:25:00', 11800, 'Inactivo', 11, 11, NULL),
(12, '2022-01-10', '11:30:00', 21900, 'Activo', 12, 12, NULL),
(13, '2022-01-10', '11:35:00', 61000, 'Activo', 13, 13, NULL),
(14, '2022-01-09', '11:35:00', 31200, 'Activo', 14, 14, NULL),
(15, '2022-01-03', '11:35:00', 21400, 'Activo', 15, 15, NULL),
(16, '2022-01-02', '11:35:00', 7500, 'inactivo', 16, 16, NULL),
(17, '2022-01-02', '12:10:00', 8100, 'Inactivo', 17, 17, NULL),
(18, '2022-01-02', '11:10:00', 6200, 'Inactivo', 18, 18, NULL),
(19, '2022-01-01', '12:15:00', 4300, 'Activo', 19, 19, NULL),
(20, '2022-01-01', '11:40:00', 13900, 'Activo', 20, 20, NULL),
(21, '2022-01-06', '11:40:00', 14900, 'Activo', 21, 21, NULL),
(22, '2022-01-05', '11:40:00', 17600, 'Inactivo', 22, 22, NULL),
(23, '2022-01-04', '11:45:00', 19800, 'Inactivo', 23, 23, NULL),
(24, '2022-01-03', '11:50:00', 21000, 'Activo', 24, 24, NULL),
(25, '2022-01-02', '11:55:00', 32800, 'Inactivo', 25, 25, NULL);

--
-- Disparadores `pedido`
--
DROP TRIGGER IF EXISTS `ActualizarFechaPedido`;
DELIMITER $$
CREATE TRIGGER `ActualizarFechaPedido` BEFORE UPDATE ON `pedido` FOR EACH ROW INSERT INTO pedido(fecha)VALUES(new.fecha)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

DROP TABLE IF EXISTS `producto`;
CREATE TABLE `producto` (
  `IdProducto` int(11) NOT NULL,
  `Descripcion` varchar(60) DEFAULT NULL,
  `Precio` double DEFAULT NULL,
  `Categoria` varchar(60) DEFAULT NULL,
  `Estado` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`IdProducto`, `Descripcion`, `Precio`, `Categoria`, `Estado`) VALUES
(161169986, '1/2 Pollo Broaster', 14000, 'Comida rapida', 'En venta'),
(214123647, 'Hamburguesa de Pollo', 15000, 'Comida rapida', 'En venta'),
(214746478, 'Hamburguesa de Pollo', 15000, 'Comida rapida', 'En venta'),
(271866331, 'Pote de Helado sabor Vainillna 660g', 10000, 'Comida rapida', 'En venta'),
(294140649, 'Pizza Paisa', 3000, 'Comida rapida', 'En venta'),
(306056113, 'Pizza hawaiana', 3200, 'Comida rapida', 'En venta'),
(365502757, '1 Pollo frito', 22000, 'Comida rapida', 'En venta'),
(400844963, 'Gaseosa Coca-Cola 400ml', 2800, 'Bebida', 'En venta'),
(409415816, 'Empanada de carne', 2300, 'Comida rapida', 'En venta'),
(423729078, 'Paquete de Gomitas Trululu Gusanos Ácidos', 3000, 'Golosina', 'En venta'),
(487120981, 'Perro caliente Mixto', 6000, 'Comida rapida', 'En venta'),
(556175014, 'Sandwich Mixto', 5000, 'Comida rapida', 'En venta'),
(565485431, 'Empanada Mexicana', 2500, 'Comida rapida', 'En venta'),
(567467038, 'Jugo Hit 500ml Naranja Piña', 2500, 'Bebida', 'En venta'),
(633548818, 'Hamburguesa de pollo envuelta en Bacon', 21000, 'Comida rapida', 'En venta'),
(662835545, 'Hamburguesa de pollo', 15000, 'Comida rapida', 'En venta'),
(708577362, 'Empanada Mixta', 2200, 'Comida rapida', 'En venta'),
(759070312, 'Empanada Mixta', 2500, 'Comida rapida', 'En venta'),
(790320205, 'Gaseosa Colombiana 400ml', 2800, 'Bebida', 'En venta'),
(797173008, 'Jugo Hit 500ml frutos rojos', 2500, 'Bebida', 'En venta'),
(832068283, 'Pizza de Costillas de cerdo BBQ', 3200, 'Comida rapida', 'En venta'),
(864216065, 'Ponque Chocorramo', 2000, 'Postre', 'En venta'),
(888601266, 'Hamburguesa de Carne', 18000, 'Comida rapida', 'En venta'),
(899359615, 'Perro caliente simple', 4000, 'Comida rapida', 'En venta'),
(945262494, 'Balde de pollo KFC', 35000, 'Comida rapida', 'En venta');

--
-- Disparadores `producto`
--
DROP TRIGGER IF EXISTS `ActualizarPrecioProducto`;
DELIMITER $$
CREATE TRIGGER `ActualizarPrecioProducto` AFTER UPDATE ON `producto` FOR EACH ROW INSERT INTO producto(precio) VALUES(new.precio)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE `usuario` (
  `IdUsuario` int(11) NOT NULL,
  `TipoDocumento` varchar(30) DEFAULT NULL,
  `NoDocumento` int(30) DEFAULT NULL,
  `Nombre` varchar(40) DEFAULT NULL,
  `Apellido` varchar(40) DEFAULT NULL,
  `Direccion` varchar(40) DEFAULT NULL,
  `Telefono` double DEFAULT NULL,
  `Correo` varchar(60) DEFAULT NULL,
  `Contrasena` varchar(50) DEFAULT NULL,
  `Estado` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`IdUsuario`, `TipoDocumento`, `NoDocumento`, `Nombre`, `Apellido`, `Direccion`, `Telefono`, `Correo`, `Contrasena`, `Estado`) VALUES
(1, 'TI', 123456789, 'Joan', 'Barreto', 'Calle 12 # 16-44', 3196824766, 'El.lopsss15@gmail.com', 'Michi1205', 'Activo'),
(2, 'TI', 103457698, 'Juan', 'Ventero', 'Calle 85 # 18-84', 8286313281, 'ESapomadako14@gmail.com', 'Roger1205', 'Activo'),
(3, 'TI', 101337236, 'Sebastian', 'Rojas', 'Diagonal 20 # 18-34', 2915790650, 'salchipapa2315@gmail.com', 'Neron1205', 'Inactivo'),
(4, 'TI', 109365597, 'Carlos', 'Sanches', 'Calle 32 # 18-38', 2883058893, 'Elmatarukas35@gmail.com', 'Palomo1205', 'Activo'),
(5, 'TI', 213231321, 'Dylan', 'Morales', 'Calle 62 # 25-37', 6951136946, 'Elsarabambiche45@gmail.com', 'Moran:305', 'Activo'),
(6, 'TI', 104293243, 'Luis', 'Perez', 'Calle 38 # 15-31', 9070680530, 'Gokussjfase45@gmail.com', 'constrasena', 'Activo'),
(7, 'TI', 110437855, 'Nixon', 'Ventero', 'Calle 72 # 15-21', 5653164631, 'lagorda455@gmail.com', '123456789', 'Activo'),
(8, 'TI', 104373348, 'Diana', 'Castaño', 'Calle 45 # 15-43', 5298947092, 'Elfifas20315@gmail.com', 'Mipapi1205.', 'Activo'),
(9, 'TI', 102686818, 'David', 'Montaña', 'Calle 58 # 15-65', 2219817013, 'Soygay75@gmail.com', 'SiSeñor', 'Activo'),
(10, 'TI', 107011168, 'Roger', 'Martinez', 'Calle 92 # 15-87', 6210822725, 'ElArmadillo16@gmail.com', 'elAbocato', 'Activo'),
(11, 'TI', 103824328, 'Alfredo', 'Gomez', 'Calle 43 # 85-39', 4407337610, 'ElBunuelitorico16@gmail.com', 'Michichun', 'Activo'),
(12, 'TI', 105750558, 'Haider', 'Aguilera', 'Calle 84 # 5-14', 6210234332, 'ElNegroafricano15@gmail.com', 'Elchimbo21', 'Inactivo'),
(13, 'TI', 105314942, 'Brandon', 'Ospina', 'Calle 98 # 10-64', 6199552730, 'Eltripode16@gmail.com', 'Mipoto32', 'Activo'),
(14, 'TI', 145851492, 'Andrés', 'Martinez', 'Calle 43 # 85-74', 6322913061, 'Ventiuna16@gmail.com', 'Michigan', 'Activo'),
(15, 'TI', 109776475, 'Felipe', 'Jaramillo', 'Calle 11 # 87-19', 6244266405, 'Elquegrita16@gmail.com', 'SebasUwU', 'Activo'),
(16, 'TI', 107250611, 'Jhoan', 'Armando', 'Calle 13 # 95-54', 2347191127, 'Alfonso16@gmail.com', 'ElMoscoosi', 'Activo'),
(17, 'TI', 198524036, 'Sebastian', 'Cruz', 'Calle 92 # 85-64', 9598618451, 'Juanca77@gmail.com', 'Rogertero', 'Activo'),
(18, 'TI', 121765432, 'Alexander', 'Barreto', 'Calle 82 # 17-44', 2432999109, 'teoriaeliocebnt85@gmail.com', 'elhiervat', 'Activo'),
(19, 'TI', 185962476, 'Yolis', 'Pabon', 'Calle 72 # 17-39', 3993602255, 'ElQUintana18@gmail.com', 'NublaoUwU', 'Inactivo'),
(20, 'TI', 156987742, 'Amalia', 'Florez', 'Calle 62 # 14-32', 7140582612, 'Etesechs598@gmail.com', 'Elfurro21', 'Activo'),
(21, 'TI', 163559874, 'Seis', 'Martinez', 'Calle 52 # 18-36', 2469244169, 'Elbucle875@gmail.com', 'Movilecod', 'Activo'),
(22, 'TI', 158200647, 'Julian', 'Sanches', 'Calle 42 # 19-54', 7001575900, 'Epasiseñor75@gmail.com', 'Michujara', 'Activo'),
(23, 'TI', 185436927, 'Esteban', 'Quintero', 'Calle 32 # 95-44', 1032432749, 'Tengosida35@gmail.com', 'Michapero', 'Activo'),
(24, 'TI', 174986523, 'Jesus', 'Garcia', 'Calle 22 # 93-84', 4025901898, 'Vamosquesisepuede35@gmail.com', 'Dorime12', 'Activo'),
(25, 'TI', 184235689, 'Alex', 'Torres', 'Calle 12 # 65-14', 4681412600, 'GraciasSENA32@gmail.com', 'ElAmadadoulli', 'Inactivo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vista1`
--

DROP TABLE IF EXISTS `vista1`;
CREATE TABLE `vista1` (
  `idDomiciliario` int(11) NOT NULL,
  `tipoDocumento` varchar(60) DEFAULT NULL,
  `nombre` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vista2`
--

DROP TABLE IF EXISTS `vista2`;
CREATE TABLE `vista2` (
  `IdPedido` int(11) NOT NULL,
  `Fecha` date DEFAULT NULL,
  `Hora` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vista3`
--

DROP TABLE IF EXISTS `vista3`;
CREATE TABLE `vista3` (
  `IdDomicilio` int(11) NOT NULL,
  `Hora` time DEFAULT NULL,
  `IdPedido` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vista4`
--

DROP TABLE IF EXISTS `vista4`;
CREATE TABLE `vista4` (
  `IdProducto` int(11) NOT NULL,
  `Descripcion` varchar(60) DEFAULT NULL,
  `Precio` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `domiciliario`
--
ALTER TABLE `domiciliario`
  ADD PRIMARY KEY (`IdDomiciliario`);

--
-- Indices de la tabla `domicilio`
--
ALTER TABLE `domicilio`
  ADD PRIMARY KEY (`IdDomicilio`),
  ADD KEY `IdDomiciliario` (`IdDomiciliario`),
  ADD KEY `IdPedido` (`IdPedido`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`IdPedido`),
  ADD KEY `IdUsuario` (`IdUsuario`,`IdProducto`),
  ADD KEY `IdProducto` (`IdProducto`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`IdProducto`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`IdUsuario`);

--
-- Indices de la tabla `vista1`
--
ALTER TABLE `vista1`
  ADD PRIMARY KEY (`idDomiciliario`);

--
-- Indices de la tabla `vista2`
--
ALTER TABLE `vista2`
  ADD PRIMARY KEY (`IdPedido`);

--
-- Indices de la tabla `vista3`
--
ALTER TABLE `vista3`
  ADD PRIMARY KEY (`IdDomicilio`);

--
-- Indices de la tabla `vista4`
--
ALTER TABLE `vista4`
  ADD PRIMARY KEY (`IdProducto`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `domicilio`
--
ALTER TABLE `domicilio`
  ADD CONSTRAINT `domicilio_ibfk_1` FOREIGN KEY (`IdPedido`) REFERENCES `pedido` (`IdPedido`),
  ADD CONSTRAINT `domicilio_ibfk_2` FOREIGN KEY (`IdDomiciliario`) REFERENCES `domiciliario` (`IdDomiciliario`);

--
-- Filtros para la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`IdProducto`) REFERENCES `producto` (`IdProducto`),
  ADD CONSTRAINT `pedido_ibfk_2` FOREIGN KEY (`IdUsuario`) REFERENCES `usuario` (`IdUsuario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
