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
/*Insert a new employee: 968-94-8025 into employee table with the name: AAAA AAAA, email: ariyuneasaki@gmail.com
    , gender: Female, street address: 1231, city: 12312, country: Australia, 
    job: pilot, and current airport code: PEK. We also insert this employee into payment and set their normal hours, overtime_hours,
    taxes and monthly salary to 0.*/
BEGIN;
INSERT INTO employee (social_security_num, first_name, last_name, email, gender, street_num, city, country, job, current_airport_code)
VALUES ('968-94-8025','AAAA','AAAA','ariyuneasaki@gmail.com','Female','1231','12312','Australia','pilot','PEK');
INSERT INTO payment (social_security_num, job, normal_hours, overtime_hours, taxes, monthly_salary)
VALUES ('968-94-8025', 'pilot', 0, 0, 0, 0);
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
/*Update both flights starting with flight_id: 04_ and assign pilot: 968-94-8025, copilot: N/A, 
    and flightattendants: N/A, N/A, N/A, N/A
    to it*/
BEGIN;
UPDATE flightassignment SET pilot = '968-94-8025', copilot = 'N/A', flight_attendant_1 = 'N/A', flight_attendant_2 = 'N/A', 
flight_attendant_3 = 'N/A', flight_attendant_4 = 'N/A'
WHERE flight_id LIKE '04_';
COMMIT;
/*Update the normal hours, overtime hours, taxes and monthly salary in the payment table for employees: 545-56-1535, 968-94-8025*/
BEGIN;
Update payment
SET normal_hours = CASE social_security_num
                     WHEN '545-56-1535' THEN 26
                     WHEN '968-94-8025' THEN 22
                   END,
    overtime_hours = CASE social_security_num
                     WHEN '545-56-1535' THEN 0
                     WHEN '968-94-8025' THEN 0
                   END,
    taxes = CASE social_security_num
                     WHEN '545-56-1535' THEN 473.20
                     WHEN '968-94-8025' THEN 508.20
                   END,
    monthly_salary = CASE social_security_num
                     WHEN '545-56-1535' THEN 1216.80
                     WHEN '968-94-8025' THEN 1031.80
                   END
WHERE social_security_num IN ('545-56-1535', '968-94-8025');
COMMIT;
/*Insert a new employee: 898-08-9865 into employee table with the name: A A, email: ariyuneasaki@gmail.com
    , gender: Female, street address: A, city: A, country: Brazil, 
    job: pilot, and current airport code: PEK. We also insert this employee into payment and set their normal hours, overtime_hours,
    taxes and monthly salary to 0.*/
BEGIN;
INSERT INTO employee (social_security_num, first_name, last_name, email, gender, street_num, city, country, job, current_airport_code)
VALUES ('898-08-9865','A','A','ariyuneasaki@gmail.com','Female','A','A','Brazil','pilot','PEK');
INSERT INTO payment (social_security_num, job, normal_hours, overtime_hours, taxes, monthly_salary)
VALUES ('898-08-9865', 'pilot', 0, 0, 0, 0);
COMMIT;
/*Insert a new employee: 987-52-0519 into employee table with the name: A A, email: ariyuneasaki@gmail.com
    , gender: Female, street address: A, city: A, country: Brazil, 
    job: copilot, and current airport code: PEK. We also insert this employee into payment and set their normal hours, overtime_hours,
    taxes and monthly salary to 0.*/
BEGIN;
INSERT INTO employee (social_security_num, first_name, last_name, email, gender, street_num, city, country, job, current_airport_code)
VALUES ('987-52-0519','A','A','ariyuneasaki@gmail.com','Female','A','A','Brazil','copilot','PEK');
INSERT INTO payment (social_security_num, job, normal_hours, overtime_hours, taxes, monthly_salary)
VALUES ('987-52-0519', 'copilot', 0, 0, 0, 0);
COMMIT;
/*Insert a new employee: 703-62-4133 into employee table with the name: A A, email: ariyuneasaki@gmail.com
    , gender: Female, street address: A, city: A, country: Brazil, 
    job: ground crew, and current airport code: PEK. We also insert this employee into payment and set their normal hours, overtime_hours,
    taxes and monthly salary to 0.*/
BEGIN;
INSERT INTO employee (social_security_num, first_name, last_name, email, gender, street_num, city, country, job, current_airport_code)
VALUES ('703-62-4133','A','A','ariyuneasaki@gmail.com','Female','A','A','Brazil','ground crew','PEK');
INSERT INTO payment (social_security_num, job, normal_hours, overtime_hours, taxes, monthly_salary)
VALUES ('703-62-4133', 'ground crew', 0, 0, 0, 0);
COMMIT;
/*Insert a new employee: 159-25-1743 into employee table with the name: A A, email: ariyuneasaki@gmail.com
    , gender: Female, street address: A, city: A, country: Brazil, 
    job: flight attendant, and current airport code: PEK. We also insert this employee into payment and set their normal hours, overtime_hours,
    taxes and monthly salary to 0.*/
BEGIN;
INSERT INTO employee (social_security_num, first_name, last_name, email, gender, street_num, city, country, job, current_airport_code)
VALUES ('159-25-1743','A','A','ariyuneasaki@gmail.com','Female','A','A','Brazil','flight attendant','PEK');
INSERT INTO payment (social_security_num, job, normal_hours, overtime_hours, taxes, monthly_salary)
VALUES ('159-25-1743', 'flight attendant', 0, 0, 0, 0);
COMMIT;
/*Insert a new employee: 993-23-7321 into employee table with the name: A A, email: ariyuneasaki@gmail.com
    , gender: Female, street address: A, city: A, country: Brazil, 
    job: office worker, and current airport code: PEK. We also insert this employee into payment and set their normal hours, overtime_hours,
    taxes and monthly salary to 0.*/
BEGIN;
INSERT INTO employee (social_security_num, first_name, last_name, email, gender, street_num, city, country, job, current_airport_code)
VALUES ('993-23-7321','A','A','ariyuneasaki@gmail.com','Female','A','A','Brazil','office worker','PEK');
INSERT INTO payment (social_security_num, job, normal_hours, overtime_hours, taxes, monthly_salary)
VALUES ('993-23-7321', 'office worker', 0, 0, 0, 0);
COMMIT;
/*Update both flights starting with flight_id: 04_ and assign pilot: 898-08-9865, copilot: 987-52-0519, 
    and flightattendants: 159-25-1743, 377-44-5943, 876-04-4208, 744-70-9032
    to it*/
BEGIN;
UPDATE flightassignment SET pilot = '898-08-9865', copilot = '987-52-0519', flight_attendant_1 = '159-25-1743', flight_attendant_2 = '377-44-5943', 
flight_attendant_3 = '876-04-4208', flight_attendant_4 = '744-70-9032'
WHERE flight_id LIKE '04_';
COMMIT;
/*Update the normal hours, overtime hours, taxes and monthly salary in the payment table for employees: 377-44-5943, 876-04-4208, 744-70-9032, 898-08-9865, 987-52-0519, 159-25-1743*/
BEGIN;
Update payment
SET normal_hours = CASE social_security_num
                     WHEN '377-44-5943' THEN 22
                     WHEN '876-04-4208' THEN 22
                     WHEN '744-70-9032' THEN 22
                     WHEN '898-08-9865' THEN 22
                     WHEN '987-52-0519' THEN 22
                     WHEN '159-25-1743' THEN 22
                   END,
    overtime_hours = CASE social_security_num
                     WHEN '377-44-5943' THEN 0
                     WHEN '876-04-4208' THEN 0
                     WHEN '744-70-9032' THEN 0
                     WHEN '898-08-9865' THEN 0
                     WHEN '987-52-0519' THEN 0
                     WHEN '159-25-1743' THEN 0
                   END,
    taxes = CASE social_security_num
                     WHEN '377-44-5943' THEN 292.60
                     WHEN '876-04-4208' THEN 292.60
                     WHEN '744-70-9032' THEN 292.60
                     WHEN '898-08-9865' THEN 431.20
                     WHEN '987-52-0519' THEN 400.40
                     WHEN '159-25-1743' THEN 234.08
                   END,
    monthly_salary = CASE social_security_num
                     WHEN '377-44-5943' THEN 543.40
                     WHEN '876-04-4208' THEN 543.40
                     WHEN '744-70-9032' THEN 543.40
                     WHEN '898-08-9865' THEN 1108.80
                     WHEN '987-52-0519' THEN 1029.60
                     WHEN '159-25-1743' THEN 601.92
                   END
WHERE social_security_num IN ('377-44-5943', '876-04-4208', '744-70-9032', '898-08-9865', '987-52-0519', '159-25-1743');
COMMIT;
/*Update shiftid: 1 and assign groundworkers: 703-62-4133, N/A 
    and office workers: 993-23-7321, N/A to it*/
BEGIN;
UPDATE officeshift 
SET ground_worker_1 = '703-62-4133', ground_worker_2 = 'N/A', office_worker_1 = '993-23-7321', office_worker_2 = 'N/A'
WHERE shift_id = 1;
COMMIT;
/*Update shiftid: 1 and assign groundworkers: 703-62-4133, N/A 
    and office workers: 993-23-7321, N/A to it*/
BEGIN;
BEGIN;
UPDATE officeshift 
SET ground_worker_1 = '703-62-4133', ground_worker_2 = 'N/A', office_worker_1 = '993-23-7321', office_worker_2 = 'N/A'
WHERE shift_id = 1;
COMMIT;
COMMIT;
/*Update shiftid: 1 and assign groundworkers: 703-62-4133, N/A 
    and office workers: 993-23-7321, N/A to it*/
BEGIN;
BEGIN;
BEGIN;
UPDATE officeshift 
SET ground_worker_1 = '703-62-4133', ground_worker_2 = 'N/A', office_worker_1 = '993-23-7321', office_worker_2 = 'N/A'
WHERE shift_id = 1;
COMMIT;
COMMIT;
COMMIT;
/*Update the normal hours, overtime hours, taxes and monthly salary in the payment table for employees: 377-44-5943, 876-04-4208, 744-70-9032, 898-08-9865, 987-52-0519, 703-62-4133, 159-25-1743, 993-23-7321*/
BEGIN;
Update payment
SET normal_hours = CASE social_security_num
                     WHEN '377-44-5943' THEN 22
                     WHEN '876-04-4208' THEN 22
                     WHEN '744-70-9032' THEN 22
                     WHEN '898-08-9865' THEN 22
                     WHEN '987-52-0519' THEN 22
                     WHEN '703-62-4133' THEN 8
                     WHEN '159-25-1743' THEN 22
                     WHEN '993-23-7321' THEN 8
                   END,
    overtime_hours = CASE social_security_num
                     WHEN '377-44-5943' THEN 0
                     WHEN '876-04-4208' THEN 0
                     WHEN '744-70-9032' THEN 0
                     WHEN '898-08-9865' THEN 0
                     WHEN '987-52-0519' THEN 0
                     WHEN '703-62-4133' THEN 0
                     WHEN '159-25-1743' THEN 0
                     WHEN '993-23-7321' THEN 0
                   END,
    taxes = CASE social_security_num
                     WHEN '377-44-5943' THEN 292.60
                     WHEN '876-04-4208' THEN 292.60
                     WHEN '744-70-9032' THEN 292.60
                     WHEN '898-08-9865' THEN 431.20
                     WHEN '987-52-0519' THEN 400.40
                     WHEN '703-62-4133' THEN 44.80
                     WHEN '159-25-1743' THEN 234.08
                     WHEN '993-23-7321' THEN 56.00
                   END,
    monthly_salary = CASE social_security_num
                     WHEN '377-44-5943' THEN 543.40
                     WHEN '876-04-4208' THEN 543.40
                     WHEN '744-70-9032' THEN 543.40
                     WHEN '898-08-9865' THEN 1108.80
                     WHEN '987-52-0519' THEN 1029.60
                     WHEN '703-62-4133' THEN 115.20
                     WHEN '159-25-1743' THEN 601.92
                     WHEN '993-23-7321' THEN 144.00
                   END
WHERE social_security_num IN ('377-44-5943', '876-04-4208', '744-70-9032', '898-08-9865', '987-52-0519', '703-62-4133', '159-25-1743', '993-23-7321');
COMMIT;
/*Update the normal hours, overtime hours, taxes and monthly salary in the payment table for employees: 377-44-5943, 876-04-4208, 744-70-9032, 898-08-9865, 987-52-0519, 703-62-4133, 159-25-1743, 993-23-7321*/
BEGIN;
Update payment
SET normal_hours = CASE social_security_num
                     WHEN '377-44-5943' THEN 22
                     WHEN '876-04-4208' THEN 22
                     WHEN '744-70-9032' THEN 22
                     WHEN '898-08-9865' THEN 22
                     WHEN '987-52-0519' THEN 22
                     WHEN '703-62-4133' THEN 8
                     WHEN '159-25-1743' THEN 22
                     WHEN '993-23-7321' THEN 8
                   END,
    overtime_hours = CASE social_security_num
                     WHEN '377-44-5943' THEN 0
                     WHEN '876-04-4208' THEN 0
                     WHEN '744-70-9032' THEN 0
                     WHEN '898-08-9865' THEN 0
                     WHEN '987-52-0519' THEN 0
                     WHEN '703-62-4133' THEN 0
                     WHEN '159-25-1743' THEN 0
                     WHEN '993-23-7321' THEN 0
                   END,
    taxes = CASE social_security_num
                     WHEN '377-44-5943' THEN 292.60
                     WHEN '876-04-4208' THEN 292.60
                     WHEN '744-70-9032' THEN 292.60
                     WHEN '898-08-9865' THEN 431.20
                     WHEN '987-52-0519' THEN 400.40
                     WHEN '703-62-4133' THEN 44.80
                     WHEN '159-25-1743' THEN 234.08
                     WHEN '993-23-7321' THEN 56.00
                   END,
    monthly_salary = CASE social_security_num
                     WHEN '377-44-5943' THEN 543.40
                     WHEN '876-04-4208' THEN 543.40
                     WHEN '744-70-9032' THEN 543.40
                     WHEN '898-08-9865' THEN 1108.80
                     WHEN '987-52-0519' THEN 1029.60
                     WHEN '703-62-4133' THEN 115.20
                     WHEN '159-25-1743' THEN 601.92
                     WHEN '993-23-7321' THEN 144.00
                   END
WHERE social_security_num IN ('377-44-5943', '876-04-4208', '744-70-9032', '898-08-9865', '987-52-0519', '703-62-4133', '159-25-1743', '993-23-7321');
COMMIT;
/*Update the normal hours, overtime hours, taxes and monthly salary in the payment table for employees: 377-44-5943, 876-04-4208, 744-70-9032, 898-08-9865, 987-52-0519, 703-62-4133, 159-25-1743, 993-23-7321*/
BEGIN;
Update payment
SET normal_hours = CASE social_security_num
                     WHEN '377-44-5943' THEN 22
                     WHEN '876-04-4208' THEN 22
                     WHEN '744-70-9032' THEN 22
                     WHEN '898-08-9865' THEN 22
                     WHEN '987-52-0519' THEN 22
                     WHEN '703-62-4133' THEN 8
                     WHEN '159-25-1743' THEN 22
                     WHEN '993-23-7321' THEN 8
                   END,
    overtime_hours = CASE social_security_num
                     WHEN '377-44-5943' THEN 0
                     WHEN '876-04-4208' THEN 0
                     WHEN '744-70-9032' THEN 0
                     WHEN '898-08-9865' THEN 0
                     WHEN '987-52-0519' THEN 0
                     WHEN '703-62-4133' THEN 0
                     WHEN '159-25-1743' THEN 0
                     WHEN '993-23-7321' THEN 0
                   END,
    taxes = CASE social_security_num
                     WHEN '377-44-5943' THEN 292.60
                     WHEN '876-04-4208' THEN 292.60
                     WHEN '744-70-9032' THEN 292.60
                     WHEN '898-08-9865' THEN 431.20
                     WHEN '987-52-0519' THEN 400.40
                     WHEN '703-62-4133' THEN 44.80
                     WHEN '159-25-1743' THEN 234.08
                     WHEN '993-23-7321' THEN 56.00
                   END,
    monthly_salary = CASE social_security_num
                     WHEN '377-44-5943' THEN 543.40
                     WHEN '876-04-4208' THEN 543.40
                     WHEN '744-70-9032' THEN 543.40
                     WHEN '898-08-9865' THEN 1108.80
                     WHEN '987-52-0519' THEN 1029.60
                     WHEN '703-62-4133' THEN 115.20
                     WHEN '159-25-1743' THEN 601.92
                     WHEN '993-23-7321' THEN 144.00
                   END
WHERE social_security_num IN ('377-44-5943', '876-04-4208', '744-70-9032', '898-08-9865', '987-52-0519', '703-62-4133', '159-25-1743', '993-23-7321');
COMMIT;
/*Update shiftid: 1 and assign groundworkers: 689-20-0248, N/A 
    and office workers: N/A, N/A to it*/
BEGIN;
UPDATE officeshift 
SET ground_worker_1 = '689-20-0248', ground_worker_2 = 'N/A', office_worker_1 = 'N/A', office_worker_2 = 'N/A'
WHERE shift_id = 1;
COMMIT;
/*Update the normal hours, overtime hours, taxes and monthly salary in the payment table for employees: 689-20-0248*/
BEGIN;
Update payment
SET normal_hours = CASE social_security_num
                     WHEN '689-20-0248' THEN 8
                   END,
    overtime_hours = CASE social_security_num
                     WHEN '689-20-0248' THEN 0
                   END,
    taxes = CASE social_security_num
                     WHEN '689-20-0248' THEN 70.00
                   END,
    monthly_salary = CASE social_security_num
                     WHEN '689-20-0248' THEN 130.00
                   END
WHERE social_security_num IN ('689-20-0248');
COMMIT;
/*Update shiftid: 1 and assign groundworkers: 158-61-5318, N/A 
    and office workers: N/A, N/A to it*/
BEGIN;
UPDATE officeshift 
SET ground_worker_1 = '158-61-5318', ground_worker_2 = 'N/A', office_worker_1 = 'N/A', office_worker_2 = 'N/A'
WHERE shift_id = 1;
COMMIT;
/*Update the normal hours, overtime hours, taxes and monthly salary in the payment table for employees: 158-61-5318*/
BEGIN;
Update payment
SET normal_hours = CASE social_security_num
                     WHEN '158-61-5318' THEN 8
                   END,
    overtime_hours = CASE social_security_num
                     WHEN '158-61-5318' THEN 0
                   END,
    taxes = CASE social_security_num
                     WHEN '158-61-5318' THEN 70.00
                   END,
    monthly_salary = CASE social_security_num
                     WHEN '158-61-5318' THEN 130.00
                   END
WHERE social_security_num IN ('158-61-5318');
COMMIT;
/*Update the normal hours, overtime hours, taxes and monthly salary in the payment table for employees: 158-61-5318*/
BEGIN;
Update payment
SET normal_hours = CASE social_security_num
                     WHEN '158-61-5318' THEN 8
                   END,
    overtime_hours = CASE social_security_num
                     WHEN '158-61-5318' THEN 0
                   END,
    taxes = CASE social_security_num
                     WHEN '158-61-5318' THEN 70.00
                   END,
    monthly_salary = CASE social_security_num
                     WHEN '158-61-5318' THEN 130.00
                   END
WHERE social_security_num IN ('158-61-5318');
COMMIT;
/*Insert a new employee: 935-23-5959 into employee table with the name: A A, email: ariyuneasaki@gmail.com
    , gender: Female, street address: A, city: A, country: Brazil, 
    job: pilot, and current airport code: PEK. We also insert this employee into payment and set their normal hours, overtime_hours,
    taxes and monthly salary to 0.*/
BEGIN;
INSERT INTO employee (social_security_num, first_name, last_name, email, gender, street_num, city, country, job, current_airport_code)
VALUES ('935-23-5959','A','A','ariyuneasaki@gmail.com','Female','A','A','Brazil','pilot','PEK');
INSERT INTO payment (social_security_num, job, normal_hours, overtime_hours, taxes, monthly_salary)
VALUES ('935-23-5959', 'pilot', 0, 0, 0, 0);
COMMIT;
/*Insert a new employee: 462-75-3491 into employee table with the name: A A, email: ariyuneasaki@gmail.com
    , gender: Female, street address: A, city: A, country: Brazil, 
    job: ground crew, and current airport code: PEK. We also insert this employee into payment and set their normal hours, overtime_hours,
    taxes and monthly salary to 0.*/
BEGIN;
INSERT INTO employee (social_security_num, first_name, last_name, email, gender, street_num, city, country, job, current_airport_code)
VALUES ('462-75-3491','A','A','ariyuneasaki@gmail.com','Female','A','A','Brazil','ground crew','PEK');
INSERT INTO payment (social_security_num, job, normal_hours, overtime_hours, taxes, monthly_salary)
VALUES ('462-75-3491', 'ground crew', 0, 0, 0, 0);
COMMIT;
/*Insert a new employee: 687-95-5577 into employee table with the name: A A, email: ariyuneasaki@gmail.com
    , gender: Female, street address: A, city: A, country: Brazil, 
    job: office worker, and current airport code: PEK. We also insert this employee into payment and set their normal hours, overtime_hours,
    taxes and monthly salary to 0.*/
BEGIN;
INSERT INTO employee (social_security_num, first_name, last_name, email, gender, street_num, city, country, job, current_airport_code)
VALUES ('687-95-5577','A','A','ariyuneasaki@gmail.com','Female','A','A','Brazil','office worker','PEK');
INSERT INTO payment (social_security_num, job, normal_hours, overtime_hours, taxes, monthly_salary)
VALUES ('687-95-5577', 'office worker', 0, 0, 0, 0);
COMMIT;
/*Insert a new employee: 749-29-6226 into employee table with the name: A A, email: ariyuneasaki@gmail.com
    , gender: Female, street address: A, city: A, country: Brazil, 
    job: office worker, and current airport code: GRU. We also insert this employee into payment and set their normal hours, overtime_hours,
    taxes and monthly salary to 0.*/
BEGIN;
INSERT INTO employee (social_security_num, first_name, last_name, email, gender, street_num, city, country, job, current_airport_code)
VALUES ('749-29-6226','A','A','ariyuneasaki@gmail.com','Female','A','A','Brazil','office worker','GRU');
INSERT INTO payment (social_security_num, job, normal_hours, overtime_hours, taxes, monthly_salary)
VALUES ('749-29-6226', 'office worker', 0, 0, 0, 0);
COMMIT;
/*Insert a new employee: 715-16-1171 into employee table with the name: A A, email: ariyuneasaki@gmail.com
    , gender: Female, street address: A, city: A, country: Brazil, 
    job: office worker, and current airport code: LAX. We also insert this employee into payment and set their normal hours, overtime_hours,
    taxes and monthly salary to 0.*/
BEGIN;
INSERT INTO employee (social_security_num, first_name, last_name, email, gender, street_num, city, country, job, current_airport_code)
VALUES ('715-16-1171','A','A','ariyuneasaki@gmail.com','Female','A','A','Brazil','office worker','LAX');
INSERT INTO payment (social_security_num, job, normal_hours, overtime_hours, taxes, monthly_salary)
VALUES ('715-16-1171', 'office worker', 0, 0, 0, 0);
COMMIT;
/*Update shiftid: 73 and assign groundworkers: N/A, N/A 
    and office workers: 749-29-6226, N/A to it*/
BEGIN;
UPDATE officeshift 
SET ground_worker_1 = 'N/A', ground_worker_2 = 'N/A', office_worker_1 = '749-29-6226', office_worker_2 = 'N/A'
WHERE shift_id = 73;
COMMIT;
/*Update shiftid: 37 and assign groundworkers: N/A, N/A 
    and office workers: 715-16-1171, N/A to it*/
BEGIN;
UPDATE officeshift 
SET ground_worker_1 = 'N/A', ground_worker_2 = 'N/A', office_worker_1 = '715-16-1171', office_worker_2 = 'N/A'
WHERE shift_id = 37;
COMMIT;
/*Update shiftid: 1 and assign groundworkers: N/A, 462-75-3491 
    and office workers: N/A, N/A to it*/
BEGIN;
UPDATE officeshift 
SET ground_worker_1 = 'N/A', ground_worker_2 = '462-75-3491', office_worker_1 = 'N/A', office_worker_2 = 'N/A'
WHERE shift_id = 1;
COMMIT;
/*Update the normal hours, overtime hours, taxes and monthly salary in the payment table for employees: 462-75-3491, 749-29-6226, 715-16-1171*/
BEGIN;
Update payment
SET normal_hours = CASE social_security_num
                     WHEN '462-75-3491' THEN 8
                     WHEN '749-29-6226' THEN 8
                     WHEN '715-16-1171' THEN 8
                   END,
    overtime_hours = CASE social_security_num
                     WHEN '462-75-3491' THEN 0
                     WHEN '749-29-6226' THEN 0
                     WHEN '715-16-1171' THEN 0
                   END,
    taxes = CASE social_security_num
                     WHEN '462-75-3491' THEN 56.00
                     WHEN '749-29-6226' THEN 67.20
                     WHEN '715-16-1171' THEN 67.20
                   END,
    monthly_salary = CASE social_security_num
                     WHEN '462-75-3491' THEN 144.00
                     WHEN '749-29-6226' THEN 172.80
                     WHEN '715-16-1171' THEN 172.80
                   END
WHERE social_security_num IN ('462-75-3491', '749-29-6226', '715-16-1171');
COMMIT;
/*Update the normal hours, overtime hours, taxes and monthly salary in the payment table for employees: 462-75-3491, 749-29-6226, 715-16-1171*/
BEGIN;
Update payment
SET normal_hours = CASE social_security_num
                     WHEN '462-75-3491' THEN 8
                     WHEN '749-29-6226' THEN 8
                     WHEN '715-16-1171' THEN 8
                   END,
    overtime_hours = CASE social_security_num
                     WHEN '462-75-3491' THEN 0
                     WHEN '749-29-6226' THEN 0
                     WHEN '715-16-1171' THEN 0
                   END,
    taxes = CASE social_security_num
                     WHEN '462-75-3491' THEN 56.00
                     WHEN '749-29-6226' THEN 67.20
                     WHEN '715-16-1171' THEN 67.20
                   END,
    monthly_salary = CASE social_security_num
                     WHEN '462-75-3491' THEN 144.00
                     WHEN '749-29-6226' THEN 172.80
                     WHEN '715-16-1171' THEN 172.80
                   END
WHERE social_security_num IN ('462-75-3491', '749-29-6226', '715-16-1171');
COMMIT;
