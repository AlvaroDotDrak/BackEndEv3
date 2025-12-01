-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-12-2025 a las 12:11:10
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `veterinaria_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add categoria', 7, 'add_categoria'),
(26, 'Can change categoria', 7, 'change_categoria'),
(27, 'Can delete categoria', 7, 'delete_categoria'),
(28, 'Can view categoria', 7, 'view_categoria'),
(29, 'Can add producto', 8, 'add_producto'),
(30, 'Can change producto', 8, 'change_producto'),
(31, 'Can delete producto', 8, 'delete_producto'),
(32, 'Can view producto', 8, 'view_producto');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$1000000$SfViPSP1S81GHLIUHm3YmQ$iB3ruPyZQ2THGRJh0+X4rBaJR5JEJqBSyFCnMeqge2I=', '2025-12-01 11:03:26.735557', 1, 'alvar', '', '', '', 1, 1, '2025-12-01 07:36:13.405604'),
(2, 'pbkdf2_sha256$1000000$EUnGhnV6ESjUITtfueHAOu$o/7VfbW44l2LBMo0WKCjiqoEpk7yqC/eRCyZynMdZzQ=', '2025-12-01 10:47:19.958798', 0, 'empleado1', '', '', '', 0, 1, '2025-12-01 08:52:48.917022'),
(3, 'pbkdf2_sha256$1000000$wf85twGQyFGyHiXzh3XBa3$sqZfdW+AuM74fQdbO8ArZL9WVUXMAkwzRIypJiijFDw=', '2025-12-01 10:52:16.440187', 0, 'empleado2', '', '', '', 0, 1, '2025-12-01 10:51:53.038935');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2025-12-01 08:52:49.473409', '2', 'empleado1', 1, '[{\"added\": {}}]', 4, 1),
(2, '2025-12-01 10:51:53.628493', '3', 'empleado2', 1, '[{\"added\": {}}]', 4, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(7, 'gestorProductos', 'categoria'),
(8, 'gestorProductos', 'producto'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2025-12-01 07:32:35.740780'),
(2, 'auth', '0001_initial', '2025-12-01 07:32:36.521118'),
(3, 'admin', '0001_initial', '2025-12-01 07:32:36.705191'),
(4, 'admin', '0002_logentry_remove_auto_add', '2025-12-01 07:32:36.711362'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2025-12-01 07:32:36.719879'),
(6, 'contenttypes', '0002_remove_content_type_name', '2025-12-01 07:32:36.801546'),
(7, 'auth', '0002_alter_permission_name_max_length', '2025-12-01 07:32:36.885634'),
(8, 'auth', '0003_alter_user_email_max_length', '2025-12-01 07:32:36.897695'),
(9, 'auth', '0004_alter_user_username_opts', '2025-12-01 07:32:36.905728'),
(10, 'auth', '0005_alter_user_last_login_null', '2025-12-01 07:32:36.970025'),
(11, 'auth', '0006_require_contenttypes_0002', '2025-12-01 07:32:36.973707'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2025-12-01 07:32:36.979730'),
(13, 'auth', '0008_alter_user_username_max_length', '2025-12-01 07:32:36.992796'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2025-12-01 07:32:37.016929'),
(15, 'auth', '0010_alter_group_name_max_length', '2025-12-01 07:32:37.039464'),
(16, 'auth', '0011_update_proxy_permissions', '2025-12-01 07:32:37.046999'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2025-12-01 07:32:37.059871'),
(18, 'gestorProductos', '0001_initial', '2025-12-01 07:32:37.239236'),
(19, 'sessions', '0001_initial', '2025-12-01 07:32:37.287493');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_session`
--

DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('l9pb6gn2ocyo7r4evm4ncwcx9j6bjkyk', '.eJxVjEEOwiAQRe_C2pCCOIBL9z0DGZhBqgaS0q6Md7dNutDtf-_9twi4LiWsnecwkbgKJU6_W8T05LoDemC9N5laXeYpyl2RB-1ybMSv2-H-HRTsZauBoldWc47JIKLyzAwRLmTZZdyYSXkAQ5QBrM-Qzj7qxDg4xaQdiM8XHoU5NQ:1vQ1gk:IioBmy_2NPwRxL0Cq4k_VLjM0wHEifGfbYHon47bATY', '2025-12-15 11:03:26.739579');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gestorproductos_categoria`
--

DROP TABLE IF EXISTS `gestorproductos_categoria`;
CREATE TABLE `gestorproductos_categoria` (
  `id` bigint(20) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `gestorproductos_categoria`
--

INSERT INTO `gestorproductos_categoria` (`id`, `nombre`, `descripcion`) VALUES
(1, 'Aliementos', 'Alimentos para mascotas'),
(2, 'Medicamentos', 'Medicamentos para animales'),
(3, 'Arenas', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gestorproductos_producto`
--

DROP TABLE IF EXISTS `gestorproductos_producto`;
CREATE TABLE `gestorproductos_producto` (
  `id` bigint(20) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `descripcion` longtext DEFAULT NULL,
  `precio` decimal(10,2) NOT NULL,
  `categoria_id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `gestorproductos_producto`
--

INSERT INTO `gestorproductos_producto` (`id`, `nombre`, `descripcion`, `precio`, `categoria_id`, `user_id`) VALUES
(1, 'Purina Urinary gato 3kg', 'Alimento para gatos con problemas urinarios, disuelve cristales', 24990.00, 1, 1),
(3, 'Royal Urinary SO 1,5 kg', 'Alimento para gatos para gatos con cristales formados', 15000.00, 1, 2),
(4, 'Invermic Antiparasitario 10 ML', 'Antiparasitario interno solucion oral', 8990.00, 2, 2),
(5, 'Arena Aglutinante Turbo Clean 20 Kg', 'La arena sanitaria aglutinante Turbo Clean Odor Control de 20 kg', 17000.00, 3, 2),
(6, 'Snack Perros Natura Nourish 170gr', 'Snack Perros Natura Nourish Dental Chews Fruit Veggie 170gr', 5000.00, 1, 2),
(7, 'Nomade Raza Med/gde 20kg', 'Alimento Premium Perro', 42000.00, 1, 2),
(8, 'Arena sanitaria aglutinante America Litter 15kg', 'Diseñada para los amantes de los felinos conscientes del medio ambiente, esta arena de bentonita 100% natural es la solución perfecta para el control de olores y la higiene de tu mascota', 16000.00, 3, 1),
(9, 'Bravery Gato Adulto Salmón 7 Kg', '• Elaborado con 100% carne de salmón deshidratada\r\n• Hipoalergénico y monoproteico\r\n• Libre de granos y gluten', 42000.00, 1, 1),
(10, 'Alimento Fit Formula Premium Fit Gato para gato adulto sabor ave de 10 kg', 'La selección de un alimento adecuado para tu mascota es muy importante para garantizar su crecimiento, desarrollo y salud. Con esta opción de Fit Formula podrás cubrir las necesidades nutricionales y energéticas de tu gato.', 29000.00, 1, 1),
(11, 'Purina® Pro Plan® Sterilized Alimento Para Gato 7.5kg', '40.0% Proteína bruta (mín.) 40,0%\r\nExtracto etéreo / Grasa bruta (mín./máx.) 12,0% / 15,0%\r\nFibra bruta (máx.) 5,5%\r\nHumedad (máx.) 12,0%\r\nMinerales/Cenizas (máx.) 8,5%', 41000.00, 1, 1),
(12, 'Spray antipulgas', '120 ml de spray', 19000.00, 2, 3),
(13, 'Purina Excellent Urinary Gato 7.5kg', 'La selección de un alimento adecuado para tu mascota es muy importante para garantizar su crecimiento, desarrollo y salud. Con esta opción de Excellent podrás cubrir las necesidades nutricionales y energéticas de tu gato.', 28990.00, 1, 3),
(14, 'Therapy Feline Urinary Health 2kg.', 'Therapy Feline Urinary Health 2kg es un alimento seco premium diseñado específicamente para la salud urinaria de los gatos. Su formulación única ayuda a mantener el equilibrio del pH urinario, contribuyendo a la prevención de problemas urinarios comunes en felinos.', 19800.00, 1, 3),
(15, 'Balanced Perro Senior Raza Grande 15 Kg', 'La selección de un alimento adecuado para tu mascota es muy importante para garantizar su crecimiento, desarrollo y salud. Con esta opción de Balanced podrás cubrir las necesidades nutricionales y energéticas de tu perro.', 45990.00, 1, 3),
(16, 'Arena Antibacterial Aglutinante Topk9 15kg Bol. Reutilizable', 'Seamos Eco amigables con nuestra Bolsa Reutilizable de 15kg. Viene con manillas cómodas para llevar tus compras de supermercado, feria o accesorios de tu mascota cuando salen de paseo.', 11990.00, 3, 3);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indices de la tabla `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indices de la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indices de la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indices de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indices de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indices de la tabla `gestorproductos_categoria`
--
ALTER TABLE `gestorproductos_categoria`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `gestorproductos_producto`
--
ALTER TABLE `gestorproductos_producto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gestorProductos_prod_categoria_id_9579c299_fk_gestorPro` (`categoria_id`),
  ADD KEY `gestorProductos_producto_user_id_803710d1_fk_auth_user_id` (`user_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT de la tabla `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `gestorproductos_categoria`
--
ALTER TABLE `gestorproductos_categoria`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `gestorproductos_producto`
--
ALTER TABLE `gestorproductos_producto`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Filtros para la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Filtros para la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `gestorproductos_producto`
--
ALTER TABLE `gestorproductos_producto`
  ADD CONSTRAINT `gestorProductos_prod_categoria_id_9579c299_fk_gestorPro` FOREIGN KEY (`categoria_id`) REFERENCES `gestorproductos_categoria` (`id`),
  ADD CONSTRAINT `gestorProductos_producto_user_id_803710d1_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
