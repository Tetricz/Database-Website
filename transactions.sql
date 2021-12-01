BEGIN;
UPDATE flightassignment SET pilot = '500-79-5396', copilot = '545-56-1535', flight_attendant_1 = 'N/A', flight_attendant_2 = 'N/A', 
flight_attendant_3 = 'N/A', flight_attendant_4 = 'N/A'
WHERE flight_id LIKE '01_';
COMMIT;
BEGIN;
Update payment
SET normal_hours = CASE social_security_num
                     WHEN '500-79-5396' THEN 26
                     WHEN '545-56-1535' THEN 26
                   END,
    overtime_hours = CASE social_security_num
                     WHEN '500-79-5396' THEN 0
                     WHEN '545-56-1535' THEN 0
                   END,
    taxes = CASE social_security_num
                     WHEN '500-79-5396' THEN 509.60
                     WHEN '545-56-1535' THEN 473.20
                   END,
    monthly_salary = CASE social_security_num
                     WHEN '500-79-5396' THEN 1310.40
                     WHEN '545-56-1535' THEN 1216.80
                   END
WHERE social_security_num IN ('500-79-5396', '545-56-1535');
COMMIT;
