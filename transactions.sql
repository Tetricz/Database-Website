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
