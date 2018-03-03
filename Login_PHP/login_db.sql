/* create mysql database */
CREATE DATABASE miod_login;

/* Create a user with only SELECT, UPDATE and INSERT privileges. */
CREATE USER 'sec_user'@'localhost' IDENTIFIED WITH mysql_native_password AS 'nHgT6Kaw24';
GRANT SELECT, INSERT, UPDATE ON miod_login.* TO 'sec_user'@'localhost';

/* Create a the members table */
CREATE TABLE miod_login.members (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(30) NOT NULL,
    email VARCHAR(50) NOT NULL,
    password CHAR(128) NOT NULL
) ENGINE = InnoDB;
