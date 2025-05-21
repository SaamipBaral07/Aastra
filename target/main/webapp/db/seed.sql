-- Insert initial users
INSERT INTO `users` (`username`, `email`, `password`, `role`) VALUES
('adminuser', 'admin@example.com', 'hashedpassword1', 'admin'),
('johndoe', 'john@example.com', 'hashedpassword2', 'customer');

-- Insert initial categories
INSERT INTO `categories` (`name`) VALUES
('Men'), ('Women'), ('Kids');

-- Insert initial products
INSERT INTO `products` (`name`, `description`, `price`, `stock`, `category_id`) VALUES
('Men T-Shirt', 'Cotton t-shirt', 19.99, 100, 1),
('Women Dress', 'Summer floral dress', 39.99, 50, 2),
('Kids Jacket', 'Winter jacket for kids', 29.99, 75, 3);

-- Insert product images
INSERT INTO `product_images` (`product_id`, `image_url`) VALUES
(1, 'images/men_tshirt.jpg'),
(2, 'images/women_dress.jpg'),
(3, 'images/kids_jacket.jpg');

-- Insert cart items
INSERT INTO `cart` (`user_id`, `product_id`, `quantity`) VALUES
(2, 1, 2),
(2, 3, 1);

-- Insert orders
INSERT INTO `orders` (`user_id`, `status`, `total_amount`) VALUES
(2, 'pending', 69.97);

-- Insert order items
INSERT INTO `order_items` (`order_id`, `product_id`, `quantity`, `unit_price`) VALUES
(1, 1, 2, 19.99),
(1, 3, 1, 29.99);

-- Insert product reviews
INSERT INTO `reviews` (`user_id`, `product_id`, `rating`, `comment`) VALUES
(2, 1, 4, 'Great quality t-shirt'),
(2, 3, 5, 'Very warm and comfortable');