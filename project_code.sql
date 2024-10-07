-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 29, 2024 at 10:19 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `termproject`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `CategoryID` int(11) NOT NULL,
  `CategoryName` varchar(100) NOT NULL,
  `Description` text DEFAULT NULL,
  `TotalItems` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`CategoryID`, `CategoryName`, `Description`, `TotalItems`) VALUES
(1, 'Crossbody Bags', 'Stylish and functional crossbody bags for everyday use', 8),
(2, 'Tote Bags', 'Spacious and trendy tote bags', 10),
(3, 'Plushies', 'Cute and cuddly plush toys', 10),
(4, 'Coin Pouches', 'Convenient and cute coin pouches', 10),
(5, 'Backpacks', 'Durable and fashionable backpacks', 5),
(6, 'Keychains', 'Cute and adorable keychains', 6);

-- --------------------------------------------------------

--
-- Table structure for table `customeraccounts`
--

CREATE TABLE `customeraccounts` (
  `AccountID` int(11) NOT NULL,
  `UserName` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `DOB` date NOT NULL,
  `AccountCreationDate` date DEFAULT NULL,
  `AccountActivity` varchar(255) DEFAULT NULL,
  `TotalPurchase` decimal(10,2) DEFAULT NULL,
  `LoyaltyPoints` int(11) DEFAULT NULL,
  `NewsletterSubscription` varchar(10) DEFAULT NULL,
  `ApplicablePromotion` varchar(100) DEFAULT NULL,
  `CustomerID` int(11) DEFAULT NULL
) ;

--
-- Dumping data for table `customeraccounts`
--

INSERT INTO `customeraccounts` (`AccountID`, `UserName`, `Password`, `DOB`, `AccountCreationDate`, `AccountActivity`, `TotalPurchase`, `LoyaltyPoints`, `NewsletterSubscription`, `ApplicablePromotion`, `CustomerID`) VALUES
(1, 'john.doe', 'password123', '1985-05-15', '2024-01-01', 'Review product', 2500.00, 300, 'Yes', 'Mid-year Sale', 1),
(2, 'jane.nguyen', 'securepass', '1990-07-20', '2024-02-15', 'Share product', 1500.00, 150, 'No', 'Birthday Discount', 2),
(3, 'alice.wang', 'alicepass', '1988-03-22', '2024-03-10', 'Save product', 3500.00, 450, 'Yes', NULL, 3),
(4, 'crystal.huynh', 'crystal123', '1995-03-20', '2024-03-14', 'Share Product', 2000.00, 200, 'No', 'Birthday Discount', 4),
(5, 'peter.lee', 'peter456', '2000-04-24', '2024-06-22', 'Share Product', 3000.00, 300, 'Yes', 'Summer Sale', 5);

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `CustomerID` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Address` varchar(255) NOT NULL,
  `City` varchar(100) NOT NULL,
  `PostalCode` varchar(100) NOT NULL,
  `Country` varchar(100) NOT NULL,
  `PhoneNo` bigint(20) DEFAULT NULL,
  `referrerID` int(11) DEFAULT NULL
) ;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`CustomerID`, `Name`, `Email`, `Address`, `City`, `PostalCode`, `Country`, `PhoneNo`, `referrerID`) VALUES
(1, 'John Doe', 'john.doe@example.com', '123 Elm St', 'Springfield', '02310', 'USA', 1234567890, NULL),
(2, 'Jane Nguyen', 'jane.nguyen@example.com', '456 Pham Ngoc Thach St', 'HaNoi', 'V3I4X6', 'Vietnam', 2345678901, 1),
(3, 'Alice Wang', 'alice.wang@gmail.com', '36 Pine St', 'Guangzhou', '510832', 'China', 13724356598, 2),
(4, 'Crystal Huynh', 'crystal.huynh@gmail.com', '120 Hoan Kiem St', 'HaNoi', 'V5M6A8', 'Vietnam', 2346662020, 2),
(5, 'Peter Lee', 'peter.lee@gmail.com', '420 Hamilton St', 'Seattle', '08110', 'USA', 1238887220, 4);

-- --------------------------------------------------------

--
-- Table structure for table `orderdetails`
--

CREATE TABLE `orderdetails` (
  `OrderDetailID` int(15) NOT NULL,
  `OrderID` int(11) NOT NULL,
  `ProductID` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL CHECK (`Quantity` > 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orderdetails`
--

INSERT INTO `orderdetails` (`OrderDetailID`, `OrderID`, `ProductID`, `Quantity`) VALUES
(1, 1, 1, 1),
(2, 2, 3, 2),
(3, 3, 5, 1),
(4, 4, 2, 2),
(5, 5, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `OrderID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `OrderDate` date NOT NULL,
  `Total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`OrderID`, `CustomerID`, `OrderDate`, `Total`) VALUES
(1, 1, '2024-01-01', 75),
(2, 2, '2024-01-02', 30),
(3, 2, '2024-01-03', 150),
(4, 3, '2024-03-14', 60),
(5, 4, '2024-03-15', 40);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `ProductID` int(11) NOT NULL,
  `ProductName` varchar(100) NOT NULL,
  `CategoryID` int(11) NOT NULL,
  `Price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`ProductID`, `ProductName`, `CategoryID`, `Price`) VALUES
(1, 'Babie Bear Baguette Crossbody Bag', 1, 29.99),
(2, 'Shoku-pan Bear Tote Bag', 2, 24.99),
(3, 'Banada Fruits Sando Plushie', 3, 19.99),
(4, 'Melon-pan Coin Pouch', 4, 9.99),
(5, 'Bunny Cupcake Backpack', 5, 49.99),
(6, 'Pudding Lollipop Keychain', 6, 8.99);

-- --------------------------------------------------------

--
-- Table structure for table `shippings`
--

CREATE TABLE `shippings` (
  `ShippingID` int(11) NOT NULL,
  `OrderID` int(11) NOT NULL,
  `ProviderID` int(11) NOT NULL,
  `Cost` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `shippings`
--

INSERT INTO `shippings` (`ShippingID`, `OrderID`, `ProviderID`, `Cost`) VALUES
(1, 1, 1, 10.00),
(2, 2, 2, 35.00),
(3, 3, 2, 45.00),
(4, 4, 4, 50.00),
(5, 5, 5, 30.00);

-- --------------------------------------------------------

--
-- Table structure for table `transportation_providers`
--

CREATE TABLE `transportation_providers` (
  `ProviderID` int(11) NOT NULL,
  `ProviderName` varchar(100) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `PhoneNumber` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transportation_providers`
--

INSERT INTO `transportation_providers` (`ProviderID`, `ProviderName`, `Email`, `PhoneNumber`) VALUES
(1, 'CanadaPost', 'cp@canadapost.com', 9876543210),
(2, 'International', 'international@quickship.com', 9876543211),
(3, 'Backup', 'backup@reliabletrans.com', 9876543212),
(4, 'DHL', 'dhl@globalshipping.com', 9876543213),
(5, 'FedEx', 'fedex@homedelivery.com', 9876543214);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`CategoryID`),
  ADD UNIQUE KEY `CategoryName` (`CategoryName`);

--
-- Indexes for table `customeraccounts`
--
ALTER TABLE `customeraccounts`
  ADD PRIMARY KEY (`AccountID`),
  ADD UNIQUE KEY `UserName` (`UserName`),
  ADD UNIQUE KEY `CustomerID` (`CustomerID`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`CustomerID`),
  ADD UNIQUE KEY `Email` (`Email`),
  ADD UNIQUE KEY `PhoneNo` (`PhoneNo`),
  ADD KEY `fk_customers_referral` (`referrerID`);

--
-- Indexes for table `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD PRIMARY KEY (`OrderDetailID`),
  ADD KEY `fk_orders` (`OrderID`),
  ADD KEY `fk_products` (`ProductID`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`OrderID`),
  ADD KEY `fk_Orders_Customers` (`CustomerID`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`ProductID`),
  ADD UNIQUE KEY `ProductName` (`ProductName`),
  ADD KEY `fk_Categories` (`CategoryID`);

--
-- Indexes for table `shippings`
--
ALTER TABLE `shippings`
  ADD PRIMARY KEY (`ShippingID`),
  ADD UNIQUE KEY `OrderID` (`OrderID`),
  ADD KEY `fk_Providers_Shipping` (`ProviderID`);

--
-- Indexes for table `transportation_providers`
--
ALTER TABLE `transportation_providers`
  ADD PRIMARY KEY (`ProviderID`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `CategoryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `customeraccounts`
--
ALTER TABLE `customeraccounts`
  MODIFY `AccountID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orderdetails`
--
ALTER TABLE `orderdetails`
  MODIFY `OrderDetailID` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `OrderID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `ProductID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `shippings`
--
ALTER TABLE `shippings`
  MODIFY `ShippingID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `transportation_providers`
--
ALTER TABLE `transportation_providers`
  MODIFY `ProviderID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `customeraccounts`
--
ALTER TABLE `customeraccounts`
  ADD CONSTRAINT `account_belongs_1customer` FOREIGN KEY (`CustomerID`) REFERENCES `customers` (`CustomerID`);

--
-- Constraints for table `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `fk_customers_referral` FOREIGN KEY (`referrerID`) REFERENCES `customers` (`CustomerID`);

--
-- Constraints for table `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD CONSTRAINT `fk_orders` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`OrderID`),
  ADD CONSTRAINT `fk_products` FOREIGN KEY (`ProductID`) REFERENCES `products` (`ProductID`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `fk_Orders_Customers` FOREIGN KEY (`CustomerID`) REFERENCES `customers` (`CustomerID`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `fk_Categories` FOREIGN KEY (`CategoryID`) REFERENCES `categories` (`CategoryID`);

--
-- Constraints for table `shippings`
--
ALTER TABLE `shippings`
  ADD CONSTRAINT `fk_Orders_Shipping` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`OrderID`),
  ADD CONSTRAINT `fk_Providers_Shipping` FOREIGN KEY (`ProviderID`) REFERENCES `transportation_providers` (`ProviderID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
