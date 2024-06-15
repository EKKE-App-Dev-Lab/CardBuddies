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
    `p_nat_name` varchar(30) NOT NULL,
    `p_nat_desc` text        NOT NULL
);

CREATE TABLE `product_nationality`
(
    `productID`  bigint(20) NOT NULL,
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
