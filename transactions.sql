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
