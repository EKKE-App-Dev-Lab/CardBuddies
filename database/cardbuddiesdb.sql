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

CREATE TABLE `types`
(
    `typeID`      bigint(20)  NOT NULL,
    `p_type_name` varchar(30) NOT NULL,
    `p_type_desc` text        NOT NULL
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

ALTER TABLE `types`
    ADD PRIMARY KEY (`typeID`);

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

ALTER TABLE `types`
    MODIFY `typeID` bigint(20) NOT NULL AUTO_INCREMENT,
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

ALTER TABLE `product_type`
    ADD CONSTRAINT `1_Product_Many_Types` FOREIGN KEY (`productID`) REFERENCES `products` (`productID`) ON DELETE CASCADE ON UPDATE CASCADE,
    ADD CONSTRAINT `1_Type_Many_Products` FOREIGN KEY (`typeID`) REFERENCES `types` (`typeID`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `transaction`
    ADD CONSTRAINT `1_Order_Many_Transactions` FOREIGN KEY (`orderID`) REFERENCES `userorder` (`orderID`) ON DELETE CASCADE ON UPDATE CASCADE,
    ADD CONSTRAINT `1_User_Many_Transactions` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `userorder`
    ADD CONSTRAINT `1_User_Many_Orders` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `cart`
    ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE;

INSERT INTO `products` (`jatekosnev`, `nemzetiseg`, `csapat`, `tamadopont`, `vedopont`, `leiras`, `allapot`, `ar`,
                        `kartyakep`)
VALUES ('Abdulkarim Hassan', 'Qatar', 'QAT', 85, 71, 'Fans\' Favourite', 'New', 230, 'ABDULKARIM HASSAN.jpg'),
       ('Achraf Hakimi', 'Morocco', 'MAR', 85, 63, 'Hero', 'New', 228, 'ACHRAF HAKIMI.jpg'),
       ('Ádám Nagy', 'Hungary', 'HUN', 54, 67, 'Experience', 'New', 40, 'ÁDÁM NAGY.jpg'),
       ('Alejandro Balde', 'Spain', 'ESP', 71, 80, 'Shining Star', 'New', 70, 'ALEJANDRO BALDE.jpg'),
       ('Alfredo Morales', 'Germany', 'GER', 51, 67, 'Mittelfeld', 'New', 45, 'ALFREDO MORALES.jpg'),
       ('Andreas Christensen', 'Denmark', 'DEN', 94, 83, 'Titan', 'New', 262, 'ANDREAS CHRISTENSEN.jpg'),
       ('Andrew Robertson', 'Scotland', 'SCO', 73, 84, 'Captain', 'New', 80, 'ANDREW ROBERTSON.jpg'),
       ('Augusto Batalla', 'Argentina', 'ARG', 84, 59, 'Team Mate', 'New', 65, 'AUGUSTO BATALLA.jpg'),
       ('Bryan Ruiz', 'Costa Rica', 'CRC', 68, 75, 'Experience', 'New', 75, 'BRYAN RUIZ.jpg'),
       ('Christian Eriksen', 'Denmark', 'DEN', 79, 60, 'Top Scorer', 'New', 70, 'CHRISTIAN ERIKSEN.jpg');

INSERT INTO `products` (`jatekosnev`, `nemzetiseg`, `csapat`, `tamadopont`, `vedopont`, `leiras`, `allapot`, `ar`,
                        `kartyakep`)
VALUES ('David Alaba', 'Austria', 'AUT', 70, 84, 'Captain', 'New', 80, 'DAVID ALABA.jpg'),
       ('Diego Biseswar', 'Suriname', 'PAOK', 70, 86, 'Limited Edition', 'New', 232, 'DIEGO BISESWAR.jpg'),
       ('Eden Hazard', 'Belgium', 'BEL', 90, 98, 'Game Changer', 'New', 282, 'EDEN HAZARD.jpg'),
       ('Éver Banega', 'Argentina', 'Valencia', 78, 79, 'Champions League', 'New', 80, 'ÉVER BANEGA.jpg'),
       ('Georginio Wijnaldum', 'Netherlands', 'NED', 77, 74, 'Experience', 'New', 65, 'GEORGINIO WIJNALDUM.jpg'),
       ('Giorgos Masouras', 'Greece', 'Olympiacos', 83, 95, 'Game Changer', 'New', 247, 'GIORGOS MASOURAS.jpg'),
       ('Goncalo Ramos', 'Portugal', 'POR', 78, 37, 'Debutant', 'New', 65, 'GONCALO RAMOS.jpg'),
       ('Harry Kane', 'England', 'ENG', 88, 55, 'Captain', 'New', 90, 'HARRY KANE.jpg'),
       ('Ivan Perisic', 'Croatia', 'Inter Milan', 76, 65, 'Team Mate', 'New', 225, 'IVAN PERISIC.jpg'),
       ('Jack Grealish', 'England', 'ENG', 81, 41, 'Playmaker', 'New', 75, 'JACK GREALISH.jpg');

INSERT INTO `products` (`jatekosnev`, `nemzetiseg`, `csapat`, `tamadopont`, `vedopont`, `leiras`, `allapot`, `ar`,
                        `kartyakep`)
VALUES ('João Félix', 'Portuguese', 'Atletico Madrid', 83, 42, 'STYLER', 'FOR', 8000000, 'JOÃO FÉLIX.jpg'),
       ('João Moutinho', 'Portuguese', 'Portugal', 65, 72, 'HERO', 'CORE', 82, 'JOÃO MOUTINHO.jpg'),
       ('Julian Brandt', 'German', 'Borussia Dortmund', 65, 74, 'TEAM MATE', 'CORE', 220, 'JULIAN BRANDT.jpg'),
       ('Juraj Kucka', 'Slovakian', 'Slovakia', 70, 73, 'EXPERIENCE', '', 5500000, 'JURAJ KUCKA.jpg'),
       ('Kasper Schmeichel', 'Danish', 'Denmark', 9, 75, 'MASTERCLASS', '', 6000000, 'KASPER SCHMEICHEL.jpg'),
       ('Kenny Miller', 'Scottish', 'Rangers', 50, 83, '', '', 0, 'KENNY MILLER.jpg'),
       ('Luís Figo', 'Portuguese', 'Portugal', 85, 72, 'LEGEND', '', 8500000, 'LUÍS FIGO.jpg'),
       ('Luka Modric', 'Croatian', 'Croatia', 72, 88, 'LIMITED EDITION', '', 0, 'LUKA MODRIC.jpg'),
       ('Marcelo Brozovic', 'Croatian', 'Croatia', 73, 79, 'MASTERCLASS', '', 7000000, 'MARCELO BROZOVIC.jpg'),
       ('Marcel Sabitzer', 'Austrian', 'Austria', 86, 0, 'LIMITED EDITION', '', 0, 'MARCEL SABITZER.jpg');

INSERT INTO products (jatekosnev, nemzetiseg, csapat, tamadopont, vedopont, leiras, allapot, ar, kartyakep)
VALUES ('Marcus Rashford', 'England', 'Manchester United', 82, 62, 'Team Mate', 75, 100, 'MARCUS_RASHFORD.jpg'),
       ('Mark Uth', 'Germany', 'Schalke 04', 81, 60, 'Team Mate', 70, 100, 'MARK_UTH.jpg'),
       ('Mason Greenwood', 'England', 'Manchester United', 80, 66, 'Team Mate', 71, 100, 'MASON_GREENWOOD.jpg'),
       ('Mathew Ryan', 'Australia', 'Unknown', 64, 64, 'Contender', 79, 100, 'MATHEW_RYAN.jpg'),
       ('Matija Nastasic', 'Serbia', 'Schalke 04', 82, 64, 'Team Mate', 59, 100, 'MATIJA_NASTASIC.jpg'),
       ('Memphis Depay', 'Netherlands', 'Netherlands', 80, 32, 'Top Scorer', 100, 100, 'MEMPHIS_DEPAY.jpg'),
       ('Miha Zajc', 'Slovenia', 'Unknown', 68, 63, 'Top Scorer', 100, 100, 'MIHA_ZAJC.jpg'),
       ('Moises Munoz', 'Mexico', 'Club America', 77, 65, 'Team Mate', 46, 100, 'MOISES_MUNOZ.jpg'),
       ('Pepe', 'Portugal', 'Portugal', 32, 76, 'Experience', 100, 100, 'PEPE.jpg'),
       ('Raphael Guerreiro', 'Portugal', 'Borussia Dortmund', 70, 76, 'Fans\' Favourite', 85, 100,
        'RAPHAEL_GUERREIRO.jpg');

INSERT INTO products (jatekosnev, nemzetiseg, csapat, tamadopont, vedopont, leiras, allapot, ar, kartyakep)
VALUES ('Rio Ferdinand', 'England', 'Manchester United', 89, 86, 'Champions League Card', 'New', 5000,
        'RIO_FERDINAND.jpg'),
       ('Robin van Persie', 'Netherlands', 'Netherlands National Team', 87, 41, 'Legend Card', 'New', 6000,
        'ROBIN_VAN_PERSIE.jpg'),
       ('Rodrigo de Paul', 'Argentina', 'Argentina National Team', 83, 87, 'Magician Card', 'New', 5500,
        'RODRIGO_DE_PAUL.jpg'),
       ('Roland Sallai', 'Hungary', 'Hungary National Team', 71, 54, 'Top Scorer Card', 'New', 4000,
        'ROLAND_SALLAI.jpg'),
       ('Rony Lopes', 'Portugal', 'Olympiacos', 79, 62, 'Team Mate Card', 'New', 4500, 'RONY_LOPES.jpg'),
       ('Sergei Parshivlyuk', 'Russia', 'Spartak Moskva', 76, 72, 'Champions League Card', 'New', 4200,
        'SERGEI_PARSHIVLYUK.jpg'),
       ('Stephen Eustáquio', 'Canada', 'Canada National Team', 62, 65, 'Hero Card', 'New', 3800,
        'STEPHEN_EUSTAQUIO.jpg'),
       ('Tarek Salman', 'Qatar', 'Qatar National Team', 75, 63, 'Hero Card', 'New', 4000, 'TAREK_SALMAN.jpg'),
       ('Tarik Tissoudali', 'Morocco', 'Morocco National Team', 64, 77, 'Hero Card', 'New', 4100,
        'TARIK_TISSOUDALI.jpg'),
       ('Thibaut Courtois', 'Belgium', 'Belgium National Team', 99, 93, 'Top Keeper Card', 'New', 7000,
        'THIBAUT_COURTOIS.jpg');

INSERT INTO products (jatekosnev, nemzetiseg, csapat, tamadopont, vedopont, leiras, allapot, ar, kartyakep)
VALUES
    ('Virgil van Dijk', 'Netherlands', 'Netherlands National Team', 69, 88, 'Captain Card', 'New', 6500, 'VIRGIL_VAN_DIJK.jpg'),
    ('Vladimír Coufal', 'Czech Republic', 'Czech Republic National Team', 43, 74, 'Experience Card', 'New', 5000, 'VLADIMIR_COUFAL.jpg'),
    ('Walid Abbas', 'UAE', 'UAE National Team', 77, 67, 'Contender Card', 'New', 4800, 'WALID_ABBAS.jpg'),
    ('Zeki Çelik', 'Turkey', 'Turkey National Team', 45, 74, 'Masterclass Card', 'New', 5200, 'ZEKI_CELIK.jpg');


COMMIT;
