use EcomDB;
create role read_only;
create role 'app_write';
GRANT SELECT ON ecomdb.* TO read_only;
GRANT INSERT, UPDATE, DELETE ON ecomdb.* TO 'app_write';
CREATE USER 'readonly_user'@'localhost' IDENTIFIED BY 'password123';
CREATE USER 'app_write'@'localhost' IDENTIFIED BY 'password123';

GRANT read_only TO 'readonly_user'@'localhost';
GRANT 'app_write' TO 'app_write'@'localhost';

SET DEFAULT ROLE read_only TO 'readonly_user'@'localhost';
SET DEFAULT ROLE 'app_write' TO 'app_write'@'localhost'