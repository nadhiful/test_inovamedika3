-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 02, 2019 at 01:52 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `task`
--

-- --------------------------------------------------------

--
-- Table structure for table `shop_address`
--

CREATE TABLE `shop_address` (
  `id` int(11) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `street` varchar(255) NOT NULL,
  `zipcode` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `shop_address`
--

INSERT INTO `shop_address` (`id`, `firstname`, `lastname`, `street`, `zipcode`, `city`, `country`) VALUES
(1, 'Alpa', 'beta', 'Jalan Sunter', 'Kemang', 'Jakarta Selatan', 'Indonesia'),
(2, 'Alpa', 'beta', 'Jalan Sunter', 'Kemang', 'Jakarta Selatan', 'Indonesia'),
(3, 'Alpa', 'beta', 'Jalan Sunter', 'Kemang', 'Jakarta Selatan', 'Indonesia');

-- --------------------------------------------------------

--
-- Table structure for table `shop_category`
--

CREATE TABLE `shop_category` (
  `category_id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `title` varchar(45) NOT NULL,
  `description` text,
  `language` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `shop_category`
--

INSERT INTO `shop_category` (`category_id`, `parent_id`, `title`, `description`, `language`) VALUES
(1, 0, 'Baju', '', ''),
(2, 0, 'Sepatu', '', ''),
(3, 1, 'Celana', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `shop_customer`
--

CREATE TABLE `shop_customer` (
  `customer_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `address_id` int(11) NOT NULL,
  `delivery_address_id` int(11) NOT NULL,
  `billing_address_id` int(11) NOT NULL,
  `email` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `shop_customer`
--

INSERT INTO `shop_customer` (`customer_id`, `user_id`, `address_id`, `delivery_address_id`, `billing_address_id`, `email`) VALUES
(1, NULL, 0, 0, 0, 'alpa@gmail.com'),
(2, NULL, 1, 0, 0, 'alfa@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `shop_image`
--

CREATE TABLE `shop_image` (
  `id` int(11) NOT NULL,
  `title` varchar(45) NOT NULL,
  `filename` varchar(45) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `shop_image`
--

INSERT INTO `shop_image` (`id`, `title`, `filename`, `product_id`) VALUES
(5, 'Baju', 'Tulips.jpg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `shop_order`
--

CREATE TABLE `shop_order` (
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `delivery_address_id` int(11) NOT NULL,
  `billing_address_id` int(11) NOT NULL,
  `ordering_date` int(11) NOT NULL,
  `ordering_done` tinyint(1) DEFAULT NULL,
  `ordering_confirmed` tinyint(1) DEFAULT NULL,
  `payment_method` int(11) NOT NULL,
  `shipping_method` int(11) NOT NULL,
  `comment` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `shop_order`
--

INSERT INTO `shop_order` (`order_id`, `customer_id`, `delivery_address_id`, `billing_address_id`, `ordering_date`, `ordering_done`, `ordering_confirmed`, `payment_method`, `shipping_method`, `comment`) VALUES
(1, 2, 2, 3, 1575269715, NULL, NULL, 3, 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `shop_order_position`
--

CREATE TABLE `shop_order_position` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `specifications` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `shop_order_position`
--

INSERT INTO `shop_order_position` (`id`, `order_id`, `product_id`, `amount`, `specifications`) VALUES
(1, 1, 1, 1, '{\"5\":[\"1\"],\"1\":[\"6\"]}');

-- --------------------------------------------------------

--
-- Table structure for table `shop_payment_method`
--

CREATE TABLE `shop_payment_method` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text,
  `tax_id` int(11) NOT NULL,
  `price` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `shop_payment_method`
--

INSERT INTO `shop_payment_method` (`id`, `title`, `description`, `tax_id`, `price`) VALUES
(1, 'cash', 'You pay cash', 1, 0),
(2, 'advance Payment', 'You pay in advance, we deliver', 1, 0),
(3, 'cash on delivery', 'You pay when we deliver', 1, 0),
(4, 'invoice', 'We deliver and send a invoice', 1, 0),
(5, 'paypal', 'You pay by paypal', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `shop_products`
--

CREATE TABLE `shop_products` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `tax_id` int(11) NOT NULL,
  `title` varchar(45) NOT NULL,
  `description` text,
  `price` varchar(45) DEFAULT NULL,
  `language` varchar(45) DEFAULT NULL,
  `specifications` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `shop_products`
--

INSERT INTO `shop_products` (`product_id`, `category_id`, `tax_id`, `title`, `description`, `price`, `language`, `specifications`) VALUES
(1, 1, 1, 'Baju Batik', 'Baju batik lengan pendek', '5000', NULL, '{\"Size\":\"S,L,XL\",\"Color\":\"\",\"Some random attribute\":\"\",\"Material\":\"\",\"Specific number\":\"\"}');

-- --------------------------------------------------------

--
-- Table structure for table `shop_product_specification`
--

CREATE TABLE `shop_product_specification` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `is_user_input` tinyint(1) DEFAULT NULL,
  `required` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `shop_product_specification`
--

INSERT INTO `shop_product_specification` (`id`, `title`, `is_user_input`, `required`) VALUES
(1, 'Size', 0, 1),
(2, 'Color', 0, 0),
(3, 'Some random attribute', 0, 0),
(4, 'Material', 0, 1),
(5, 'Specific number', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `shop_product_variation`
--

CREATE TABLE `shop_product_variation` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `specification_id` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `price_adjustion` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `shop_product_variation`
--

INSERT INTO `shop_product_variation` (`id`, `product_id`, `specification_id`, `position`, `title`, `price_adjustion`) VALUES
(5, 1, 5, 1, 'please enter a number here', 0),
(6, 1, 1, 2, 'variation1', 3),
(7, 1, 1, 3, 'variation2', 6),
(8, 1, 2, 4, 'variation3', 9);

-- --------------------------------------------------------

--
-- Table structure for table `shop_shipping_method`
--

CREATE TABLE `shop_shipping_method` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text,
  `tax_id` int(11) NOT NULL,
  `price` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `shop_shipping_method`
--

INSERT INTO `shop_shipping_method` (`id`, `title`, `description`, `tax_id`, `price`) VALUES
(1, 'Delivery by postal Service', 'We deliver by Postal Service. 2.99 units of money are charged for that', 1, 2.99);

-- --------------------------------------------------------

--
-- Table structure for table `shop_tax`
--

CREATE TABLE `shop_tax` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `percent` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `shop_tax`
--

INSERT INTO `shop_tax` (`id`, `title`, `percent`) VALUES
(1, '19%', 19),
(2, '7%', 7);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `shop_address`
--
ALTER TABLE `shop_address`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shop_category`
--
ALTER TABLE `shop_category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `shop_customer`
--
ALTER TABLE `shop_customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `shop_image`
--
ALTER TABLE `shop_image`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_Image_Products` (`product_id`);

--
-- Indexes for table `shop_order`
--
ALTER TABLE `shop_order`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `fk_order_customer` (`customer_id`);

--
-- Indexes for table `shop_order_position`
--
ALTER TABLE `shop_order_position`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shop_payment_method`
--
ALTER TABLE `shop_payment_method`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shop_products`
--
ALTER TABLE `shop_products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `fk_products_category` (`category_id`);

--
-- Indexes for table `shop_product_specification`
--
ALTER TABLE `shop_product_specification`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shop_product_variation`
--
ALTER TABLE `shop_product_variation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shop_shipping_method`
--
ALTER TABLE `shop_shipping_method`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shop_tax`
--
ALTER TABLE `shop_tax`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `shop_address`
--
ALTER TABLE `shop_address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `shop_category`
--
ALTER TABLE `shop_category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `shop_customer`
--
ALTER TABLE `shop_customer`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `shop_image`
--
ALTER TABLE `shop_image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `shop_order`
--
ALTER TABLE `shop_order`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `shop_order_position`
--
ALTER TABLE `shop_order_position`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `shop_payment_method`
--
ALTER TABLE `shop_payment_method`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `shop_products`
--
ALTER TABLE `shop_products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `shop_product_specification`
--
ALTER TABLE `shop_product_specification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `shop_product_variation`
--
ALTER TABLE `shop_product_variation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `shop_shipping_method`
--
ALTER TABLE `shop_shipping_method`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `shop_tax`
--
ALTER TABLE `shop_tax`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `shop_image`
--
ALTER TABLE `shop_image`
  ADD CONSTRAINT `fk_Image_Products` FOREIGN KEY (`product_id`) REFERENCES `shop_products` (`product_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `shop_order`
--
ALTER TABLE `shop_order`
  ADD CONSTRAINT `fk_order_customer1` FOREIGN KEY (`customer_id`) REFERENCES `shop_customer` (`customer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `shop_products`
--
ALTER TABLE `shop_products`
  ADD CONSTRAINT `fk_products_category` FOREIGN KEY (`category_id`) REFERENCES `shop_category` (`category_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
