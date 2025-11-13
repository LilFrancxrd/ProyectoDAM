-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-11-2025 a las 23:49:51
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
-- Base de datos: `dbmodel`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `genres`
--

CREATE TABLE `genres` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `genres`
--

INSERT INTO `genres` (`id`, `name`) VALUES
(1, 'Acción'),
(2, 'Plataformas'),
(3, 'FPS'),
(4, 'Estratégia');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `library`
--

CREATE TABLE `library` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `unique_game_id` int(11) NOT NULL,
  `owner` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `offers`
--

CREATE TABLE `offers` (
  `idOferta` int(11) NOT NULL,
  `videogameId` int(11) NOT NULL,
  `nombreJuego` varchar(255) NOT NULL,
  `discount` decimal(5,2) NOT NULL,
  `startDate` datetime NOT NULL,
  `endDate` datetime NOT NULL,
  `precioOriginal` decimal(8,2) DEFAULT NULL,
  `imagenUrl` varchar(500) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `offers`
--

INSERT INTO `offers` (`idOferta`, `videogameId`, `nombreJuego`, `discount`, `startDate`, `endDate`, `precioOriginal`, `imagenUrl`, `created_at`, `updated_at`) VALUES
(1, 1, 'Overcooked 2', 4.00, '2024-11-08 00:00:00', '2024-11-30 23:59:59', 10000.00, 'overcooked2.jpg', '2025-11-08 19:50:54', '2025-11-08 19:50:54'),
(2, 2, 'Red Dead Redemption 2', 4.00, '2024-11-08 01:30:00', '2024-11-30 23:59:59', 10000.00, 'reddead.jpg', '2025-11-08 21:12:31', '2025-11-08 21:12:31');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `name` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `name`) VALUES
(0, 'Usuario'),
(1, 'Editor'),
(2, 'Admin');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sales`
--

CREATE TABLE `sales` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `buyer` int(11) NOT NULL,
  `totalprice` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sales_items`
--

CREATE TABLE `sales_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sale_id` int(11) NOT NULL,
  `videogame` int(11) NOT NULL,
  `nIntercambios` int(11) NOT NULL,
  `totalprice` int(11) DEFAULT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'en_biblioteca'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(55) NOT NULL,
  `name` varchar(55) DEFAULT NULL,
  `password` text DEFAULT NULL,
  `role` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `email`, `name`, `password`, `role`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin', 'admin', 2, '2025-11-08 19:30:14', '2025-11-08 19:30:14');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_profiles`
--

CREATE TABLE `user_profiles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(55) DEFAULT NULL,
  `phone` varchar(25) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `bio` text DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `videogames`
--

CREATE TABLE `videogames` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `genre_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `videogames`
--

INSERT INTO `videogames` (`id`, `genre_id`, `name`, `description`, `price`) VALUES
(1, 2, 'Overcooked 2', '¡Overcooked vuelve con un nuevo y caótico juego de cocina en acción! Regresa al Reino de la Cebolla y organiza tu equipo de chefs en un cooperativo clásico o en partidas en línea de hasta cuatro jugadores. Agarraos los delantales... es hora de salvar el mundo (¡otra vez!)', 10000),
(2, 1, 'The Last of Us™ Part I', 'Descubre el galardonado juego que inspiró la aclamada serie de televisión. Guía a Joel y Ellie en su travesía por una América posapocalíptica y encuentra aliados y enemigos inolvidables en The Last of Us™.', 50000),
(3, 4, 'Sid Meier’s Civilization® VI', 'Expande tu imperio, haz avanzar tu cultura y enfréntate a los mejores líderes de la historia. ¿Podrá tu civilización superar la prueba del tiempo? ', 44990),
(4, 1, 'Red Dead Redemption 2', 'Arthur Morgan y la banda de Van der Linde se ven obligados a huir. Con agentes federales y cazarrecompensas pisándoles los talones, la banda deberá atracar, robar y luchar para sobrevivir en su camino por el escabroso territorio.', 53990),
(5, 3, 'Battlefield™ 6', 'La experiencia bélica definitiva. En una guerra de tanques, cazas y gigantescos arsenales de combate, el arma más mortífera es tu patrulla.', 62990);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `videogame_images`
--

CREATE TABLE `videogame_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `videogame_id` int(11) NOT NULL,
  `image_path` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `videogame_images`
--

INSERT INTO `videogame_images` (`id`, `videogame_id`, `image_path`) VALUES
(1, 1, 'data/img/overcooked2-header.jpg'),
(2, 1, 'data/img/overcooked2-img-1.jpg'),
(3, 2, 'data/img/tlou-p1-header.jpg'),
(4, 2, 'data/img/tlou-p1-img-1.jpg'),
(5, 3, 'data/img/civ6-header.jpg'),
(6, 3, 'data/img/civ6-img1.jpg'),
(7, 4, 'data/img/rdr2-header.jpg'),
(8, 4, 'data/img/rdr2-img1.jpg'),
(9, 5, 'data/img/battlefield6-header.jpg'),
(10, 5, 'data/img/battlefield6-img1.jpg');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `genres`
--
ALTER TABLE `genres`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `library`
--
ALTER TABLE `library`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `offers`
--
ALTER TABLE `offers`
  ADD PRIMARY KEY (`idOferta`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sales_items`
--
ALTER TABLE `sales_items`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indices de la tabla `user_profiles`
--
ALTER TABLE `user_profiles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indices de la tabla `videogames`
--
ALTER TABLE `videogames`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `videogame_images`
--
ALTER TABLE `videogame_images`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `genres`
--
ALTER TABLE `genres`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `library`
--
ALTER TABLE `library`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `offers`
--
ALTER TABLE `offers`
  MODIFY `idOferta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `sales`
--
ALTER TABLE `sales`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `sales_items`
--
ALTER TABLE `sales_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `user_profiles`
--
ALTER TABLE `user_profiles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `videogames`
--
ALTER TABLE `videogames`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `videogame_images`
--
ALTER TABLE `videogame_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
