-- Table: users
CREATE TABLE users (
                       id int not null auto_increment ,
                       username VARCHAR(255) NOT NULL PRIMARY KEY,
                       password VARCHAR(255) NOT NULL,
                       email VARCHAR(255) NOT NULL
);
