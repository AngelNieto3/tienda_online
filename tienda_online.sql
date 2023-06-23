/*
 Navicat Premium Data Transfer

 Source Server         : BASEDISTRIBUIDOS
 Source Server Type    : MySQL
 Source Server Version : 50733
 Source Host           : localhost:3306
 Source Schema         : tienda_online

 Target Server Type    : MySQL
 Target Server Version : 50733
 File Encoding         : 65001

 Date: 19/06/2023 10:36:00
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for categorias
-- ----------------------------
DROP TABLE IF EXISTS `categorias`;
CREATE TABLE `categorias`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_spanish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of categorias
-- ----------------------------
INSERT INTO `categorias` VALUES (1, 'ACCION');
INSERT INTO `categorias` VALUES (2, 'COMEDIA');
INSERT INTO `categorias` VALUES (3, 'TERROR');
INSERT INTO `categorias` VALUES (4, 'AVENTURA');
INSERT INTO `categorias` VALUES (5, 'ANIMADA');

-- ----------------------------
-- Table structure for clientes
-- ----------------------------
DROP TABLE IF EXISTS `clientes`;
CREATE TABLE `clientes`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(80) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `apellidos` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `telefono` varchar(15) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `comentario` varchar(300) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 51 CHARACTER SET = utf8 COLLATE = utf8_spanish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of clientes
-- ----------------------------
INSERT INTO `clientes` VALUES (49, 'Guillermo Ddier', 'Reyes Reyes', 'guillermoreyesdid@gmail.com', '5562250825', '');
INSERT INTO `clientes` VALUES (50, 'Guillermo Ddier', 'Reyes Reyes', 'guillermoreyesdid@gmail.com', '5562250825', '');

-- ----------------------------
-- Table structure for detalle_pedidos
-- ----------------------------
DROP TABLE IF EXISTS `detalle_pedidos`;
CREATE TABLE `detalle_pedidos`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pedido_id` int(11) NOT NULL,
  `pelicula_id` int(11) NOT NULL,
  `precio` decimal(10, 2) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `estado` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 58 CHARACTER SET = utf8 COLLATE = utf8_spanish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of detalle_pedidos
-- ----------------------------
INSERT INTO `detalle_pedidos` VALUES (53, 40, 1, 20.00, 1, 1);
INSERT INTO `detalle_pedidos` VALUES (54, 40, 2, 25.00, 1, 1);
INSERT INTO `detalle_pedidos` VALUES (55, 40, 20, 39.00, 1, 1);
INSERT INTO `detalle_pedidos` VALUES (56, 40, 19, 30.00, 1, 1);
INSERT INTO `detalle_pedidos` VALUES (57, 41, 20, 39.00, 6, 1);

-- ----------------------------
-- Table structure for pedidos
-- ----------------------------
DROP TABLE IF EXISTS `pedidos`;
CREATE TABLE `pedidos`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `cliente_id` int(11) NOT NULL,
  `total` decimal(10, 2) NOT NULL,
  `fecha` date NOT NULL,
  `estado` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 42 CHARACTER SET = utf8 COLLATE = utf8_spanish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pedidos
-- ----------------------------
INSERT INTO `pedidos` VALUES (40, 49, 114.00, '2023-06-07', 1);
INSERT INTO `pedidos` VALUES (41, 50, 234.00, '2023-06-07', 1);

-- ----------------------------
-- Table structure for peliculas
-- ----------------------------
DROP TABLE IF EXISTS `peliculas`;
CREATE TABLE `peliculas`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(80) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` varchar(300) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `foto` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `precio` decimal(10, 2) NOT NULL,
  `categoria_id` int(10) NOT NULL,
  `fecha` date NOT NULL,
  `estado` int(11) NOT NULL DEFAULT 1,
  `cantidad` int(11) NOT NULL,
  `stock_min` int(11) NOT NULL,
  `stock_max` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_spanish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of peliculas
-- ----------------------------
INSERT INTO `peliculas` VALUES (1, 'GUARDIANES DE LAS GALAXIA', 'FULL ACCION', '2.jpg', 20.00, 1, '2023-06-07', 1, 9, 5, 20);
INSERT INTO `peliculas` VALUES (2, 'MICKEY MOUSE', 'FULL ANIMACION', '4.jpg', 25.00, 5, '2023-05-29', 1, 9, 5, 20);
INSERT INTO `peliculas` VALUES (3, 'BANANA', 'FULL AVENTURA', '6.jpg', 24.00, 4, '2017-09-03', 1, 10, 5, 20);
INSERT INTO `peliculas` VALUES (4, 'BATMAN', 'FULL ACCION', 'batman.jpg', 30.00, 1, '2023-06-07', 1, 10, 5, 20);
INSERT INTO `peliculas` VALUES (5, 'CAMINO HACIA EL TERROR', 'FULL TERROR', 'camino-hacia-el-terror.jpg', 35.00, 3, '2017-09-03', 1, 10, 5, 20);
INSERT INTO `peliculas` VALUES (6, 'DEADPOOL', 'FULL ACCION', 'deadpool.jpg', 40.00, 1, '2023-06-07', 1, 10, 5, 20);
INSERT INTO `peliculas` VALUES (7, 'LEGO', 'FULL ANIMADA', 'lego.jpg', 17.00, 5, '2017-09-03', 1, 10, 5, 20);
INSERT INTO `peliculas` VALUES (8, 'RAMBO', 'FULL ACCION', 'rambo.jpg', 35.00, 1, '2023-06-07', 1, 10, 5, 20);
INSERT INTO `peliculas` VALUES (9, 'RESIDENT', 'FULL ACCION', 'resident.jpg', 36.00, 1, '2017-09-03', 1, 10, 5, 20);
INSERT INTO `peliculas` VALUES (10, 'SIMPSON', 'FULL', 'simpsons.jpg', 31.00, 4, '2023-05-29', 1, 10, 5, 20);
INSERT INTO `peliculas` VALUES (11, 'TED', 'FULL COMEDIA', 'ted.jpg', 17.00, 2, '2023-05-29', 1, 10, 5, 20);
INSERT INTO `peliculas` VALUES (12, 'TRANSFORMERS', 'FULL ACCION', 'transformer.jpg', 40.00, 1, '2023-06-07', 1, 10, 5, 20);
INSERT INTO `peliculas` VALUES (19, 'SUPER MARIO BROS', 'FULL MOVE', '03.jpg', 30.00, 2, '2023-06-07', 1, 9, 4, 15);
INSERT INTO `peliculas` VALUES (20, 'SPYDERMAN ACROSS', 'FULL MOVE HD', '45.jpg', 39.00, 1, '2023-06-07', 1, 10, 3, 18);

-- ----------------------------
-- Table structure for usuarios
-- ----------------------------
DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE `usuarios`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_usuario` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `clave` varchar(150) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `estado` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_spanish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of usuarios
-- ----------------------------
INSERT INTO `usuarios` VALUES (1, 'admin1', '1234', 1);

-- ----------------------------
-- Procedure structure for actualizar_pelicula
-- ----------------------------
DROP PROCEDURE IF EXISTS `actualizar_pelicula`;
delimiter ;;
CREATE PROCEDURE `actualizar_pelicula`(IN pelicula_id INT,
    IN nuevo_titulo VARCHAR(100),
    IN nueva_descripcion VARCHAR(255),
    IN nueva_foto VARCHAR(100),
    IN nuevo_precio DECIMAL(10, 2),
    IN nueva_categoria_id INT,
    IN nueva_fecha DATE,
    IN nueva_cantidad INT)
BEGIN
    DECLARE stock_minimo1 INT;
    DECLARE stock_maximo1 INT;
    
    -- Obtener stock mínimo y stock máximo
    SELECT stock_min, stock_max INTO stock_minimo1, stock_maximo1
    FROM peliculas
    WHERE id = pelicula_id;
    
    -- Validar la nueva cantidad
    IF nueva_cantidad < stock_minimo1 THEN
        SELECT 'ES MUY POCA CANTIDAD' AS mensaje;
    ELSEIF nueva_cantidad > stock_maximo1 THEN
        SELECT 'ES DEMASIADA' AS mensaje;
    ELSE
        SELECT 'ESTA BIEN' AS mensaje;
				UPDATE peliculas
        SET titulo = nuevo_titulo,
            descripcion = nueva_descripcion,
            foto = nueva_foto,
            precio = nuevo_precio,
            categoria_id = nueva_categoria_id,
            fecha = nueva_fecha,
            cantidad = nueva_cantidad
        WHERE id = pelicula_id;
    END IF;
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
