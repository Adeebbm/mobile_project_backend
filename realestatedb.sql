CREATE TABLE ACCOUNT (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    username VARCHAR(100) NOT NULL UNIQUE,
    email VARCHAR(150) NOT NULL UNIQUE,
    phone_number VARCHAR(15) NOT NULL,
    city VARCHAR(100) NOT NULL,
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
    date_built DATE,
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

CREATE TABLE COORDINATES (
    coordinate_id INT AUTO_INCREMENT PRIMARY KEY,
    city VARCHAR(100) NOT NULL UNIQUE,
    X INT NOT NULL, 
    Y INT NOT NULL
);



INSERT INTO ACCOUNT (first_name, last_name, username, email, phone_number, city, password) 
VALUES
('John', 'Doe', 'johndoe', 'johndoe@gmail.com', '0320123456', 'Beirut', '$2y$10$o89uholYVGOcBZA13awyEuc1X19qYZONGZXziQacHtLFXJU8RaXku'),
('Jane', 'Smith', 'janesmith', 'janesmith@gmail.com', '0320765432', 'Tripoli', '$2y$10$o89uholYVGOcBZA13awyEuc1X19qYZONGZXziQacHtLFXJU8RaXku'),
('Ali', 'Hassan', 'alihassan', 'alihassan@yahoo.com', '0312345678', 'Sidon', '$2y$10$o89uholYVGOcBZA13awyEuc1X19qYZONGZXziQacHtLFXJU8RaXku'),
('Laila', 'Kassem', 'lailakassem', 'lailakassem@gmail.com', '0398765432', 'Byblos', '$2y$10$o89uholYVGOcBZA13awyEuc1X19qYZONGZXziQacHtLFXJU8RaXku'),
('George', 'Nasr', 'georgenasr', 'george.nasr@gmail.com', '0328765432', 'Zahle', '$2y$10$o89uholYVGOcBZA13awyEuc1X19qYZONGZXziQacHtLFXJU8RaXku'),
('Maya', 'Farah', 'mayafarah', 'maya.farah@gmail.com', '0376543210', 'Tyre', '$2y$10$o89uholYVGOcBZA13awyEuc1X19qYZONGZXziQacHtLFXJU8RaXku'),
('Hassan', 'Khalil', 'hassankhalil', 'hassan.khalil@hotmail.com', '0392837465', 'Batroun', '$2y$10$o89uholYVGOcBZA13awyEuc1X19qYZONGZXziQacHtLFXJU8RaXku'),
('Rania', 'Jaber', 'raniajaber', 'rania.jaber@gmail.com', '0312349876', 'Aley', '$2y$10$o89uholYVGOcBZA13awyEuc1X19qYZONGZXziQacHtLFXJU8RaXku'),
('Sami', 'Zein', 'samizein', 'sami.zein@yahoo.com', '0398765123', 'Jbeil', '$2y$10$o89uholYVGOcBZA13awyEuc1X19qYZONGZXziQacHtLFXJU8RaXku'),
('Lina', 'Moussa', 'linamoussa', 'lina.moussa@gmail.com', '0312345670', 'Baalbek', '$2y$10$o89uholYVGOcBZA13awyEuc1X19qYZONGZXziQacHtLFXJU8RaXku');



INSERT INTO ESTATE (type, beds, baths, price, city, image_link, street, area, description, date_built, owner_id)
VALUES
('house', 3, 2, 150000, 'Beirut', 'mobile_project_backend/images/house.png', 'Street 1, Beirut', 120.00, 
'This charming house is located in the heart of Beirut, offering easy access to the vibrant city life. With a spacious garden and a cozy interior, it’s perfect for a family looking for comfort and convenience. The home is just minutes away from shopping centers, schools, and cultural landmarks. The property features modern amenities and a tranquil atmosphere despite being in the busy city center.', '2022-01-15', 1),

('penthouse', 4, 3, 500000, 'Tripoli', 'mobile_project_backend/images/penthouse.jpg', 'Street 3, Tripoli', 200.00, 
'This luxurious penthouse offers breathtaking panoramic views of the Mediterranean coastline. It’s designed with high-end finishes, featuring an open-plan layout that maximizes natural light and space. Located in the prestigious area of Tripoli, this penthouse is perfect for those seeking elegance and privacy with modern comforts. It also comes with a private terrace, ideal for hosting gatherings or relaxing outdoors.', '2021-06-10', 2),

('villa', 5, 4, 750000, 'Sidon', 'mobile_project_backend/images/villa.jpg', 'Street 5, Sidon', 350.00, 
'Spacious and elegant, this villa offers a peaceful retreat in Sidon with its large garden and luxurious pool. The villa’s modern architecture blends with traditional Lebanese design elements, creating a warm and welcoming atmosphere. It features a high-end kitchen, spacious bedrooms, and a master suite with an en-suite bathroom. This home provides the perfect setting for families looking for tranquility and luxury living.', '2020-05-20', 3),

('apartment', 2, 1, 100000, 'Byblos', 'mobile_project_backend/images/apartment.png', 'Street 7, Byblos', 75.00, 
'This modern apartment is situated in the heart of Byblos, offering a stunning view of the Mediterranean Sea. With its sleek design, it boasts two cozy bedrooms, a fully equipped kitchen, and a spacious living area. The apartment’s large windows let in plenty of natural light, giving the space an airy, open feel. It’s the perfect home for anyone who wants to enjoy coastal living with easy access to restaurants, shops, and the beach.', '2022-07-30', 4),

('mansion', 8, 6, 1000000, 'Zahle', 'mobile_project_backend/images/mansion.jpg', 'Street 10, Zahle', 500.00, 
'This opulent mansion is located in the scenic town of Zahle, surrounded by vineyards and rolling hills. With 8 bedrooms, 6 bathrooms, and expansive living spaces, it offers unparalleled luxury and comfort. The estate features an indoor swimming pool, private theater room, and a fully equipped gym. The grounds are meticulously landscaped, offering plenty of space for outdoor entertaining and relaxation, making it the perfect choice for those seeking privacy and grandeur.', '2019-04-18', 5),

('house', 3, 2, 200000, 'Tyre', 'mobile_project_backend/images/house.png', 'Street 2, Tyre', 150.00, 
'This house in Tyre offers a rare combination of coastal living and urban convenience. It has 3 spacious bedrooms, 2 bathrooms, and an open-concept living area perfect for entertaining. The large garden is an ideal space for outdoor activities, and it features a relaxing patio area. Located just a short walk from the beach, this property offers the perfect balance of serenity and access to the vibrant cultural scene in Tyre.', '2020-07-22', 6),

('villa', 4, 3, 600000, 'Batroun', 'mobile_project_backend/images/villa.jpg', 'Street 3, Batroun', 300.00, 
'This stunning villa in Batroun combines modern luxury with breathtaking sea views. It features 4 spacious bedrooms, a private infinity pool, and large windows that let in natural light, offering panoramic views of the Mediterranean. The villa is designed for comfort and functionality, with an open-plan living space, a gourmet kitchen, and a spacious terrace for outdoor dining. It is the ideal retreat for those who value both elegance and privacy.', '2021-05-10', 7),

('apartment', 1, 1, 70000, 'Aley', 'mobile_project_backend/images/apartment.png', 'Street 4, Aley', 50.00, 
'This charming apartment in Aley offers a peaceful escape with stunning mountain views. It’s perfect for singles or couples looking for a cozy space. The apartment is fully furnished, with a well-equipped kitchen and a comfortable living area. It is located in a quiet neighborhood, yet within close proximity to cafes, shops, and public transportation, making it ideal for someone looking for a balanced lifestyle.', '2022-02-10', 8),

('mansion', 10, 8, 1500000, 'Jbeil', 'mobile_project_backend/images/mansion.jpg', 'Street 8, Jbeil', 800.00, 
'This grand mansion in Jbeil is a true masterpiece of design and architecture, offering over 10,000 square feet of living space. It boasts 10 bedrooms, 8 bathrooms, and luxurious common areas, including a ballroom and a library. The estate includes a private outdoor pool, tennis courts, and lush gardens perfect for hosting large gatherings or enjoying quiet moments of relaxation. Its location in the scenic hills of Jbeil ensures absolute privacy while still being close to the beach and town.', '2018-03-30', 9),

('house', 2, 1, 120000, 'Baalbek', 'mobile_project_backend/images/house.png', 'Street 6, Baalbek', 80.00, 
'This affordable house in Baalbek is perfect for small families or individuals. It offers two cozy bedrooms, a fully equipped kitchen, and a comfortable living room. The property has a manageable yard and is located in a peaceful neighborhood, providing a safe and quiet environment for its residents. It is an excellent choice for anyone looking for a starter home in one of Lebanon’s historic cities.', '2021-11-11', 10),

('house', 4, 3, 220000, 'Beirut', 'mobile_project_backend/images/house.png', 'Street 9, Beirut', 200.00, 
'This beautiful house in Beirut offers a blend of traditional and modern design, making it a perfect home for a family. The spacious garden is ideal for children to play, and the house comes with a fully equipped kitchen, high ceilings, and large windows that let in plenty of natural light. It is located in a desirable neighborhood with easy access to schools, parks, and the bustling city center.', '2022-08-01', 1),

('penthouse', 3, 2, 450000, 'Tripoli', 'mobile_project_backend/images/penthouse.jpg', 'Street 4, Tripoli', 190.00, 
'This exceptional penthouse in Tripoli features an open-plan design with panoramic views of the city and the Mediterranean Sea. It has 3 bedrooms and 2 bathrooms, making it ideal for small families or professionals. The penthouse is equipped with smart home technology and high-end finishes, including a gourmet kitchen and a luxurious master suite. Its rooftop terrace offers a private space for relaxation and outdoor entertainment.', '2021-07-10', 2),

('villa', 6, 5, 850000, 'Sidon', 'mobile_project_backend/images/villa.jpg', 'Street 2, Sidon', 450.00, 
'This expansive villa in Sidon is a perfect combination of luxury and comfort. With 6 bedrooms and 5 bathrooms, it offers ample space for larger families or those seeking extra room for guests. The villa features a state-of-the-art kitchen, an elegant living room, and a private swimming pool. The property is located in a quiet area with easy access to the beach and local attractions, making it an ideal choice for those who enjoy a luxurious lifestyle by the sea.', '2019-05-20', 3),

('apartment', 2, 1, 95000, 'Byblos', 'mobile_project_backend/images/apartment.png', 'Street 12, Byblos', 90.00, 
'This stylish apartment in Byblos is a modern living space offering 2 bedrooms and 1 bathroom, designed for those seeking both comfort and convenience. It has a spacious open-plan living area and is located in one of Lebanon’s most historic cities. The apartment’s location provides easy access to the beach, restaurants, and cultural sites. It’s perfect for individuals or couples who want to experience the charm of Byblos while living in a contemporary setting.', '2022-09-05', 4),

('mansion', 7, 5, 950000, 'Zahle', 'mobile_project_backend/images/mansion.jpg', 'Street 10, Zahle', 400.00, 
'This magnificent mansion in Zahle offers unparalleled luxury with its 7 bedrooms and 5 bathrooms, along with an expansive living area. The property boasts a grandiose design with classic Lebanese architectural elements, including marble floors and intricate woodwork. The estate is equipped with modern amenities such as a private gym, an indoor pool, and a sauna. The sprawling grounds include manicured gardens and a large outdoor', '2000-11-12', 2)

('house', 4, 3, 240000, 'Beirut','mobile_project_backend/images/house.png', 'Street 11, Beirut', 210.00, 
'Located in one of Beirut’s most sought-after neighborhoods, this house offers 4 spacious bedrooms and 3 bathrooms. The open-plan living space leads to a beautiful garden, providing a serene escape from the city hustle. The home is equipped with modern appliances and features a large kitchen and dining area, perfect for hosting family gatherings. This property is ideal for those seeking comfort and convenience in a vibrant urban setting.', '2020-03-12', 1),

('penthouse', 5, 4, 650000, 'Tripoli', 'mobile_project_backend/images/penthouse.jpg', 'Street 5, Tripoli', 250.00, 
'This luxurious penthouse in Tripoli offers 5 bedrooms and 4 bathrooms, with floor-to-ceiling windows that provide stunning views of the city and the sea. The open-plan living area is perfect for entertaining, while the gourmet kitchen is equipped with state-of-the-art appliances. The penthouse also includes a private rooftop garden and a jacuzzi, ideal for relaxing while enjoying the panoramic views.', '2021-10-15', 2),

('villa', 6, 5, 900000, 'Sidon', 'mobile_project_backend/images/villa.jpg', 'Street 4, Sidon', 380.00, 
'This gorgeous villa is situated in Sidon and features 6 bedrooms, 5 bathrooms, and a large outdoor area perfect for hosting parties and family events. The villa includes a high-end kitchen with a breakfast nook, a formal dining room, and a luxurious master suite. Outside, the property boasts a private pool, garden, and a shaded terrace, offering ample space for outdoor living and relaxation.', '2019-02-20', 3),

('apartment', 3, 2, 130000, 'Byblos', 'mobile_project_backend/images/apartment.png', 'Street 13, Byblos', 110.00, 
'This charming apartment in Byblos offers 3 bedrooms and 2 bathrooms, along with a cozy living space perfect for a small family. The apartment is located just minutes from the beach and the historic center of Byblos, giving easy access to shopping, dining, and entertainment. With a bright and airy design, this apartment features modern finishes and a lovely balcony to enjoy the coastal breeze.', '2021-06-01', 4),

('mansion', 9, 7, 1200000, 'Zahle', 'mobile_project_backend/images/mansion.jpg', 'Street 15, Zahle', 600.00, 
'This grand mansion in Zahle is a luxurious estate with 9 bedrooms and 7 bathrooms, designed with a blend of classic and modern features. The estate includes expansive living areas, a private indoor pool, and a home theater. The property is nestled in the hills of Zahle, offering peace and privacy while remaining close to the city center. Its lavish gardens and outdoor spaces make it ideal for entertaining guests or enjoying family gatherings in style.', '2018-11-10', 5),

('house', 3, 2, 180000, 'Tyre', 'mobile_project_backend/images/house.png', 'Street 8, Tyre', 160.00, 
'Located in a peaceful neighborhood in Tyre, this house features 3 bedrooms and 2 bathrooms, perfect for a small family. The property includes a beautiful garden and a cozy patio area, ideal for outdoor dining or relaxation. The home is designed with modern finishes and a fully equipped kitchen. Situated close to the beach, this house is perfect for those who enjoy coastal living and a quiet lifestyle.', '2021-12-15', 6),

('villa', 5, 4, 700000, 'Batroun', 'mobile_project_backend/images/villa.jpg', 'Street 9, Batroun', 300.00, 
'This villa in Batroun features 5 bedrooms and 4 bathrooms, with luxurious finishes and plenty of natural light. The spacious open-plan layout is ideal for family gatherings and includes a gourmet kitchen, large living room, and formal dining area. Outside, the villa offers a private pool and a spacious garden, making it perfect for hosting guests or enjoying leisure time with family. The property’s elevated position offers stunning views of the Mediterranean.', '2020-08-20', 7),

('apartment', 2, 1, 85000, 'Aley', 'mobile_project_backend/images/apartment.png', 'Street 7, Aley', 60.00, 
'This beautiful apartment in Aley offers 2 bedrooms and 1 bathroom, with an open-plan living area that is perfect for individuals or couples. The apartment features a modern kitchen, cozy living space, and large windows that bring in ample natural light. The location provides a serene mountain view while still being close to cafes, shops, and public transportation, offering the best of both worlds.', '2021-02-28', 8),

('mansion', 12, 10, 2000000, 'Jbeil', 'mobile_project_backend/images/mansion.jpg', 'Street 18, Jbeil', 1000.00, 
'This magnificent mansion in Jbeil is an unparalleled masterpiece with 12 bedrooms, 10 bathrooms, and over 10,000 square feet of living space. The estate features lavish common areas, including a grand ballroom, library, and entertainment rooms. With its private grounds, an outdoor pool, tennis court, and extensive gardens, it’s the ideal property for those who seek both luxury and privacy in one of Lebanon’s most beautiful regions.', '2017-05-22', 9),

('house', 4, 3, 250000, 'Baalbek', 'mobile_project_backend/images/house.png', 'Street 5, Baalbek', 190.00, 
'This house in Baalbek offers 4 bedrooms and 3 bathrooms, making it ideal for a growing family. The property includes a large backyard, perfect for outdoor activities or gardening. The home is designed with modern amenities and has a spacious living room and kitchen area. Located in a peaceful neighborhood, it’s also within easy reach of schools, parks, and local shops.', '2021-03-18', 10),

('penthouse', 3, 2, 400000, 'Tripoli', 'mobile_project_backend/images/penthouse.jpg', 'Street 2, Tripoli', 230.00, 
'This stunning penthouse in Tripoli offers 3 bedrooms, 2 bathrooms, and a spacious rooftop terrace with breathtaking views of the city and the Mediterranean Sea. It features an open-concept living area, a modern kitchen with high-end finishes, and large windows that let in plenty of natural light. The penthouse offers a luxurious living experience with access to a private elevator and 24/7 security.', '2020-12-05', 2),

('villa', 4, 3, 650000, 'Sidon', 'mobile_project_backend/images/villa.jpg', 'Street 3, Sidon', 340.00, 
'This charming villa in Sidon offers 4 bedrooms, 3 bathrooms, and a spacious open-plan living area. The property includes a large garden and a private pool, offering a perfect setting for family gatherings or relaxation. Located in a quiet, upscale neighborhood, the villa offers both comfort and luxury. Its proximity to the beach and local attractions makes it an ideal choice for anyone looking to enjoy coastal living in style.', '2019-04-14', 3),

('apartment', 2, 1, 95000, 'Byblos', 'mobile_project_backend/images/apartment.png', 'Street 11, Byblos', 85.00, 
'This stylish apartment in Byblos is located just a short walk from the beach and offers 2 bedrooms, 1 bathroom, and a comfortable living space. The apartment features an open-concept design with modern finishes and a fully equipped kitchen. The neighborhood is lively yet peaceful, with restaurants, cafes, and shops nearby. It’s an ideal place for young professionals or couples looking to live in one of Lebanon’s most historic cities.', '2021-08-25', 4),

('mansion', 10, 9, 1400000, 'Zahle', 'mobile_project_backend/images/mansion.jpg', 'Street 20, Zahle', 750.00, 
'This extraordinary mansion in Zahle offers 10 bedrooms, 9 bathrooms, and extensive living space that spans over 7,000 square feet. The estate includes a state-of-the-art home theater, a fitness center, and a wine cellar. The expansive outdoor area includes a private pool, tennis court, and beautifully landscaped gardens, ideal for relaxation or hosting events. This luxurious property is set in the scenic hills of Zahle, offering breathtaking views of the surrounding mountains and valleys.', '2018-10-15', 5),

('house', 5, 4, 270000, 'Tyre', 'mobile_project_backend/images/house.png', 'Street 10, Tyre', 210.00, 
'This spacious house in Tyre is perfect for large families, offering 5 bedrooms, 4 bathrooms, and a cozy yet modern living space. The home is designed with a fully equipped kitchen, a dining area, and an expansive living room. The large backyard provides plenty of space for outdoor activities, and the property is located close to the beach, offering easy access to Tyre’s historic attractions and vibrant local culture.', '2020-09-11', 6),

('villa', 7, 6, 950000, 'Batroun', 'mobile_project_backend/images/villa.jpg', 'Street 12, Batroun', 420.00, 
'This impressive villa in Batroun features 7 bedrooms and 6 bathrooms, offering ample space for large families or those who love to entertain. The property includes an indoor swimming pool, a spacious outdoor patio, and beautifully landscaped gardens. The villa’s design emphasizes open space and natural light, with a modern kitchen, large living areas, and high ceilings. Its location provides stunning views of the Mediterranean, making it an exceptional choice for anyone looking for a luxury home by the sea.', '2021-04-01', 7),

('apartment', 3, 2, 125000, 'Aley', 'mobile_project_backend/images/apartment.png', 'Street 6, Aley', 95.00, 
'This spacious 3-bedroom, 2-bathroom apartment in Aley offers stunning views of the mountains and city below. It features a bright and airy open-plan living area, a fully equipped kitchen, and generous bedrooms with plenty of natural light. The apartment is located in a quiet neighborhood, offering peace and tranquility while still being within reach of shops, cafes, and public transportation.', '2020-07-21', 8);








INSERT INTO FAVORITE (user_id, estate_id)
VALUES
(1, 1), (1, 2), (1, 3), (1, 4), (1, 5),
(2, 6), (2, 7), (2, 8), (2, 9), (2, 10),
(3, 11), (3, 12), (3, 13), (3, 14), (3, 15),
(4, 16), (4, 17), (4, 18), (4, 19), (4, 20),
(5, 21), (5, 22), (5, 23), (5, 24), (5, 25),
(6, 26), (6, 27), (6, 28), (6, 29), (6, 30),
(7, 1), (7, 2), (7, 3), (7, 4), (7, 5),
(8, 6), (8, 7), (8, 8), (8, 9), (8, 10),
(9, 11), (9, 12), (9, 13), (9, 14), (9, 15),
(10, 16), (10, 17), (10, 18), (10, 19), (10, 20);





INSERT INTO COORDINATES (city, X, Y)
VALUES
('Beirut', 33, 35),
('Tripoli', 34, 35),
('Sidon', 33, 35),
('Byblos', 34, 34),
('Zahle', 33, 34),
('Tyre', 32, 35),
('Batroun', 34, 34),
('Aley', 33, 33),
('Jbeil', 34, 34),
('Baalbek', 33, 36);



