/*
SELECT pilot, flight_id, (DATE_PART('day', scheduled_departure_time - scheduled_arrival_time) * 24 + 
                         DATE_PART('hour', scheduled_departure_time - scheduled_arrival_time)) AS hours_worked
FROM flightassignment
GROUP BY pilot, flight_id, hours_worked;

I think this will work for getting the hours worked. Not finalized but a rough draft
*/
create table flightassignment (
	flight_id VARCHAR(3) PRIMARY KEY,
    departure_airport VARCHAR (3),
    arrival_airport VARCHAR (3),
    pilot VARCHAR (50),
    copilot VARCHAR (50),
    scheduled_departure_time TIMESTAMPTZ,
    scheduled_arrival_time TIMESTAMPTZ,
    flight_attendant_1 VARCHAR (50),
    flight_attendant_2 VARCHAR (50),
    flight_attendant_3 VARCHAR (50),
    flight_attendant_4 VARCHAR (50)
);

--Day 1--
insert into flightassignment (flight_id, departure_airport, arrival_airport, scheduled_departure_time, scheduled_arrival_time) values ('1A','GRU', 'LAX', '2021-11-01 06:25+00'::timestamptz, '2021-11-01 19:25+00'::timestamptz);
insert into flightassignment (flight_id, departure_airport, arrival_airport, scheduled_departure_time, scheduled_arrival_time) values ('2A','LAX', 'CDG', '2021-11-01 09:55+00'::timestamptz, '2021-11-01 21:55+00'::timestamptz);
insert into flightassignment (flight_id, departure_airport, arrival_airport, scheduled_departure_time, scheduled_arrival_time) values ('3A','CDG', 'PEK', '2021-11-01 08:00+00'::timestamptz, '2021-11-01 19:00+00'::timestamptz);
insert into flightassignment (flight_id, departure_airport, arrival_airport, scheduled_departure_time, scheduled_arrival_time) values ('4A','PEK', 'SYD', '2021-11-01 00:10+00'::timestamptz, '2021-11-01 11:10+00'::timestamptz);
insert into flightassignment (flight_id, departure_airport, arrival_airport, scheduled_departure_time, scheduled_arrival_time) values ('5A','SYD', 'GRU', '2021-11-01 00:00+00'::timestamptz, '2021-11-01 17:00+00'::timestamptz);

--Day 2--
insert into flightassignment (flight_id, departure_airport, arrival_airport, scheduled_departure_time, scheduled_arrival_time) values ('1B','LAX', 'GRU', '2021-11-02 02:00+00'::timestamptz, '2021-11-02 15:00+00'::timestamptz);
insert into flightassignment (flight_id, departure_airport, arrival_airport, scheduled_departure_time, scheduled_arrival_time) values ('2B','CDG', 'LAX', '2021-11-02 06:00+00'::timestamptz, '2021-11-02 18:00+00'::timestamptz);
insert into flightassignment (flight_id, departure_airport, arrival_airport, scheduled_departure_time, scheduled_arrival_time) values ('3B','PEK', 'CDG', '2021-11-02 01:00+00'::timestamptz, '2021-11-02 12:00+00'::timestamptz);
insert into flightassignment (flight_id, departure_airport, arrival_airport, scheduled_departure_time, scheduled_arrival_time) values ('4B','SYD', 'PEK', '2021-11-02 05:55+00'::timestamptz, '2021-11-02 16:55+00'::timestamptz);
insert into flightassignment (flight_id, departure_airport, arrival_airport, scheduled_departure_time, scheduled_arrival_time) values ('5B','GRU', 'SYD', '2021-11-02 06:00+00'::timestamptz, '2021-11-02 23:00+00'::timestamptz);

--Day 3--
insert into flightassignment (flight_id, departure_airport, arrival_airport, scheduled_departure_time, scheduled_arrival_time) values ('11C','CDG', 'LAX', '2021-11-03 09:00+00'::timestamptz, '2021-11-03 21:00+00'::timestamptz);
insert into flightassignment (flight_id, departure_airport, arrival_airport, scheduled_departure_time, scheduled_arrival_time) values ('12C','LAX', 'SYD', '2021-11-03 03:55+00'::timestamptz, '2021-11-03 18:55+00'::timestamptz);
insert into flightassignment (flight_id, departure_airport, arrival_airport, scheduled_departure_time, scheduled_arrival_time) values ('13C','SYD', 'GRU', '2021-11-03 00:00+00'::timestamptz, '2021-11-03 17:00+00'::timestamptz);
insert into flightassignment (flight_id, departure_airport, arrival_airport, scheduled_departure_time, scheduled_arrival_time) values ('14C','GRU', 'PEK', '2021-11-03 05:00+00'::timestamptz, '2021-11-03 19:00+00'::timestamptz);
insert into flightassignment (flight_id, departure_airport, arrival_airport, scheduled_departure_time, scheduled_arrival_time) values ('15C','PEK', 'CDG', '2021-11-03 01:30+00'::timestamptz, '2021-11-03 12:30+00'::timestamptz);

--Day 4--
insert into flightassignment (flight_id, departure_airport, arrival_airport, scheduled_departure_time, scheduled_arrival_time) values ('11D','LAX', 'CDG', '2021-11-04 09:55+00'::timestamptz, '2021-11-04 21:55+00'::timestamptz);
insert into flightassignment (flight_id, departure_airport, arrival_airport, scheduled_departure_time, scheduled_arrival_time) values ('12D','SYD', 'LAX', '2021-11-04 08:55+00'::timestamptz, '2021-11-04 23:55+00'::timestamptz);
insert into flightassignment (flight_id, departure_airport, arrival_airport, scheduled_departure_time, scheduled_arrival_time) values ('13D','GRU', 'SYD', '2021-11-04 05:00+00'::timestamptz, '2021-11-04 22:00+00'::timestamptz);
insert into flightassignment (flight_id, departure_airport, arrival_airport, scheduled_departure_time, scheduled_arrival_time) values ('14D','PEK', 'GRU', '2021-11-04 08:00+00'::timestamptz, '2021-11-04 22:00+00'::timestamptz);
insert into flightassignment (flight_id, departure_airport, arrival_airport, scheduled_departure_time, scheduled_arrival_time) values ('15D','CDG', 'PEK', '2021-11-04 01:00+00'::timestamptz, '2021-11-04 12:00+00'::timestamptz);

--Day 5--
insert into flightassignment (flight_id, departure_airport, arrival_airport, scheduled_departure_time, scheduled_arrival_time) values ('21E','LAX', 'GRU', '2021-11-05 09:45+00'::timestamptz, '2021-11-05 22:45+00'::timestamptz);
insert into flightassignment (flight_id, departure_airport, arrival_airport, scheduled_departure_time, scheduled_arrival_time) values ('22E','PEK', 'SYD', '2021-11-05 03:55+00'::timestamptz, '2021-11-05 14:55+00'::timestamptz);
insert into flightassignment (flight_id, departure_airport, arrival_airport, scheduled_departure_time, scheduled_arrival_time) values ('23E','GRU', 'CDG', '2021-11-05 08:00+00'::timestamptz, '2021-11-05 23:00+00'::timestamptz);
insert into flightassignment (flight_id, departure_airport, arrival_airport, scheduled_departure_time, scheduled_arrival_time) values ('24E','CDG', 'LAX', '2021-11-05 09:00+00'::timestamptz, '2021-11-05 21:00+00'::timestamptz);
insert into flightassignment (flight_id, departure_airport, arrival_airport, scheduled_departure_time, scheduled_arrival_time) values ('25E','SYD', 'PEK', '2021-11-05 01:00+00'::timestamptz, '2021-11-05 12:00+00'::timestamptz);

--Day 6--
insert into flightassignment (flight_id, departure_airport, arrival_airport, scheduled_departure_time, scheduled_arrival_time) values ('21F','GRU', 'LAX', '2021-11-06 03:55+00'::timestamptz, '2021-11-06 16:55+00'::timestamptz);
insert into flightassignment (flight_id, departure_airport, arrival_airport, scheduled_departure_time, scheduled_arrival_time) values ('22F','SYD', 'PEK', '2021-11-06 08:55+00'::timestamptz, '2021-11-06 19:55+00'::timestamptz);
insert into flightassignment (flight_id, departure_airport, arrival_airport, scheduled_departure_time, scheduled_arrival_time) values ('23F','CDG', 'GRU', '2021-11-06 08:00+00'::timestamptz, '2021-11-06 23:00+00'::timestamptz);
insert into flightassignment (flight_id, departure_airport, arrival_airport, scheduled_departure_time, scheduled_arrival_time) values ('24F','LAX', 'CDG', '2021-11-06 05:00+00'::timestamptz, '2021-11-06 17:00+00'::timestamptz);
insert into flightassignment (flight_id, departure_airport, arrival_airport, scheduled_departure_time, scheduled_arrival_time) values ('25F','PEK', 'SYD', '2021-11-06 00:00+00'::timestamptz, '2021-11-06 11:00+00'::timestamptz);


--Fill pilot, copilot, etc. with N/A instead of null--
UPDATE flightassignment SET pilot = 'N/A', copilot = 'N/A', flight_attendant_1 = 'N/A', flight_attendant_2 = 'N/A', flight_attendant_3 = 'N/A', flight_attendant_4 = 'N/A' WHERE flight_id = '1A';
UPDATE flightassignment SET pilot = 'N/A', copilot = 'N/A', flight_attendant_1 = 'N/A', flight_attendant_2 = 'N/A', flight_attendant_3 = 'N/A', flight_attendant_4 = 'N/A' WHERE flight_id = '2A';
UPDATE flightassignment SET pilot = 'N/A', copilot = 'N/A', flight_attendant_1 = 'N/A', flight_attendant_2 = 'N/A', flight_attendant_3 = 'N/A', flight_attendant_4 = 'N/A' WHERE flight_id = '3A';
UPDATE flightassignment SET pilot = 'N/A', copilot = 'N/A', flight_attendant_1 = 'N/A', flight_attendant_2 = 'N/A', flight_attendant_3 = 'N/A', flight_attendant_4 = 'N/A' WHERE flight_id = '4A';
UPDATE flightassignment SET pilot = 'N/A', copilot = 'N/A', flight_attendant_1 = 'N/A', flight_attendant_2 = 'N/A', flight_attendant_3 = 'N/A', flight_attendant_4 = 'N/A' WHERE flight_id = '5A';

UPDATE flightassignment SET pilot = 'N/A', copilot = 'N/A', flight_attendant_1 = 'N/A', flight_attendant_2 = 'N/A', flight_attendant_3 = 'N/A', flight_attendant_4 = 'N/A' WHERE flight_id = '1B';
UPDATE flightassignment SET pilot = 'N/A', copilot = 'N/A', flight_attendant_1 = 'N/A', flight_attendant_2 = 'N/A', flight_attendant_3 = 'N/A', flight_attendant_4 = 'N/A' WHERE flight_id = '2B';
UPDATE flightassignment SET pilot = 'N/A', copilot = 'N/A', flight_attendant_1 = 'N/A', flight_attendant_2 = 'N/A', flight_attendant_3 = 'N/A', flight_attendant_4 = 'N/A' WHERE flight_id = '3B';
UPDATE flightassignment SET pilot = 'N/A', copilot = 'N/A', flight_attendant_1 = 'N/A', flight_attendant_2 = 'N/A', flight_attendant_3 = 'N/A', flight_attendant_4 = 'N/A' WHERE flight_id = '4B';
UPDATE flightassignment SET pilot = 'N/A', copilot = 'N/A', flight_attendant_1 = 'N/A', flight_attendant_2 = 'N/A', flight_attendant_3 = 'N/A', flight_attendant_4 = 'N/A' WHERE flight_id = '5B';

UPDATE flightassignment SET pilot = 'N/A', copilot = 'N/A', flight_attendant_1 = 'N/A', flight_attendant_2 = 'N/A', flight_attendant_3 = 'N/A', flight_attendant_4 = 'N/A' WHERE flight_id = '11C';
UPDATE flightassignment SET pilot = 'N/A', copilot = 'N/A', flight_attendant_1 = 'N/A', flight_attendant_2 = 'N/A', flight_attendant_3 = 'N/A', flight_attendant_4 = 'N/A' WHERE flight_id = '12C';
UPDATE flightassignment SET pilot = 'N/A', copilot = 'N/A', flight_attendant_1 = 'N/A', flight_attendant_2 = 'N/A', flight_attendant_3 = 'N/A', flight_attendant_4 = 'N/A' WHERE flight_id = '13C';
UPDATE flightassignment SET pilot = 'N/A', copilot = 'N/A', flight_attendant_1 = 'N/A', flight_attendant_2 = 'N/A', flight_attendant_3 = 'N/A', flight_attendant_4 = 'N/A' WHERE flight_id = '14C';
UPDATE flightassignment SET pilot = 'N/A', copilot = 'N/A', flight_attendant_1 = 'N/A', flight_attendant_2 = 'N/A', flight_attendant_3 = 'N/A', flight_attendant_4 = 'N/A' WHERE flight_id = '15C';

UPDATE flightassignment SET pilot = 'N/A', copilot = 'N/A', flight_attendant_1 = 'N/A', flight_attendant_2 = 'N/A', flight_attendant_3 = 'N/A', flight_attendant_4 = 'N/A' WHERE flight_id = '11D';
UPDATE flightassignment SET pilot = 'N/A', copilot = 'N/A', flight_attendant_1 = 'N/A', flight_attendant_2 = 'N/A', flight_attendant_3 = 'N/A', flight_attendant_4 = 'N/A' WHERE flight_id = '12D';
UPDATE flightassignment SET pilot = 'N/A', copilot = 'N/A', flight_attendant_1 = 'N/A', flight_attendant_2 = 'N/A', flight_attendant_3 = 'N/A', flight_attendant_4 = 'N/A' WHERE flight_id = '13D';
UPDATE flightassignment SET pilot = 'N/A', copilot = 'N/A', flight_attendant_1 = 'N/A', flight_attendant_2 = 'N/A', flight_attendant_3 = 'N/A', flight_attendant_4 = 'N/A' WHERE flight_id = '14D';
UPDATE flightassignment SET pilot = 'N/A', copilot = 'N/A', flight_attendant_1 = 'N/A', flight_attendant_2 = 'N/A', flight_attendant_3 = 'N/A', flight_attendant_4 = 'N/A' WHERE flight_id = '15D';

UPDATE flightassignment SET pilot = 'N/A', copilot = 'N/A', flight_attendant_1 = 'N/A', flight_attendant_2 = 'N/A', flight_attendant_3 = 'N/A', flight_attendant_4 = 'N/A' WHERE flight_id = '21E';
UPDATE flightassignment SET pilot = 'N/A', copilot = 'N/A', flight_attendant_1 = 'N/A', flight_attendant_2 = 'N/A', flight_attendant_3 = 'N/A', flight_attendant_4 = 'N/A' WHERE flight_id = '22E';
UPDATE flightassignment SET pilot = 'N/A', copilot = 'N/A', flight_attendant_1 = 'N/A', flight_attendant_2 = 'N/A', flight_attendant_3 = 'N/A', flight_attendant_4 = 'N/A' WHERE flight_id = '23E';
UPDATE flightassignment SET pilot = 'N/A', copilot = 'N/A', flight_attendant_1 = 'N/A', flight_attendant_2 = 'N/A', flight_attendant_3 = 'N/A', flight_attendant_4 = 'N/A' WHERE flight_id = '24E';
UPDATE flightassignment SET pilot = 'N/A', copilot = 'N/A', flight_attendant_1 = 'N/A', flight_attendant_2 = 'N/A', flight_attendant_3 = 'N/A', flight_attendant_4 = 'N/A' WHERE flight_id = '25E';

UPDATE flightassignment SET pilot = 'N/A', copilot = 'N/A', flight_attendant_1 = 'N/A', flight_attendant_2 = 'N/A', flight_attendant_3 = 'N/A', flight_attendant_4 = 'N/A' WHERE flight_id = '21F';
UPDATE flightassignment SET pilot = 'N/A', copilot = 'N/A', flight_attendant_1 = 'N/A', flight_attendant_2 = 'N/A', flight_attendant_3 = 'N/A', flight_attendant_4 = 'N/A' WHERE flight_id = '22F';
UPDATE flightassignment SET pilot = 'N/A', copilot = 'N/A', flight_attendant_1 = 'N/A', flight_attendant_2 = 'N/A', flight_attendant_3 = 'N/A', flight_attendant_4 = 'N/A' WHERE flight_id = '23F';
UPDATE flightassignment SET pilot = 'N/A', copilot = 'N/A', flight_attendant_1 = 'N/A', flight_attendant_2 = 'N/A', flight_attendant_3 = 'N/A', flight_attendant_4 = 'N/A' WHERE flight_id = '24F';
UPDATE flightassignment SET pilot = 'N/A', copilot = 'N/A', flight_attendant_1 = 'N/A', flight_attendant_2 = 'N/A', flight_attendant_3 = 'N/A', flight_attendant_4 = 'N/A' WHERE flight_id = '25F';