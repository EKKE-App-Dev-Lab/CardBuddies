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


