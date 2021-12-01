BEGIN;
UPDATE flightassignment SET pilot = '605-24-9827', copilot = '280-33-7851', flight_attendant_1 = '222-16-3379', flight_attendant_2 = '763-40-1461', 
flight_attendant_3 = '347-67-1273', flight_attendant_4 = '548-68-1810'
WHERE flight_id LIKE '01_';
COMMIT;
BEGIN;
Update payment
SET normal_hours = CASE social_security_num
                     WHEN '605-24-9827' THEN 26
                     WHEN '280-33-7851' THEN 26
                     WHEN '347-67-1273' THEN 26
                     WHEN '222-16-3379' THEN 26
                     WHEN '763-40-1461' THEN 26
                     WHEN '548-68-1810' THEN 26
                   END,
    overtime_hours = CASE social_security_num
                     WHEN '605-24-9827' THEN 0
                     WHEN '280-33-7851' THEN 0
                     WHEN '347-67-1273' THEN 0
                     WHEN '222-16-3379' THEN 0
                     WHEN '763-40-1461' THEN 0
                     WHEN '548-68-1810' THEN 0
                   END,
    taxes = CASE social_security_num
                     WHEN '605-24-9827' THEN 509.60
                     WHEN '280-33-7851' THEN 473.20
                     WHEN '347-67-1273' THEN 276.64
                     WHEN '222-16-3379' THEN 276.64
                     WHEN '763-40-1461' THEN 276.64
                     WHEN '548-68-1810' THEN 276.64
                   END,
    monthly_salary = CASE social_security_num
                     WHEN '605-24-9827' THEN 1310.40
                     WHEN '280-33-7851' THEN 1216.80
                     WHEN '347-67-1273' THEN 711.36
                     WHEN '222-16-3379' THEN 711.36
                     WHEN '763-40-1461' THEN 711.36
                     WHEN '548-68-1810' THEN 711.36
                   END
WHERE social_security_num IN ('605-24-9827', '280-33-7851', '347-67-1273', '222-16-3379', '763-40-1461', '548-68-1810');
COMMIT;
BEGIN;
Update payment
SET normal_hours = CASE social_security_num
                     WHEN '605-24-9827' THEN 26
                     WHEN '280-33-7851' THEN 26
                     WHEN '347-67-1273' THEN 26
                     WHEN '222-16-3379' THEN 26
                     WHEN '763-40-1461' THEN 26
                     WHEN '548-68-1810' THEN 26
                   END,
    overtime_hours = CASE social_security_num
                     WHEN '605-24-9827' THEN 0
                     WHEN '280-33-7851' THEN 0
                     WHEN '347-67-1273' THEN 0
                     WHEN '222-16-3379' THEN 0
                     WHEN '763-40-1461' THEN 0
                     WHEN '548-68-1810' THEN 0
                   END,
    taxes = CASE social_security_num
                     WHEN '605-24-9827' THEN 509.60
                     WHEN '280-33-7851' THEN 473.20
                     WHEN '347-67-1273' THEN 276.64
                     WHEN '222-16-3379' THEN 276.64
                     WHEN '763-40-1461' THEN 276.64
                     WHEN '548-68-1810' THEN 276.64
                   END,
    monthly_salary = CASE social_security_num
                     WHEN '605-24-9827' THEN 1310.40
                     WHEN '280-33-7851' THEN 1216.80
                     WHEN '347-67-1273' THEN 711.36
                     WHEN '222-16-3379' THEN 711.36
                     WHEN '763-40-1461' THEN 711.36
                     WHEN '548-68-1810' THEN 711.36
                   END
WHERE social_security_num IN ('605-24-9827', '280-33-7851', '347-67-1273', '222-16-3379', '763-40-1461', '548-68-1810');
COMMIT;
BEGIN;
Update payment
SET normal_hours = CASE social_security_num
                     WHEN '605-24-9827' THEN 26
                     WHEN '280-33-7851' THEN 26
                     WHEN '347-67-1273' THEN 26
                     WHEN '222-16-3379' THEN 26
                     WHEN '763-40-1461' THEN 26
                     WHEN '548-68-1810' THEN 26
                   END,
    overtime_hours = CASE social_security_num
                     WHEN '605-24-9827' THEN 0
                     WHEN '280-33-7851' THEN 0
                     WHEN '347-67-1273' THEN 0
                     WHEN '222-16-3379' THEN 0
                     WHEN '763-40-1461' THEN 0
                     WHEN '548-68-1810' THEN 0
                   END,
    taxes = CASE social_security_num
                     WHEN '605-24-9827' THEN 509.60
                     WHEN '280-33-7851' THEN 473.20
                     WHEN '347-67-1273' THEN 276.64
                     WHEN '222-16-3379' THEN 276.64
                     WHEN '763-40-1461' THEN 276.64
                     WHEN '548-68-1810' THEN 276.64
                   END,
    monthly_salary = CASE social_security_num
                     WHEN '605-24-9827' THEN 1310.40
                     WHEN '280-33-7851' THEN 1216.80
                     WHEN '347-67-1273' THEN 711.36
                     WHEN '222-16-3379' THEN 711.36
                     WHEN '763-40-1461' THEN 711.36
                     WHEN '548-68-1810' THEN 711.36
                   END
WHERE social_security_num IN ('605-24-9827', '280-33-7851', '347-67-1273', '222-16-3379', '763-40-1461', '548-68-1810');
COMMIT;
BEGIN;
UPDATE flightassignment SET pilot = '830-55-4393', copilot = '386-94-2181', flight_attendant_1 = 'N/A', flight_attendant_2 = 'N/A', 
flight_attendant_3 = 'N/A', flight_attendant_4 = 'N/A'
WHERE flight_id LIKE '02_';
COMMIT;
BEGIN;
BEGIN;
UPDATE flightassignment SET pilot = '830-55-4393', copilot = '386-94-2181', flight_attendant_1 = 'N/A', flight_attendant_2 = 'N/A', 
flight_attendant_3 = 'N/A', flight_attendant_4 = 'N/A'
WHERE flight_id LIKE '02_';
COMMIT;
COMMIT;
BEGIN;
BEGIN;
BEGIN;
UPDATE flightassignment SET pilot = '830-55-4393', copilot = '386-94-2181', flight_attendant_1 = 'N/A', flight_attendant_2 = 'N/A', 
flight_attendant_3 = 'N/A', flight_attendant_4 = 'N/A'
WHERE flight_id LIKE '02_';
COMMIT;
COMMIT;
COMMIT;
BEGIN;
UPDATE flightassignment SET pilot = '110-01-2872', copilot = '386-94-2181', flight_attendant_1 = 'N/A', flight_attendant_2 = 'N/A', 
flight_attendant_3 = 'N/A', flight_attendant_4 = 'N/A'
WHERE flight_id LIKE '05_';
COMMIT;
BEGIN;
UPDATE flightassignment SET pilot = '830-55-4393', copilot = '603-14-9498', flight_attendant_1 = 'N/A', flight_attendant_2 = 'N/A', 
flight_attendant_3 = 'N/A', flight_attendant_4 = 'N/A'
WHERE flight_id LIKE '02_';
COMMIT;
BEGIN;
UPDATE flightassignment SET pilot = 'N/A', copilot = 'N/A', flight_attendant_1 = 'N/A', flight_attendant_2 = 'N/A', 
flight_attendant_3 = 'N/A', flight_attendant_4 = 'N/A'
WHERE flight_id LIKE '01_';
COMMIT;
BEGIN;
UPDATE flightassignment SET pilot = 'N/A', copilot = 'N/A', flight_attendant_1 = 'N/A', flight_attendant_2 = 'N/A', 
flight_attendant_3 = 'N/A', flight_attendant_4 = 'N/A'
WHERE flight_id LIKE '02_';
COMMIT;
BEGIN;
UPDATE flightassignment SET pilot = 'N/A', copilot = 'N/A', flight_attendant_1 = 'N/A', flight_attendant_2 = 'N/A', 
flight_attendant_3 = 'N/A', flight_attendant_4 = 'N/A'
WHERE flight_id LIKE '05_';
COMMIT;
BEGIN;
UPDATE flightassignment SET pilot = 'N/A', copilot = 'N/A', flight_attendant_1 = 'N/A', flight_attendant_2 = 'N/A', 
flight_attendant_3 = 'N/A', flight_attendant_4 = '347-67-1273'
WHERE flight_id LIKE '01_';
COMMIT;
BEGIN;
UPDATE flightassignment SET pilot = 'N/A', copilot = 'N/A', flight_attendant_1 = 'N/A', flight_attendant_2 = 'N/A', 
flight_attendant_3 = 'N/A', flight_attendant_4 = 'N/A'
WHERE flight_id LIKE '01_';
COMMIT;
BEGIN;
UPDATE employee
SET first_name = 'Albie', last_name = 'Crocombe', email = 'acrocombe2p@linkedin.com', gender = 'Male', street_num = '79', city = 'Sao Paulo', country = 'Brazil'
WHERE social_security_num = '360-18-7737';
COMMIT;
BEGIN;
BEGIN;
UPDATE employee
SET first_name = 'Albie', last_name = 'Crocombe', email = 'acrocombe2p@linkedin.com', gender = 'Male', street_num = '79', city = 'Sao Paulo', country = 'Brazil'
WHERE social_security_num = '360-18-7737';
COMMIT;
COMMIT;
BEGIN;
BEGIN;
BEGIN;
UPDATE employee
SET first_name = 'Albie', last_name = 'Crocombe', email = 'acrocombe2p@linkedin.com', gender = 'Male', street_num = '79', city = 'Sao Paulo', country = 'Brazil'
WHERE social_security_num = '360-18-7737';
COMMIT;
COMMIT;
COMMIT;
BEGIN;
UPDATE flightassignment SET pilot = '605-24-9827', copilot = '280-33-7851', flight_attendant_1 = 'N/A', flight_attendant_2 = 'N/A', 
flight_attendant_3 = 'N/A', flight_attendant_4 = 'N/A'
WHERE flight_id LIKE '01_';
COMMIT;
BEGIN;
UPDATE flightassignment SET pilot = 'N/A', copilot = 'N/A', flight_attendant_1 = 'N/A', flight_attendant_2 = 'N/A', 
flight_attendant_3 = 'N/A', flight_attendant_4 = 'N/A'
WHERE flight_id LIKE '01_';
COMMIT;
BEGIN;
UPDATE officeshift 
SET ground_worker_1 = '158-61-5318', ground_worker_2 = '689-20-0248', office_worker_1 = '562-83-3028', office_worker_2 = '422-04-9876'
WHERE shift_id = 1;
COMMIT;
BEGIN;
Update payment
SET normal_hours = CASE social_security_num
                     WHEN '689-20-0248' THEN 8
                     WHEN '158-61-5318' THEN 8
                     WHEN '422-04-9876' THEN 8
                     WHEN '562-83-3028' THEN 8
                   END,
    overtime_hours = CASE social_security_num
                     WHEN '689-20-0248' THEN 0
                     WHEN '158-61-5318' THEN 0
                     WHEN '422-04-9876' THEN 0
                     WHEN '562-83-3028' THEN 0
                   END,
    taxes = CASE social_security_num
                     WHEN '689-20-0248' THEN 56.00
                     WHEN '158-61-5318' THEN 56.00
                     WHEN '422-04-9876' THEN 70.00
                     WHEN '562-83-3028' THEN 70.00
                   END,
    monthly_salary = CASE social_security_num
                     WHEN '689-20-0248' THEN 104.00
                     WHEN '158-61-5318' THEN 104.00
                     WHEN '422-04-9876' THEN 130.00
                     WHEN '562-83-3028' THEN 130.00
                   END
WHERE social_security_num IN ('689-20-0248', '158-61-5318', '422-04-9876', '562-83-3028');
COMMIT;
