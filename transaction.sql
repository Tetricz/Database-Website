/*Insert a new employee: 879-09-0243 into employee table with the name: AA AA, email: ariyuneasaki@gmail.com
    , gender: Female, street address: AA, city: AA, country: Brazil, 
    job: ground crew, and current airport code: SYD. We also insert this employee into payment and set their normal hours, overtime_hours,
    taxes and monthly salary to 0.*/
BEGIN;
INSERT INTO employee (social_security_num, first_name, last_name, email, gender, street_num, city, country, job, current_airport_code)
VALUES ('879-09-0243','AA','AA','ariyuneasaki@gmail.com','Female','AA','AA','Brazil','ground crew','SYD');
INSERT INTO payment (social_security_num, job, normal_hours, overtime_hours, taxes, monthly_salary)
VALUES ('879-09-0243', 'ground crew', 0, 0, 0, 0);
COMMIT;
/*Insert a new employee: 528-47-2834 into employee table with the name: AA AA, email: ariyuneasaki@gmail.com
    , gender: Female, street address: AA, city: AA, country: Brazil, 
    job: ground crew, and current airport code: SYD. We also insert this employee into payment and set their normal hours, overtime_hours,
    taxes and monthly salary to 0.*/
BEGIN;
INSERT INTO employee (social_security_num, first_name, last_name, email, gender, street_num, city, country, job, current_airport_code)
VALUES ('528-47-2834','AA','AA','ariyuneasaki@gmail.com','Female','AA','AA','Brazil','ground crew','SYD');
INSERT INTO payment (social_security_num, job, normal_hours, overtime_hours, taxes, monthly_salary)
VALUES ('528-47-2834', 'ground crew', 0, 0, 0, 0);
COMMIT;
/*Update shiftid: 19 and assign groundworkers: 528-47-2834, N/A 
    and office workers: N/A, N/A to it*/
BEGIN;
UPDATE officeshift 
SET ground_worker_1 = '528-47-2834', ground_worker_2 = 'N/A', office_worker_1 = 'N/A', office_worker_2 = 'N/A'
WHERE shift_id = 19;
COMMIT;
/*Update the normal hours, overtime hours, taxes and monthly salary in the payment table for employees: 528-47-2834*/
BEGIN;
Update payment
SET normal_hours = CASE social_security_num
                     WHEN '528-47-2834' THEN 8
                   END,
    overtime_hours = CASE social_security_num
                     WHEN '528-47-2834' THEN 0
                   END,
    taxes = CASE social_security_num
                     WHEN '528-47-2834' THEN 56.00
                   END,
    monthly_salary = CASE social_security_num
                     WHEN '528-47-2834' THEN 144.00
                   END
WHERE social_security_num IN ('528-47-2834');
COMMIT;
/*Update both flights starting with flight_id: 01_ and assign pilot: 500-79-5396, copilot: N/A, 
    and flightattendants: N/A, N/A, N/A, N/A
    to it*/
BEGIN;
UPDATE flightassignment SET pilot = '500-79-5396', copilot = 'N/A', flight_attendant_1 = 'N/A', flight_attendant_2 = 'N/A', 
flight_attendant_3 = 'N/A', flight_attendant_4 = 'N/A'
WHERE flight_id LIKE '01_';
COMMIT;
/*Update the normal hours, overtime hours, taxes and monthly salary in the payment table for employees: 500-79-5396, 528-47-2834*/
BEGIN;
Update payment
SET normal_hours = CASE social_security_num
                     WHEN '500-79-5396' THEN 26
                     WHEN '528-47-2834' THEN 8
                   END,
    overtime_hours = CASE social_security_num
                     WHEN '500-79-5396' THEN 0
                     WHEN '528-47-2834' THEN 0
                   END,
    taxes = CASE social_security_num
                     WHEN '500-79-5396' THEN 509.60
                     WHEN '528-47-2834' THEN 56.00
                   END,
    monthly_salary = CASE social_security_num
                     WHEN '500-79-5396' THEN 1310.40
                     WHEN '528-47-2834' THEN 144.00
                   END
WHERE social_security_num IN ('500-79-5396', '528-47-2834');
COMMIT;
/*Update the normal hours, overtime hours, taxes and monthly salary in the payment table for employees: 500-79-5396, 528-47-2834*/
BEGIN;
Update payment
SET normal_hours = CASE social_security_num
                     WHEN '500-79-5396' THEN 26
                     WHEN '528-47-2834' THEN 8
                   END,
    overtime_hours = CASE social_security_num
                     WHEN '500-79-5396' THEN 0
                     WHEN '528-47-2834' THEN 0
                   END,
    taxes = CASE social_security_num
                     WHEN '500-79-5396' THEN 509.60
                     WHEN '528-47-2834' THEN 56.00
                   END,
    monthly_salary = CASE social_security_num
                     WHEN '500-79-5396' THEN 1310.40
                     WHEN '528-47-2834' THEN 144.00
                   END
WHERE social_security_num IN ('500-79-5396', '528-47-2834');
COMMIT;
/*Update the normal hours, overtime hours, taxes and monthly salary in the payment table for employees: 500-79-5396, 528-47-2834*/
BEGIN;
Update payment
SET normal_hours = CASE social_security_num
                     WHEN '500-79-5396' THEN 26
                     WHEN '528-47-2834' THEN 8
                   END,
    overtime_hours = CASE social_security_num
                     WHEN '500-79-5396' THEN 0
                     WHEN '528-47-2834' THEN 0
                   END,
    taxes = CASE social_security_num
                     WHEN '500-79-5396' THEN 509.60
                     WHEN '528-47-2834' THEN 56.00
                   END,
    monthly_salary = CASE social_security_num
                     WHEN '500-79-5396' THEN 1310.40
                     WHEN '528-47-2834' THEN 144.00
                   END
WHERE social_security_num IN ('500-79-5396', '528-47-2834');
COMMIT;
/*Update employee: 500-79-5396 information and change their name to: Abbe Laurence, email: alaurence9@g.co,
    streetnum: 5542, city: Sao Paulo and country: Brazil*/
BEGIN;
UPDATE employee
SET first_name = 'Abbe', last_name = 'Laurence', email = 'alaurence9@g.co', street_num = '5542', city = 'Sao Paulo', country = 'Brazil'
WHERE social_security_num = '500-79-5396';
COMMIT;
/*Update employee: 500-79-5396 information and change their name to: Abbe Laurence, email: alaurence9@g.co,
    streetnum: 5542, city: Sao Paulo and country: Brazil*/
BEGIN;
UPDATE employee
SET first_name = 'Abbe', last_name = 'Laurence', email = 'alaurence9@g.co', street_num = '5542', city = 'Sao Paulo', country = 'Brazil'
WHERE social_security_num = '500-79-5396';
COMMIT;
/*Update employee: 500-79-5396 information and change their name to: Abbe Laurence, email: alaurence9@g.co,
    streetnum: 5542, city: Sao Paulo and country: Brazil*/
BEGIN;
UPDATE employee
SET first_name = 'Abbe', last_name = 'Laurence', email = 'alaurence9@g.co', street_num = '5542', city = 'Sao Paulo', country = 'Brazil'
WHERE social_security_num = '500-79-5396';
COMMIT;
/*Update employee: 500-79-5396 information and change their name to: Abbe Laurence, email: alaurence9@g.co,
    streetnum: 5542, city: Sao Paulo and country: Brazil*/
BEGIN;
UPDATE employee
SET first_name = 'Abbe', last_name = 'Laurence', email = 'alaurence9@g.co', street_num = '5542', city = 'Sao Paulo', country = 'Brazil'
WHERE social_security_num = '500-79-5396';
COMMIT;
/*Update employee: 847-39-5263 information and change their name to: Ad Yielding, email: ayielding1w@slideshare.net,
    streetnum: 44, city: Paris and country: France*/
BEGIN;
UPDATE employee
SET first_name = 'Ad', last_name = 'Yielding', email = 'ayielding1w@slideshare.net', street_num = '44', city = 'Paris', country = 'France'
WHERE social_security_num = '847-39-5263';
COMMIT;
/*Update employee: 500-79-5396 information and change their name to: Abbe Laurence, email: alaurence9@g.co,
    streetnum: 5542, city: Sao Paulo, country: Brazil, sick leave: 1, vacation days: 16*/
BEGIN;
UPDATE employee
SET first_name = 'Abbe', last_name = 'Laurence', email = 'alaurence9@g.co', street_num = '5542', city = 'Sao Paulo', country = 'Brazil',
sick_leave = 1, vacation_days = 16
WHERE social_security_num = '500-79-5396';
COMMIT;
/*Insert a new employee: 312-44-2785 into employee table with the name: AA AA, email: AA@gmail.com
    , gender: Female, street address: AA, city: AA, country: Brazil, 
    job: office worker, and current airport code: PEK. We also insert this employee into payment and set their normal hours, overtime_hours,
    taxes and monthly salary to 0.*/
BEGIN;
INSERT INTO employee (social_security_num, first_name, last_name, email, gender, street_num, city, country, job, current_airport_code)
VALUES ('312-44-2785','AA','AA','AA@gmail.com','Female','AA','AA','Brazil','office worker','PEK');
INSERT INTO payment (social_security_num, job, normal_hours, overtime_hours, taxes, monthly_salary)
VALUES ('312-44-2785', 'office worker', 0, 0, 0, 0);
COMMIT;
/*Update employee: 312-44-2785 information and change their name to: AA AA, email: AA@gmail.com,
    streetnum: AA, city: AA, country: Brazil, sick leave: 9, vacation days: 14*/
BEGIN;
UPDATE employee
SET first_name = 'AA', last_name = 'AA', email = 'AA@gmail.com', street_num = 'AA', city = 'AA', country = 'Brazil',
sick_leave = 9, vacation_days = 14
WHERE social_security_num = '312-44-2785';
COMMIT;
/*Insert a new employee: 793-69-3376 into employee table with the name: a a, email: ariyuneasaki@gmail.com
    , gender: Female, street address: a, city: a, country: Brazil, 
    job: pilot, current airport code: PEK, sick leave: 9, vacation days: 16. We also insert this 
    employee into payment and set their normal hours, overtime_hours,
    taxes and monthly salary to 0.*/
BEGIN;
INSERT INTO employee (social_security_num, first_name, last_name, email, gender, street_num, city, country, job, current_airport_code, sick_leave, vacation_days)
VALUES ('793-69-3376','a','a','ariyuneasaki@gmail.com','Female','a','a','Brazil','pilot','PEK',9,16);
INSERT INTO payment (social_security_num, job, normal_hours, overtime_hours, taxes, monthly_salary)
VALUES ('793-69-3376', 'pilot', 0, 0, 0, 0);
COMMIT;
/*Update both flights starting with flight_id: 01_ and assign pilot: 500-79-5396, copilot: 545-56-1535, 
    and flightattendants: 251-49-2858, 494-59-0750, 763-40-1461, 327-93-1213
    to it*/
BEGIN;
UPDATE flightassignment SET pilot = '500-79-5396', copilot = '545-56-1535', flight_attendant_1 = '251-49-2858', flight_attendant_2 = '494-59-0750', 
flight_attendant_3 = '763-40-1461', flight_attendant_4 = '327-93-1213'
WHERE flight_id LIKE '01_';
COMMIT;
/*Update both flights starting with flight_id: 23_ and assign pilot: N/A, copilot: N/A, 
    and flightattendants: 494-59-0750, 222-16-3379, 251-49-2858, 327-93-1213
    to it*/
BEGIN;
UPDATE flightassignment SET pilot = 'N/A', copilot = 'N/A', flight_attendant_1 = '494-59-0750', flight_attendant_2 = '222-16-3379', 
flight_attendant_3 = '251-49-2858', flight_attendant_4 = '327-93-1213'
WHERE flight_id LIKE '23_';
COMMIT;
/*Update both flights starting with flight_id: 14_ and assign pilot: N/A, copilot: N/A, 
    and flightattendants: N/A, N/A, 251-49-2858, 327-93-1213
    to it*/
BEGIN;
UPDATE flightassignment SET pilot = 'N/A', copilot = 'N/A', flight_attendant_1 = 'N/A', flight_attendant_2 = 'N/A', 
flight_attendant_3 = '251-49-2858', flight_attendant_4 = '327-93-1213'
WHERE flight_id LIKE '14_';
COMMIT;
/*Update the normal hours, overtime hours, taxes and monthly salary in the payment table for employees: 500-79-5396, 545-56-1535, 327-93-1213, 494-59-0750, 494-59-0750, 251-49-2858, 251-49-2858, 763-40-1461, 222-16-3379*/
BEGIN;
Update payment
SET normal_hours = CASE social_security_num
                     WHEN '500-79-5396' THEN 26
                     WHEN '545-56-1535' THEN 26
                     WHEN '327-93-1213' THEN 40
                     WHEN '494-59-0750' THEN 26
                     WHEN '494-59-0750' THEN 30
                     WHEN '251-49-2858' THEN 40
                     WHEN '251-49-2858' THEN 26
                     WHEN '763-40-1461' THEN 26
                     WHEN '222-16-3379' THEN 30
                   END,
    overtime_hours = CASE social_security_num
                     WHEN '500-79-5396' THEN 0
                     WHEN '545-56-1535' THEN 0
                     WHEN '327-93-1213' THEN 44
                     WHEN '494-59-0750' THEN 0
                     WHEN '494-59-0750' THEN 0
                     WHEN '251-49-2858' THEN 18
                     WHEN '251-49-2858' THEN 0
                     WHEN '763-40-1461' THEN 0
                     WHEN '222-16-3379' THEN 0
                   END,
    taxes = CASE social_security_num
                     WHEN '500-79-5396' THEN 509.60
                     WHEN '545-56-1535' THEN 473.20
                     WHEN '327-93-1213' THEN 992.32
                     WHEN '494-59-0750' THEN 276.64
                     WHEN '494-59-0750' THEN 319.20
                     WHEN '251-49-2858' THEN 657.44
                     WHEN '251-49-2858' THEN 276.64
                     WHEN '763-40-1461' THEN 276.64
                     WHEN '222-16-3379' THEN 319.20
                   END,
    monthly_salary = CASE social_security_num
                     WHEN '500-79-5396' THEN 1310.40
                     WHEN '545-56-1535' THEN 1216.80
                     WHEN '327-93-1213' THEN 2551.68
                     WHEN '494-59-0750' THEN 711.36
                     WHEN '494-59-0750' THEN 820.80
                     WHEN '251-49-2858' THEN 1690.56
                     WHEN '251-49-2858' THEN 711.36
                     WHEN '763-40-1461' THEN 711.36
                     WHEN '222-16-3379' THEN 820.80
                   END
WHERE social_security_num IN ('500-79-5396', '545-56-1535', '327-93-1213', '494-59-0750', '494-59-0750', '251-49-2858', '251-49-2858', '763-40-1461', '222-16-3379');
COMMIT;
/*Update the normal hours, overtime hours, taxes and monthly salary in the payment table for employees: 500-79-5396, 545-56-1535, 327-93-1213, 494-59-0750, 494-59-0750, 251-49-2858, 251-49-2858, 763-40-1461, 222-16-3379*/
BEGIN;
Update payment
SET normal_hours = CASE social_security_num
                     WHEN '500-79-5396' THEN 26
                     WHEN '545-56-1535' THEN 26
                     WHEN '327-93-1213' THEN 40
                     WHEN '494-59-0750' THEN 26
                     WHEN '494-59-0750' THEN 30
                     WHEN '251-49-2858' THEN 40
                     WHEN '251-49-2858' THEN 26
                     WHEN '763-40-1461' THEN 26
                     WHEN '222-16-3379' THEN 30
                   END,
    overtime_hours = CASE social_security_num
                     WHEN '500-79-5396' THEN 0
                     WHEN '545-56-1535' THEN 0
                     WHEN '327-93-1213' THEN 44
                     WHEN '494-59-0750' THEN 0
                     WHEN '494-59-0750' THEN 0
                     WHEN '251-49-2858' THEN 18
                     WHEN '251-49-2858' THEN 0
                     WHEN '763-40-1461' THEN 0
                     WHEN '222-16-3379' THEN 0
                   END,
    taxes = CASE social_security_num
                     WHEN '500-79-5396' THEN 509.60
                     WHEN '545-56-1535' THEN 473.20
                     WHEN '327-93-1213' THEN 992.32
                     WHEN '494-59-0750' THEN 276.64
                     WHEN '494-59-0750' THEN 319.20
                     WHEN '251-49-2858' THEN 657.44
                     WHEN '251-49-2858' THEN 276.64
                     WHEN '763-40-1461' THEN 276.64
                     WHEN '222-16-3379' THEN 319.20
                   END,
    monthly_salary = CASE social_security_num
                     WHEN '500-79-5396' THEN 1310.40
                     WHEN '545-56-1535' THEN 1216.80
                     WHEN '327-93-1213' THEN 2551.68
                     WHEN '494-59-0750' THEN 711.36
                     WHEN '494-59-0750' THEN 820.80
                     WHEN '251-49-2858' THEN 1690.56
                     WHEN '251-49-2858' THEN 711.36
                     WHEN '763-40-1461' THEN 711.36
                     WHEN '222-16-3379' THEN 820.80
                   END
WHERE social_security_num IN ('500-79-5396', '545-56-1535', '327-93-1213', '494-59-0750', '494-59-0750', '251-49-2858', '251-49-2858', '763-40-1461', '222-16-3379');
COMMIT;
/*Update the normal hours, overtime hours, taxes and monthly salary in the payment table for employees: 500-79-5396, 545-56-1535, 327-93-1213, 494-59-0750, 494-59-0750, 251-49-2858, 251-49-2858, 763-40-1461, 222-16-3379*/
BEGIN;
Update payment
SET normal_hours = CASE social_security_num
                     WHEN '500-79-5396' THEN 26
                     WHEN '545-56-1535' THEN 26
                     WHEN '327-93-1213' THEN 40
                     WHEN '494-59-0750' THEN 26
                     WHEN '494-59-0750' THEN 30
                     WHEN '251-49-2858' THEN 40
                     WHEN '251-49-2858' THEN 26
                     WHEN '763-40-1461' THEN 26
                     WHEN '222-16-3379' THEN 30
                   END,
    overtime_hours = CASE social_security_num
                     WHEN '500-79-5396' THEN 0
                     WHEN '545-56-1535' THEN 0
                     WHEN '327-93-1213' THEN 44
                     WHEN '494-59-0750' THEN 0
                     WHEN '494-59-0750' THEN 0
                     WHEN '251-49-2858' THEN 18
                     WHEN '251-49-2858' THEN 0
                     WHEN '763-40-1461' THEN 0
                     WHEN '222-16-3379' THEN 0
                   END,
    taxes = CASE social_security_num
                     WHEN '500-79-5396' THEN 509.60
                     WHEN '545-56-1535' THEN 473.20
                     WHEN '327-93-1213' THEN 992.32
                     WHEN '494-59-0750' THEN 276.64
                     WHEN '494-59-0750' THEN 319.20
                     WHEN '251-49-2858' THEN 657.44
                     WHEN '251-49-2858' THEN 276.64
                     WHEN '763-40-1461' THEN 276.64
                     WHEN '222-16-3379' THEN 319.20
                   END,
    monthly_salary = CASE social_security_num
                     WHEN '500-79-5396' THEN 1310.40
                     WHEN '545-56-1535' THEN 1216.80
                     WHEN '327-93-1213' THEN 2551.68
                     WHEN '494-59-0750' THEN 711.36
                     WHEN '494-59-0750' THEN 820.80
                     WHEN '251-49-2858' THEN 1690.56
                     WHEN '251-49-2858' THEN 711.36
                     WHEN '763-40-1461' THEN 711.36
                     WHEN '222-16-3379' THEN 820.80
                   END
WHERE social_security_num IN ('500-79-5396', '545-56-1535', '327-93-1213', '494-59-0750', '494-59-0750', '251-49-2858', '251-49-2858', '763-40-1461', '222-16-3379');
COMMIT;
/*Update the normal hours, overtime hours, taxes and monthly salary in the payment table for employees: 500-79-5396, 545-56-1535, 327-93-1213, 494-59-0750, 494-59-0750, 251-49-2858, 251-49-2858, 763-40-1461, 222-16-3379*/
BEGIN;
Update payment
SET normal_hours = CASE social_security_num
                     WHEN '500-79-5396' THEN 26
                     WHEN '545-56-1535' THEN 26
                     WHEN '327-93-1213' THEN 40
                     WHEN '494-59-0750' THEN 26
                     WHEN '494-59-0750' THEN 30
                     WHEN '251-49-2858' THEN 40
                     WHEN '251-49-2858' THEN 26
                     WHEN '763-40-1461' THEN 26
                     WHEN '222-16-3379' THEN 30
                   END,
    overtime_hours = CASE social_security_num
                     WHEN '500-79-5396' THEN 0
                     WHEN '545-56-1535' THEN 0
                     WHEN '327-93-1213' THEN 44
                     WHEN '494-59-0750' THEN 0
                     WHEN '494-59-0750' THEN 0
                     WHEN '251-49-2858' THEN 18
                     WHEN '251-49-2858' THEN 0
                     WHEN '763-40-1461' THEN 0
                     WHEN '222-16-3379' THEN 0
                   END,
    taxes = CASE social_security_num
                     WHEN '500-79-5396' THEN 509.60
                     WHEN '545-56-1535' THEN 473.20
                     WHEN '327-93-1213' THEN 992.32
                     WHEN '494-59-0750' THEN 276.64
                     WHEN '494-59-0750' THEN 319.20
                     WHEN '251-49-2858' THEN 657.44
                     WHEN '251-49-2858' THEN 276.64
                     WHEN '763-40-1461' THEN 276.64
                     WHEN '222-16-3379' THEN 319.20
                   END,
    monthly_salary = CASE social_security_num
                     WHEN '500-79-5396' THEN 1310.40
                     WHEN '545-56-1535' THEN 1216.80
                     WHEN '327-93-1213' THEN 2551.68
                     WHEN '494-59-0750' THEN 711.36
                     WHEN '494-59-0750' THEN 820.80
                     WHEN '251-49-2858' THEN 1690.56
                     WHEN '251-49-2858' THEN 711.36
                     WHEN '763-40-1461' THEN 711.36
                     WHEN '222-16-3379' THEN 820.80
                   END
WHERE social_security_num IN ('500-79-5396', '545-56-1535', '327-93-1213', '494-59-0750', '494-59-0750', '251-49-2858', '251-49-2858', '763-40-1461', '222-16-3379');
COMMIT;
/*Update the normal hours, overtime hours, taxes and monthly salary in the payment table for employees: 500-79-5396, 545-56-1535, 327-93-1213, 494-59-0750, 494-59-0750, 251-49-2858, 251-49-2858, 763-40-1461, 222-16-3379*/
BEGIN;
Update payment
SET normal_hours = CASE social_security_num
                     WHEN '500-79-5396' THEN 26
                     WHEN '545-56-1535' THEN 26
                     WHEN '327-93-1213' THEN 40
                     WHEN '494-59-0750' THEN 26
                     WHEN '494-59-0750' THEN 30
                     WHEN '251-49-2858' THEN 40
                     WHEN '251-49-2858' THEN 26
                     WHEN '763-40-1461' THEN 26
                     WHEN '222-16-3379' THEN 30
                   END,
    overtime_hours = CASE social_security_num
                     WHEN '500-79-5396' THEN 0
                     WHEN '545-56-1535' THEN 0
                     WHEN '327-93-1213' THEN 44
                     WHEN '494-59-0750' THEN 0
                     WHEN '494-59-0750' THEN 0
                     WHEN '251-49-2858' THEN 18
                     WHEN '251-49-2858' THEN 0
                     WHEN '763-40-1461' THEN 0
                     WHEN '222-16-3379' THEN 0
                   END,
    taxes = CASE social_security_num
                     WHEN '500-79-5396' THEN 509.60
                     WHEN '545-56-1535' THEN 473.20
                     WHEN '327-93-1213' THEN 992.32
                     WHEN '494-59-0750' THEN 276.64
                     WHEN '494-59-0750' THEN 319.20
                     WHEN '251-49-2858' THEN 657.44
                     WHEN '251-49-2858' THEN 276.64
                     WHEN '763-40-1461' THEN 276.64
                     WHEN '222-16-3379' THEN 319.20
                   END,
    monthly_salary = CASE social_security_num
                     WHEN '500-79-5396' THEN 1310.40
                     WHEN '545-56-1535' THEN 1216.80
                     WHEN '327-93-1213' THEN 2551.68
                     WHEN '494-59-0750' THEN 711.36
                     WHEN '494-59-0750' THEN 820.80
                     WHEN '251-49-2858' THEN 1690.56
                     WHEN '251-49-2858' THEN 711.36
                     WHEN '763-40-1461' THEN 711.36
                     WHEN '222-16-3379' THEN 820.80
                   END
WHERE social_security_num IN ('500-79-5396', '545-56-1535', '327-93-1213', '494-59-0750', '494-59-0750', '251-49-2858', '251-49-2858', '763-40-1461', '222-16-3379');
COMMIT;
/*Update the normal hours, overtime hours, taxes and monthly salary in the payment table for employees: 500-79-5396, 545-56-1535, 327-93-1213, 494-59-0750, 494-59-0750, 251-49-2858, 251-49-2858, 763-40-1461, 222-16-3379*/
BEGIN;
Update payment
SET normal_hours = CASE social_security_num
                     WHEN '500-79-5396' THEN 26
                     WHEN '545-56-1535' THEN 26
                     WHEN '327-93-1213' THEN 40
                     WHEN '494-59-0750' THEN 26
                     WHEN '494-59-0750' THEN 30
                     WHEN '251-49-2858' THEN 40
                     WHEN '251-49-2858' THEN 26
                     WHEN '763-40-1461' THEN 26
                     WHEN '222-16-3379' THEN 30
                   END,
    overtime_hours = CASE social_security_num
                     WHEN '500-79-5396' THEN 0
                     WHEN '545-56-1535' THEN 0
                     WHEN '327-93-1213' THEN 44
                     WHEN '494-59-0750' THEN 0
                     WHEN '494-59-0750' THEN 0
                     WHEN '251-49-2858' THEN 18
                     WHEN '251-49-2858' THEN 0
                     WHEN '763-40-1461' THEN 0
                     WHEN '222-16-3379' THEN 0
                   END,
    taxes = CASE social_security_num
                     WHEN '500-79-5396' THEN 509.60
                     WHEN '545-56-1535' THEN 473.20
                     WHEN '327-93-1213' THEN 992.32
                     WHEN '494-59-0750' THEN 276.64
                     WHEN '494-59-0750' THEN 319.20
                     WHEN '251-49-2858' THEN 657.44
                     WHEN '251-49-2858' THEN 276.64
                     WHEN '763-40-1461' THEN 276.64
                     WHEN '222-16-3379' THEN 319.20
                   END,
    monthly_salary = CASE social_security_num
                     WHEN '500-79-5396' THEN 1310.40
                     WHEN '545-56-1535' THEN 1216.80
                     WHEN '327-93-1213' THEN 2551.68
                     WHEN '494-59-0750' THEN 711.36
                     WHEN '494-59-0750' THEN 820.80
                     WHEN '251-49-2858' THEN 1690.56
                     WHEN '251-49-2858' THEN 711.36
                     WHEN '763-40-1461' THEN 711.36
                     WHEN '222-16-3379' THEN 820.80
                   END
WHERE social_security_num IN ('500-79-5396', '545-56-1535', '327-93-1213', '494-59-0750', '494-59-0750', '251-49-2858', '251-49-2858', '763-40-1461', '222-16-3379');
COMMIT;
/*Update shiftid: 1 and assign groundworkers: 253-64-5676, 549-31-5258 
    and office workers: 626-55-7190, 248-07-6582 to it*/
BEGIN;
UPDATE officeshift 
SET ground_worker_1 = '253-64-5676', ground_worker_2 = '549-31-5258', office_worker_1 = '626-55-7190', office_worker_2 = '248-07-6582'
WHERE shift_id = 1;
COMMIT;
/*Update shiftid: 1 and assign groundworkers: 253-64-5676, N/A 
    and office workers: N/A, N/A to it*/
BEGIN;
UPDATE officeshift 
SET ground_worker_1 = '253-64-5676', ground_worker_2 = 'N/A', office_worker_1 = 'N/A', office_worker_2 = 'N/A'
WHERE shift_id = 1;
COMMIT;
/*Update the normal hours, overtime hours, taxes and monthly salary in the payment table for employees: 500-79-5396, 545-56-1535, 327-93-1213, 494-59-0750, 494-59-0750, 251-49-2858, 251-49-2858, 763-40-1461, 222-16-3379, 253-64-5676*/
BEGIN;
Update payment
SET normal_hours = CASE social_security_num
                     WHEN '500-79-5396' THEN 26
                     WHEN '545-56-1535' THEN 26
                     WHEN '327-93-1213' THEN 40
                     WHEN '494-59-0750' THEN 26
                     WHEN '494-59-0750' THEN 30
                     WHEN '251-49-2858' THEN 40
                     WHEN '251-49-2858' THEN 26
                     WHEN '763-40-1461' THEN 26
                     WHEN '222-16-3379' THEN 30
                     WHEN '253-64-5676' THEN 8
                   END,
    overtime_hours = CASE social_security_num
                     WHEN '500-79-5396' THEN 0
                     WHEN '545-56-1535' THEN 0
                     WHEN '327-93-1213' THEN 44
                     WHEN '494-59-0750' THEN 0
                     WHEN '494-59-0750' THEN 0
                     WHEN '251-49-2858' THEN 18
                     WHEN '251-49-2858' THEN 0
                     WHEN '763-40-1461' THEN 0
                     WHEN '222-16-3379' THEN 0
                     WHEN '253-64-5676' THEN 0
                   END,
    taxes = CASE social_security_num
                     WHEN '500-79-5396' THEN 509.60
                     WHEN '545-56-1535' THEN 473.20
                     WHEN '327-93-1213' THEN 992.32
                     WHEN '494-59-0750' THEN 276.64
                     WHEN '494-59-0750' THEN 319.20
                     WHEN '251-49-2858' THEN 657.44
                     WHEN '251-49-2858' THEN 276.64
                     WHEN '763-40-1461' THEN 276.64
                     WHEN '222-16-3379' THEN 319.20
                     WHEN '253-64-5676' THEN 70.00
                   END,
    monthly_salary = CASE social_security_num
                     WHEN '500-79-5396' THEN 1310.40
                     WHEN '545-56-1535' THEN 1216.80
                     WHEN '327-93-1213' THEN 2551.68
                     WHEN '494-59-0750' THEN 711.36
                     WHEN '494-59-0750' THEN 820.80
                     WHEN '251-49-2858' THEN 1690.56
                     WHEN '251-49-2858' THEN 711.36
                     WHEN '763-40-1461' THEN 711.36
                     WHEN '222-16-3379' THEN 820.80
                     WHEN '253-64-5676' THEN 130.00
                   END
WHERE social_security_num IN ('500-79-5396', '545-56-1535', '327-93-1213', '494-59-0750', '494-59-0750', '251-49-2858', '251-49-2858', '763-40-1461', '222-16-3379', '253-64-5676');
COMMIT;
/*Update shiftid: 1 and assign groundworkers: 549-31-5258, N/A 
    and office workers: N/A, N/A to it*/
BEGIN;
UPDATE officeshift 
SET ground_worker_1 = '549-31-5258', ground_worker_2 = 'N/A', office_worker_1 = 'N/A', office_worker_2 = 'N/A'
WHERE shift_id = 1;
COMMIT;
/*Update shiftid: 1 and assign groundworkers: 253-64-5676, N/A 
    and office workers: N/A, N/A to it*/
BEGIN;
UPDATE officeshift 
SET ground_worker_1 = '253-64-5676', ground_worker_2 = 'N/A', office_worker_1 = 'N/A', office_worker_2 = 'N/A'
WHERE shift_id = 1;
COMMIT;
/*Update shiftid: 1 and assign groundworkers: 549-31-5258, N/A 
    and office workers: N/A, N/A to it*/
BEGIN;
UPDATE officeshift 
SET ground_worker_1 = '549-31-5258', ground_worker_2 = 'N/A', office_worker_1 = 'N/A', office_worker_2 = 'N/A'
WHERE shift_id = 1;
COMMIT;
/*Update shiftid: 1 and assign groundworkers: 253-64-5676, N/A 
    and office workers: N/A, N/A to it*/
BEGIN;
UPDATE officeshift 
SET ground_worker_1 = '253-64-5676', ground_worker_2 = 'N/A', office_worker_1 = 'N/A', office_worker_2 = 'N/A'
WHERE shift_id = 1;
COMMIT;
/*Update shiftid: 1 and assign groundworkers: 549-31-5258, N/A 
    and office workers: N/A, N/A to it*/
BEGIN;
UPDATE officeshift 
SET ground_worker_1 = '549-31-5258', ground_worker_2 = 'N/A', office_worker_1 = 'N/A', office_worker_2 = 'N/A'
WHERE shift_id = 1;
COMMIT;
/*Update shiftid: 1 and assign groundworkers: 253-64-5676, N/A 
    and office workers: N/A, N/A to it*/
BEGIN;
UPDATE officeshift 
SET ground_worker_1 = '253-64-5676', ground_worker_2 = 'N/A', office_worker_1 = 'N/A', office_worker_2 = 'N/A'
WHERE shift_id = 1;
COMMIT;
/*Update shiftid: 1 and assign groundworkers: 549-31-5258, N/A 
    and office workers: N/A, N/A to it*/
BEGIN;
UPDATE officeshift 
SET ground_worker_1 = '549-31-5258', ground_worker_2 = 'N/A', office_worker_1 = 'N/A', office_worker_2 = 'N/A'
WHERE shift_id = 1;
COMMIT;
/*Update shiftid: 1 and assign groundworkers: 549-31-5258, N/A 
    and office workers: N/A, N/A to it*/
BEGIN;
UPDATE officeshift 
SET ground_worker_1 = '549-31-5258', ground_worker_2 = 'N/A', office_worker_1 = 'N/A', office_worker_2 = 'N/A'
WHERE shift_id = 1;
COMMIT;
/*Update shiftid: 1 and assign groundworkers: N/A, N/A 
    and office workers: N/A, N/A to it*/
BEGIN;
UPDATE officeshift 
SET ground_worker_1 = 'N/A', ground_worker_2 = 'N/A', office_worker_1 = 'N/A', office_worker_2 = 'N/A'
WHERE shift_id = 1;
COMMIT;
/*Update shiftid: 1 and assign groundworkers: N/A, N/A 
    and office workers: N/A, N/A to it*/
BEGIN;
UPDATE officeshift 
SET ground_worker_1 = 'N/A', ground_worker_2 = 'N/A', office_worker_1 = 'N/A', office_worker_2 = 'N/A'
WHERE shift_id = 1;
COMMIT;
/*Update shiftid: 1 and assign groundworkers: 158-61-5318, N/A 
    and office workers: N/A, N/A to it*/
BEGIN;
UPDATE officeshift 
SET ground_worker_1 = '158-61-5318', ground_worker_2 = 'N/A', office_worker_1 = 'N/A', office_worker_2 = 'N/A'
WHERE shift_id = 1;
COMMIT;
/*Update shiftid: 1 and assign groundworkers: N/A, N/A 
    and office workers: N/A, N/A to it*/
BEGIN;
UPDATE officeshift 
SET ground_worker_1 = 'N/A', ground_worker_2 = 'N/A', office_worker_1 = 'N/A', office_worker_2 = 'N/A'
WHERE shift_id = 1;
COMMIT;
/*Update shiftid: 1 and assign groundworkers: N/A, N/A 
    and office workers: N/A, N/A to it*/
BEGIN;
UPDATE officeshift 
SET ground_worker_1 = 'N/A', ground_worker_2 = 'N/A', office_worker_1 = 'N/A', office_worker_2 = 'N/A'
WHERE shift_id = 1;
COMMIT;
/*Update shiftid: 1 and assign groundworkers: N/A, N/A 
    and office workers: N/A, N/A to it*/
BEGIN;
UPDATE officeshift 
SET ground_worker_1 = 'N/A', ground_worker_2 = 'N/A', office_worker_1 = 'N/A', office_worker_2 = 'N/A'
WHERE shift_id = 1;
COMMIT;
/*Update shiftid: 1 and assign groundworkers: N/A, N/A 
    and office workers: N/A, N/A to it*/
BEGIN;
UPDATE officeshift 
SET ground_worker_1 = 'N/A', ground_worker_2 = 'N/A', office_worker_1 = 'N/A', office_worker_2 = 'N/A'
WHERE shift_id = 1;
COMMIT;
/*Update shiftid: 1 and assign groundworkers: N/A, N/A 
    and office workers: N/A, N/A to it*/
BEGIN;
UPDATE officeshift 
SET ground_worker_1 = 'N/A', ground_worker_2 = 'N/A', office_worker_1 = 'N/A', office_worker_2 = 'N/A'
WHERE shift_id = 1;
COMMIT;
/*Update shiftid: 1 and assign groundworkers: N/A, N/A 
    and office workers: N/A, N/A to it*/
BEGIN;
UPDATE officeshift 
SET ground_worker_1 = 'N/A', ground_worker_2 = 'N/A', office_worker_1 = 'N/A', office_worker_2 = 'N/A'
WHERE shift_id = 1;
COMMIT;
/*Update shiftid: 1 and assign groundworkers: N/A, N/A 
    and office workers: N/A, N/A to it*/
BEGIN;
UPDATE officeshift 
SET ground_worker_1 = 'N/A', ground_worker_2 = 'N/A', office_worker_1 = 'N/A', office_worker_2 = 'N/A'
WHERE shift_id = 1;
COMMIT;
/*Update both flights starting with flight_id: 01_ and assign pilot: N/A, copilot: N/A, 
    and flightattendants: N/A, N/A, N/A, N/A
    to it*/
BEGIN;
UPDATE flightassignment SET pilot = 'N/A', copilot = 'N/A', flight_attendant_1 = 'N/A', flight_attendant_2 = 'N/A', 
flight_attendant_3 = 'N/A', flight_attendant_4 = 'N/A'
WHERE flight_id LIKE '01_';
COMMIT;
/*Update both flights starting with flight_id: 14_ and assign pilot: N/A, copilot: N/A, 
    and flightattendants: N/A, N/A, N/A, N/A
    to it*/
BEGIN;
UPDATE flightassignment SET pilot = 'N/A', copilot = 'N/A', flight_attendant_1 = 'N/A', flight_attendant_2 = 'N/A', 
flight_attendant_3 = 'N/A', flight_attendant_4 = 'N/A'
WHERE flight_id LIKE '14_';
COMMIT;
/*Update both flights starting with flight_id: 23_ and assign pilot: N/A, copilot: N/A, 
    and flightattendants: N/A, N/A, N/A, N/A
    to it*/
BEGIN;
UPDATE flightassignment SET pilot = 'N/A', copilot = 'N/A', flight_attendant_1 = 'N/A', flight_attendant_2 = 'N/A', 
flight_attendant_3 = 'N/A', flight_attendant_4 = 'N/A'
WHERE flight_id LIKE '23_';
COMMIT;
/*Update both flights starting with flight_id: 22_ and assign pilot: N/A, copilot: N/A, 
    and flightattendants: N/A, N/A, 744-70-9032, N/A
    to it*/
BEGIN;
UPDATE flightassignment SET pilot = 'N/A', copilot = 'N/A', flight_attendant_1 = 'N/A', flight_attendant_2 = 'N/A', 
flight_attendant_3 = '744-70-9032', flight_attendant_4 = 'N/A'
WHERE flight_id LIKE '22_';
COMMIT;
/*Update both flights starting with flight_id: 12_ and assign pilot: N/A, copilot: N/A, 
    and flightattendants: N/A, 707-94-2947, N/A, N/A
    to it*/
BEGIN;
UPDATE flightassignment SET pilot = 'N/A', copilot = 'N/A', flight_attendant_1 = 'N/A', flight_attendant_2 = '707-94-2947', 
flight_attendant_3 = 'N/A', flight_attendant_4 = 'N/A'
WHERE flight_id LIKE '12_';
COMMIT;
/*Update both flights starting with flight_id: 01_ and assign pilot: N/A, copilot: N/A, 
    and flightattendants: N/A, N/A, N/A, N/A
    to it*/
BEGIN;
UPDATE flightassignment SET pilot = 'N/A', copilot = 'N/A', flight_attendant_1 = 'N/A', flight_attendant_2 = 'N/A', 
flight_attendant_3 = 'N/A', flight_attendant_4 = 'N/A'
WHERE flight_id LIKE '01_';
COMMIT;
/*Update both flights starting with flight_id: 01_ and assign pilot: N/A, copilot: N/A, 
    and flightattendants: N/A, N/A, N/A, N/A
    to it*/
BEGIN;
UPDATE flightassignment SET pilot = 'N/A', copilot = 'N/A', flight_attendant_1 = 'N/A', flight_attendant_2 = 'N/A', 
flight_attendant_3 = 'N/A', flight_attendant_4 = 'N/A'
WHERE flight_id LIKE '01_';
COMMIT;
/*Update both flights starting with flight_id: 12_ and assign pilot: N/A, copilot: N/A, 
    and flightattendants: N/A, N/A, N/A, N/A
    to it*/
BEGIN;
UPDATE flightassignment SET pilot = 'N/A', copilot = 'N/A', flight_attendant_1 = 'N/A', flight_attendant_2 = 'N/A', 
flight_attendant_3 = 'N/A', flight_attendant_4 = 'N/A'
WHERE flight_id LIKE '12_';
COMMIT;
/*Update both flights starting with flight_id: 01_ and assign pilot: N/A, copilot: N/A, 
    and flightattendants: 494-59-0750, 251-49-2858, 548-68-1810, 763-40-1461
    to it*/
BEGIN;
UPDATE flightassignment SET pilot = 'N/A', copilot = 'N/A', flight_attendant_1 = '494-59-0750', flight_attendant_2 = '251-49-2858', 
flight_attendant_3 = '548-68-1810', flight_attendant_4 = '763-40-1461'
WHERE flight_id LIKE '01_';
COMMIT;
/*Update both flights starting with flight_id: 22_ and assign pilot: N/A, copilot: N/A, 
    and flightattendants: N/A, N/A, N/A, N/A
    to it*/
BEGIN;
UPDATE flightassignment SET pilot = 'N/A', copilot = 'N/A', flight_attendant_1 = 'N/A', flight_attendant_2 = 'N/A', 
flight_attendant_3 = 'N/A', flight_attendant_4 = 'N/A'
WHERE flight_id LIKE '22_';
COMMIT;
/*Update both flights starting with flight_id: 14_ and assign pilot: N/A, copilot: N/A, 
    and flightattendants: 548-68-1810, 494-59-0750, N/A, N/A
    to it*/
BEGIN;
UPDATE flightassignment SET pilot = 'N/A', copilot = 'N/A', flight_attendant_1 = '548-68-1810', flight_attendant_2 = '494-59-0750', 
flight_attendant_3 = 'N/A', flight_attendant_4 = 'N/A'
WHERE flight_id LIKE '14_';
COMMIT;
/*Update both flights starting with flight_id: 01_ and assign pilot: N/A, copilot: N/A, 
    and flightattendants: N/A, N/A, N/A, N/A
    to it*/
BEGIN;
UPDATE flightassignment SET pilot = 'N/A', copilot = 'N/A', flight_attendant_1 = 'N/A', flight_attendant_2 = 'N/A', 
flight_attendant_3 = 'N/A', flight_attendant_4 = 'N/A'
WHERE flight_id LIKE '01_';
COMMIT;
/*Update both flights starting with flight_id: 14_ and assign pilot: N/A, copilot: N/A, 
    and flightattendants: N/A, N/A, N/A, N/A
    to it*/
BEGIN;
UPDATE flightassignment SET pilot = 'N/A', copilot = 'N/A', flight_attendant_1 = 'N/A', flight_attendant_2 = 'N/A', 
flight_attendant_3 = 'N/A', flight_attendant_4 = 'N/A'
WHERE flight_id LIKE '14_';
COMMIT;
/*Insert a new employee: 704-09-4153 into employee table with the name: a a, email: ariyuneasaki@gmail.com
    , gender: Female, street address: 1, city: 1, country: Brazil, 
    job: pilot, current airport code: PEK, sick leave: 9, vacation days: 16. We also insert this 
    employee into payment and set their normal hours, overtime_hours,
    taxes and monthly salary to 0.*/
BEGIN;
INSERT INTO employee (social_security_num, first_name, last_name, email, gender, street_num, city, country, job, current_airport_code, sick_leave, vacation_days)
VALUES ('704-09-4153','a','a','ariyuneasaki@gmail.com','Female','1','1','Brazil','pilot','PEK',9,16);
INSERT INTO payment (social_security_num, job, normal_hours, overtime_hours, taxes, monthly_salary)
VALUES ('704-09-4153', 'pilot', 0, 0, 0, 0);
COMMIT;
/*Update both flights starting with flight_id: 04_ and assign pilot: 704-09-4153, copilot: N/A, 
    and flightattendants: N/A, N/A, N/A, N/A
    to it*/
BEGIN;
UPDATE flightassignment SET pilot = '704-09-4153', copilot = 'N/A', flight_attendant_1 = 'N/A', flight_attendant_2 = 'N/A', 
flight_attendant_3 = 'N/A', flight_attendant_4 = 'N/A'
WHERE flight_id LIKE '04_';
COMMIT;
/*Update the normal hours, overtime hours, taxes and monthly salary in the payment table for employees: 704-09-4153*/
BEGIN;
Update payment
SET normal_hours = CASE social_security_num
                     WHEN '704-09-4153' THEN 22
                   END,
    overtime_hours = CASE social_security_num
                     WHEN '704-09-4153' THEN 0
                   END,
    taxes = CASE social_security_num
                     WHEN '704-09-4153' THEN 431.20
                   END,
    monthly_salary = CASE social_security_num
                     WHEN '704-09-4153' THEN 1108.80
                   END
WHERE social_security_num IN ('704-09-4153');
COMMIT;
/*Insert a new employee: 820-27-4352 into employee table with the name: a b, email: ariyuneasaki@gmail.com
    , gender: Female, street address: a, city: a, country: Brazil, 
    job: pilot, current airport code: PEK, sick leave: 9, vacation days: 16. We also insert this 
    employee into payment and set their normal hours, overtime_hours,
    taxes and monthly salary to 0.*/
BEGIN;
INSERT INTO employee (social_security_num, first_name, last_name, email, gender, street_num, city, country, job, current_airport_code, sick_leave, vacation_days)
VALUES ('820-27-4352','a','b','ariyuneasaki@gmail.com','Female','a','a','Brazil','pilot','PEK',9,16);
INSERT INTO payment (social_security_num, job, normal_hours, overtime_hours, taxes, monthly_salary)
VALUES ('820-27-4352', 'pilot', 0, 0, 0, 0);
COMMIT;
/*Insert a new employee: 631-99-8765 into employee table with the name: Aa Bb, email: ariyuneasaki@gmail.com
    , gender: Female, street address: a, city: a, country: Brazil, 
    job: pilot, current airport code: PEK, sick leave: 9, vacation days: 16. We also insert this 
    employee into payment and set their normal hours, overtime_hours,
    taxes and monthly salary to 0.*/
BEGIN;
INSERT INTO employee (social_security_num, first_name, last_name, email, gender, street_num, city, country, job, current_airport_code, sick_leave, vacation_days)
VALUES ('631-99-8765','Aa','Bb','ariyuneasaki@gmail.com','Female','a','a','Brazil','pilot','PEK',9,16);
INSERT INTO payment (social_security_num, job, normal_hours, overtime_hours, taxes, monthly_salary)
VALUES ('631-99-8765', 'pilot', 0, 0, 0, 0);
COMMIT;
/*Insert a new employee: 218-24-7059 into employee table with the name: Aa Bb, email: ariyuneasaki@gmail.com
    , gender: Female, street address: a, city: a, country: Brazil, 
    job: pilot, current airport code: CDG, sick leave: 9, vacation days: 16. We also insert this 
    employee into payment and set their normal hours, overtime_hours,
    taxes and monthly salary to 0.*/
BEGIN;
INSERT INTO employee (social_security_num, first_name, last_name, email, gender, street_num, city, country, job, current_airport_code, sick_leave, vacation_days)
VALUES ('218-24-7059','Aa','Bb','ariyuneasaki@gmail.com','Female','a','a','Brazil','pilot','CDG',9,16);
INSERT INTO payment (social_security_num, job, normal_hours, overtime_hours, taxes, monthly_salary)
VALUES ('218-24-7059', 'pilot', 0, 0, 0, 0);
COMMIT;
/*Update the normal hours, overtime hours, taxes and monthly salary in the payment table for employees: 704-09-4153*/
BEGIN;
Update payment
SET normal_hours = CASE social_security_num
                     WHEN '704-09-4153' THEN 22
                   END,
    overtime_hours = CASE social_security_num
                     WHEN '704-09-4153' THEN 0
                   END,
    taxes = CASE social_security_num
                     WHEN '704-09-4153' THEN 431.20
                   END,
    monthly_salary = CASE social_security_num
                     WHEN '704-09-4153' THEN 1108.80
                   END
WHERE social_security_num IN ('704-09-4153');
COMMIT;
/*Update both flights starting with flight_id: 03_ and assign pilot: 218-24-7059, copilot: N/A, 
    and flightattendants: N/A, N/A, N/A, N/A
    to it*/
BEGIN;
UPDATE flightassignment SET pilot = '218-24-7059', copilot = 'N/A', flight_attendant_1 = 'N/A', flight_attendant_2 = 'N/A', 
flight_attendant_3 = 'N/A', flight_attendant_4 = 'N/A'
WHERE flight_id LIKE '03_';
COMMIT;
/*Update the normal hours, overtime hours, taxes and monthly salary in the payment table for employees: 218-24-7059, 704-09-4153*/
BEGIN;
Update payment
SET normal_hours = CASE social_security_num
                     WHEN '218-24-7059' THEN 22
                     WHEN '704-09-4153' THEN 22
                   END,
    overtime_hours = CASE social_security_num
                     WHEN '218-24-7059' THEN 0
                     WHEN '704-09-4153' THEN 0
                   END,
    taxes = CASE social_security_num
                     WHEN '218-24-7059' THEN 431.20
                     WHEN '704-09-4153' THEN 431.20
                   END,
    monthly_salary = CASE social_security_num
                     WHEN '218-24-7059' THEN 1108.80
                     WHEN '704-09-4153' THEN 1108.80
                   END
WHERE social_security_num IN ('218-24-7059', '704-09-4153');
COMMIT;
