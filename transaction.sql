/*Insert a new employee: 944-84-0485 into employee table with the name: a a, email: ariyuneasaki@gmail.com
    , gender: Female, street address: a, city: a, country: Brazil, 
    job: pilot, current airport code: PEK, sick leave: 9, vacation days: 16. We also insert this 
    employee into payment and set their normal hours, overtime_hours,
    taxes and monthly salary to 0.*/
BEGIN;
INSERT INTO employee (social_security_num, first_name, last_name, email, gender, street_num, city, country, job, current_airport_code, sick_leave, vacation_days)
VALUES ('944-84-0485','a','a','ariyuneasaki@gmail.com','Female','a','a','Brazil','pilot','PEK',9,16);
INSERT INTO payment (social_security_num, job, normal_hours, overtime_hours, taxes, monthly_salary)
VALUES ('944-84-0485', 'pilot', 0, 0, 0, 0);
COMMIT;
/*Insert a new employee: 778-37-1923 into employee table with the name: a a, email: ariyuneasaki@gmail.com
    , gender: Female, street address: a, city: a, country: Brazil, 
    job: pilot, current airport code: PEK, sick leave: 9, vacation days: 16. We also insert this 
    employee into payment and set their normal hours, overtime_hours,
    taxes and monthly salary to 0.*/
BEGIN;
INSERT INTO employee (social_security_num, first_name, last_name, email, gender, street_num, city, country, job, current_airport_code, sick_leave, vacation_days)
VALUES ('778-37-1923','a','a','ariyuneasaki@gmail.com','Female','a','a','Brazil','pilot','PEK',9,16);
INSERT INTO payment (social_security_num, job, normal_hours, overtime_hours, taxes, monthly_salary)
VALUES ('778-37-1923', 'pilot', 0, 0, 0, 0);
COMMIT;
/*Update both flights starting with flight_id: 01_ and assign pilot: N/A, copilot: N/A, 
    and flightattendants: N/A, N/A, N/A, N/A
    to it*/
BEGIN;
UPDATE flightassignment SET pilot = 'N/A', copilot = 'N/A', flight_attendant_1 = 'N/A', flight_attendant_2 = 'N/A', 
flight_attendant_3 = 'N/A', flight_attendant_4 = 'N/A'
WHERE flight_id LIKE '01_';
COMMIT;
/*Update both flights starting with flight_id: 01_ and assign pilot: 605-24-9827, copilot: 280-33-7851, 
    and flightattendants: N/A, N/A, N/A, N/A
    to it*/
BEGIN;
UPDATE flightassignment SET pilot = '605-24-9827', copilot = '280-33-7851', flight_attendant_1 = 'N/A', flight_attendant_2 = 'N/A', 
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
/*Update both flights starting with flight_id: 02_ and assign pilot: 619-11-9230, copilot: 603-14-9498, 
    and flightattendants: 707-94-2947, 691-97-4521, 620-05-0442, 629-54-9891
    to it*/
BEGIN;
UPDATE flightassignment SET pilot = '619-11-9230', copilot = '603-14-9498', flight_attendant_1 = '707-94-2947', flight_attendant_2 = '691-97-4521', 
flight_attendant_3 = '620-05-0442', flight_attendant_4 = '629-54-9891'
WHERE flight_id LIKE '02_';
COMMIT;
/*Update both flights starting with flight_id: 02_ and assign pilot: N/A, copilot: N/A, 
    and flightattendants: N/A, N/A, N/A, N/A
    to it*/
BEGIN;
UPDATE flightassignment SET pilot = 'N/A', copilot = 'N/A', flight_attendant_1 = 'N/A', flight_attendant_2 = 'N/A', 
flight_attendant_3 = 'N/A', flight_attendant_4 = 'N/A'
WHERE flight_id LIKE '02_';
COMMIT;
/*Update shiftid: 1 and assign groundworkers: N/A, N/A 
    and office workers: N/A, 626-55-7190 to it*/
BEGIN;
UPDATE officeshift 
SET ground_worker_1 = 'N/A', ground_worker_2 = 'N/A', office_worker_1 = 'N/A', office_worker_2 = '626-55-7190'
WHERE shift_id = 1;
COMMIT;
/*Update shiftid: 1 and assign groundworkers: N/A, N/A 
    and office workers: N/A, N/A to it*/
BEGIN;
UPDATE officeshift 
SET ground_worker_1 = 'N/A', ground_worker_2 = 'N/A', office_worker_1 = 'N/A', office_worker_2 = 'N/A'
WHERE shift_id = 1;
COMMIT;
/*Update shiftid: 1 and assign groundworkers: N/A, 549-31-5258 
    and office workers: N/A, N/A to it*/
BEGIN;
UPDATE officeshift 
SET ground_worker_1 = 'N/A', ground_worker_2 = '549-31-5258', office_worker_1 = 'N/A', office_worker_2 = 'N/A'
WHERE shift_id = 1;
COMMIT;
