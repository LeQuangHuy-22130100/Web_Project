DROP DATABASE sofadata ;
CREATE DATABASE SofaData CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE SofaData;

-- 1. Bảng users_table (Khớp userDAO.java)
CREATE TABLE users_table (
                             id INT AUTO_INCREMENT PRIMARY KEY,
                             Name VARCHAR(255) NOT NULL,      -- DAO dùng Name để login/checkUser
                             Password VARCHAR(255) NOT NULL,
                             isAdmin INT DEFAULT 0,
                             isClient INT DEFAULT 1,
                             Email VARCHAR(255)
);

-- 2. Bảng categories (Khớp categoriesDAO.java)
CREATE TABLE categories (
                            CategoryID INT AUTO_INCREMENT PRIMARY KEY,
                            Name VARCHAR(255) NOT NULL
);

-- 3. Bảng sizes (Khớp SizeDao.java)
CREATE TABLE sizes (
                       SizeID INT AUTO_INCREMENT PRIMARY KEY,
                       Size VARCHAR(50) NOT NULL
);

-- 4. Bảng price_range (Khớp PriceRangeDAO.java)
CREATE TABLE price_range (
                             priceID INT AUTO_INCREMENT PRIMARY KEY,
                             priceMin VARCHAR(50),
                             priceMax VARCHAR(50)
);

-- 5. Bảng showroom (Khớp ShowRoomDAO.java)
CREATE TABLE showroom (
                          id INT AUTO_INCREMENT PRIMARY KEY,
                          name VARCHAR(255),
                          address VARCHAR(255),
                          hotline VARCHAR(50),
                          description TEXT,
                          image VARCHAR(255)
);
-- 6. Bảng Sản phẩm (Product.java)
CREATE TABLE product (
                         ProductID INT AUTO_INCREMENT PRIMARY KEY,
                         CategoryID INT,
                         SizeID INT,
                         PriceID INT,
                         Name VARCHAR(255) NOT NULL,
                         Image VARCHAR(255),
                         Price DOUBLE,
                         Description TEXT,
                         Stock INT,
                         Matarial VARCHAR(255),
                         FOREIGN KEY (CategoryID) REFERENCES categories(CategoryID),
                         FOREIGN KEY (SizeID) REFERENCES sizes(SizeID),
                         FOREIGN KEY (PriceID) REFERENCES price_range(priceID)
);

-- 7. Bảng orders (Khớp OrderDAO.java)
CREATE TABLE orders (
                        order_id INT AUTO_INCREMENT PRIMARY KEY,
                        user_id INT,
                        order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
                        status VARCHAR(50),
                        total_amount DOUBLE,
                        FOREIGN KEY (user_id) REFERENCES users_table(id)
);

-- 8. Bảng order_details (Khớp OrderDetailDAO.java)
CREATE TABLE order_details (
                               order_detail_id INT AUTO_INCREMENT PRIMARY KEY,
                               order_id INT,
                               product_id INT,
                               quantity DOUBLE,
                               price DOUBLE,
                               guarantee VARCHAR(255),
                               FOREIGN KEY (order_id) REFERENCES orders(order_id),
                               FOREIGN KEY (product_id) REFERENCES product(ProductID)
);

-- 9. Bảng Giỏ hàng (cartShopping.java)
CREATE TABLE IF NOT EXISTS cart_shopping (
                                             cartId INT PRIMARY KEY AUTO_INCREMENT,
                                             productID INT,
                                             userID INT,
                                             quanlity DOUBLE,
                                             name VARCHAR(255),
    image VARCHAR(255),
    FOREIGN KEY (productID) REFERENCES product(ProductID) ON DELETE CASCADE,
    FOREIGN KEY (userID) REFERENCES users_table(id) ON DELETE CASCADE
    );

-- 10. Bảng Đánh giá (review.java)
CREATE TABLE IF NOT EXISTS reviews (
                                       reviewId INT PRIMARY KEY AUTO_INCREMENT,
                                       productID INT,
                                       userID INT,
                                       comments TEXT,
                                       date DATETIME DEFAULT CURRENT_TIMESTAMP,
                                       FOREIGN KEY (productID) REFERENCES product(ProductID) ON DELETE CASCADE,
    FOREIGN KEY (userID) REFERENCES users_table(id) ON DELETE CASCADE
    );