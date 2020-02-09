-- *****************************************************************************
-- This script contains INSERT statements for populating tables with seed data
-- *****************************************************************************

BEGIN TRANSACTION;

INSERT INTO app_user (user_name, password, role, salt)
VALUES ();

INSERT INTO info (user_name, email, first_name, last_name, gender, birthdate, height, weight, lose_wt, maintain_wt, gain_wt, target_wt)
VALUES ();

INSERT INTO meal_data (ingr, calories, meal_type, meal_date)
VALUES ();

ROLLBACK;
--COMMIT;

UPDATE app_user SET role = 'administrator' WHERE user_name = 'shawnTJ';
UPDATE info SET lose_wt = true WHERE user_name = 'shawnTJ';
UPDATE info SET target_wt = 185 WHERE user_name = 'shawnTJ';