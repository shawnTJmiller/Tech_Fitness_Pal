-- *************************************************************************************************
-- This script creates all of the database objects (tables, sequences, etc) for the database
-- *************************************************************************************************

BEGIN TRANSACTION;

-- CREATE statements go here
DROP TABLE IF EXISTS app_user;
DROP TABLE IF EXISTS info;
DROP TABLE IF EXISTS meal_data;
DROP TABLE IF EXISTS user_data;

CREATE TABLE app_user (
  id SERIAL PRIMARY KEY,
  user_name varchar(32) NOT NULL UNIQUE,
  password varchar(32) NOT NULL,
  role varchar(32) DEFAULT 'restricted',
  salt varchar(255) NOT NULL
);

CREATE TABLE info (
  user_name VARCHAR(32) NOT NULL UNIQUE PRIMARY KEY,
  email VARCHAR(100) NOT NULL UNIQUE,
  first_name VARCHAR (20) NOT NULL,
  last_name VARCHAR (20) NOT NULL,
  gender VARCHAR (20),
  birthdate DATE NOT NULL,
  height INT,
  weight INT NOT NULL,
  lose_wt BOOLEAN DEFAULT true,
  maintain_wt BOOLEAN,
  gain_wt BOOLEAN,
  target_wt INT,
  user_img VARCHAR(200)
);
  
CREATE TABLE meal_data (
  meal_id SERIAL PRIMARY KEY,
  ingr VARCHAR(100) NOT NULL,
  calories DECIMAL,
  meal_type VARCHAR(50) NOT NULL,
  meal_date DATE NOT NULL
);

--CREATE TABLE user_data (
--  id INT NOT NULL,
--  meal_id INT NOT NULL,
--  CONSTRAINT user_meal_id_meal_id PRIMARY KEY (id, meal_id)
--);


COMMIT TRANSACTION;

--ALTER TABLE app_user ADD FOREIGN KEY (user_name) REFERENCES info(user_name);
--ALTER TABLE user_data ADD FOREIGN KEY (id) REFERENCES app_user(id);
--ALTER TABLE user_data ADD FOREIGN KEY (meal_id) REFERENCES meal_data;
--ALTER TABLE info ADD user_img VARCHAR(200);
--DROP TABLE user_data;
ALTER TABLE meal_data ADD id INT NOT NULL;
ALTER TABLE meal_data ADD FOREIGN KEY (id) REFERENCES app_user(id);
--ALTER TABLE meal_data DROP COLUMN id;