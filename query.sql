/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->*/
SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation, employee.sick_leave, employee.vacation_days FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;
/*Gets the sick leave and vacation days for jobs to validate sick/leave/vacation days edited for employees-->*/
SELECT job, sick_leave, vacation_days 
FROM job;
