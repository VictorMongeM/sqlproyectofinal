CREATE USER proyectobd_user@localhost IDENTIFIED BY 'pr0y3ct0bd';
GRANT ALL ON proyectobd.* TO proyectobd_user@localhost;
SHOW GRANTS FOR proyectobd_user@localhost;
