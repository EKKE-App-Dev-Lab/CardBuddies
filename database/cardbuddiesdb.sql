drop database if exists `cardbuddiesdb`;
create database if not exists `cardbuddiesdb`;
use `cardbuddiesdb`;

CREATE TABLE `products`
(
    `productID`  bigint(20)   NOT NULL AUTO_INCREMENT,
    `jatekosnev` varchar(255) not null,
    `nemzetiseg` varchar(255) not null,
    `csapat`     varchar(255) not null,
    `tamadopont` int          not null,
    `vedopont`   int          not null,
    `leiras`     text         not null,
    `allapot`    varchar(255) not null,
    `ar`         int          not null,
    `kartyakep`  varchar(255) null,
    PRIMARY KEY (`productID`)
);


CREATE TABLE `nationality`
(
    `nationalityID` bigint(20)  NOT NULL,
    `p_nat_name`    varchar(30) NOT NULL,
    `p_nat_desc`    text        NOT NULL
);

ALTER TABLE `nationality`
    ADD CONSTRAINT unique_p_nat_name UNIQUE (`p_nat_name`);

CREATE TABLE `product_nationality`
(
    `productID`     bigint(20) NOT NULL,
    `nationalityID` bigint(20) NOT NULL
);

CREATE TABLE `product_type`
(
    `productID` bigint(20) NOT NULL,
    `typeID`    bigint(20) NOT NULL
);


CREATE TABLE `user`
(
    `userID`       bigint(20)   NOT NULL,
    `uname`        varchar(50)  NOT NULL,
    `pass`         varchar(100) NOT NULL,
    `fname`        varchar(50)  NOT NULL,
    `lname`        varchar(50)  NOT NULL,
    `email`        varchar(50)  NOT NULL,
    `address`      varchar(60)  NOT NULL,
    `phone`        varchar(8)   NOT NULL,
    `description`  text         NOT NULL,
    `vkey`         varchar(100) NOT NULL,
    `verified`     tinyint(1)   NOT NULL,
    `isSubscribed` tinyint(1)   NOT NULL,
    `isAdmin`      tinyint(1)   NOT NULL,
    `createDate`   timestamp    NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
);

CREATE TABLE `cart`
(
    `cartID` bigint(20) NOT NULL,
    `userID` bigint(20) NOT NULL
);

CREATE TABLE `cartitem`
(
    `cartItemID` bigint(20)  NOT NULL,
    `productID`  bigint(20)  NOT NULL,
    `cartID`     bigint(20)  NOT NULL,
    `price`      float       NOT NULL,
    `quantity`   smallint(6) NOT NULL,
    `createDate` timestamp   NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
);

CREATE TABLE `userorder`
(
    `orderID`    bigint(20)   NOT NULL,
    `userID`     bigint(20)   NOT NULL,
    `total`      float        NOT NULL,
    `address`    varchar(100) NOT NULL,
    `phone`      varchar(8)   NOT NULL,
    `status`     text         NOT NULL,
    `createDate` timestamp    NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
);

CREATE TABLE `orderitem`
(
    `orderItemID` bigint(20)  NOT NULL,
    `productID`   bigint(20)  NOT NULL,
    `orderID`     bigint(20)  NOT NULL,
    `price`       float       NOT NULL,
    `quantity`    smallint(6) NOT NULL,
    `createDate`  timestamp   NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
);

CREATE TABLE `transaction`
(
    `tranID`        bigint(20) NOT NULL,
    `userID`        bigint(20) NOT NULL,
    `orderID`       bigint(20) NOT NULL,
    `paymentMethod` text       NOT NULL,
    `status`        text       NOT NULL,
    `createDate`    timestamp  NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
);

ALTER TABLE `cart`
    ADD PRIMARY KEY (`cartID`),
    ADD KEY `userID` (`userID`);

ALTER TABLE `cartitem`
    ADD PRIMARY KEY (`cartItemID`),
    ADD KEY `1_Cart_Zero-Or-More_CartItems` (`cartID`),
    ADD KEY `1_Product_Many_CartItems` (`productID`);

ALTER TABLE `nationality`
    ADD PRIMARY KEY (`nationalityID`);

ALTER TABLE `orderitem`
    ADD PRIMARY KEY (`orderItemID`),
    ADD KEY `1_Order_Many_OrderItems` (`orderID`),
    ADD KEY `1_Product_Many_OrderItems` (`productID`);

ALTER TABLE `product_nationality`
    ADD KEY `1_Product_Many_Categories` (`productID`),
    ADD KEY `1_Category_Many_Products` (`nationalityID`);

ALTER TABLE `product_type`
    ADD KEY `1_Product_Many_Types` (`productID`),
    ADD KEY `1_Type_Many_Products` (`typeID`);

ALTER TABLE `transaction`
    ADD PRIMARY KEY (`tranID`),
    ADD KEY `1_Order_Many_Transactions` (`orderID`),
    ADD KEY `1_User_Many_Transactions` (`userID`);



ALTER TABLE `user`
    ADD PRIMARY KEY (`userID`);

ALTER TABLE `userorder`
    ADD PRIMARY KEY (`orderID`),
    ADD KEY `1_User_Many_Orders` (`userID`);

ALTER TABLE `cart`
    MODIFY `cartID` bigint(20) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 1;

ALTER TABLE `cartitem`
    MODIFY `cartItemID` bigint(20) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 1;

ALTER TABLE `nationality`
    MODIFY `nationalityID` bigint(20) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 1;

ALTER TABLE `orderitem`
    MODIFY `orderItemID` bigint(20) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 1;

ALTER TABLE `transaction`
    MODIFY `tranID` bigint(20) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 1;


ALTER TABLE `user`
    MODIFY `userID` bigint(20) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 1;

ALTER TABLE `userorder`
    MODIFY `orderID` bigint(20) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 1;

ALTER TABLE `cartitem`
    ADD CONSTRAINT `1_Cart_Zero-Or-More_CartItems` FOREIGN KEY (`cartID`) REFERENCES `cart` (`cartID`) ON DELETE CASCADE ON UPDATE CASCADE,
    ADD CONSTRAINT `1_Product_Many_CartItems` FOREIGN KEY (`productID`) REFERENCES `products` (`productID`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `orderitem`
    ADD CONSTRAINT `1_Order_Many_OrderItems` FOREIGN KEY (`orderID`) REFERENCES `userorder` (`orderID`) ON DELETE CASCADE ON UPDATE CASCADE,
    ADD CONSTRAINT `1_Product_Many_OrderItems` FOREIGN KEY (`productID`) REFERENCES `products` (`productID`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `product_nationality`
    ADD CONSTRAINT `1_Category_Many_Products` FOREIGN KEY (`nationalityID`) REFERENCES `nationality` (`nationalityID`) ON DELETE CASCADE ON UPDATE CASCADE,
    ADD CONSTRAINT `1_Product_Many_Categories` FOREIGN KEY (`productID`) REFERENCES `products` (`productID`) ON DELETE CASCADE ON UPDATE CASCADE;



ALTER TABLE `transaction`
    ADD CONSTRAINT `1_Order_Many_Transactions` FOREIGN KEY (`orderID`) REFERENCES `userorder` (`orderID`) ON DELETE CASCADE ON UPDATE CASCADE,
    ADD CONSTRAINT `1_User_Many_Transactions` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `userorder`
    ADD CONSTRAINT `1_User_Many_Orders` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `cart`
    ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE;

INSERT INTO `products` (`jatekosnev`, `nemzetiseg`, `csapat`, `tamadopont`, `vedopont`, `leiras`, `allapot`, `ar`,
                        `kartyakep`)
VALUES ('Abdulkarim Hassan', 'Qatar', 'QAT', 85, 71, 'Fans\' Favourite', 'New', 230,
        'Assets\\images\\products\\ABDULKARIM_HASSAN.jpg'),
       ('Achraf Hakimi', 'Morocco', 'MAR', 85, 63, 'Hero', 'New', 228, 'Assets\\images\\products\\ACHRAF_HAKIMI.jpg'),
       ('Ádám Nagy', 'Hungary', 'HUN', 54, 67, 'Experience', 'New', 1200, 'Assets\\images\\products\\ADAM_NAGY.jpg'),
       ('Alejandro Balde', 'Spain', 'ESP', 71, 80, 'Shining Star', 'New', 900,
        'Assets\\images\\products\\ALEJANDRO_BALDE.jpg'),
       ('Alfredo Morales', 'Germany', 'GER', 51, 67, 'Mittelfeld', 'New', 45,
        'Assets\\images\\products\\ALFREDO_MORALES.jpg'),
       ('Andreas Christensen', 'Denmark', 'DEN', 94, 83, 'Titan', 'New', 262,
        'Assets\\images\\products\\ANDREAS_CHRISTENSEN.jpg'),
       ('Andrew Robertson', 'Scotland', 'SCO', 73, 84, 'Captain', 'New', 80,
        'Assets\\images\\products\\ANDREW_ROBERTSON.jpg'),
       ('Augusto Batalla', 'Argentina', 'ARG', 84, 59, 'Team Mate', 'New', 65,
        'Assets\\images\\products\\AUGUSTO_BATALLA.jpg'),
       ('Bryan Ruiz', 'Costa Rica', 'CRC', 68, 75, 'Experience', 'New', 75, 'Assets\\images\\products\\BRYAN_RUIZ.jpg'),
       ('Christian Eriksen', 'Denmark', 'DEN', 79, 60, 'Top Scorer', 'New', 70,
        'Assets\\images\\products\\CHRISTIAN_ERIKSEN.jpg');

INSERT INTO `products` (`jatekosnev`, `nemzetiseg`, `csapat`, `tamadopont`, `vedopont`, `leiras`, `allapot`, `ar`,
                        `kartyakep`)
VALUES ('David Alaba', 'Austria', 'AUT', 70, 84, 'Captain', 'New', 80, 'Assets\\images\\products\\DAVID_ALABA.jpg'),
       ('Diego Biseswar', 'Suriname', 'PAOK', 70, 86, 'Limited Edition', 'New', 232,
        'Assets\\images\\products\\DIEGO_BISESWAR.jpg'),
       ('Eden Hazard', 'Belgium', 'BEL', 90, 98, 'Game Changer', 'New', 282, 'Assets\\images\\products\\EDEN_HAZARD.jpg'),
       ('Éver Banega', 'Argentina', 'Valencia', 78, 79, 'Champions League', 'New', 80,
        'Assets\\images\\products\\EVER_BANEGA.jpg'),
       ('Georginio Wijnaldum', 'Netherlands', 'NED', 77, 74, 'Experience', 'New', 65,
        'Assets\\images\\products\\GEORGINIO_WIJNALDUM.jpg'),
       ('Giorgos Masouras', 'Greece', 'Olympiacos', 83, 95, 'Game Changer', 'New', 247,
        'Assets\\images\\products\\GIORGOS_MASOURAS.jpg'),
       ('Goncalo Ramos', 'Portugal', 'POR', 78, 37, 'Debutant', 'New', 65, 'Assets\\images\\products\\GONCALO_RAMOS.jpg'),
       ('Harry Kane', 'England', 'ENG', 88, 55, 'Captain', 'New', 90, 'Assets\\images\\products\\HARRY_KANE.jpg'),
       ('Ivan Perisic', 'Croatia', 'Inter Milan', 76, 65, 'Team Mate', 'New', 225,
        'Assets\\images\\products\\IVAN_PERISIC.jpg'),
       ('Jack Grealish', 'England', 'ENG', 81, 41, 'Playmaker', 'New', 75, 'Assets\\images\\products\\JACK_GREALISH.jpg');

INSERT INTO `products` (`jatekosnev`, `nemzetiseg`, `csapat`, `tamadopont`, `vedopont`, `leiras`, `allapot`, `ar`,
                        `kartyakep`)
VALUES ('João Félix', 'Portuguese', 'Atletico Madrid', 83, 42, 'STYLER', 'FOR', 800,
        'Assets\\images\\products\\JOAO_FELIX.jpg'),
       ('João Moutinho', 'Portuguese', 'Portugal', 65, 72, 'HERO', 'CORE', 82,
        'Assets\\images\\products\\JOAO_MOUTINHO.jpg'),
       ('Julian Brandt', 'German', 'Borussia Dortmund', 65, 74, 'TEAM MATE', 'CORE', 220,
        'Assets\\images\\products\\JULIAN_BRANDT.jpg'),
       ('Juraj Kucka', 'Slovakian', 'Slovakia', 70, 73, 'EXPERIENCE', '', 550,
        'Assets\\images\\products\\JURAJ_KUCKA.jpg'),
       ('Kasper Schmeichel', 'Danish', 'Denmark', 9, 75, 'MASTERCLASS', '', 600,
        'Assets\\images\\products\\KASPER_SCHMEICHEL.jpg'),
       ('Kenny Miller', 'Scottish', 'Rangers', 50, 83, '', '', 0, 'Assets\\images\\products\\KENNY_MILLER.jpg'),
       ('Luís Figo', 'Portuguese', 'Portugal', 85, 72, 'LEGEND', '', 8500, 'Assets\\images\\products\\LUIS_FIGO.jpg'),
       ('Luka Modric', 'Croatian', 'Croatia', 72, 88, 'LIMITED EDITION', '', 250,
        'Assets\\images\\products\\LUKA_MODRIC.jpg'),
       ('Marcelo Brozovic', 'Croatian', 'Croatia', 73, 79, 'MASTERCLASS', '', 7000000,
        'Assets\\images\\products\\MARCELO_BROZOVIC.jpg'),
       ('Marcel Sabitzer', 'Austrian', 'Austria', 86, 0, 'LIMITED EDITION', '', 550,
        'Assets\\images\\products\\MARCEL_SABITZER.jpg');

INSERT INTO products (jatekosnev, nemzetiseg, csapat, tamadopont, vedopont, leiras, allapot, ar, kartyakep)
VALUES ('Marcus Rashford', 'England', 'Manchester United', 82, 62, 'Team Mate', 75, 100,
        'Assets\\images\\products\\MARCUS_RASHFORD.jpg'),
       ('Mark Uth', 'Germany', 'Schalke 04', 81, 60, 'Team Mate', 70, 100, 'Assets\\images\\products\\MARK_UTH.jpg'),
       ('Mason Greenwood', 'England', 'Manchester United', 80, 66, 'Team Mate', 71, 100,
        'Assets\\images\\products\\MASON_GREENWOOD.jpg'),
       ('Mathew Ryan', 'Australia', 'Unknown', 64, 64, 'Contender', 79, 100, 'Assets\\images\\products\\MATHEW_RYAN.jpg'),
       ('Matija Nastasic', 'Serbia', 'Schalke 04', 82, 64, 'Team Mate', 59, 100,
        'Assets\\images\\products\\MATIJA_NASTASIC.jpg'),
       ('Memphis Depay', 'Netherlands', 'Netherlands', 80, 32, 'Top Scorer', 100, 100,
        'Assets\\images\\products\\MEMPHIS_DEPAY.jpg'),
       ('Miha Zajc', 'Slovenia', 'Unknown', 68, 63, 'Top Scorer', 100, 100, 'Assets\\images\\products\\MIHA_ZAJC.jpg'),
       ('Moises Munoz', 'Mexico', 'Club America', 77, 65, 'Team Mate', 46, 100,
        'Assets\\images\\products\\MOISES_MUNOZ.jpg'),
       ('Pepe', 'Portugal', 'Portugal', 32, 76, 'Experience', 100, 100, 'Assets\\images\\products\\PEPE.jpg'),
       ('Raphael Guerreiro', 'Portugal', 'Borussia Dortmund', 70, 76, 'Fans\' Favourite', 85, 100,
        'Assets\\images\\products\\RAPHAEL_GUERREIRO.jpg');

INSERT INTO products (jatekosnev, nemzetiseg, csapat, tamadopont, vedopont, leiras, allapot, ar, kartyakep)
VALUES ('Rio Ferdinand', 'England', 'Manchester United', 89, 86, 'Champions League Card', 'New', 500,
        'Assets\\images\\products\\RIO_FERDINAND.jpg'),
       ('Robin van Persie', 'Netherlands', 'Netherlands National Team', 87, 41, 'Legend Card', 'New', 600,
        'Assets\\images\\products\\ROBIN_VAN_PERSIE.jpg'),
       ('Rodrigo de Paul', 'Argentina', 'Argentina National Team', 83, 87, 'Magician Card', 'New', 550,
        'Assets\\images\\products\\RODRIGO_DE_PAUL.jpg'),
       ('Roland Sallai', 'Hungary', 'Hungary National Team', 71, 54, 'Top Scorer Card', 'New', 400,
        'Assets\\images\\products\\ROLAND_SALLAI.jpg'),
       ('Rony Lopes', 'Portugal', 'Olympiacos', 79, 62, 'Team Mate Card', 'New', 450,
        'Assets\\images\\products\\RONY_LOPES.jpg'),
       ('Sergei Parshivlyuk', 'Russia', 'Spartak Moskva', 76, 72, 'Champions League Card', 'New', 420,
        'Assets\\images\\products\\SERGEI_PARSHIVLYUK.jpg'),
       ('Stephen Eustáquio', 'Canada', 'Canada National Team', 62, 65, 'Hero Card', 'New', 380,
        'Assets\\images\\products\\STEPHEN_EUSTAQUIO.jpg'),
       ('Tarek Salman', 'Qatar', 'Qatar National Team', 75, 63, 'Hero Card', 'New', 400,
        'Assets\\images\\products\\TAREK_SALMAN.jpg'),
       ('Tarik Tissoudali', 'Morocco', 'Morocco National Team', 64, 77, 'Hero Card', 'New', 410,
        'Assets\\images\\products\\TARIK_TISSOUDALI.jpg'),
       ('Thibaut Courtois', 'Belgium', 'Belgium National Team', 99, 93, 'Top Keeper Card', 'New', 700,
        'Assets\\images\\products\\THIBAUT_COURTOIS.jpg');

INSERT INTO products (jatekosnev, nemzetiseg, csapat, tamadopont, vedopont, leiras, allapot, ar, kartyakep)
VALUES ('Virgil van Dijk', 'Netherlands', 'Netherlands National Team', 69, 88, 'Captain Card', 'New', 650,
        'Assets\\images\\products\\VIRGIL_VAN_DIJK.jpg'),
       ('Vladimír Coufal', 'Czech Republic', 'Czech Republic National Team', 43, 74, 'Experience Card', 'New', 500,
        'Assets\\images\\products\\VLADIMIR_COUFAL.jpg'),
       ('Walid Abbas', 'UAE', 'UAE National Team', 77, 67, 'Contender Card', 'New', 480,
        'Assets\\images\\products\\WALID_ABBAS.jpg'),
       ('Zeki Çelik', 'Turkey', 'Turkey National Team', 45, 74, 'Masterclass Card', 'New', 520,
        'Assets\\images\\products\\ZEKI_CELIK.jpg');

INSERT INTO `nationality` (`p_nat_name`, `p_nat_desc`)
VALUES ('Qatar', 'Qatari National Team'),
       ('Morocco', 'Moroccan National Team'),
       ('Hungary', 'Hungarian National Team'),
       ('Spain', 'Spanish National Team'),
       ('Germany', 'German National Team'),
       ('Denmark', 'Danish National Team'),
       ('Scotland', 'Scottish National Team'),
       ('Argentina', 'Argentinian National Team'),
       ('Costa Rica', 'Costa Rican National Team');

INSERT INTO `nationality` (`p_nat_name`, `p_nat_desc`)
VALUES ('Austria', 'Austrian National Team'),
       ('Suriname', 'Surinamese National Team'),
       ('Belgium', 'Belgian National Team'),
       ('Netherlands', 'Dutch National Team'),
       ('Greece', 'Greek National Team'),
       ('Portugal', 'Portuguese National Team'),
       ('Croatia', 'Croatian National Team');

INSERT INTO `nationality` (`p_nat_name`, `p_nat_desc`)
VALUES ('Slovakian', 'Slovakian National Team');

INSERT INTO `nationality` (`nationalityID`, `p_nat_name`, `p_nat_desc`)
VALUES (19, 'England', 'English National Team'),
       (20, 'Australia', 'Australian National Team'),
       (21, 'Serbia', 'Serbian National Team'),
       (22, 'Slovenia', 'Slovenian National Team'),
       (23, 'Mexico', 'Mexican National Team');

-- Assuming the nationalityID values match the order of insertions above
INSERT INTO `product_nationality` (`productID`, `nationalityID`)
VALUES (1, 1), -- Abdulkarim Hassan - Qatar
       (2, 2), -- Achraf Hakimi - Morocco
       (3, 3), -- Ádám Nagy - Hungary
       (4, 4), -- Alejandro Balde - Spain
       (5, 5), -- Alfredo Morales - Germany
       (6, 6), -- Andreas Christensen - Denmark
       (7, 7), -- Andrew Robertson - Scotland
       (8, 8), -- Augusto Batalla - Argentina
       (9, 9), -- Bryan Ruiz - Costa Rica
       (10, 6);
-- Christian Eriksen - Denmark

-- Assuming the nationalityID values match the order of insertions above
INSERT INTO `product_nationality` (`productID`, `nationalityID`)
VALUES (11, 10), -- David Alaba - Austria
       (12, 11), -- Diego Biseswar - Suriname
       (13, 12), -- Eden Hazard - Belgium
       (14, 8),  -- Éver Banega - Argentina
       (15, 13), -- Georginio Wijnaldum - Netherlands
       (16, 14), -- Giorgos Masouras - Greece
       (17, 15), -- Goncalo Ramos - Portugal
       (18, 16), -- Harry Kane - England
       (19, 17), -- Ivan Perisic - Croatia
       (20, 16); -- Jack Grealish - England

INSERT INTO `product_nationality` (`productID`, `nationalityID`)
VALUES (21, 1),
       (22, 1),
       (23, 2),
       (24, 3),
       (25, 4),
       (26, 5),
       (27, 1),
       (28, 6),
       (29, 6),
       (30, 7);

INSERT INTO product_nationality (productID, nationalityID)
VALUES (31, 19), -- Marcus Rashford -> England
       (32, 5),  -- Mark Uth -> Germany
       (33, 19), -- Mason Greenwood -> England
       (34, 20), -- Mathew Ryan -> Australia
       (35, 21), -- Matija Nastasic -> Serbia
       (36, 13), -- Memphis Depay -> Netherlands
       (37, 22), -- Miha Zajc -> Slovenia
       (38, 23), -- Moises Munoz -> Mexico
       (39, 15), -- Pepe -> Portugal
       (40, 15); -- Raphael Guerreiro -> Portugal

INSERT INTO product_nationality (productID, nationalityID)
VALUES (41, 10), -- England
       (42, 5),  -- Netherlands
       (43, 4),  -- Argentina
       (44, 3),  -- Hungary
       (45, 7),  -- Portugal
       (46, 8),  -- Russia
       (47, 9),  -- Canada
       (48, 1),  -- Qatar
       (49, 2),  -- Morocco
       (50, 6); -- Belgium

INSERT INTO product_nationality (productID, nationalityID)
VALUES (51, 5),  -- Netherlands
       (52, 10), -- Czech Republic
       (53, 11), -- UAE
       (54, 12); -- Turkey

CREATE TABLE `types`
(
    `typeID`      bigint(20)  NOT NULL,
    `p_type_name` varchar(30) NOT NULL,
    `p_type_desc` text        NOT NULL
);

ALTER TABLE `types`
    ADD PRIMARY KEY (`typeID`);

ALTER TABLE `types`
    MODIFY `typeID` bigint(20) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 1;

ALTER TABLE `product_type`
    ADD CONSTRAINT `1_Product_Many_Types` FOREIGN KEY (`productID`) REFERENCES `products` (`productID`) ON DELETE CASCADE ON UPDATE CASCADE,
    ADD CONSTRAINT `1_Type_Many_Products` FOREIGN KEY (`typeID`) REFERENCES `types` (`typeID`) ON DELETE CASCADE ON UPDATE CASCADE;

INSERT INTO `types` (`typeID`, `p_type_name`, `p_type_desc`)
VALUES (1, 'új', 'az új kártyákat újként jelölik'),
       (2, 'kiemelt', 'a nagy érdeklődést kiváltó kártyákat kiemeltként jelölik'),
       (3, 'akciós', 'az akciós kártyákat akciósként jelölik'),
       (4, 'legjobb', 'a legjobban fogyó kártyákat legjobbként jelölik');

INSERT INTO `product_type` (`productID`, `typeID`)
VALUES (1, 2),
       (2, 2),
       (3, 2),
       (4, 2),
       (5, 2),
       (6, 2),
       (7, 1),
       (8, 1),
       (9, 1),
       (10, 1),
       (11, 1),
       (12, 1),
       (13, 2),
       (14, 2),
       (15, 2),
       (16, 2),
       (17, 2),
       (18, 2),
       (19, 2),
       (20, 2),
       (21, 2),
       (22, 2),
       (23, 2),
       (24, 2),
       (25, 2),
       (26, 2),
       (27, 2),
       (28, 2),
       (29, 2),
       (30, 2),
       (31, 2),
       (32, 2),
       (33, 2),
       (34, 2),
       (35, 2),
       (36, 2),
       (37, 2),
       (38, 2),
       (39, 2),
       (40, 2),
       (41, 2),
       (42, 2),
       (43, 2),
       (44, 2),
       (45, 2),
       (46, 2),
       (47, 2),
       (48, 2),
       (49, 2),
       (50, 2),
       (51, 2),
       (52, 2),
       (53, 2),
       (54, 2);


COMMIT;
