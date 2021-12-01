SELECT social_security_num, job, normal_hours, CAST (payrate AS FLOAT), overtime_hours, CAST (overtime_payrate AS FLOAT), (normal_hours * payrate + overtime_hours * overtime_payrate) * taxes AS taxes, (normal_hours * payrate + overtime_hours * overtime_payrate) * (1 - taxes) AS monthly_salary
FROM (
  SELECT t1.social_security_num, job, taxes, payrate, overtime_payrate,
      CASE    
          WHEN hours_worked - 40 <= 0 THEN hours_worked
          WHEN hours_worked - 40 > 0 THEN 40
      END normal_hours,
      CASE
          WHEN hours_worked - 40 <= 0 THEN 0
          WHEN hours_worked - 40 > 0 THEN hours_worked - 40
      END overtime_hours
  FROM 
      (SELECT pilot AS social_security_num, SUM(DATE_PART('day', scheduled_arrival_time - scheduled_departure_time) * 24 + 
          DATE_PART('hour', scheduled_arrival_time - scheduled_departure_time)) AS hours_worked
      FROM flightassignment
      WHERE pilot NOT LIKE 'N/A'
      GROUP BY pilot
      UNION
      SELECT copilot AS social_security_num, SUM(DATE_PART('day', scheduled_arrival_time - scheduled_departure_time) * 24 + 
          DATE_PART('hour', scheduled_arrival_time - scheduled_departure_time)) AS hours_worked
      FROM flightassignment
      WHERE copilot NOT LIKE 'N/A'
      GROUP BY copilot
      UNION
      SELECT flight_attendant_1 AS social_security_num, SUM(DATE_PART('day', scheduled_arrival_time - scheduled_departure_time) * 24 + 
          DATE_PART('hour', scheduled_arrival_time - scheduled_departure_time)) AS hours_worked
      FROM flightassignment
      WHERE flight_attendant_1 NOT LIKE 'N/A'
      GROUP BY flight_attendant_1
      UNION
      SELECT flight_attendant_2 AS social_security_num, SUM(DATE_PART('day', scheduled_arrival_time - scheduled_departure_time) * 24 + 
          DATE_PART('hour', scheduled_arrival_time - scheduled_departure_time)) AS hours_worked
      FROM flightassignment
      WHERE flight_attendant_2 NOT LIKE 'N/A'
      GROUP BY flight_attendant_2
      UNION
      SELECT flight_attendant_3 AS social_security_num, SUM(DATE_PART('day', scheduled_arrival_time - scheduled_departure_time) * 24 + 
          DATE_PART('hour', scheduled_arrival_time - scheduled_departure_time)) AS hours_worked
      FROM flightassignment
      WHERE flight_attendant_3 NOT LIKE 'N/A'
      GROUP BY flight_attendant_3
      UNION
      SELECT flight_attendant_4 AS social_security_num, SUM(DATE_PART('day', scheduled_arrival_time - scheduled_departure_time) * 24 + 
          DATE_PART('hour', scheduled_arrival_time - scheduled_departure_time)) AS hours_worked
      FROM flightassignment
      WHERE flight_attendant_4 NOT LIKE 'N/A'
      GROUP BY flight_attendant_4
      UNION
      SELECT ground_worker_1 AS social_security_num, SUM(DATE_PART('day', shift_end - shift_start) * 24 + 
          DATE_PART('hour', shift_end - shift_start)) AS hours_worked
      FROM officeshift
      WHERE ground_worker_1 NOT LIKE 'N/A'
      GROUP BY ground_worker_1
      UNION
      SELECT ground_worker_2 AS social_security_num, SUM(DATE_PART('day', shift_end - shift_start) * 24 + 
          DATE_PART('hour', shift_end - shift_start)) AS hours_worked
      FROM officeshift
      WHERE ground_worker_2 NOT LIKE 'N/A'
      GROUP BY ground_worker_2
      UNION
      SELECT office_worker_1 AS social_security_num, SUM(DATE_PART('day', shift_end - shift_start) * 24 + 
          DATE_PART('hour', shift_end - shift_start)) AS hours_worked
      FROM officeshift
      WHERE office_worker_1 NOT LIKE 'N/A'
      GROUP BY office_worker_1
      UNION
      SELECT office_worker_2 AS social_security_num, SUM(DATE_PART('day', shift_end - shift_start) * 24 + 
          DATE_PART('hour', shift_end - shift_start)) AS hours_worked
      FROM officeshift
      WHERE office_worker_2 NOT LIKE 'N/A'
      GROUP BY office_worker_2) AS t1
  JOIN 
      (SELECT employee.job, taxes, social_security_num, payrate, overtime_payrate 
      FROM employee, job, country 
      WHERE employee.job = job.job AND country.country = employee.country) AS t2 
      ON t1.social_security_num = t2.social_security_num
) AS t3;
SELECT * FROM flightassignment;
SELECT social_security_num 
FROM employee 
WHERE current_airport_code = 'GRU' AND job = 'pilot';
SELECT social_security_num 
FROM employee 
WHERE current_airport_code = 'GRU' AND job = 'copilot';
SELECT social_security_num 
FROM employee 
WHERE current_airport_code = 'GRU' AND job = 'flight attendant';
SELECT social_security_num, job, normal_hours, CAST (payrate AS FLOAT), overtime_hours, CAST (overtime_payrate AS FLOAT), (normal_hours * payrate + overtime_hours * overtime_payrate) * taxes AS taxes, (normal_hours * payrate + overtime_hours * overtime_payrate) * (1 - taxes) AS monthly_salary
FROM (
  SELECT t1.social_security_num, job, taxes, payrate, overtime_payrate,
      CASE    
          WHEN hours_worked - 40 <= 0 THEN hours_worked
          WHEN hours_worked - 40 > 0 THEN 40
      END normal_hours,
      CASE
          WHEN hours_worked - 40 <= 0 THEN 0
          WHEN hours_worked - 40 > 0 THEN hours_worked - 40
      END overtime_hours
  FROM 
      (SELECT pilot AS social_security_num, SUM(DATE_PART('day', scheduled_arrival_time - scheduled_departure_time) * 24 + 
          DATE_PART('hour', scheduled_arrival_time - scheduled_departure_time)) AS hours_worked
      FROM flightassignment
      WHERE pilot NOT LIKE 'N/A'
      GROUP BY pilot
      UNION
      SELECT copilot AS social_security_num, SUM(DATE_PART('day', scheduled_arrival_time - scheduled_departure_time) * 24 + 
          DATE_PART('hour', scheduled_arrival_time - scheduled_departure_time)) AS hours_worked
      FROM flightassignment
      WHERE copilot NOT LIKE 'N/A'
      GROUP BY copilot
      UNION
      SELECT flight_attendant_1 AS social_security_num, SUM(DATE_PART('day', scheduled_arrival_time - scheduled_departure_time) * 24 + 
          DATE_PART('hour', scheduled_arrival_time - scheduled_departure_time)) AS hours_worked
      FROM flightassignment
      WHERE flight_attendant_1 NOT LIKE 'N/A'
      GROUP BY flight_attendant_1
      UNION
      SELECT flight_attendant_2 AS social_security_num, SUM(DATE_PART('day', scheduled_arrival_time - scheduled_departure_time) * 24 + 
          DATE_PART('hour', scheduled_arrival_time - scheduled_departure_time)) AS hours_worked
      FROM flightassignment
      WHERE flight_attendant_2 NOT LIKE 'N/A'
      GROUP BY flight_attendant_2
      UNION
      SELECT flight_attendant_3 AS social_security_num, SUM(DATE_PART('day', scheduled_arrival_time - scheduled_departure_time) * 24 + 
          DATE_PART('hour', scheduled_arrival_time - scheduled_departure_time)) AS hours_worked
      FROM flightassignment
      WHERE flight_attendant_3 NOT LIKE 'N/A'
      GROUP BY flight_attendant_3
      UNION
      SELECT flight_attendant_4 AS social_security_num, SUM(DATE_PART('day', scheduled_arrival_time - scheduled_departure_time) * 24 + 
          DATE_PART('hour', scheduled_arrival_time - scheduled_departure_time)) AS hours_worked
      FROM flightassignment
      WHERE flight_attendant_4 NOT LIKE 'N/A'
      GROUP BY flight_attendant_4
      UNION
      SELECT ground_worker_1 AS social_security_num, SUM(DATE_PART('day', shift_end - shift_start) * 24 + 
          DATE_PART('hour', shift_end - shift_start)) AS hours_worked
      FROM officeshift
      WHERE ground_worker_1 NOT LIKE 'N/A'
      GROUP BY ground_worker_1
      UNION
      SELECT ground_worker_2 AS social_security_num, SUM(DATE_PART('day', shift_end - shift_start) * 24 + 
          DATE_PART('hour', shift_end - shift_start)) AS hours_worked
      FROM officeshift
      WHERE ground_worker_2 NOT LIKE 'N/A'
      GROUP BY ground_worker_2
      UNION
      SELECT office_worker_1 AS social_security_num, SUM(DATE_PART('day', shift_end - shift_start) * 24 + 
          DATE_PART('hour', shift_end - shift_start)) AS hours_worked
      FROM officeshift
      WHERE office_worker_1 NOT LIKE 'N/A'
      GROUP BY office_worker_1
      UNION
      SELECT office_worker_2 AS social_security_num, SUM(DATE_PART('day', shift_end - shift_start) * 24 + 
          DATE_PART('hour', shift_end - shift_start)) AS hours_worked
      FROM officeshift
      WHERE office_worker_2 NOT LIKE 'N/A'
      GROUP BY office_worker_2) AS t1
  JOIN 
      (SELECT employee.job, taxes, social_security_num, payrate, overtime_payrate 
      FROM employee, job, country 
      WHERE employee.job = job.job AND country.country = employee.country) AS t2 
      ON t1.social_security_num = t2.social_security_num
) AS t3;
<!--Gets all employees from employee table-->/nSELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
<!--Gets all employees from employee table-->/nSELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
<!--Gets all employees from employee table-->/nSELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
<!--Gets all employees from employee table-->/nSELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
<!--Gets all employees from employee table-->/nSELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
<!--Gets all employees from employee table-->/nSELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
<!--Gets all employees from employee table-->/nSELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
<!--Gets all employees from employee table-->/nSELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
<!--Gets all employees from employee table-->/nSELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
<!--Gets all employees from employee table-->/nSELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
<!--Gets all employees from employee table-->/nSELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
<!--Gets all employees from employee table-->/nSELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
<!--Gets all employees from employee table-->/nSELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
<!--Gets all employees from employee table-->/nSELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
<!--Gets all employees from employee table-->/nSELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
<!--Gets all employees from employee table-->/nSELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
<!--Gets all employees from employee table-->/nSELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
<!--Gets all employees from employee table-->/nSELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
<!--Gets all employees from employee table-->/nSELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
<!--Gets all employees from employee table-->/nSELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
<!--Gets all employees from employee table-->/nSELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
<!--Gets all employees from employee table-->/nSELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
<!--Gets all employees from employee table-->/nSELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
<!--Gets all employees from employee table-->/nSELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
<!--Gets all employees from employee table-->/nSELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
<!--Gets all employees from employee table-->/nSELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
<!--Gets all employees from employee table-->/nSELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
<!--Gets all employees from employee table-->/nSELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
<!--Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
<!--Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
<!--Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
<!--Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
<!--Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
<!--Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->
*/SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->
*/SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->
*/SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->
*/SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->
*/SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->
*/SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->*/
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->*/
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->*/
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->*/
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->*/
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->*/
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->*/
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->*/
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->*/
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->*/
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
