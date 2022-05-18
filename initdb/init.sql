CREATE DATABASE magentodb;
CREATE USER 'magento'@'localhost' IDENTIFIED BY '123456';
GRANT ALL ON magentdb.* TO 'magento'@'localhost' IDENTIFIED BY '123456' WITH GRANT OPTION;
