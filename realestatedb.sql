CREATE TABLE ACCOUNT (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    username VARCHAR(100) NOT NULL UNIQUE,
    email VARCHAR(150) NOT NULL UNIQUE,
    phone_number VARCHAR(15) NOT NULL,
    password VARCHAR(255) NOT NULL
);

CREATE TABLE ESTATE (
    estate_id INT PRIMARY KEY AUTO_INCREMENT,
    type VARCHAR(50) NOT NULL,
    beds INT NOT NULL,
    baths INT NOT NULL,
    price DECIMAL(15, 2) NOT NULL,
    city VARCHAR(100) NOT NULL,
    image_link VARCHAR(150) NOT NULL,
    street VARCHAR(150),
    views INT DEFAULT 0,
    area DECIMAL(10, 2),
    description VARCHAR(2048),
    date_build DATE,
    owner_id INT,
    post_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (owner_id) REFERENCES ACCOUNT(id) ON DELETE CASCADE
);

CREATE TABLE FAVORITE (
    favorite_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    estate_id INT,
    FOREIGN KEY (user_id) REFERENCES ACCOUNT(id) ON DELETE CASCADE,
    FOREIGN KEY (estate_id) REFERENCES ESTATE(estate_id) ON DELETE CASCADE,
    UNIQUE (user_id, estate_id) 
);


