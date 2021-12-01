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
/*Selects all fields from flightassignment table to display-->*/
SELECT * FROM flightassignment;
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->*/
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Selects all fields from officeshift table and airport_code from office table to display-->*/
SELECT shift_id, officeshift.office_id, airport_code, shift_start, shift_end, ground_worker_1, ground_worker_2, office_worker_1, office_worker_2 
FROM officeshift, office 
WHERE officeshift.office_id = office_num;
/*Selects all fields from officeshift table and airport_code from office table to display-->*/
SELECT shift_id, officeshift.office_id, airport_code, shift_start, shift_end, ground_worker_1, ground_worker_2, office_worker_1, office_worker_2 
FROM officeshift, office 
WHERE officeshift.office_id = office_num;
/*Selects all fields from officeshift table and airport_code from office table to display-->*/
SELECT shift_id, officeshift.office_id, airport_code, shift_start, shift_end, ground_worker_1, ground_worker_2, office_worker_1, office_worker_2 
FROM officeshift, office 
WHERE officeshift.office_id = office_num;
/*Selects all fields from officeshift table and airport_code from office table to display-->*/
SELECT shift_id, officeshift.office_id, airport_code, shift_start, shift_end, ground_worker_1, ground_worker_2, office_worker_1, office_worker_2 
FROM officeshift, office 
WHERE officeshift.office_id = office_num;
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
/*Selects all fields from officeshift table and airport_code from office table to display-->*/
SELECT shift_id, officeshift.office_id, airport_code, shift_start, shift_end, ground_worker_1, ground_worker_2, office_worker_1, office_worker_2 
FROM officeshift, office 
WHERE officeshift.office_id = office_num;
/*Selects ssns to assign that have their current_airport_code the same as the office id: 2 airport code and job: ground crew-->*/
SELECT social_security_num FROM employee 
WHERE current_airport_code = 
  (SELECT airport_code
    FROM office
    WHERE office_num = 2) 
    AND job = 'office worker';
/*Selects ssns to assign that have their current_airport_code the same as the office id: 2 airport code and job: office worker-->*/
SELECT social_security_num FROM employee 
WHERE current_airport_code = 
  (SELECT airport_code
    FROM office
    WHERE office_num = 2) 
    AND job = 'office worker';
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->*/
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Selects all fields from officeshift table and airport_code from office table to display-->*/
SELECT shift_id, officeshift.office_id, airport_code, shift_start, shift_end, ground_worker_1, ground_worker_2, office_worker_1, office_worker_2 
FROM officeshift, office 
WHERE officeshift.office_id = office_num;
/*Selects ssns to assign that have their current_airport_code the same as the office id: 2 airport code and job: office worker-->*/
SELECT social_security_num FROM employee 
WHERE current_airport_code = 
  (SELECT airport_code
    FROM office
    WHERE office_num = 2) 
    AND job = 'ground crew';
/*Selects ssns to assign that have their current_airport_code the same as the office id: 2 airport code and job: ground crew-->*/
SELECT social_security_num FROM employee 
WHERE current_airport_code = 
  (SELECT airport_code
    FROM office
    WHERE office_num = 2) 
    AND job = 'ground crew';
/*Selects ssn, hours worked, overtime hours worked, normal payrate, overtime payrate, taxes and
    monthly salary from employee, flightassignmens, job and country tables.
    We find all the flights/office shifts assigned to a social security number, get the total hours worked, place anything worked above 40 hours as overtime,
    then we pull from the job table to get the payrate for the employee and calculate their monthly salary by multiplying hours worked by the appropriate
    payrate. Lastly we get the tax for the employee's country and multiply it by the previous result, and subtract it to get the monthly salary-->*/
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
/*Selects all fields from flightassignment table to display-->*/
SELECT * FROM flightassignment;
/*Selects ssns to assign that have their current_airport_code the same as the flight departure airport code: GRU and job: pilot-->*/
SELECT social_security_num 
FROM employee 
WHERE current_airport_code = 'GRU' AND job = 'pilot';
/*Selects ssns to assign that have their current_airport_code the same as the flight departure airport code: GRU and job: copilot-->*/
SELECT social_security_num 
FROM employee 
WHERE current_airport_code = 'GRU' AND job = 'copilot';
/*Selects ssns to assign that have their current_airport_code the same as the flight departure airport code: GRU and job: flight attendant-->*/
SELECT social_security_num 
FROM employee 
WHERE current_airport_code = 'GRU' AND job = 'flight attendant';
/*Selects ssn, hours worked, overtime hours worked, normal payrate, overtime payrate, taxes and
    monthly salary from employee, flightassignmens, job and country tables.
    We find all the flights/office shifts assigned to a social security number, get the total hours worked, place anything worked above 40 hours as overtime,
    then we pull from the job table to get the payrate for the employee and calculate their monthly salary by multiplying hours worked by the appropriate
    payrate. Lastly we get the tax for the employee's country and multiply it by the previous result, and subtract it to get the monthly salary-->*/
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
/*Selects all fields from flightassignment table to display-->*/
SELECT * FROM flightassignment;
/*Selects ssn, hours worked, overtime hours worked, normal payrate, overtime payrate, taxes and
    monthly salary from employee, flightassignmens, job and country tables.
    We find all the flights/office shifts assigned to a social security number, get the total hours worked, place anything worked above 40 hours as overtime,
    then we pull from the job table to get the payrate for the employee and calculate their monthly salary by multiplying hours worked by the appropriate
    payrate. Lastly we get the tax for the employee's country and multiply it by the previous result, and subtract it to get the monthly salary-->*/
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
/*Selects all fields from officeshift table and airport_code from office table to display-->*/
SELECT shift_id, officeshift.office_id, airport_code, shift_start, shift_end, ground_worker_1, ground_worker_2, office_worker_1, office_worker_2 
FROM officeshift, office 
WHERE officeshift.office_id = office_num;
/*Selects ssn, hours worked, overtime hours worked, normal payrate, overtime payrate, taxes and
    monthly salary from employee, flightassignmens, job and country tables.
    We find all the flights/office shifts assigned to a social security number, get the total hours worked, place anything worked above 40 hours as overtime,
    then we pull from the job table to get the payrate for the employee and calculate their monthly salary by multiplying hours worked by the appropriate
    payrate. Lastly we get the tax for the employee's country and multiply it by the previous result, and subtract it to get the monthly salary-->*/
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
/*Selects all fields from officeshift table and airport_code from office table to display-->*/
SELECT shift_id, officeshift.office_id, airport_code, shift_start, shift_end, ground_worker_1, ground_worker_2, office_worker_1, office_worker_2 
FROM officeshift, office 
WHERE officeshift.office_id = office_num;
/*Selects all fields from officeshift table and airport_code from office table to display-->*/
SELECT shift_id, officeshift.office_id, airport_code, shift_start, shift_end, ground_worker_1, ground_worker_2, office_worker_1, office_worker_2 
FROM officeshift, office 
WHERE officeshift.office_id = office_num;
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->*/
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation, employee.sick_leave, employee.vacation_days FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Gets the sick leave and vacation days for jobs to validate sick/leave/vacation days edited for employees-->*/
SELECT job, sick_leave, vacation_days 
FROM job;
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->*/
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation, employee.sick_leave, employee.vacation_days FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Gets the sick leave and vacation days for jobs to validate sick/leave/vacation days edited for employees-->*/
SELECT job, sick_leave, vacation_days 
FROM job;
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->*/
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation, employee.sick_leave, employee.vacation_days FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Gets the sick leave and vacation days for jobs to validate sick/leave/vacation days edited for employees-->*/
SELECT job, sick_leave, vacation_days 
FROM job;
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->*/
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation, employee.sick_leave, employee.vacation_days FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Gets the sick leave and vacation days for jobs to validate sick/leave/vacation days edited for employees-->*/
SELECT job, sick_leave, vacation_days 
FROM job;
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->*/
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation, employee.sick_leave, employee.vacation_days FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Gets the sick leave and vacation days for jobs to validate sick/leave/vacation days edited for employees-->*/
SELECT job, sick_leave, vacation_days 
FROM job;
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->*/
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation, employee.sick_leave, employee.vacation_days FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Gets the sick leave and vacation days for jobs to validate sick/leave/vacation days edited for employees-->*/
SELECT job, sick_leave, vacation_days 
FROM job;
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->*/
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation, employee.sick_leave, employee.vacation_days FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Gets the sick leave and vacation days for jobs to validate sick/leave/vacation days edited for employees-->*/
SELECT job, sick_leave, vacation_days 
FROM job;
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->*/
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation, employee.sick_leave, employee.vacation_days FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Gets the sick leave and vacation days for jobs to validate sick/leave/vacation days edited for employees-->*/
SELECT job, sick_leave, vacation_days 
FROM job;
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->*/
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation, employee.sick_leave, employee.vacation_days FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Gets the sick leave and vacation days for jobs to validate sick/leave/vacation days edited for employees-->*/
SELECT job, sick_leave, vacation_days 
FROM job;
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->*/
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation, employee.sick_leave, employee.vacation_days FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Gets the sick leave and vacation days for jobs to validate sick/leave/vacation days edited for employees-->*/
SELECT job, sick_leave, vacation_days 
FROM job;
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->*/
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation, employee.sick_leave, employee.vacation_days FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Gets the sick leave and vacation days for jobs to validate sick/leave/vacation days edited for employees-->*/
SELECT job, sick_leave, vacation_days 
FROM job;
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->*/
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation, employee.sick_leave, employee.vacation_days FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Gets the sick leave and vacation days for jobs to validate sick/leave/vacation days edited for employees-->*/
SELECT job, sick_leave, vacation_days 
FROM job;
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->*/
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation, employee.sick_leave, employee.vacation_days FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Gets the sick leave and vacation days for jobs to validate sick/leave/vacation days edited for employees-->*/
SELECT job, sick_leave, vacation_days 
FROM job;
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->*/
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation, employee.sick_leave, employee.vacation_days FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Gets the sick leave and vacation days for jobs to validate sick/leave/vacation days edited for employees-->*/
SELECT job, sick_leave, vacation_days 
FROM job;
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->*/
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation, employee.sick_leave, employee.vacation_days FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Gets the sick leave and vacation days for jobs to validate sick/leave/vacation days edited for employees-->*/
SELECT job, sick_leave, vacation_days 
FROM job;
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->*/
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation, employee.sick_leave, employee.vacation_days FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Gets the sick leave and vacation days for jobs to validate sick/leave/vacation days edited for employees-->*/
SELECT job, sick_leave, vacation_days 
FROM job;
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->*/
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation, employee.sick_leave, employee.vacation_days FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Gets the sick leave and vacation days for jobs to validate sick/leave/vacation days edited for employees-->*/
SELECT job, sick_leave, vacation_days 
FROM job;
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->*/
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation, employee.sick_leave, employee.vacation_days FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Gets the sick leave and vacation days for jobs to validate sick/leave/vacation days edited for employees-->*/
SELECT job, sick_leave, vacation_days 
FROM job;
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->*/
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation, employee.sick_leave, employee.vacation_days FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Gets the sick leave and vacation days for jobs to validate sick/leave/vacation days edited for employees-->*/
SELECT job, sick_leave, vacation_days 
FROM job;
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->*/
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation, employee.sick_leave, employee.vacation_days FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Gets the sick leave and vacation days for jobs to validate sick/leave/vacation days edited for employees-->*/
SELECT job, sick_leave, vacation_days 
FROM job;
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->*/
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation, employee.sick_leave, employee.vacation_days FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Gets the sick leave and vacation days for jobs to validate sick/leave/vacation days edited for employees-->*/
SELECT job, sick_leave, vacation_days 
FROM job;
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->*/
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation, employee.sick_leave, employee.vacation_days FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Gets the sick leave and vacation days for jobs to validate sick/leave/vacation days edited for employees-->*/
SELECT job, sick_leave, vacation_days 
FROM job;
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->*/
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation, employee.sick_leave, employee.vacation_days FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Gets the sick leave and vacation days for jobs to validate sick/leave/vacation days edited for employees-->*/
SELECT job, sick_leave, vacation_days 
FROM job;
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->*/
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation, employee.sick_leave, employee.vacation_days FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Gets the sick leave and vacation days for jobs to validate sick/leave/vacation days edited for employees-->*/
SELECT job, sick_leave, vacation_days 
FROM job;
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->*/
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation, employee.sick_leave, employee.vacation_days FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Gets the sick leave and vacation days for jobs to validate sick/leave/vacation days edited for employees-->*/
SELECT job, sick_leave, vacation_days 
FROM job;
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->*/
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation, employee.sick_leave, employee.vacation_days FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Gets the sick leave and vacation days for jobs to validate sick/leave/vacation days edited for employees-->*/
SELECT job, sick_leave, vacation_days 
FROM job;
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->*/
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation, employee.sick_leave, employee.vacation_days FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Gets the sick leave and vacation days for jobs to validate sick/leave/vacation days edited for employees-->*/
SELECT job, sick_leave, vacation_days 
FROM job;
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->*/
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation, employee.sick_leave, employee.vacation_days FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Gets the sick leave and vacation days for jobs to validate sick/leave/vacation days edited for employees-->*/
SELECT job, sick_leave, vacation_days 
FROM job;
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->*/
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation, employee.sick_leave, employee.vacation_days FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Gets the sick leave and vacation days for jobs to validate sick/leave/vacation days edited for employees-->*/
SELECT job, sick_leave, vacation_days 
FROM job;
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->*/
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation, employee.sick_leave, employee.vacation_days FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Gets the sick leave and vacation days for jobs to validate sick/leave/vacation days edited for employees-->*/
SELECT job, sick_leave, vacation_days 
FROM job;
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->*/
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation, employee.sick_leave, employee.vacation_days FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Gets the sick leave and vacation days for jobs to validate sick/leave/vacation days edited for employees-->*/
SELECT job, sick_leave, vacation_days 
FROM job;
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->*/
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation, employee.sick_leave, employee.vacation_days FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Gets the sick leave and vacation days for jobs to validate sick/leave/vacation days edited for employees-->*/
SELECT job, sick_leave, vacation_days 
FROM job;
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->*/
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation, employee.sick_leave, employee.vacation_days FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Gets the sick leave and vacation days for jobs to validate sick/leave/vacation days edited for employees-->*/
SELECT job, sick_leave, vacation_days 
FROM job;
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->*/
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation, employee.sick_leave, employee.vacation_days FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Gets the sick leave and vacation days for jobs to validate sick/leave/vacation days edited for employees-->*/
SELECT job, sick_leave, vacation_days 
FROM job;
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->*/
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation, employee.sick_leave, employee.vacation_days FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Gets the sick leave and vacation days for jobs to validate sick/leave/vacation days edited for employees-->*/
SELECT job, sick_leave, vacation_days 
FROM job;
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->*/
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation, employee.sick_leave, employee.vacation_days FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Gets the sick leave and vacation days for jobs to validate sick/leave/vacation days edited for employees-->*/
SELECT job, sick_leave, vacation_days 
FROM job;
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->*/
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation, employee.sick_leave, employee.vacation_days FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Gets the sick leave and vacation days for jobs to validate sick/leave/vacation days edited for employees-->*/
SELECT job, sick_leave, vacation_days 
FROM job;
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->*/
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation, employee.sick_leave, employee.vacation_days FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Gets the sick leave and vacation days for jobs to validate sick/leave/vacation days edited for employees-->*/
SELECT job, sick_leave, vacation_days 
FROM job;
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->*/
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation, employee.sick_leave, employee.vacation_days FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Gets the sick leave and vacation days for jobs to validate sick/leave/vacation days edited for employees-->*/
SELECT job, sick_leave, vacation_days 
FROM job;
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->*/
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation, employee.sick_leave, employee.vacation_days FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Gets the sick leave and vacation days for jobs to validate sick/leave/vacation days edited for employees-->*/
SELECT job, sick_leave, vacation_days 
FROM job;
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->*/
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation, employee.sick_leave, employee.vacation_days FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Gets the sick leave and vacation days for jobs to validate sick/leave/vacation days edited for employees-->*/
SELECT job, sick_leave, vacation_days 
FROM job;
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->*/
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation, employee.sick_leave, employee.vacation_days FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Gets the sick leave and vacation days for jobs to validate sick/leave/vacation days edited for employees-->*/
SELECT job, sick_leave, vacation_days 
FROM job;
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->*/
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation, employee.sick_leave, employee.vacation_days FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Gets the sick leave and vacation days for jobs to validate sick/leave/vacation days edited for employees-->*/
SELECT job, sick_leave, vacation_days 
FROM job;
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->*/
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation, employee.sick_leave, employee.vacation_days FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Gets the sick leave and vacation days for jobs to validate sick/leave/vacation days edited for employees-->*/
SELECT job, sick_leave, vacation_days 
FROM job;
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->*/
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation, employee.sick_leave, employee.vacation_days FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Gets the sick leave and vacation days for jobs to validate sick/leave/vacation days edited for employees-->*/
SELECT job, sick_leave, vacation_days 
FROM job;
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->*/
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation, employee.sick_leave, employee.vacation_days FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Gets the sick leave and vacation days for jobs to validate sick/leave/vacation days edited for employees-->*/
SELECT job, sick_leave, vacation_days 
FROM job;
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->*/
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation, employee.sick_leave, employee.vacation_days FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Gets the sick leave and vacation days for jobs to validate sick/leave/vacation days edited for employees-->*/
SELECT job, sick_leave, vacation_days 
FROM job;
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->*/
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation, employee.sick_leave, employee.vacation_days FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Gets the sick leave and vacation days for jobs to validate sick/leave/vacation days edited for employees-->*/
SELECT job, sick_leave, vacation_days 
FROM job;
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->*/
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation, employee.sick_leave, employee.vacation_days FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Gets the sick leave and vacation days for jobs to validate sick/leave/vacation days edited for employees-->*/
SELECT job, sick_leave, vacation_days 
FROM job;
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->*/
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation, employee.sick_leave, employee.vacation_days FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Gets the sick leave and vacation days for jobs to validate sick/leave/vacation days edited for employees-->*/
SELECT job, sick_leave, vacation_days 
FROM job;
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->*/
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation, employee.sick_leave, employee.vacation_days FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Gets the sick leave and vacation days for jobs to validate sick/leave/vacation days edited for employees-->*/
SELECT job, sick_leave, vacation_days 
FROM job;
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->*/
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation, employee.sick_leave, employee.vacation_days FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Gets the sick leave and vacation days for jobs to validate sick/leave/vacation days edited for employees-->*/
SELECT job, sick_leave, vacation_days 
FROM job;
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->*/
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation, employee.sick_leave, employee.vacation_days FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Gets the sick leave and vacation days for jobs to validate sick/leave/vacation days edited for employees-->*/
SELECT job, sick_leave, vacation_days 
FROM job;
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->*/
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation, employee.sick_leave, employee.vacation_days FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Gets the sick leave and vacation days for jobs to validate sick/leave/vacation days edited for employees-->*/
SELECT job, sick_leave, vacation_days 
FROM job;
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->*/
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation, employee.sick_leave, employee.vacation_days FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Gets the sick leave and vacation days for jobs to validate sick/leave/vacation days edited for employees-->*/
SELECT job, sick_leave, vacation_days 
FROM job;
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->*/
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation, employee.sick_leave, employee.vacation_days FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Gets the sick leave and vacation days for jobs to validate sick/leave/vacation days edited for employees-->*/
SELECT job, sick_leave, vacation_days 
FROM job;
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->*/
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation, employee.sick_leave, employee.vacation_days FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Gets the sick leave and vacation days for jobs to validate sick/leave/vacation days edited for employees-->*/
SELECT job, sick_leave, vacation_days 
FROM job;
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->*/
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation, employee.sick_leave, employee.vacation_days FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Gets the sick leave and vacation days for jobs to validate sick/leave/vacation days edited for employees-->*/
SELECT job, sick_leave, vacation_days 
FROM job;
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->*/
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation, employee.sick_leave, employee.vacation_days FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Gets the sick leave and vacation days for jobs to validate sick/leave/vacation days edited for employees-->*/
SELECT job, sick_leave, vacation_days 
FROM job;
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->*/
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation, employee.sick_leave, employee.vacation_days FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Gets the sick leave and vacation days for jobs to validate sick/leave/vacation days edited for employees-->*/
SELECT job, sick_leave, vacation_days 
FROM job;
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->*/
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation, employee.sick_leave, employee.vacation_days FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Gets the sick leave and vacation days for jobs to validate sick/leave/vacation days edited for employees-->*/
SELECT job, sick_leave, vacation_days 
FROM job;
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->*/
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation, employee.sick_leave, employee.vacation_days FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Gets the sick leave and vacation days for jobs to validate sick/leave/vacation days edited for employees-->*/
SELECT job, sick_leave, vacation_days 
FROM job;
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->*/
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation, employee.sick_leave, employee.vacation_days FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Gets the sick leave and vacation days for jobs to validate sick/leave/vacation days edited for employees-->*/
SELECT job, sick_leave, vacation_days 
FROM job;
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->*/
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation, employee.sick_leave, employee.vacation_days FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Gets the sick leave and vacation days for jobs to validate sick/leave/vacation days edited for employees-->*/
SELECT job, sick_leave, vacation_days 
FROM job;
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->*/
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation, employee.sick_leave, employee.vacation_days FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Gets the sick leave and vacation days for jobs to validate sick/leave/vacation days edited for employees-->*/
SELECT job, sick_leave, vacation_days 
FROM job;
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->*/
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation, employee.sick_leave, employee.vacation_days FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Gets the sick leave and vacation days for jobs to validate sick/leave/vacation days edited for employees-->*/
SELECT job, sick_leave, vacation_days 
FROM job;
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->*/
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation, employee.sick_leave, employee.vacation_days FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Gets the sick leave and vacation days for jobs to validate sick/leave/vacation days edited for employees-->*/
SELECT job, sick_leave, vacation_days 
FROM job;
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->*/
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation, employee.sick_leave, employee.vacation_days FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Gets the sick leave and vacation days for jobs to validate sick/leave/vacation days edited for employees-->*/
SELECT job, sick_leave, vacation_days 
FROM job;
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->*/
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation, employee.sick_leave, employee.vacation_days FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Gets the sick leave and vacation days for jobs to validate sick/leave/vacation days edited for employees-->*/
SELECT job, sick_leave, vacation_days 
FROM job;
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->*/
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation, employee.sick_leave, employee.vacation_days FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Gets the sick leave and vacation days for jobs to validate sick/leave/vacation days edited for employees-->*/
SELECT job, sick_leave, vacation_days 
FROM job;
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->*/
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation, employee.sick_leave, employee.vacation_days FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Gets the sick leave and vacation days for jobs to validate sick/leave/vacation days edited for employees-->*/
SELECT job, sick_leave, vacation_days 
FROM job;
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->*/
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation, employee.sick_leave, employee.vacation_days FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Gets the sick leave and vacation days for jobs to validate sick/leave/vacation days edited for employees-->*/
SELECT job, sick_leave, vacation_days 
FROM job;
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->*/
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation, employee.sick_leave, employee.vacation_days FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Gets the sick leave and vacation days for jobs to validate sick/leave/vacation days edited for employees-->*/
SELECT job, sick_leave, vacation_days 
FROM job;
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->*/
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation, employee.sick_leave, employee.vacation_days FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Gets the sick leave and vacation days for jobs to validate sick/leave/vacation days edited for employees-->*/
SELECT job, sick_leave, vacation_days 
FROM job;
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->*/
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation, employee.sick_leave, employee.vacation_days FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Gets the sick leave and vacation days for jobs to validate sick/leave/vacation days edited for employees-->*/
SELECT job, sick_leave, vacation_days 
FROM job;
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->*/
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation, employee.sick_leave, employee.vacation_days FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Gets the sick leave and vacation days for jobs to validate sick/leave/vacation days edited for employees-->*/
SELECT job, sick_leave, vacation_days 
FROM job;
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->*/
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation, employee.sick_leave, employee.vacation_days FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Gets the sick leave and vacation days for jobs to validate sick/leave/vacation days edited for employees-->*/
SELECT job, sick_leave, vacation_days 
FROM job;
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->*/
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation, employee.sick_leave, employee.vacation_days FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Gets the sick leave and vacation days for jobs to validate sick/leave/vacation days edited for employees-->*/
SELECT job, sick_leave, vacation_days 
FROM job;
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->*/
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation, employee.sick_leave, employee.vacation_days FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Gets the sick leave and vacation days for jobs to validate sick/leave/vacation days edited for employees-->*/
SELECT job, sick_leave, vacation_days 
FROM job;
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->*/
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation, employee.sick_leave, employee.vacation_days FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Gets the sick leave and vacation days for jobs to validate sick/leave/vacation days edited for employees-->*/
SELECT job, sick_leave, vacation_days 
FROM job;
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->*/
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation, employee.sick_leave, employee.vacation_days FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Gets the sick leave and vacation days for jobs to validate sick/leave/vacation days edited for employees-->*/
SELECT job, sick_leave, vacation_days 
FROM job;
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->*/
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation, employee.sick_leave, employee.vacation_days FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Gets the sick leave and vacation days for jobs to validate sick/leave/vacation days edited for employees-->*/
SELECT job, sick_leave, vacation_days 
FROM job;
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->*/
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation, employee.sick_leave, employee.vacation_days FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Gets the sick leave and vacation days for jobs to validate sick/leave/vacation days edited for employees-->*/
SELECT job, sick_leave, vacation_days 
FROM job;
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->*/
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation, employee.sick_leave, employee.vacation_days FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Gets the sick leave and vacation days for jobs to validate sick/leave/vacation days edited for employees-->*/
SELECT job, sick_leave, vacation_days 
FROM job;
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->*/
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation, employee.sick_leave, employee.vacation_days FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Gets the sick leave and vacation days for jobs to validate sick/leave/vacation days edited for employees-->*/
SELECT job, sick_leave, vacation_days 
FROM job;
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->*/
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation, employee.sick_leave, employee.vacation_days FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Gets the sick leave and vacation days for jobs to validate sick/leave/vacation days edited for employees-->*/
SELECT job, sick_leave, vacation_days 
FROM job;
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->*/
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation, employee.sick_leave, employee.vacation_days FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Gets the sick leave and vacation days for jobs to validate sick/leave/vacation days edited for employees-->*/
SELECT job, sick_leave, vacation_days 
FROM job;
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->*/
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation, employee.sick_leave, employee.vacation_days FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Gets the sick leave and vacation days for jobs to validate sick/leave/vacation days edited for employees-->*/
SELECT job, sick_leave, vacation_days 
FROM job;
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->*/
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation, employee.sick_leave, employee.vacation_days FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Gets the sick leave and vacation days for jobs to validate sick/leave/vacation days edited for employees-->*/
SELECT job, sick_leave, vacation_days 
FROM job;
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->*/
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation, employee.sick_leave, employee.vacation_days FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Gets the sick leave and vacation days for jobs to validate sick/leave/vacation days edited for employees-->*/
SELECT job, sick_leave, vacation_days 
FROM job;
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->*/
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation, employee.sick_leave, employee.vacation_days FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Gets the sick leave and vacation days for jobs to validate sick/leave/vacation days edited for employees-->*/
SELECT job, sick_leave, vacation_days 
FROM job;
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->*/
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation, employee.sick_leave, employee.vacation_days FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Gets the sick leave and vacation days for jobs to validate sick/leave/vacation days edited for employees-->*/
SELECT job, sick_leave, vacation_days 
FROM job;
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->*/
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation, employee.sick_leave, employee.vacation_days FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Gets the sick leave and vacation days for jobs to validate sick/leave/vacation days edited for employees-->*/
SELECT job, sick_leave, vacation_days 
FROM job;
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->*/
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation, employee.sick_leave, employee.vacation_days FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Gets the sick leave and vacation days for jobs to validate sick/leave/vacation days edited for employees-->*/
SELECT job, sick_leave, vacation_days 
FROM job;
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->*/
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation, employee.sick_leave, employee.vacation_days FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Gets the sick leave and vacation days for jobs to validate sick/leave/vacation days edited for employees-->*/
SELECT job, sick_leave, vacation_days 
FROM job;
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->*/
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation, employee.sick_leave, employee.vacation_days FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Gets the sick leave and vacation days for jobs to validate sick/leave/vacation days edited for employees-->*/
SELECT job, sick_leave, vacation_days 
FROM job;
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->*/
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation, employee.sick_leave, employee.vacation_days FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Gets the sick leave and vacation days for jobs to validate sick/leave/vacation days edited for employees-->*/
SELECT job, sick_leave, vacation_days 
FROM job;
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->*/
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation, employee.sick_leave, employee.vacation_days FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Gets the sick leave and vacation days for jobs to validate sick/leave/vacation days edited for employees-->*/
SELECT job, sick_leave, vacation_days 
FROM job;
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->*/
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation, employee.sick_leave, employee.vacation_days FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Gets the sick leave and vacation days for jobs to validate sick/leave/vacation days edited for employees-->*/
SELECT job, sick_leave, vacation_days 
FROM job;
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->*/
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation, employee.sick_leave, employee.vacation_days FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Gets the sick leave and vacation days for jobs to validate sick/leave/vacation days edited for employees-->*/
SELECT job, sick_leave, vacation_days 
FROM job;
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->*/
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation, employee.sick_leave, employee.vacation_days FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Gets the sick leave and vacation days for jobs to validate sick/leave/vacation days edited for employees-->*/
SELECT job, sick_leave, vacation_days 
FROM job;
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->*/
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation, employee.sick_leave, employee.vacation_days FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Gets the sick leave and vacation days for jobs to validate sick/leave/vacation days edited for employees-->*/
SELECT job, sick_leave, vacation_days 
FROM job;
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->*/
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation, employee.sick_leave, employee.vacation_days FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Gets the sick leave and vacation days for jobs to validate sick/leave/vacation days edited for employees-->*/
SELECT job, sick_leave, vacation_days 
FROM job;
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->*/
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation, employee.sick_leave, employee.vacation_days FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Gets the sick leave and vacation days for jobs to validate sick/leave/vacation days edited for employees-->*/
SELECT job, sick_leave, vacation_days 
FROM job;
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->*/
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation, employee.sick_leave, employee.vacation_days FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Gets the sick leave and vacation days for jobs to validate sick/leave/vacation days edited for employees-->*/
SELECT job, sick_leave, vacation_days 
FROM job;
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->*/
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation, employee.sick_leave, employee.vacation_days FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Gets the sick leave and vacation days for jobs to validate sick/leave/vacation days edited for employees-->*/
SELECT job, sick_leave, vacation_days 
FROM job;
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->*/
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation, employee.sick_leave, employee.vacation_days FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Gets the sick leave and vacation days for jobs to validate sick/leave/vacation days edited for employees-->*/
SELECT job, sick_leave, vacation_days 
FROM job;
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->*/
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation, employee.sick_leave, employee.vacation_days FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Gets the sick leave and vacation days for jobs to validate sick/leave/vacation days edited for employees-->*/
SELECT job, sick_leave, vacation_days 
FROM job;
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->*/
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation, employee.sick_leave, employee.vacation_days FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Gets the sick leave and vacation days for jobs to validate sick/leave/vacation days edited for employees-->*/
SELECT job, sick_leave, vacation_days 
FROM job;
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->*/
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation, employee.sick_leave, employee.vacation_days FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Gets the sick leave and vacation days for jobs to validate sick/leave/vacation days edited for employees-->*/
SELECT job, sick_leave, vacation_days 
FROM job;
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->*/
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation, employee.sick_leave, employee.vacation_days FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Gets the sick leave and vacation days for jobs to validate sick/leave/vacation days edited for employees-->*/
SELECT job, sick_leave, vacation_days 
FROM job;
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->*/
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation, employee.sick_leave, employee.vacation_days FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Gets the sick leave and vacation days for jobs to validate sick/leave/vacation days edited for employees-->*/
SELECT job, sick_leave, vacation_days 
FROM job;
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->*/
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation, employee.sick_leave, employee.vacation_days FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Gets the sick leave and vacation days for jobs to validate sick/leave/vacation days edited for employees-->*/
SELECT job, sick_leave, vacation_days 
FROM job;
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->*/
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation, employee.sick_leave, employee.vacation_days FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Gets the sick leave and vacation days for jobs to validate sick/leave/vacation days edited for employees-->*/
SELECT job, sick_leave, vacation_days 
FROM job;
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->*/
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation, employee.sick_leave, employee.vacation_days FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Gets the sick leave and vacation days for jobs to validate sick/leave/vacation days edited for employees-->*/
SELECT job, sick_leave, vacation_days 
FROM job;
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->*/
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation, employee.sick_leave, employee.vacation_days FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Gets the sick leave and vacation days for jobs to validate sick/leave/vacation days edited for employees-->*/
SELECT job, sick_leave, vacation_days 
FROM job;
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->*/
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation, employee.sick_leave, employee.vacation_days FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Gets the sick leave and vacation days for jobs to validate sick/leave/vacation days edited for employees-->*/
SELECT job, sick_leave, vacation_days 
FROM job;
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->*/
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation, employee.sick_leave, employee.vacation_days FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Gets the sick leave and vacation days for jobs to validate sick/leave/vacation days edited for employees-->*/
SELECT job, sick_leave, vacation_days 
FROM job;
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->*/
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation, employee.sick_leave, employee.vacation_days FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Gets the sick leave and vacation days for jobs to validate sick/leave/vacation days edited for employees-->*/
SELECT job, sick_leave, vacation_days 
FROM job;
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->*/
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation, employee.sick_leave, employee.vacation_days FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Gets the sick leave and vacation days for jobs to validate sick/leave/vacation days edited for employees-->*/
SELECT job, sick_leave, vacation_days 
FROM job;
/*Selects all fields from flightassignment table to display-->*/
SELECT * FROM flightassignment;
/*Selects ssns to assign that have their current_airport_code the same as the flight departure airport code: GRU and job: pilot-->*/
SELECT social_security_num 
FROM employee 
WHERE current_airport_code = 'GRU' AND job = 'pilot';
/*Selects ssns to assign that have their current_airport_code the same as the flight departure airport code: GRU and job: copilot-->*/
SELECT social_security_num 
FROM employee 
WHERE current_airport_code = 'GRU' AND job = 'copilot';
/*Selects ssns to assign that have their current_airport_code the same as the flight departure airport code: GRU and job: flight attendant-->*/
SELECT social_security_num 
FROM employee 
WHERE current_airport_code = 'GRU' AND job = 'flight attendant';
/*Selects all fields from flightassignment table to display-->*/
SELECT * FROM flightassignment;
/*Selects all fields from flightassignment table to display-->*/
SELECT * FROM flightassignment;
/*Selects ssns to assign that have their current_airport_code the same as the flight departure airport code: GRU and job: pilot-->*/
SELECT social_security_num 
FROM employee 
WHERE current_airport_code = 'GRU' AND job = 'pilot';
/*Selects ssns to assign that have their current_airport_code the same as the flight departure airport code: GRU and job: copilot-->*/
SELECT social_security_num 
FROM employee 
WHERE current_airport_code = 'GRU' AND job = 'copilot';
/*Selects ssns to assign that have their current_airport_code the same as the flight departure airport code: GRU and job: flight attendant-->*/
SELECT social_security_num 
FROM employee 
WHERE current_airport_code = 'GRU' AND job = 'flight attendant';
/*Selects ssns to assign that have their current_airport_code the same as the flight departure airport code: PEK and job: pilot-->*/
SELECT social_security_num 
FROM employee 
WHERE current_airport_code = 'PEK' AND job = 'pilot';
/*Selects ssns to assign that have their current_airport_code the same as the flight departure airport code: PEK and job: copilot-->*/
SELECT social_security_num 
FROM employee 
WHERE current_airport_code = 'PEK' AND job = 'copilot';
/*Selects ssns to assign that have their current_airport_code the same as the flight departure airport code: PEK and job: flight attendant-->*/
SELECT social_security_num 
FROM employee 
WHERE current_airport_code = 'PEK' AND job = 'flight attendant';
/*Selects ssns to assign that have their current_airport_code the same as the flight departure airport code: GRU and job: pilot-->*/
SELECT social_security_num 
FROM employee 
WHERE current_airport_code = 'GRU' AND job = 'pilot';
/*Selects ssns to assign that have their current_airport_code the same as the flight departure airport code: GRU and job: copilot-->*/
SELECT social_security_num 
FROM employee 
WHERE current_airport_code = 'GRU' AND job = 'copilot';
/*Selects ssns to assign that have their current_airport_code the same as the flight departure airport code: GRU and job: flight attendant-->*/
SELECT social_security_num 
FROM employee 
WHERE current_airport_code = 'GRU' AND job = 'flight attendant';
/*Selects ssns to assign that have their current_airport_code the same as the flight departure airport code: GRU and job: pilot-->*/
SELECT social_security_num 
FROM employee 
WHERE current_airport_code = 'GRU' AND job = 'pilot';
/*Selects ssns to assign that have their current_airport_code the same as the flight departure airport code: GRU and job: copilot-->*/
SELECT social_security_num 
FROM employee 
WHERE current_airport_code = 'GRU' AND job = 'copilot';
/*Selects ssns to assign that have their current_airport_code the same as the flight departure airport code: GRU and job: flight attendant-->*/
SELECT social_security_num 
FROM employee 
WHERE current_airport_code = 'GRU' AND job = 'flight attendant';
/*Selects ssn, hours worked, overtime hours worked, normal payrate, overtime payrate, taxes and
    monthly salary from employee, flightassignmens, job and country tables.
    We find all the flights/office shifts assigned to a social security number, get the total hours worked, place anything worked above 40 hours as overtime,
    then we pull from the job table to get the payrate for the employee and calculate their monthly salary by multiplying hours worked by the appropriate
    payrate. Lastly we get the tax for the employee's country and multiply it by the previous result, and subtract it to get the monthly salary-->*/
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
/*Selects all fields from flightassignment table to display-->*/
SELECT * FROM flightassignment;
/*Selects ssn, hours worked, overtime hours worked, normal payrate, overtime payrate, taxes and
    monthly salary from employee, flightassignmens, job and country tables.
    We find all the flights/office shifts assigned to a social security number, get the total hours worked, place anything worked above 40 hours as overtime,
    then we pull from the job table to get the payrate for the employee and calculate their monthly salary by multiplying hours worked by the appropriate
    payrate. Lastly we get the tax for the employee's country and multiply it by the previous result, and subtract it to get the monthly salary-->*/
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
/*Selects all fields from flightassignment table to display-->*/
SELECT * FROM flightassignment;
/*Selects ssn, hours worked, overtime hours worked, normal payrate, overtime payrate, taxes and
    monthly salary from employee, flightassignmens, job and country tables.
    We find all the flights/office shifts assigned to a social security number, get the total hours worked, place anything worked above 40 hours as overtime,
    then we pull from the job table to get the payrate for the employee and calculate their monthly salary by multiplying hours worked by the appropriate
    payrate. Lastly we get the tax for the employee's country and multiply it by the previous result, and subtract it to get the monthly salary-->*/
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
/*Selects ssn, hours worked, overtime hours worked, normal payrate, overtime payrate, taxes and
    monthly salary from employee, flightassignmens, job and country tables.
    We find all the flights/office shifts assigned to a social security number, get the total hours worked, place anything worked above 40 hours as overtime,
    then we pull from the job table to get the payrate for the employee and calculate their monthly salary by multiplying hours worked by the appropriate
    payrate. Lastly we get the tax for the employee's country and multiply it by the previous result, and subtract it to get the monthly salary-->*/
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
/*Selects ssn, hours worked, overtime hours worked, normal payrate, overtime payrate, taxes and
    monthly salary from employee, flightassignmens, job and country tables.
    We find all the flights/office shifts assigned to a social security number, get the total hours worked, place anything worked above 40 hours as overtime,
    then we pull from the job table to get the payrate for the employee and calculate their monthly salary by multiplying hours worked by the appropriate
    payrate. Lastly we get the tax for the employee's country and multiply it by the previous result, and subtract it to get the monthly salary-->*/
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
/*Selects ssn, hours worked, overtime hours worked, normal payrate, overtime payrate, taxes and
    monthly salary from employee, flightassignmens, job and country tables.
    We find all the flights/office shifts assigned to a social security number, get the total hours worked, place anything worked above 40 hours as overtime,
    then we pull from the job table to get the payrate for the employee and calculate their monthly salary by multiplying hours worked by the appropriate
    payrate. Lastly we get the tax for the employee's country and multiply it by the previous result, and subtract it to get the monthly salary-->*/
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
/*Selects all fields from officeshift table and airport_code from office table to display-->*/
SELECT shift_id, officeshift.office_id, airport_code, shift_start, shift_end, ground_worker_1, ground_worker_2, office_worker_1, office_worker_2 
FROM officeshift, office 
WHERE officeshift.office_id = office_num;
/*Selects ssns to assign that have their current_airport_code the same as the office id: 1 airport code and job: office worker-->*/
SELECT social_security_num FROM employee 
WHERE current_airport_code = 
  (SELECT airport_code
    FROM office
    WHERE office_num = 1) 
    AND job = 'ground crew';
/*Selects ssns to assign that have their current_airport_code the same as the office id: 1 airport code and job: ground crew-->*/
SELECT social_security_num FROM employee 
WHERE current_airport_code = 
  (SELECT airport_code
    FROM office
    WHERE office_num = 1) 
    AND job = 'ground crew';
/*Selects ssns to assign that have their current_airport_code the same as the office id: 1 airport code and job: ground crew-->*/
SELECT social_security_num FROM employee 
WHERE current_airport_code = 
  (SELECT airport_code
    FROM office
    WHERE office_num = 1) 
    AND job = 'office worker';
/*Selects ssns to assign that have their current_airport_code the same as the office id: 1 airport code and job: office worker-->*/
SELECT social_security_num FROM employee 
WHERE current_airport_code = 
  (SELECT airport_code
    FROM office
    WHERE office_num = 1) 
    AND job = 'office worker';
/*Selects ssns to assign that have their current_airport_code the same as the office id: 1 airport code and job: office worker-->*/
SELECT social_security_num FROM employee 
WHERE current_airport_code = 
  (SELECT airport_code
    FROM office
    WHERE office_num = 1) 
    AND job = 'office worker';
/*Selects ssns to assign that have their current_airport_code the same as the office id: 1 airport code and job: ground crew-->*/
SELECT social_security_num FROM employee 
WHERE current_airport_code = 
  (SELECT airport_code
    FROM office
    WHERE office_num = 1) 
    AND job = 'office worker';
/*Selects ssns to assign that have their current_airport_code the same as the office id: 1 airport code and job: office worker-->*/
SELECT social_security_num FROM employee 
WHERE current_airport_code = 
  (SELECT airport_code
    FROM office
    WHERE office_num = 1) 
    AND job = 'office worker';
/*Selects ssns to assign that have their current_airport_code the same as the office id: 1 airport code and job: ground crew-->*/
SELECT social_security_num FROM employee 
WHERE current_airport_code = 
  (SELECT airport_code
    FROM office
    WHERE office_num = 1) 
    AND job = 'office worker';
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->*/
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation, employee.sick_leave, employee.vacation_days FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Gets the sick leave and vacation days for jobs to validate sick/leave/vacation days edited for employees-->*/
SELECT job, sick_leave, vacation_days 
FROM job;
/*Selects ssn, hours worked, overtime hours worked, normal payrate, overtime payrate, taxes and
    monthly salary from employee, flightassignmens, job and country tables.
    We find all the flights/office shifts assigned to a social security number, get the total hours worked, place anything worked above 40 hours as overtime,
    then we pull from the job table to get the payrate for the employee and calculate their monthly salary by multiplying hours worked by the appropriate
    payrate. Lastly we get the tax for the employee's country and multiply it by the previous result, and subtract it to get the monthly salary-->*/
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
/*Selects all fields from officeshift table and airport_code from office table to display-->*/
SELECT shift_id, officeshift.office_id, airport_code, shift_start, shift_end, ground_worker_1, ground_worker_2, office_worker_1, office_worker_2 
FROM officeshift, office 
WHERE officeshift.office_id = office_num;
/*Selects ssns to assign that have their current_airport_code the same as the office id: 1 airport code and job: office worker-->*/
SELECT social_security_num FROM employee 
WHERE current_airport_code = 
  (SELECT airport_code
    FROM office
    WHERE office_num = 1) 
    AND job = 'ground crew';
/*Selects ssns to assign that have their current_airport_code the same as the office id: 1 airport code and job: ground crew-->*/
SELECT social_security_num FROM employee 
WHERE current_airport_code = 
  (SELECT airport_code
    FROM office
    WHERE office_num = 1) 
    AND job = 'ground crew';
/*Selects all fields from officeshift table and airport_code from office table to display-->*/
SELECT shift_id, officeshift.office_id, airport_code, shift_start, shift_end, ground_worker_1, ground_worker_2, office_worker_1, office_worker_2 
FROM officeshift, office 
WHERE officeshift.office_id = office_num;
/*Selects ssns to assign that have their current_airport_code the same as the office id: 1 airport code and job: ground crew-->*/
SELECT social_security_num FROM employee 
WHERE current_airport_code = 
  (SELECT airport_code
    FROM office
    WHERE office_num = 1) 
    AND job = 'office worker';
/*Selects ssns to assign that have their current_airport_code the same as the office id: 1 airport code and job: office worker-->*/
SELECT social_security_num FROM employee 
WHERE current_airport_code = 
  (SELECT airport_code
    FROM office
    WHERE office_num = 1) 
    AND job = 'office worker';
/*Selects all fields from officeshift table and airport_code from office table to display-->*/
SELECT shift_id, officeshift.office_id, airport_code, shift_start, shift_end, ground_worker_1, ground_worker_2, office_worker_1, office_worker_2 
FROM officeshift, office 
WHERE officeshift.office_id = office_num;
/*Selects all fields from officeshift table and airport_code from office table to display-->*/
SELECT shift_id, officeshift.office_id, airport_code, shift_start, shift_end, ground_worker_1, ground_worker_2, office_worker_1, office_worker_2 
FROM officeshift, office 
WHERE officeshift.office_id = office_num;
/*Selects ssns to assign that have their current_airport_code the same as the office id: 1 airport code and job: ground crew-->*/
SELECT social_security_num FROM employee 
WHERE current_airport_code = 
  (SELECT airport_code
    FROM office
    WHERE office_num = 1) 
    AND job = 'office worker';
/*Selects ssns to assign that have their current_airport_code the same as the office id: 1 airport code and job: office worker-->*/
SELECT social_security_num FROM employee 
WHERE current_airport_code = 
  (SELECT airport_code
    FROM office
    WHERE office_num = 1) 
    AND job = 'office worker';
/*Selects all fields from officeshift table and airport_code from office table to display-->*/
SELECT shift_id, officeshift.office_id, airport_code, shift_start, shift_end, ground_worker_1, ground_worker_2, office_worker_1, office_worker_2 
FROM officeshift, office 
WHERE officeshift.office_id = office_num;
/*Selects all fields from officeshift table and airport_code from office table to display-->*/
SELECT shift_id, officeshift.office_id, airport_code, shift_start, shift_end, ground_worker_1, ground_worker_2, office_worker_1, office_worker_2 
FROM officeshift, office 
WHERE officeshift.office_id = office_num;
/*Selects all fields from officeshift table and airport_code from office table to display-->*/
SELECT shift_id, officeshift.office_id, airport_code, shift_start, shift_end, ground_worker_1, ground_worker_2, office_worker_1, office_worker_2 
FROM officeshift, office 
WHERE officeshift.office_id = office_num;
/*Selects ssns to assign that have their current_airport_code the same as the office id: 1 airport code and job: ground crew-->*/
SELECT social_security_num FROM employee 
WHERE current_airport_code = 
  (SELECT airport_code
    FROM office
    WHERE office_num = 1) 
    AND job = 'office worker';
/*Selects ssns to assign that have their current_airport_code the same as the office id: 1 airport code and job: office worker-->*/
SELECT social_security_num FROM employee 
WHERE current_airport_code = 
  (SELECT airport_code
    FROM office
    WHERE office_num = 1) 
    AND job = 'office worker';
/*Selects all fields from officeshift table and airport_code from office table to display-->*/
SELECT shift_id, officeshift.office_id, airport_code, shift_start, shift_end, ground_worker_1, ground_worker_2, office_worker_1, office_worker_2 
FROM officeshift, office 
WHERE officeshift.office_id = office_num;
/*Selects ssns to assign that have their current_airport_code the same as the office id: 1 airport code and job: ground crew-->*/
SELECT social_security_num FROM employee 
WHERE current_airport_code = 
  (SELECT airport_code
    FROM office
    WHERE office_num = 1) 
    AND job = 'office worker';
/*Selects ssns to assign that have their current_airport_code the same as the office id: 1 airport code and job: office worker-->*/
SELECT social_security_num FROM employee 
WHERE current_airport_code = 
  (SELECT airport_code
    FROM office
    WHERE office_num = 1) 
    AND job = 'office worker';
/*Selects all fields from officeshift table and airport_code from office table to display-->*/
SELECT shift_id, officeshift.office_id, airport_code, shift_start, shift_end, ground_worker_1, ground_worker_2, office_worker_1, office_worker_2 
FROM officeshift, office 
WHERE officeshift.office_id = office_num;
/*Selects ssns to assign that have their current_airport_code the same as the office id: 1 airport code and job: ground crew-->*/
SELECT social_security_num FROM employee 
WHERE current_airport_code = 
  (SELECT airport_code
    FROM office
    WHERE office_num = 1) 
    AND job = 'office worker';
/*Selects ssns to assign that have their current_airport_code the same as the office id: 1 airport code and job: office worker-->*/
SELECT social_security_num FROM employee 
WHERE current_airport_code = 
  (SELECT airport_code
    FROM office
    WHERE office_num = 1) 
    AND job = 'office worker';
/*Selects all fields from officeshift table and airport_code from office table to display-->*/
SELECT shift_id, officeshift.office_id, airport_code, shift_start, shift_end, ground_worker_1, ground_worker_2, office_worker_1, office_worker_2 
FROM officeshift, office 
WHERE officeshift.office_id = office_num;
/*Selects ssns to assign that have their current_airport_code the same as the office id: 1 airport code and job: ground crew-->*/
SELECT social_security_num FROM employee 
WHERE current_airport_code = 
  (SELECT airport_code
    FROM office
    WHERE office_num = 1) 
    AND job = 'office worker';
/*Selects ssns to assign that have their current_airport_code the same as the office id: 1 airport code and job: office worker-->*/
SELECT social_security_num FROM employee 
WHERE current_airport_code = 
  (SELECT airport_code
    FROM office
    WHERE office_num = 1) 
    AND job = 'office worker';
/*Selects all fields from officeshift table and airport_code from office table to display-->*/
SELECT shift_id, officeshift.office_id, airport_code, shift_start, shift_end, ground_worker_1, ground_worker_2, office_worker_1, office_worker_2 
FROM officeshift, office 
WHERE officeshift.office_id = office_num;
/*Selects ssns to assign that have their current_airport_code the same as the office id: 1 airport code and job: ground crew-->*/
SELECT social_security_num FROM employee 
WHERE current_airport_code = 
  (SELECT airport_code
    FROM office
    WHERE office_num = 1) 
    AND job = 'office worker';
/*Selects ssns to assign that have their current_airport_code the same as the office id: 1 airport code and job: office worker-->*/
SELECT social_security_num FROM employee 
WHERE current_airport_code = 
  (SELECT airport_code
    FROM office
    WHERE office_num = 1) 
    AND job = 'office worker';
/*Selects all fields from officeshift table and airport_code from office table to display-->*/
SELECT shift_id, officeshift.office_id, airport_code, shift_start, shift_end, ground_worker_1, ground_worker_2, office_worker_1, office_worker_2 
FROM officeshift, office 
WHERE officeshift.office_id = office_num;
/*Selects ssns to assign that have their current_airport_code the same as the office id: 1 airport code and job: ground crew-->*/
SELECT social_security_num FROM employee 
WHERE current_airport_code = 
  (SELECT airport_code
    FROM office
    WHERE office_num = 1) 
    AND job = 'office worker';
/*Selects ssns to assign that have their current_airport_code the same as the office id: 1 airport code and job: office worker-->*/
SELECT social_security_num FROM employee 
WHERE current_airport_code = 
  (SELECT airport_code
    FROM office
    WHERE office_num = 1) 
    AND job = 'office worker';
/*Selects all fields from officeshift table and airport_code from office table to display-->*/
SELECT shift_id, officeshift.office_id, airport_code, shift_start, shift_end, ground_worker_1, ground_worker_2, office_worker_1, office_worker_2 
FROM officeshift, office 
WHERE officeshift.office_id = office_num;
/*Selects ssns to assign that have their current_airport_code the same as the office id: 1 airport code and job: ground crew-->*/
SELECT social_security_num FROM employee 
WHERE current_airport_code = 
  (SELECT airport_code
    FROM office
    WHERE office_num = 1) 
    AND job = 'office worker';
/*Selects ssns to assign that have their current_airport_code the same as the office id: 1 airport code and job: office worker-->*/
SELECT social_security_num FROM employee 
WHERE current_airport_code = 
  (SELECT airport_code
    FROM office
    WHERE office_num = 1) 
    AND job = 'office worker';
/*Selects all fields from officeshift table and airport_code from office table to display-->*/
SELECT shift_id, officeshift.office_id, airport_code, shift_start, shift_end, ground_worker_1, ground_worker_2, office_worker_1, office_worker_2 
FROM officeshift, office 
WHERE officeshift.office_id = office_num;
/*Selects all fields from officeshift table and airport_code from office table to display-->*/
SELECT shift_id, officeshift.office_id, airport_code, shift_start, shift_end, ground_worker_1, ground_worker_2, office_worker_1, office_worker_2 
FROM officeshift, office 
WHERE officeshift.office_id = office_num;
/*Selects ssns to assign that have their current_airport_code the same as the office id: 1 airport code and job: ground crew-->*/
SELECT social_security_num FROM employee 
WHERE current_airport_code = 
  (SELECT airport_code
    FROM office
    WHERE office_num = 1) 
    AND job = 'office worker';
/*Selects ssns to assign that have their current_airport_code the same as the office id: 1 airport code and job: office worker-->*/
SELECT social_security_num FROM employee 
WHERE current_airport_code = 
  (SELECT airport_code
    FROM office
    WHERE office_num = 1) 
    AND job = 'office worker';
/*Selects all fields from officeshift table and airport_code from office table to display-->*/
SELECT shift_id, officeshift.office_id, airport_code, shift_start, shift_end, ground_worker_1, ground_worker_2, office_worker_1, office_worker_2 
FROM officeshift, office 
WHERE officeshift.office_id = office_num;
/*Selects ssns to assign that have their current_airport_code the same as the office id: 1 airport code and job: ground crew-->*/
SELECT social_security_num FROM employee 
WHERE current_airport_code = 
  (SELECT airport_code
    FROM office
    WHERE office_num = 1) 
    AND job = 'office worker';
/*Selects ssns to assign that have their current_airport_code the same as the office id: 1 airport code and job: office worker-->*/
SELECT social_security_num FROM employee 
WHERE current_airport_code = 
  (SELECT airport_code
    FROM office
    WHERE office_num = 1) 
    AND job = 'office worker';
/*Selects all fields from officeshift table and airport_code from office table to display-->*/
SELECT shift_id, officeshift.office_id, airport_code, shift_start, shift_end, ground_worker_1, ground_worker_2, office_worker_1, office_worker_2 
FROM officeshift, office 
WHERE officeshift.office_id = office_num;
/*Selects ssns to assign that have their current_airport_code the same as the office id: 1 airport code and job: ground crew-->*/
SELECT social_security_num FROM employee 
WHERE current_airport_code = 
  (SELECT airport_code
    FROM office
    WHERE office_num = 1) 
    AND job = 'office worker';
/*Selects ssns to assign that have their current_airport_code the same as the office id: 1 airport code and job: office worker-->*/
SELECT social_security_num FROM employee 
WHERE current_airport_code = 
  (SELECT airport_code
    FROM office
    WHERE office_num = 1) 
    AND job = 'office worker';
/*Selects all fields from officeshift table and airport_code from office table to display-->*/
SELECT shift_id, officeshift.office_id, airport_code, shift_start, shift_end, ground_worker_1, ground_worker_2, office_worker_1, office_worker_2 
FROM officeshift, office 
WHERE officeshift.office_id = office_num;
/*Selects ssns to assign that have their current_airport_code the same as the office id: 1 airport code and job: ground crew-->*/
SELECT social_security_num FROM employee 
WHERE current_airport_code = 
  (SELECT airport_code
    FROM office
    WHERE office_num = 1) 
    AND job = 'office worker';
/*Selects ssns to assign that have their current_airport_code the same as the office id: 1 airport code and job: office worker-->*/
SELECT social_security_num FROM employee 
WHERE current_airport_code = 
  (SELECT airport_code
    FROM office
    WHERE office_num = 1) 
    AND job = 'office worker';
/*Selects all fields from officeshift table and airport_code from office table to display-->*/
SELECT shift_id, officeshift.office_id, airport_code, shift_start, shift_end, ground_worker_1, ground_worker_2, office_worker_1, office_worker_2 
FROM officeshift, office 
WHERE officeshift.office_id = office_num;
/*Selects ssns to assign that have their current_airport_code the same as the office id: 1 airport code and job: ground crew-->*/
SELECT social_security_num FROM employee 
WHERE current_airport_code = 
  (SELECT airport_code
    FROM office
    WHERE office_num = 1) 
    AND job = 'office worker';
/*Selects ssns to assign that have their current_airport_code the same as the office id: 1 airport code and job: office worker-->*/
SELECT social_security_num FROM employee 
WHERE current_airport_code = 
  (SELECT airport_code
    FROM office
    WHERE office_num = 1) 
    AND job = 'office worker';
/*Selects all fields from officeshift table and airport_code from office table to display-->*/
SELECT shift_id, officeshift.office_id, airport_code, shift_start, shift_end, ground_worker_1, ground_worker_2, office_worker_1, office_worker_2 
FROM officeshift, office 
WHERE officeshift.office_id = office_num;
/*Selects all fields from officeshift table and airport_code from office table to display-->*/
SELECT shift_id, officeshift.office_id, airport_code, shift_start, shift_end, ground_worker_1, ground_worker_2, office_worker_1, office_worker_2 
FROM officeshift, office 
WHERE officeshift.office_id = office_num;
/*Selects all fields from officeshift table and airport_code from office table to display-->*/
SELECT shift_id, officeshift.office_id, airport_code, shift_start, shift_end, ground_worker_1, ground_worker_2, office_worker_1, office_worker_2 
FROM officeshift, office 
WHERE officeshift.office_id = office_num;
/*Selects all fields from officeshift table and airport_code from office table to display-->*/
SELECT shift_id, officeshift.office_id, airport_code, shift_start, shift_end, ground_worker_1, ground_worker_2, office_worker_1, office_worker_2 
FROM officeshift, office 
WHERE officeshift.office_id = office_num;
/*Selects all fields from officeshift table and airport_code from office table to display-->*/
SELECT shift_id, officeshift.office_id, airport_code, shift_start, shift_end, ground_worker_1, ground_worker_2, office_worker_1, office_worker_2 
FROM officeshift, office 
WHERE officeshift.office_id = office_num;
/*Selects all fields from flightassignment table to display-->*/
SELECT * FROM flightassignment;
/*Selects ssns to assign that have their current_airport_code the same as the flight departure airport code: GRU and job: pilot-->*/
SELECT social_security_num 
FROM employee 
WHERE current_airport_code = 'GRU' AND job = 'pilot';
/*Selects ssns to assign that have their current_airport_code the same as the flight departure airport code: GRU and job: copilot-->*/
SELECT social_security_num 
FROM employee 
WHERE current_airport_code = 'GRU' AND job = 'copilot';
/*Selects ssns to assign that have their current_airport_code the same as the flight departure airport code: GRU and job: flight attendant-->*/
SELECT social_security_num 
FROM employee 
WHERE current_airport_code = 'GRU' AND job = 'flight attendant';
/*Selects ssns to assign that have their current_airport_code the same as the flight departure airport code: GRU and job: pilot-->*/
SELECT social_security_num 
FROM employee 
WHERE current_airport_code = 'GRU' AND job = 'pilot';
/*Selects ssns to assign that have their current_airport_code the same as the flight departure airport code: GRU and job: copilot-->*/
SELECT social_security_num 
FROM employee 
WHERE current_airport_code = 'GRU' AND job = 'copilot';
/*Selects ssns to assign that have their current_airport_code the same as the flight departure airport code: GRU and job: flight attendant-->*/
SELECT social_security_num 
FROM employee 
WHERE current_airport_code = 'GRU' AND job = 'flight attendant';
/*Selects all fields from flightassignment table to display-->*/
SELECT * FROM flightassignment;
/*Selects all fields from flightassignment table to display-->*/
SELECT * FROM flightassignment;
/*Selects all fields from flightassignment table to display-->*/
SELECT * FROM flightassignment;
/*Selects ssns to assign that have their current_airport_code the same as the flight departure airport code: GRU and job: pilot-->*/
SELECT social_security_num 
FROM employee 
WHERE current_airport_code = 'GRU' AND job = 'pilot';
/*Selects ssns to assign that have their current_airport_code the same as the flight departure airport code: GRU and job: copilot-->*/
SELECT social_security_num 
FROM employee 
WHERE current_airport_code = 'GRU' AND job = 'copilot';
/*Selects ssns to assign that have their current_airport_code the same as the flight departure airport code: GRU and job: flight attendant-->*/
SELECT social_security_num 
FROM employee 
WHERE current_airport_code = 'GRU' AND job = 'flight attendant';
/*Selects ssns to assign that have their current_airport_code the same as the flight departure airport code: PEK and job: pilot-->*/
SELECT social_security_num 
FROM employee 
WHERE current_airport_code = 'PEK' AND job = 'pilot';
/*Selects ssns to assign that have their current_airport_code the same as the flight departure airport code: PEK and job: copilot-->*/
SELECT social_security_num 
FROM employee 
WHERE current_airport_code = 'PEK' AND job = 'copilot';
/*Selects ssns to assign that have their current_airport_code the same as the flight departure airport code: PEK and job: flight attendant-->*/
SELECT social_security_num 
FROM employee 
WHERE current_airport_code = 'PEK' AND job = 'flight attendant';
/*Selects ssns to assign that have their current_airport_code the same as the flight departure airport code: LAX and job: pilot-->*/
SELECT social_security_num 
FROM employee 
WHERE current_airport_code = 'LAX' AND job = 'pilot';
/*Selects ssns to assign that have their current_airport_code the same as the flight departure airport code: LAX and job: copilot-->*/
SELECT social_security_num 
FROM employee 
WHERE current_airport_code = 'LAX' AND job = 'copilot';
/*Selects ssns to assign that have their current_airport_code the same as the flight departure airport code: LAX and job: flight attendant-->*/
SELECT social_security_num 
FROM employee 
WHERE current_airport_code = 'LAX' AND job = 'flight attendant';
/*Selects all fields from flightassignment table to display-->*/
SELECT * FROM flightassignment;
/*Selects all fields from flightassignment table to display-->*/
SELECT * FROM flightassignment;
/*Selects all fields from flightassignment table to display-->*/
SELECT * FROM flightassignment;
/*Selects ssns to assign that have their current_airport_code the same as the flight departure airport code: GRU and job: pilot-->*/
SELECT social_security_num 
FROM employee 
WHERE current_airport_code = 'GRU' AND job = 'pilot';
/*Selects ssns to assign that have their current_airport_code the same as the flight departure airport code: GRU and job: copilot-->*/
SELECT social_security_num 
FROM employee 
WHERE current_airport_code = 'GRU' AND job = 'copilot';
/*Selects ssns to assign that have their current_airport_code the same as the flight departure airport code: GRU and job: flight attendant-->*/
SELECT social_security_num 
FROM employee 
WHERE current_airport_code = 'GRU' AND job = 'flight attendant';
/*Selects all fields from flightassignment table to display-->*/
SELECT * FROM flightassignment;
/*Selects ssns to assign that have their current_airport_code the same as the flight departure airport code: GRU and job: pilot-->*/
SELECT social_security_num 
FROM employee 
WHERE current_airport_code = 'GRU' AND job = 'pilot';
/*Selects ssns to assign that have their current_airport_code the same as the flight departure airport code: GRU and job: copilot-->*/
SELECT social_security_num 
FROM employee 
WHERE current_airport_code = 'GRU' AND job = 'copilot';
/*Selects ssns to assign that have their current_airport_code the same as the flight departure airport code: GRU and job: flight attendant-->*/
SELECT social_security_num 
FROM employee 
WHERE current_airport_code = 'GRU' AND job = 'flight attendant';
/*Selects all fields from flightassignment table to display-->*/
SELECT * FROM flightassignment;
/*Selects ssns to assign that have their current_airport_code the same as the flight departure airport code: GRU and job: pilot-->*/
SELECT social_security_num 
FROM employee 
WHERE current_airport_code = 'GRU' AND job = 'pilot';
/*Selects ssns to assign that have their current_airport_code the same as the flight departure airport code: GRU and job: copilot-->*/
SELECT social_security_num 
FROM employee 
WHERE current_airport_code = 'GRU' AND job = 'copilot';
/*Selects ssns to assign that have their current_airport_code the same as the flight departure airport code: GRU and job: flight attendant-->*/
SELECT social_security_num 
FROM employee 
WHERE current_airport_code = 'GRU' AND job = 'flight attendant';
/*Selects ssns to assign that have their current_airport_code the same as the flight departure airport code: LAX and job: pilot-->*/
SELECT social_security_num 
FROM employee 
WHERE current_airport_code = 'LAX' AND job = 'pilot';
/*Selects ssns to assign that have their current_airport_code the same as the flight departure airport code: LAX and job: copilot-->*/
SELECT social_security_num 
FROM employee 
WHERE current_airport_code = 'LAX' AND job = 'copilot';
/*Selects ssns to assign that have their current_airport_code the same as the flight departure airport code: LAX and job: flight attendant-->*/
SELECT social_security_num 
FROM employee 
WHERE current_airport_code = 'LAX' AND job = 'flight attendant';
/*Selects ssns to assign that have their current_airport_code the same as the flight departure airport code: SYD and job: pilot-->*/
SELECT social_security_num 
FROM employee 
WHERE current_airport_code = 'SYD' AND job = 'pilot';
/*Selects ssns to assign that have their current_airport_code the same as the flight departure airport code: SYD and job: copilot-->*/
SELECT social_security_num 
FROM employee 
WHERE current_airport_code = 'SYD' AND job = 'copilot';
/*Selects ssns to assign that have their current_airport_code the same as the flight departure airport code: SYD and job: flight attendant-->*/
SELECT social_security_num 
FROM employee 
WHERE current_airport_code = 'SYD' AND job = 'flight attendant';
/*Selects all fields from flightassignment table to display-->*/
SELECT * FROM flightassignment;
/*Selects all fields from flightassignment table to display-->*/
SELECT * FROM flightassignment;
/*Selects ssns to assign that have their current_airport_code the same as the flight departure airport code: GRU and job: pilot-->*/
SELECT social_security_num 
FROM employee 
WHERE current_airport_code = 'GRU' AND job = 'pilot';
/*Selects ssns to assign that have their current_airport_code the same as the flight departure airport code: GRU and job: copilot-->*/
SELECT social_security_num 
FROM employee 
WHERE current_airport_code = 'GRU' AND job = 'copilot';
/*Selects ssns to assign that have their current_airport_code the same as the flight departure airport code: GRU and job: flight attendant-->*/
SELECT social_security_num 
FROM employee 
WHERE current_airport_code = 'GRU' AND job = 'flight attendant';
/*Selects ssns to assign that have their current_airport_code the same as the flight departure airport code: PEK and job: pilot-->*/
SELECT social_security_num 
FROM employee 
WHERE current_airport_code = 'PEK' AND job = 'pilot';
/*Selects ssns to assign that have their current_airport_code the same as the flight departure airport code: PEK and job: copilot-->*/
SELECT social_security_num 
FROM employee 
WHERE current_airport_code = 'PEK' AND job = 'copilot';
/*Selects ssns to assign that have their current_airport_code the same as the flight departure airport code: PEK and job: flight attendant-->*/
SELECT social_security_num 
FROM employee 
WHERE current_airport_code = 'PEK' AND job = 'flight attendant';
/*Selects ssns to assign that have their current_airport_code the same as the flight departure airport code: GRU and job: pilot-->*/
SELECT social_security_num 
FROM employee 
WHERE current_airport_code = 'GRU' AND job = 'pilot';
/*Selects ssns to assign that have their current_airport_code the same as the flight departure airport code: GRU and job: copilot-->*/
SELECT social_security_num 
FROM employee 
WHERE current_airport_code = 'GRU' AND job = 'copilot';
/*Selects ssns to assign that have their current_airport_code the same as the flight departure airport code: GRU and job: flight attendant-->*/
SELECT social_security_num 
FROM employee 
WHERE current_airport_code = 'GRU' AND job = 'flight attendant';
/*Selects ssns to assign that have their current_airport_code the same as the flight departure airport code: PEK and job: pilot-->*/
SELECT social_security_num 
FROM employee 
WHERE current_airport_code = 'PEK' AND job = 'pilot';
/*Selects ssns to assign that have their current_airport_code the same as the flight departure airport code: PEK and job: copilot-->*/
SELECT social_security_num 
FROM employee 
WHERE current_airport_code = 'PEK' AND job = 'copilot';
/*Selects ssns to assign that have their current_airport_code the same as the flight departure airport code: PEK and job: flight attendant-->*/
SELECT social_security_num 
FROM employee 
WHERE current_airport_code = 'PEK' AND job = 'flight attendant';
/*Selects ssns to assign that have their current_airport_code the same as the flight departure airport code: GRU and job: pilot-->*/
SELECT social_security_num 
FROM employee 
WHERE current_airport_code = 'GRU' AND job = 'pilot';
/*Selects ssns to assign that have their current_airport_code the same as the flight departure airport code: GRU and job: copilot-->*/
SELECT social_security_num 
FROM employee 
WHERE current_airport_code = 'GRU' AND job = 'copilot';
/*Selects ssns to assign that have their current_airport_code the same as the flight departure airport code: GRU and job: flight attendant-->*/
SELECT social_security_num 
FROM employee 
WHERE current_airport_code = 'GRU' AND job = 'flight attendant';
/*Selects all fields from flightassignment table to display-->*/
SELECT * FROM flightassignment;
/*Selects ssns to assign that have their current_airport_code the same as the flight departure airport code: GRU and job: pilot-->*/
SELECT social_security_num 
FROM employee 
WHERE current_airport_code = 'GRU' AND job = 'pilot';
/*Selects ssns to assign that have their current_airport_code the same as the flight departure airport code: GRU and job: copilot-->*/
SELECT social_security_num 
FROM employee 
WHERE current_airport_code = 'GRU' AND job = 'copilot';
/*Selects ssns to assign that have their current_airport_code the same as the flight departure airport code: GRU and job: flight attendant-->*/
SELECT social_security_num 
FROM employee 
WHERE current_airport_code = 'GRU' AND job = 'flight attendant';
/*Selects ssns to assign that have their current_airport_code the same as the flight departure airport code: GRU and job: pilot-->*/
SELECT social_security_num 
FROM employee 
WHERE current_airport_code = 'GRU' AND job = 'pilot';
/*Selects ssns to assign that have their current_airport_code the same as the flight departure airport code: GRU and job: copilot-->*/
SELECT social_security_num 
FROM employee 
WHERE current_airport_code = 'GRU' AND job = 'copilot';
/*Selects ssns to assign that have their current_airport_code the same as the flight departure airport code: GRU and job: flight attendant-->*/
SELECT social_security_num 
FROM employee 
WHERE current_airport_code = 'GRU' AND job = 'flight attendant';
/*Selects ssn, hours worked, overtime hours worked, normal payrate, overtime payrate, taxes and
    monthly salary from employee, flightassignmens, job and country tables.
    We find all the flights/office shifts assigned to a social security number, get the total hours worked, place anything worked above 40 hours as overtime,
    then we pull from the job table to get the payrate for the employee and calculate their monthly salary by multiplying hours worked by the appropriate
    payrate. Lastly we get the tax for the employee's country and multiply it by the previous result, and subtract it to get the monthly salary-->*/
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
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->*/
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation, employee.sick_leave, employee.vacation_days FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Gets the sick leave and vacation days for jobs to validate sick/leave/vacation days edited for employees-->*/
SELECT job, sick_leave, vacation_days 
FROM job;
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->*/
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation, employee.sick_leave, employee.vacation_days FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Gets the sick leave and vacation days for jobs to validate sick/leave/vacation days edited for employees-->*/
SELECT job, sick_leave, vacation_days 
FROM job;
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->*/
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation, employee.sick_leave, employee.vacation_days FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Gets the sick leave and vacation days for jobs to validate sick/leave/vacation days edited for employees-->*/
SELECT job, sick_leave, vacation_days 
FROM job;
/*Selects ssn, hours worked, overtime hours worked, normal payrate, overtime payrate, taxes and
    monthly salary from employee, flightassignmens, job and country tables.
    We find all the flights/office shifts assigned to a social security number, get the total hours worked, place anything worked above 40 hours as overtime,
    then we pull from the job table to get the payrate for the employee and calculate their monthly salary by multiplying hours worked by the appropriate
    payrate. Lastly we get the tax for the employee's country and multiply it by the previous result, and subtract it to get the monthly salary-->*/
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
/*Selects all fields from flightassignment table to display-->*/
SELECT * FROM flightassignment;
/*Selects ssns to assign that have their current_airport_code the same as the flight departure airport code: PEK and job: pilot-->*/
SELECT social_security_num 
FROM employee 
WHERE current_airport_code = 'PEK' AND job = 'pilot';
/*Selects ssns to assign that have their current_airport_code the same as the flight departure airport code: PEK and job: copilot-->*/
SELECT social_security_num 
FROM employee 
WHERE current_airport_code = 'PEK' AND job = 'copilot';
/*Selects ssns to assign that have their current_airport_code the same as the flight departure airport code: PEK and job: flight attendant-->*/
SELECT social_security_num 
FROM employee 
WHERE current_airport_code = 'PEK' AND job = 'flight attendant';
/*Selects ssn, hours worked, overtime hours worked, normal payrate, overtime payrate, taxes and
    monthly salary from employee, flightassignmens, job and country tables.
    We find all the flights/office shifts assigned to a social security number, get the total hours worked, place anything worked above 40 hours as overtime,
    then we pull from the job table to get the payrate for the employee and calculate their monthly salary by multiplying hours worked by the appropriate
    payrate. Lastly we get the tax for the employee's country and multiply it by the previous result, and subtract it to get the monthly salary-->*/
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
/*Selects all fields from flightassignment table to display-->*/
SELECT * FROM flightassignment;
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->*/
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation, employee.sick_leave, employee.vacation_days FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Gets the sick leave and vacation days for jobs to validate sick/leave/vacation days edited for employees-->*/
SELECT job, sick_leave, vacation_days 
FROM job;
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->*/
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation, employee.sick_leave, employee.vacation_days FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Gets the sick leave and vacation days for jobs to validate sick/leave/vacation days edited for employees-->*/
SELECT job, sick_leave, vacation_days 
FROM job;
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->*/
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation, employee.sick_leave, employee.vacation_days FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Gets the sick leave and vacation days for jobs to validate sick/leave/vacation days edited for employees-->*/
SELECT job, sick_leave, vacation_days 
FROM job;
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->*/
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation, employee.sick_leave, employee.vacation_days FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Gets the sick leave and vacation days for jobs to validate sick/leave/vacation days edited for employees-->*/
SELECT job, sick_leave, vacation_days 
FROM job;
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->*/
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation, employee.sick_leave, employee.vacation_days FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Gets the sick leave and vacation days for jobs to validate sick/leave/vacation days edited for employees-->*/
SELECT job, sick_leave, vacation_days 
FROM job;
/*Selects ssn, hours worked, overtime hours worked, normal payrate, overtime payrate, taxes and
    monthly salary from employee, flightassignmens, job and country tables.
    We find all the flights/office shifts assigned to a social security number, get the total hours worked, place anything worked above 40 hours as overtime,
    then we pull from the job table to get the payrate for the employee and calculate their monthly salary by multiplying hours worked by the appropriate
    payrate. Lastly we get the tax for the employee's country and multiply it by the previous result, and subtract it to get the monthly salary-->*/
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
/*Selects all fields from flightassignment table to display-->*/
SELECT * FROM flightassignment;
/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->*/
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation, employee.sick_leave, employee.vacation_days FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Gets the sick leave and vacation days for jobs to validate sick/leave/vacation days edited for employees-->*/
SELECT job, sick_leave, vacation_days 
FROM job;
/*Selects all fields from flightassignment table to display-->*/
SELECT * FROM flightassignment;
/*Selects ssns to assign that have their current_airport_code the same as the flight departure airport code: CDG and job: pilot-->*/
SELECT social_security_num 
FROM employee 
WHERE current_airport_code = 'CDG' AND job = 'pilot';
/*Selects ssns to assign that have their current_airport_code the same as the flight departure airport code: CDG and job: copilot-->*/
SELECT social_security_num 
FROM employee 
WHERE current_airport_code = 'CDG' AND job = 'copilot';
/*Selects ssns to assign that have their current_airport_code the same as the flight departure airport code: CDG and job: flight attendant-->*/
SELECT social_security_num 
FROM employee 
WHERE current_airport_code = 'CDG' AND job = 'flight attendant';
/*Selects all fields from flightassignment table to display-->*/
SELECT * FROM flightassignment;
/*Selects ssns to assign that have their current_airport_code the same as the flight departure airport code: CDG and job: pilot-->*/
SELECT social_security_num 
FROM employee 
WHERE current_airport_code = 'CDG' AND job = 'pilot';
/*Selects ssns to assign that have their current_airport_code the same as the flight departure airport code: CDG and job: copilot-->*/
SELECT social_security_num 
FROM employee 
WHERE current_airport_code = 'CDG' AND job = 'copilot';
/*Selects ssns to assign that have their current_airport_code the same as the flight departure airport code: CDG and job: flight attendant-->*/
SELECT social_security_num 
FROM employee 
WHERE current_airport_code = 'CDG' AND job = 'flight attendant';
/*Selects ssn, hours worked, overtime hours worked, normal payrate, overtime payrate, taxes and
    monthly salary from employee, flightassignmens, job and country tables.
    We find all the flights/office shifts assigned to a social security number, get the total hours worked, place anything worked above 40 hours as overtime,
    then we pull from the job table to get the payrate for the employee and calculate their monthly salary by multiplying hours worked by the appropriate
    payrate. Lastly we get the tax for the employee's country and multiply it by the previous result, and subtract it to get the monthly salary-->*/
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
