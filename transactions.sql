BEGIN;
INSERT INTO employee (social_security_num, first_name, last_name, email, gender, street_num, city, country, job, current_airport_code)
VALUES ('268-77-2527','a','b','ariyuneasaki@gmail.com','Female','2','2','2','pilot','PEK');
INSERT INTO payment (social_security_num, job, normal_hours, overtime_hours, taxes, monthly_salary)
VALUES ('268-77-2527', 'pilot', 0, 0, 0, 0);
COMMIT;
/*Insert a new employee: 695-01-5170 into employee table with the name: a a, email: ariyuneasaki@gmail.com
    , gender: Female, street address: a, city: a, country: a, 
    job: pilot, and current airport code: PEK. We also insert this employee into payment and set their normal hours, overtime_hours,
    taxes and monthly salary to 0.*/
BEGIN;
INSERT INTO employee (social_security_num, first_name, last_name, email, gender, street_num, city, country, job, current_airport_code)
VALUES ('695-01-5170','a','a','ariyuneasaki@gmail.com','Female','a','a','a','pilot','PEK');
INSERT INTO payment (social_security_num, job, normal_hours, overtime_hours, taxes, monthly_salary)
VALUES ('695-01-5170', 'pilot', 0, 0, 0, 0);
COMMIT;
/*Insert a new employee: 268-78-3080 into employee table with the name: a a, email: ariyuneasaki@gmail.com
    , gender: Female, street address: a, city: a, country: a, 
    job: pilot, and current airport code: PEK. We also insert this employee into payment and set their normal hours, overtime_hours,
    taxes and monthly salary to 0.*/
BEGIN;
INSERT INTO employee (social_security_num, first_name, last_name, email, gender, street_num, city, country, job, current_airport_code)
VALUES ('268-78-3080','a','a','ariyuneasaki@gmail.com','Female','a','a','a','pilot','PEK');
INSERT INTO payment (social_security_num, job, normal_hours, overtime_hours, taxes, monthly_salary)
VALUES ('268-78-3080', 'pilot', 0, 0, 0, 0);
COMMIT;
/*Insert a new employee: 372-60-1191 into employee table with the name: AAAA AAAA, email: AAAAA@gmail.com
    , gender: Female, street address: 1231, city: 231231, country: 213123, 
    job: pilot, and current airport code: PEK. We also insert this employee into payment and set their normal hours, overtime_hours,
    taxes and monthly salary to 0.*/
BEGIN;
INSERT INTO employee (social_security_num, first_name, last_name, email, gender, street_num, city, country, job, current_airport_code)
VALUES ('372-60-1191','AAAA','AAAA','AAAAA@gmail.com','Female','1231','231231','213123','pilot','PEK');
INSERT INTO payment (social_security_num, job, normal_hours, overtime_hours, taxes, monthly_salary)
VALUES ('372-60-1191', 'pilot', 0, 0, 0, 0);
COMMIT;
/*Update both flights starting with flight_id: 15_ and assign pilot: 372-60-1191, copilot: N/A, 
    and flightattendants: N/A, N/A, N/A, N/A
    to it*/
BEGIN;
UPDATE flightassignment SET pilot = '372-60-1191', copilot = 'N/A', flight_attendant_1 = 'N/A', flight_attendant_2 = 'N/A', 
flight_attendant_3 = 'N/A', flight_attendant_4 = 'N/A'
WHERE flight_id LIKE '15_';
COMMIT;
/*Update both flights starting with flight_id: 15_ and assign pilot: 372-60-1191, copilot: N/A, 
    and flightattendants: N/A, N/A, N/A, N/A
    to it*/
BEGIN;
BEGIN;
UPDATE flightassignment SET pilot = '372-60-1191', copilot = 'N/A', flight_attendant_1 = 'N/A', flight_attendant_2 = 'N/A', 
flight_attendant_3 = 'N/A', flight_attendant_4 = 'N/A'
WHERE flight_id LIKE '15_';
COMMIT;
COMMIT;
/*Update both flights starting with flight_id: 01_ and assign pilot: N/A, copilot: 545-56-1535, 
    and flightattendants: N/A, N/A, N/A, N/A
    to it*/
BEGIN;
UPDATE flightassignment SET pilot = 'N/A', copilot = '545-56-1535', flight_attendant_1 = 'N/A', flight_attendant_2 = 'N/A', 
flight_attendant_3 = 'N/A', flight_attendant_4 = 'N/A'
WHERE flight_id LIKE '01_';
COMMIT;
/*Update the normal hours, overtime hours, taxes and monthly salary in the payment table for employees: 545-56-1535*/
BEGIN;
Update payment
SET normal_hours = CASE social_security_num
                     WHEN '545-56-1535' THEN 26
                   END,
    overtime_hours = CASE social_security_num
                     WHEN '545-56-1535' THEN 0
                   END,
    taxes = CASE social_security_num
                     WHEN '545-56-1535' THEN 473.20
                   END,
    monthly_salary = CASE social_security_num
                     WHEN '545-56-1535' THEN 1216.80
                   END
WHERE social_security_num IN ('545-56-1535');
COMMIT;
/*Insert a new employee: 797-87-1126 into employee table with the name: AAAA AAAA, email: ariyuneasaki@gmail.com
    , gender: Female, street address: 1231, city: 1231, country: 1231, 
    job: pilot, and current airport code: PEK. We also insert this employee into payment and set their normal hours, overtime_hours,
    taxes and monthly salary to 0.*/
BEGIN;
INSERT INTO employee (social_security_num, first_name, last_name, email, gender, street_num, city, country, job, current_airport_code)
VALUES ('797-87-1126','AAAA','AAAA','ariyuneasaki@gmail.com','Female','1231','1231','1231','pilot','PEK');
INSERT INTO payment (social_security_num, job, normal_hours, overtime_hours, taxes, monthly_salary)
VALUES ('797-87-1126', 'pilot', 0, 0, 0, 0);
COMMIT;
/*Update both flights starting with flight_id: 15_ and assign pilot: 797-87-1126, copilot: N/A, 
    and flightattendants: N/A, N/A, N/A, N/A
    to it*/
BEGIN;
UPDATE flightassignment SET pilot = '797-87-1126', copilot = 'N/A', flight_attendant_1 = 'N/A', flight_attendant_2 = 'N/A', 
flight_attendant_3 = 'N/A', flight_attendant_4 = 'N/A'
WHERE flight_id LIKE '15_';
COMMIT;
/*Update the normal hours, overtime hours, taxes and monthly salary in the payment table for employees: 545-56-1535*/
BEGIN;
Update payment
SET normal_hours = CASE social_security_num
                     WHEN '545-56-1535' THEN 26
                   END,
    overtime_hours = CASE social_security_num
                     WHEN '545-56-1535' THEN 0
                   END,
    taxes = CASE social_security_num
                     WHEN '545-56-1535' THEN 473.20
                   END,
    monthly_salary = CASE social_security_num
                     WHEN '545-56-1535' THEN 1216.80
                   END
WHERE social_security_num IN ('545-56-1535');
COMMIT;
/*Update the normal hours, overtime hours, taxes and monthly salary in the payment table for employees: 545-56-1535*/
BEGIN;
Update payment
SET normal_hours = CASE social_security_num
                     WHEN '545-56-1535' THEN 26
                   END,
    overtime_hours = CASE social_security_num
                     WHEN '545-56-1535' THEN 0
                   END,
    taxes = CASE social_security_num
                     WHEN '545-56-1535' THEN 473.20
                   END,
    monthly_salary = CASE social_security_num
                     WHEN '545-56-1535' THEN 1216.80
                   END
WHERE social_security_num IN ('545-56-1535');
COMMIT;
/*Update the normal hours, overtime hours, taxes and monthly salary in the payment table for employees: 545-56-1535*/
BEGIN;
Update payment
SET normal_hours = CASE social_security_num
                     WHEN '545-56-1535' THEN 26
                   END,
    overtime_hours = CASE social_security_num
                     WHEN '545-56-1535' THEN 0
                   END,
    taxes = CASE social_security_num
                     WHEN '545-56-1535' THEN 473.20
                   END,
    monthly_salary = CASE social_security_num
                     WHEN '545-56-1535' THEN 1216.80
                   END
WHERE social_security_num IN ('545-56-1535');
COMMIT;
/*Update the normal hours, overtime hours, taxes and monthly salary in the payment table for employees: 545-56-1535*/
BEGIN;
Update payment
SET normal_hours = CASE social_security_num
                     WHEN '545-56-1535' THEN 26
                   END,
    overtime_hours = CASE social_security_num
                     WHEN '545-56-1535' THEN 0
                   END,
    taxes = CASE social_security_num
                     WHEN '545-56-1535' THEN 473.20
                   END,
    monthly_salary = CASE social_security_num
                     WHEN '545-56-1535' THEN 1216.80
                   END
WHERE social_security_num IN ('545-56-1535');
COMMIT;
