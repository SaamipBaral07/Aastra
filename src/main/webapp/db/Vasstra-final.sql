-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 22, 2025 at 09:06 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `vaastra-1`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cart_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`cart_id`, `user_id`, `product_id`, `quantity`) VALUES
(52, 1, 6, 1),
(53, 6, 8, 30);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `name`) VALUES
(1, 'Men'),
(2, 'Women'),
(3, 'Kids');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `order_date` datetime DEFAULT current_timestamp(),
  `status` varchar(50) NOT NULL,
  `total_amount` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `user_id`, `order_date`, `status`, `total_amount`) VALUES
(12, 6, '2025-05-21 23:05:21', 'Pending', 990.00),
(13, 2, '2025-05-21 23:06:13', 'Pending', 470.00),
(14, 2, '2025-05-21 23:06:41', 'Pending', 770.00),
(15, 4, '2025-05-21 23:09:33', 'Pending', 615.00),
(16, 6, '2025-05-22 11:30:33', 'Delivered', 1510.00),
(17, 6, '2025-05-22 11:31:07', 'Delivered', 1750.00),
(18, 2, '2025-05-22 12:15:59', 'Pending', 85.00);

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `order_item_id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `unit_price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`order_item_id`, `order_id`, `product_id`, `quantity`, `unit_price`) VALUES
(17, 12, 7, 6, 40.00),
(18, 12, 2, 15, 50.00),
(19, 13, 6, 5, 30.00),
(20, 13, 11, 8, 40.00),
(21, 14, 10, 10, 50.00),
(22, 14, 14, 9, 30.00),
(23, 15, 22, 5, 23.00),
(24, 15, 8, 10, 50.00),
(25, 16, 5, 10, 100.00),
(26, 16, 4, 9, 50.00),
(27, 16, 14, 2, 30.00),
(28, 17, 16, 5, 50.00),
(29, 17, 9, 50, 30.00),
(30, 18, 1, 1, 25.00),
(31, 18, 6, 2, 30.00);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `stock` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `name`, `description`, `price`, `stock`, `category_id`) VALUES
(1, 'White Polo T-Shirt', 'Cotton t-shirt', 25.00, 74, 1),
(2, 'Women Tank Top', 'Summer floral dress', 50.00, 25, 2),
(3, 'Kids Hoodie', 'Unisex Hoodies', 40.00, 0, 3),
(4, 'Women T-Shirts', 'Plain T-Shirt', 50.00, 60, 2),
(5, 'Men\'s Leather Jacket', 'Pure Leather', 100.00, 10, 1),
(6, 'Kids Uniform', 'School Uniform for Summer', 30.00, 83, 3),
(7, 'Women Ruffle Shirt', 'Sleeve Shirts-Casual WorkWear', 40.00, 44, 2),
(8, 'Mens Hawaiian Shirts', 'Summer Floral Shirt ', 50.00, 30, 1),
(9, 'Kids Tracksuit', 'Unisex Hoodies with Joggers', 30.00, 50, 3),
(10, 'Women Wide Leg Trousers', ' Winter Baggy Jeans', 50.00, 20, 2),
(11, 'Men\'s Warm Up Top', 'Breathable Zip Up Top ', 40.00, 182, 1),
(12, 'Girls Night Dress', 'Nightgown Sleepwear Nightie', 15.00, 80, 3),
(13, 'Trench Coat ', 'New khaki three-dimensional Pocket Belt Women\'s Trench coat ', 30.00, 15, 2),
(14, 'Satin Sleepwear ', '2Pcs set Women Sleepwear Satin sleeveless Draped Neck ', 30.00, 8, 2),
(15, 'Ruffle mini-skirt ', 'Women mini-skirt Ruffle trim for summer', 45.00, 10, 2),
(16, 'Backless mini-dress', 'Double layered backless mini dress women ', 50.00, 15, 2),
(17, 'Bodycon', 'Romantic Ditsy floral Strap Backless Long Mermaid Hem Dress', 54.00, 25, 2),
(18, 'Men\'s hoodie ', 'Men\'s Basic Printed Draw-String Hoodie Sweatshirt, Casual for Daily wear, Autumn', 30.00, 50, 1),
(19, 'Men\'s Suit ', 'Formal Men\'s Slim fit suit Jacket, Business Casual Commuter Blazer with pocket ', 45.00, 26, 1),
(20, 'Summer shorts', 'Men\'s fashion Street Drawstring work shorts, Street shorts', 45.00, 26, 1),
(21, 'Men\'s Basic Sleepwear', 'Letter print short sleeve Top and Plaid shorts Loungewear Set ', 26.00, 50, 1),
(22, 'Summer Vest ', 'Men\'s casual seagull Print Round Neck Vest Top ', 23.00, 7, 1),
(23, 'coord set ', 'Casual minimalist short sleeve shorts 2pcs set, suitable for summer girls', 20.00, 30, 3),
(24, 'Princess Dress', 'Girls Elegant solid color Jacquard Texture Cap Sleeve Ruffle Collar High Waist A line Princess ', 56.00, 25, 3),
(25, 'Boy suit ', 'New Gentle man Suit Set children\'s Shirt Vest Bow tie Pants 4-piece Set ', 56.00, 25, 3),
(26, 'Girls sleep wear', 'Young girl cute Pattern casual slim fit short sleeve t-shirt and loose long pants', 20.00, 36, 3),
(27, 'leather bomber jacket ', 'Young Boy PU Leather Bomber Jacket', 45.00, 12, 3);

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `image_id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `image_url` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`image_id`, `product_id`, `image_url`) VALUES
(1, 1, 'home/images/clothing11.jpg'),
(2, 2, 'home/images/women.jpg'),
(3, 3, 'home/images/kidsy.avif'),
(4, 4, 'home/images/top3.webp'),
(5, 5, 'home/images/leather1.jpg'),
(6, 1, 'home/images/men-polo2.jpg'),
(7, 1, 'home/images/men-polo3.jpg'),
(8, 2, 'home/images/tanktop-2.jpg'),
(9, 2, 'home/images/tanktop-3.jpg'),
(10, 3, 'home/images/kids_hoodie2.jpg'),
(11, 3, 'home/images/kids_hoodie3.jpg'),
(12, 4, 'home/images/woman-tee2.jpg'),
(13, 4, 'home/images/woman-tee3.jpg'),
(14, 5, 'home/images/leather2.jpg'),
(15, 5, 'home/images/leather3.jpg'),
(16, 6, 'home/images/school1.jpg'),
(17, 6, 'home/images/school2.jpg'),
(18, 6, 'home/images/school3.jpg'),
(19, 7, 'home/images/wshirt1.jpg'),
(20, 7, 'home/images/wshirt2.jpg'),
(21, 7, 'home/images/wshirt3.jpg'),
(22, 8, 'home/images/hawai1.jpg'),
(23, 8, 'home/images/hawai2.jpg'),
(24, 8, 'home/images/hawai3.jpg'),
(25, 9, 'home/images/track.jpg'),
(26, 9, 'home/images/track2.jpg'),
(27, 9, 'home/images/track3.jpg'),
(28, 10, 'home/images/wjeans.jpg'),
(29, 10, 'home/images/wjeans2.jpg'),
(30, 10, 'home/images/wjeans3.jpg'),
(31, 11, 'home/images/warmup1.jpg'),
(32, 11, 'home/images/warmup2.jpg'),
(33, 11, 'home/images/warmup3.jpg'),
(34, 12, 'home/images/gown1.jpg'),
(35, 12, 'home/images/gown2.jpg'),
(36, 12, 'home/images/gown3.jpg'),
(37, 13, 'home/images/Women-trench-coat-beige.png\r\n'),
(38, 13, 'home/images/Women-Trench-coat-Black.png\n'),
(39, 13, 'home/images/Women-trench-coat-navyblue.png\r\n'),
(40, 14, 'home/images/Women-Sleepwear-black.png\r\n'),
(41, 14, 'home/images/Women-Sleepwear-navyblue.png\r\n'),
(42, 14, 'home/images/Women-Sleepwear-pink.png\r\n'),
(43, 15, 'home/images/mini-skirt-dustypink.png\r\n'),
(44, 15, 'home/images/mini-skirt-mintgreen.png\r\n'),
(45, 15, 'home/images/mini-skirt-navyblue.png\r\n'),
(46, 16, 'home/images/mini-dress-white.png'),
(47, 16, 'home/images/mini-skirt-black.png'),
(48, 16, 'home/images/mini-dress-black.png'),
(49, 17, 'home/images/bodycon-multicolor.png'),
(50, 17, 'home/images/bodycon-orange.png'),
(51, 17, 'home/images/bodycon-white.png'),
(69, 18, 'home/images/hoodie-black.png'),
(70, 18, 'home/images/hoodie-grey.png'),
(71, 18, 'home/images/hoodie-red.png'),
(72, 19, 'home/images/suit-beige.png'),
(73, 19, 'home/images/suit-armygreen.png'),
(74, 19, 'home/images/suit-darkgrey.png'),
(75, 20, 'home/images/Men\'s shorts brown.png'),
(76, 20, 'home/images/Men\'s shorts dark grey.png'),
(77, 20, 'home/images/Men\'s shorts grey.png'),
(78, 21, 'home/images/sleepwear_black.png'),
(79, 21, 'home/images/sleepwear_darkgreen.png'),
(80, 21, 'home/images/sleepwear_navyblue.png'),
(81, 22, 'home/images/vest green-black.png'),
(82, 22, 'home/images/vest army green.png'),
(83, 22, 'home/images/vest navyblue.png'),
(84, 23, 'home/images/co-ord set black.png'),
(85, 23, 'home/images/co-ord set-pink.png'),
(86, 23, 'home/images/co-ord set purple.png'),
(87, 24, 'home/images/Princess dress-black.png'),
(88, 24, 'home/images/princess dress-pink.png'),
(89, 24, 'home/images/princess dress-purple.png'),
(90, 25, 'home/images/suit set-babyblue.png'),
(91, 25, 'home/images/suit set-black.png'),
(92, 25, 'home/images/suit set-navyblue.png'),
(93, 26, 'home/images/sleepwear-beige.png'),
(94, 26, 'home/images/sleepwear-pink.png'),
(95, 26, 'home/images/sleepwear-purple.png'),
(96, 27, 'home/images/kids leather jacket-beige.png'),
(97, 27, 'home/images/kids leather jacket-black.png'),
(98, 27, 'home/images/kids leather jacket-brown.png');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','customer') NOT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `email`, `password`, `role`, `created_at`) VALUES
(1, 'adminuser', 'admin@example.com', '3g/lfhlpRHWVva39yqltKA==', 'admin', '2025-05-11 14:53:28'),
(2, 'johndoe', 'john@example.com', '3g/lfhlpRHWVva39yqltKA==', 'customer', '2025-05-11 14:53:28'),
(3, 'Vladmir Putin', 'putin@gmail.com', '123', 'customer', '2025-05-13 15:02:47'),
(4, 'Melon Musk', 'melon@example.com', 'l8Z3BnnIwgQj1Kn18kBIZw==', 'customer', '2025-05-13 15:02:47'),
(5, 'Admin Cool', 'admincool@vaastra.com', '123', 'admin', '2025-05-13 15:04:20'),
(6, 'Magnus Carlsen', 'magnus@gmail.com', '3g/lfhlpRHWVva39yqltKA==', 'customer', '2025-05-13 15:04:20'),
(7, 'Hikaru09', 'hikarubishop@yahoo.com', 'nakamura', 'customer', '2025-05-20 22:23:27'),
(8, 'BobbyFisher', 'bobby@hotmail.com', '123', 'customer', '2025-05-20 22:23:27'),
(9, 'Glen', 'maxwell@email.com', 'FCqj5UNJl/sGXOkIUJ+jww==', 'customer', '2025-05-22 01:43:42');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`order_item_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`image_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `order_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `image_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`) ON DELETE SET NULL;

--
-- Constraints for table `product_images`
--
ALTER TABLE `product_images`
  ADD CONSTRAINT `product_images_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
