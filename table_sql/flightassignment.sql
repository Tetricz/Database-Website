/*
SELECT pilot, flight_id, (DATE_PART('day', scheduled_departure_time - scheduled_arrival_time) * 24 + 
                         DATE_PART('hour', scheduled_departure_time - scheduled_arrival_time)) AS hours_worked
FROM flightassignment
GROUP BY pilot, flight_id, hours_worked;

I think this will work for getting the hours worked. Not finalized but a rough draft
*/
drop table flightassignment;
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
insert into flightassignment (flight_id, departure_airport, arrival_airport, scheduled_departure_time, scheduled_arrival_time) values ('1A','GRU', 'LAX', '2021-11-01 08:25+00'::timestamptz, '2021-11-01 21:25+00'::timestamptz);
insert into flightassignment (flight_id, departure_airport, arrival_airport, scheduled_departure_time, scheduled_arrival_time) values ('1B','LAX', 'CDG', '2021-11-01 15:55+00'::timestamptz, '2021-11-02 03:55+00'::timestamptz);
insert into flightassignment (flight_id, departure_airport, arrival_airport, scheduled_departure_time, scheduled_arrival_time) values ('1C','CDG', 'PEK', '2021-11-01 08:00+00'::timestamptz, '2021-11-01 22:00+00'::timestamptz);
insert into flightassignment (flight_id, departure_airport, arrival_airport, scheduled_departure_time, scheduled_arrival_time) values ('1D','PEK', 'SYD', '2021-11-01 00:10+00'::timestamptz, '2021-11-01 11:10+00'::timestamptz);
insert into flightassignment (flight_id, departure_airport, arrival_airport, scheduled_departure_time, scheduled_arrival_time) values ('1E','SYD', 'GRU', '2021-11-01 00:00+00'::timestamptz, '2021-11-01 17:00+00'::timestamptz);

insert into flightassignment (flight_id, departure_airport, arrival_airport, scheduled_departure_time, scheduled_arrival_time) values ('1F','LAX', 'PEK', '2021-11-01 10:55+00'::timestamptz, '2021-11-01 23:55+00'::timestamptz);
insert into flightassignment (flight_id, departure_airport, arrival_airport, scheduled_departure_time, scheduled_arrival_time) values ('1G','PEK', 'SYD', '2021-11-01 00:45+00'::timestamptz, '2021-11-01 11:45+00'::timestamptz);
insert into flightassignment (flight_id, departure_airport, arrival_airport, scheduled_departure_time, scheduled_arrival_time) values ('1H','SYD', 'GRU', '2021-11-01 00:30+00'::timestamptz, '2021-11-01 17:30+00'::timestamptz);
insert into flightassignment (flight_id, departure_airport, arrival_airport, scheduled_departure_time, scheduled_arrival_time) values ('1I','GRU', 'CDG', '2021-11-01 05:25+00'::timestamptz, '2021-11-01 20:25+00'::timestamptz);
insert into flightassignment (flight_id, departure_airport, arrival_airport, scheduled_departure_time, scheduled_arrival_time) values ('1J','CDG', 'LAX', '2021-11-01 09:00+00'::timestamptz, '2021-11-01 21:00+00'::timestamptz);

--Day 2--
insert into flightassignment (flight_id, departure_airport, arrival_airport, scheduled_departure_time, scheduled_arrival_time) values ('2A','PEK', 'GRU', '2021-11-02 02:00+00'::timestamptz, '2021-11-02 16:00+00'::timestamptz);
insert into flightassignment (flight_id, departure_airport, arrival_airport, scheduled_departure_time, scheduled_arrival_time) values ('2B','GRU', 'SYD', '2021-11-02 06:00+00'::timestamptz, '2021-11-02 23:00+00'::timestamptz);
insert into flightassignment (flight_id, departure_airport, arrival_airport, scheduled_departure_time, scheduled_arrival_time) values ('2C','SYD', 'LAX', '2021-11-02 01:00+00'::timestamptz, '2021-11-02 16:00+00'::timestamptz);
insert into flightassignment (flight_id, departure_airport, arrival_airport, scheduled_departure_time, scheduled_arrival_time) values ('2D','LAX', 'CDG', '2021-11-02 15:55+00'::timestamptz, '2021-11-03 03:55+00'::timestamptz);
insert into flightassignment (flight_id, departure_airport, arrival_airport, scheduled_departure_time, scheduled_arrival_time) values ('2E','CDG', 'PEK', '2021-11-02 08:00+00'::timestamptz, '2021-11-02 22:00+00'::timestamptz);

insert into flightassignment (flight_id, departure_airport, arrival_airport, scheduled_departure_time, scheduled_arrival_time) values ('2F','SYD', 'PEK', '2021-11-02 01:00+00'::timestamptz, '2021-11-02 12:00+00'::timestamptz);
insert into flightassignment (flight_id, departure_airport, arrival_airport, scheduled_departure_time, scheduled_arrival_time) values ('2G','PEK', 'LAX', '2021-11-02 03:00+00'::timestamptz, '2021-11-02 16:00+00'::timestamptz);
insert into flightassignment (flight_id, departure_airport, arrival_airport, scheduled_departure_time, scheduled_arrival_time) values ('2H','LAX', 'CDG', '2021-11-02 14:55+00'::timestamptz, '2021-11-03 02:55+00'::timestamptz);
insert into flightassignment (flight_id, departure_airport, arrival_airport, scheduled_departure_time, scheduled_arrival_time) values ('2I','CDG', 'GRU', '2021-11-02 05:00+00'::timestamptz, '2021-11-02 22:00+00'::timestamptz);
insert into flightassignment (flight_id, departure_airport, arrival_airport, scheduled_departure_time, scheduled_arrival_time) values ('2J','GRU', 'SYD', '2021-11-02 06:15+00'::timestamptz, '2021-11-02 23:15+00'::timestamptz);

--Day 3--
insert into flightassignment (flight_id, departure_airport, arrival_airport, scheduled_departure_time, scheduled_arrival_time) values ('3A','CDG', 'LAX', '2021-11-03 09:00+00'::timestamptz, '2021-11-03 21:00+00'::timestamptz);
insert into flightassignment (flight_id, departure_airport, arrival_airport, scheduled_departure_time, scheduled_arrival_time) values ('3B','LAX', 'SYD', '2021-11-03 03:55+00'::timestamptz, '2021-11-03 18:55+00'::timestamptz);
insert into flightassignment (flight_id, departure_airport, arrival_airport, scheduled_departure_time, scheduled_arrival_time) values ('3C','SYD', 'GRU', '2021-11-03 00:00+00'::timestamptz, '2021-11-03 17:00+00'::timestamptz);
insert into flightassignment (flight_id, departure_airport, arrival_airport, scheduled_departure_time, scheduled_arrival_time) values ('3D','GRU', 'PEK', '2021-11-03 05:00+00'::timestamptz, '2021-11-03 19:00+00'::timestamptz);
insert into flightassignment (flight_id, departure_airport, arrival_airport, scheduled_departure_time, scheduled_arrival_time) values ('3E','PEK', 'CDG', '2021-11-03 01:30+00'::timestamptz, '2021-11-03 15:30+00'::timestamptz);

insert into flightassignment (flight_id, departure_airport, arrival_airport, scheduled_departure_time, scheduled_arrival_time) values ('3F','PEK', 'LAX', '2021-11-03 03:00+00'::timestamptz, '2021-11-03 16:00+00'::timestamptz);
insert into flightassignment (flight_id, departure_airport, arrival_airport, scheduled_departure_time, scheduled_arrival_time) values ('3G','LAX', 'CDG', '2021-11-03 15:55+00'::timestamptz, '2021-11-04 03:55+00'::timestamptz);
insert into flightassignment (flight_id, departure_airport, arrival_airport, scheduled_departure_time, scheduled_arrival_time) values ('3H','CDG', 'GRU', '2021-11-03 05:00+00'::timestamptz, '2021-11-03 22:00+00'::timestamptz);
insert into flightassignment (flight_id, departure_airport, arrival_airport, scheduled_departure_time, scheduled_arrival_time) values ('3I','GRU', 'SYD', '2021-11-03 06:00+00'::timestamptz, '2021-11-03 23:00+00'::timestamptz);
insert into flightassignment (flight_id, departure_airport, arrival_airport, scheduled_departure_time, scheduled_arrival_time) values ('3J','SYD', 'PEK', '2021-11-03 01:00+00'::timestamptz, '2021-11-04 12:00+00'::timestamptz);

--Day 4--
insert into flightassignment (flight_id, departure_airport, arrival_airport, scheduled_departure_time, scheduled_arrival_time) values ('4A','LAX', 'CDG', '2021-11-04 15:55+00'::timestamptz, '2021-11-05 03:55+00'::timestamptz);
insert into flightassignment (flight_id, departure_airport, arrival_airport, scheduled_departure_time, scheduled_arrival_time) values ('4B','LAX', 'PEK', '2021-11-04 10:55+00'::timestamptz, '2021-11-04 23:55+00'::timestamptz);
insert into flightassignment (flight_id, departure_airport, arrival_airport, scheduled_departure_time, scheduled_arrival_time) values ('4C','CDG', 'GRU', '2021-11-04 05:00+00'::timestamptz, '2021-11-04 22:00+00'::timestamptz);
insert into flightassignment (flight_id, departure_airport, arrival_airport, scheduled_departure_time, scheduled_arrival_time) values ('4D','CDG', 'PEK', '2021-11-04 08:00+00'::timestamptz, '2021-11-04 22:00+00'::timestamptz);
insert into flightassignment (flight_id, departure_airport, arrival_airport, scheduled_departure_time, scheduled_arrival_time) values ('4E','SYD', 'LAX', '2021-11-04 01:00+00'::timestamptz, '2021-11-04 16:00+00'::timestamptz);
insert into flightassignment (flight_id, departure_airport, arrival_airport, scheduled_departure_time, scheduled_arrival_time) values ('4F','SYD', 'GRU', '2021-11-04 00:00+00'::timestamptz, '2021-11-04 17:00+00'::timestamptz);
insert into flightassignment (flight_id, departure_airport, arrival_airport, scheduled_departure_time, scheduled_arrival_time) values ('4H','GRU', 'LAX', '2021-11-04 08:25+00'::timestamptz, '2021-11-04 21:25+00'::timestamptz);
insert into flightassignment (flight_id, departure_airport, arrival_airport, scheduled_departure_time, scheduled_arrival_time) values ('4I','GRU', 'SYD', '2021-11-04 06:00+00'::timestamptz, '2021-11-04 23:00+00'::timestamptz);
insert into flightassignment (flight_id, departure_airport, arrival_airport, scheduled_departure_time, scheduled_arrival_time) values ('4J','PEK', 'SYD', '2021-11-04 00:45+00'::timestamptz, '2021-11-04 11:45+00'::timestamptz);
insert into flightassignment (flight_id, departure_airport, arrival_airport, scheduled_departure_time, scheduled_arrival_time) values ('4G','PEK', 'CDG', '2021-11-04 01:30+00'::timestamptz, '2021-11-04 15:30+00'::timestamptz);

--Day 5--
insert into flightassignment (flight_id, departure_airport, arrival_airport, scheduled_departure_time, scheduled_arrival_time) values ('5A','LAX', 'GRU', '2021-11-05 09:45+00'::timestamptz, '2021-11-05 22:45+00'::timestamptz);
insert into flightassignment (flight_id, departure_airport, arrival_airport, scheduled_departure_time, scheduled_arrival_time) values ('5B','LAX', 'SYD', '2021-11-05 03:55+00'::timestamptz, '2021-11-05 18:55+00'::timestamptz);
insert into flightassignment (flight_id, departure_airport, arrival_airport, scheduled_departure_time, scheduled_arrival_time) values ('5C','CDG', 'PEK', '2021-11-05 08:00+00'::timestamptz, '2021-11-05 22:00+00'::timestamptz);
insert into flightassignment (flight_id, departure_airport, arrival_airport, scheduled_departure_time, scheduled_arrival_time) values ('5D','CDG', 'LAX', '2021-11-05 09:00+00'::timestamptz, '2021-11-05 21:00+00'::timestamptz);
insert into flightassignment (flight_id, departure_airport, arrival_airport, scheduled_departure_time, scheduled_arrival_time) values ('5E','SYD', 'PEK', '2021-11-05 01:00+00'::timestamptz, '2021-11-05 12:00+00'::timestamptz);
insert into flightassignment (flight_id, departure_airport, arrival_airport, scheduled_departure_time, scheduled_arrival_time) values ('5F','SYD', 'LAX', '2021-11-05 01:00+00'::timestamptz, '2021-11-05 16:00+00'::timestamptz);
insert into flightassignment (flight_id, departure_airport, arrival_airport, scheduled_departure_time, scheduled_arrival_time) values ('5G','GRU', 'SYD', '2021-11-05 06:00+00'::timestamptz, '2021-11-05 23:00+00'::timestamptz);
insert into flightassignment (flight_id, departure_airport, arrival_airport, scheduled_departure_time, scheduled_arrival_time) values ('5H','GRU', 'CDG', '2021-11-05 05:25+00'::timestamptz, '2021-11-05 20:25+00'::timestamptz); 
insert into flightassignment (flight_id, departure_airport, arrival_airport, scheduled_departure_time, scheduled_arrival_time) values ('5I','PEK', 'GRU', '2021-11-05 02:00+00'::timestamptz, '2021-11-05 16:00+00'::timestamptz);
insert into flightassignment (flight_id, departure_airport, arrival_airport, scheduled_departure_time, scheduled_arrival_time) values ('5J','PEK', 'CDG', '2021-11-05 01:30+00'::timestamptz, '2021-11-05 15:30+00'::timestamptz); 

--Day 6--
insert into flightassignment (flight_id, departure_airport, arrival_airport, scheduled_departure_time, scheduled_arrival_time) values ('6A','LAX', 'SYD', '2021-11-06 03:55+00'::timestamptz, '2021-11-06 18:55+00'::timestamptz);
insert into flightassignment (flight_id, departure_airport, arrival_airport, scheduled_departure_time, scheduled_arrival_time) values ('6B','LAX', 'CDG', '2021-11-06 15:55+00'::timestamptz, '2021-11-07 3:55+00'::timestamptz);
insert into flightassignment (flight_id, departure_airport, arrival_airport, scheduled_departure_time, scheduled_arrival_time) values ('6C','CDG', 'PEK', '2021-11-06 08:00+00'::timestamptz, '2021-11-06 22:00+00'::timestamptz);
insert into flightassignment (flight_id, departure_airport, arrival_airport, scheduled_departure_time, scheduled_arrival_time) values ('6D','CDG', 'GRU', '2021-11-06 05:00+00'::timestamptz, '2021-11-06 22:00+00'::timestamptz);
insert into flightassignment (flight_id, departure_airport, arrival_airport, scheduled_departure_time, scheduled_arrival_time) values ('6E','SYD', 'GRU', '2021-11-06 00:00+00'::timestamptz, '2021-11-06 17:00+00'::timestamptz);
insert into flightassignment (flight_id, departure_airport, arrival_airport, scheduled_departure_time, scheduled_arrival_time) values ('6F','SYD', 'LAX', '2021-11-06 01:00+00'::timestamptz, '2021-11-06 16:00+00'::timestamptz);
insert into flightassignment (flight_id, departure_airport, arrival_airport, scheduled_departure_time, scheduled_arrival_time) values ('6H','GRU', 'SYD', '2021-11-06 08:25+00'::timestamptz, '2021-11-06 21:25+00'::timestamptz);
insert into flightassignment (flight_id, departure_airport, arrival_airport, scheduled_departure_time, scheduled_arrival_time) values ('6G','GRU', 'PEK', '2021-11-06 05:00+00'::timestamptz, '2021-11-06 19:00+00'::timestamptz);
insert into flightassignment (flight_id, departure_airport, arrival_airport, scheduled_departure_time, scheduled_arrival_time) values ('6I','PEK', 'LAX', '2021-11-06 03:00+00'::timestamptz, '2021-11-06 16:00+00'::timestamptz);
insert into flightassignment (flight_id, departure_airport, arrival_airport, scheduled_departure_time, scheduled_arrival_time) values ('6J','PEK', 'CDG', '2021-11-06 01:30+00'::timestamptz, '2021-11-06 15:30+00'::timestamptz);

--Fill pilot, copilot, etc. with N/A instead of null--
UPDATE flightassignment SET pilot = 'N/A', copilot = 'N/A', flight_attendant_1 = 'N/A', flight_attendant_2 = 'N/A', flight_attendant_3 = 'N/A', flight_attendant_4 = 'N/A' WHERE flight_id = '1A';
UPDATE flightassignment SET pilot = 'N/A', copilot = 'N/A', flight_attendant_1 = 'N/A', flight_attendant_2 = 'N/A', flight_attendant_3 = 'N/A', flight_attendant_4 = 'N/A' WHERE flight_id = '1B';
UPDATE flightassignment SET pilot = 'N/A', copilot = 'N/A', flight_attendant_1 = 'N/A', flight_attendant_2 = 'N/A', flight_attendant_3 = 'N/A', flight_attendant_4 = 'N/A' WHERE flight_id = '1C';
UPDATE flightassignment SET pilot = 'N/A', copilot = 'N/A', flight_attendant_1 = 'N/A', flight_attendant_2 = 'N/A', flight_attendant_3 = 'N/A', flight_attendant_4 = 'N/A' WHERE flight_id = '1D';
UPDATE flightassignment SET pilot = 'N/A', copilot = 'N/A', flight_attendant_1 = 'N/A', flight_attendant_2 = 'N/A', flight_attendant_3 = 'N/A', flight_attendant_4 = 'N/A' WHERE flight_id = '1E';
UPDATE flightassignment SET pilot = 'N/A', copilot = 'N/A', flight_attendant_1 = 'N/A', flight_attendant_2 = 'N/A', flight_attendant_3 = 'N/A', flight_attendant_4 = 'N/A' WHERE flight_id = '1F';
UPDATE flightassignment SET pilot = 'N/A', copilot = 'N/A', flight_attendant_1 = 'N/A', flight_attendant_2 = 'N/A', flight_attendant_3 = 'N/A', flight_attendant_4 = 'N/A' WHERE flight_id = '1G';
UPDATE flightassignment SET pilot = 'N/A', copilot = 'N/A', flight_attendant_1 = 'N/A', flight_attendant_2 = 'N/A', flight_attendant_3 = 'N/A', flight_attendant_4 = 'N/A' WHERE flight_id = '1H';
UPDATE flightassignment SET pilot = 'N/A', copilot = 'N/A', flight_attendant_1 = 'N/A', flight_attendant_2 = 'N/A', flight_attendant_3 = 'N/A', flight_attendant_4 = 'N/A' WHERE flight_id = '1I';
UPDATE flightassignment SET pilot = 'N/A', copilot = 'N/A', flight_attendant_1 = 'N/A', flight_attendant_2 = 'N/A', flight_attendant_3 = 'N/A', flight_attendant_4 = 'N/A' WHERE flight_id = '1J';
UPDATE flightassignment SET pilot = 'N/A', copilot = 'N/A', flight_attendant_1 = 'N/A', flight_attendant_2 = 'N/A', flight_attendant_3 = 'N/A', flight_attendant_4 = 'N/A' WHERE flight_id = '2A';
UPDATE flightassignment SET pilot = 'N/A', copilot = 'N/A', flight_attendant_1 = 'N/A', flight_attendant_2 = 'N/A', flight_attendant_3 = 'N/A', flight_attendant_4 = 'N/A' WHERE flight_id = '2B';
UPDATE flightassignment SET pilot = 'N/A', copilot = 'N/A', flight_attendant_1 = 'N/A', flight_attendant_2 = 'N/A', flight_attendant_3 = 'N/A', flight_attendant_4 = 'N/A' WHERE flight_id = '2C';
UPDATE flightassignment SET pilot = 'N/A', copilot = 'N/A', flight_attendant_1 = 'N/A', flight_attendant_2 = 'N/A', flight_attendant_3 = 'N/A', flight_attendant_4 = 'N/A' WHERE flight_id = '2D';
UPDATE flightassignment SET pilot = 'N/A', copilot = 'N/A', flight_attendant_1 = 'N/A', flight_attendant_2 = 'N/A', flight_attendant_3 = 'N/A', flight_attendant_4 = 'N/A' WHERE flight_id = '2E';
UPDATE flightassignment SET pilot = 'N/A', copilot = 'N/A', flight_attendant_1 = 'N/A', flight_attendant_2 = 'N/A', flight_attendant_3 = 'N/A', flight_attendant_4 = 'N/A' WHERE flight_id = '2F';
UPDATE flightassignment SET pilot = 'N/A', copilot = 'N/A', flight_attendant_1 = 'N/A', flight_attendant_2 = 'N/A', flight_attendant_3 = 'N/A', flight_attendant_4 = 'N/A' WHERE flight_id = '2G';
UPDATE flightassignment SET pilot = 'N/A', copilot = 'N/A', flight_attendant_1 = 'N/A', flight_attendant_2 = 'N/A', flight_attendant_3 = 'N/A', flight_attendant_4 = 'N/A' WHERE flight_id = '2H';
UPDATE flightassignment SET pilot = 'N/A', copilot = 'N/A', flight_attendant_1 = 'N/A', flight_attendant_2 = 'N/A', flight_attendant_3 = 'N/A', flight_attendant_4 = 'N/A' WHERE flight_id = '2I';
UPDATE flightassignment SET pilot = 'N/A', copilot = 'N/A', flight_attendant_1 = 'N/A', flight_attendant_2 = 'N/A', flight_attendant_3 = 'N/A', flight_attendant_4 = 'N/A' WHERE flight_id = '2J';
UPDATE flightassignment SET pilot = 'N/A', copilot = 'N/A', flight_attendant_1 = 'N/A', flight_attendant_2 = 'N/A', flight_attendant_3 = 'N/A', flight_attendant_4 = 'N/A' WHERE flight_id = '3A';
UPDATE flightassignment SET pilot = 'N/A', copilot = 'N/A', flight_attendant_1 = 'N/A', flight_attendant_2 = 'N/A', flight_attendant_3 = 'N/A', flight_attendant_4 = 'N/A' WHERE flight_id = '3B';
UPDATE flightassignment SET pilot = 'N/A', copilot = 'N/A', flight_attendant_1 = 'N/A', flight_attendant_2 = 'N/A', flight_attendant_3 = 'N/A', flight_attendant_4 = 'N/A' WHERE flight_id = '3C';
UPDATE flightassignment SET pilot = 'N/A', copilot = 'N/A', flight_attendant_1 = 'N/A', flight_attendant_2 = 'N/A', flight_attendant_3 = 'N/A', flight_attendant_4 = 'N/A' WHERE flight_id = '3D';
UPDATE flightassignment SET pilot = 'N/A', copilot = 'N/A', flight_attendant_1 = 'N/A', flight_attendant_2 = 'N/A', flight_attendant_3 = 'N/A', flight_attendant_4 = 'N/A' WHERE flight_id = '3E';
UPDATE flightassignment SET pilot = 'N/A', copilot = 'N/A', flight_attendant_1 = 'N/A', flight_attendant_2 = 'N/A', flight_attendant_3 = 'N/A', flight_attendant_4 = 'N/A' WHERE flight_id = '3F';
UPDATE flightassignment SET pilot = 'N/A', copilot = 'N/A', flight_attendant_1 = 'N/A', flight_attendant_2 = 'N/A', flight_attendant_3 = 'N/A', flight_attendant_4 = 'N/A' WHERE flight_id = '3G';
UPDATE flightassignment SET pilot = 'N/A', copilot = 'N/A', flight_attendant_1 = 'N/A', flight_attendant_2 = 'N/A', flight_attendant_3 = 'N/A', flight_attendant_4 = 'N/A' WHERE flight_id = '3H';
UPDATE flightassignment SET pilot = 'N/A', copilot = 'N/A', flight_attendant_1 = 'N/A', flight_attendant_2 = 'N/A', flight_attendant_3 = 'N/A', flight_attendant_4 = 'N/A' WHERE flight_id = '3I';
UPDATE flightassignment SET pilot = 'N/A', copilot = 'N/A', flight_attendant_1 = 'N/A', flight_attendant_2 = 'N/A', flight_attendant_3 = 'N/A', flight_attendant_4 = 'N/A' WHERE flight_id = '3J';
UPDATE flightassignment SET pilot = 'N/A', copilot = 'N/A', flight_attendant_1 = 'N/A', flight_attendant_2 = 'N/A', flight_attendant_3 = 'N/A', flight_attendant_4 = 'N/A' WHERE flight_id = '4A';
UPDATE flightassignment SET pilot = 'N/A', copilot = 'N/A', flight_attendant_1 = 'N/A', flight_attendant_2 = 'N/A', flight_attendant_3 = 'N/A', flight_attendant_4 = 'N/A' WHERE flight_id = '4B';
UPDATE flightassignment SET pilot = 'N/A', copilot = 'N/A', flight_attendant_1 = 'N/A', flight_attendant_2 = 'N/A', flight_attendant_3 = 'N/A', flight_attendant_4 = 'N/A' WHERE flight_id = '4C';
UPDATE flightassignment SET pilot = 'N/A', copilot = 'N/A', flight_attendant_1 = 'N/A', flight_attendant_2 = 'N/A', flight_attendant_3 = 'N/A', flight_attendant_4 = 'N/A' WHERE flight_id = '4D';
UPDATE flightassignment SET pilot = 'N/A', copilot = 'N/A', flight_attendant_1 = 'N/A', flight_attendant_2 = 'N/A', flight_attendant_3 = 'N/A', flight_attendant_4 = 'N/A' WHERE flight_id = '4E';
UPDATE flightassignment SET pilot = 'N/A', copilot = 'N/A', flight_attendant_1 = 'N/A', flight_attendant_2 = 'N/A', flight_attendant_3 = 'N/A', flight_attendant_4 = 'N/A' WHERE flight_id = '4F';
UPDATE flightassignment SET pilot = 'N/A', copilot = 'N/A', flight_attendant_1 = 'N/A', flight_attendant_2 = 'N/A', flight_attendant_3 = 'N/A', flight_attendant_4 = 'N/A' WHERE flight_id = '4G';
UPDATE flightassignment SET pilot = 'N/A', copilot = 'N/A', flight_attendant_1 = 'N/A', flight_attendant_2 = 'N/A', flight_attendant_3 = 'N/A', flight_attendant_4 = 'N/A' WHERE flight_id = '4H';
UPDATE flightassignment SET pilot = 'N/A', copilot = 'N/A', flight_attendant_1 = 'N/A', flight_attendant_2 = 'N/A', flight_attendant_3 = 'N/A', flight_attendant_4 = 'N/A' WHERE flight_id = '4I';
UPDATE flightassignment SET pilot = 'N/A', copilot = 'N/A', flight_attendant_1 = 'N/A', flight_attendant_2 = 'N/A', flight_attendant_3 = 'N/A', flight_attendant_4 = 'N/A' WHERE flight_id = '4J';
UPDATE flightassignment SET pilot = 'N/A', copilot = 'N/A', flight_attendant_1 = 'N/A', flight_attendant_2 = 'N/A', flight_attendant_3 = 'N/A', flight_attendant_4 = 'N/A' WHERE flight_id = '5A';
UPDATE flightassignment SET pilot = 'N/A', copilot = 'N/A', flight_attendant_1 = 'N/A', flight_attendant_2 = 'N/A', flight_attendant_3 = 'N/A', flight_attendant_4 = 'N/A' WHERE flight_id = '5B';
UPDATE flightassignment SET pilot = 'N/A', copilot = 'N/A', flight_attendant_1 = 'N/A', flight_attendant_2 = 'N/A', flight_attendant_3 = 'N/A', flight_attendant_4 = 'N/A' WHERE flight_id = '5C';
UPDATE flightassignment SET pilot = 'N/A', copilot = 'N/A', flight_attendant_1 = 'N/A', flight_attendant_2 = 'N/A', flight_attendant_3 = 'N/A', flight_attendant_4 = 'N/A' WHERE flight_id = '5D';
UPDATE flightassignment SET pilot = 'N/A', copilot = 'N/A', flight_attendant_1 = 'N/A', flight_attendant_2 = 'N/A', flight_attendant_3 = 'N/A', flight_attendant_4 = 'N/A' WHERE flight_id = '5E';
UPDATE flightassignment SET pilot = 'N/A', copilot = 'N/A', flight_attendant_1 = 'N/A', flight_attendant_2 = 'N/A', flight_attendant_3 = 'N/A', flight_attendant_4 = 'N/A' WHERE flight_id = '5F';
UPDATE flightassignment SET pilot = 'N/A', copilot = 'N/A', flight_attendant_1 = 'N/A', flight_attendant_2 = 'N/A', flight_attendant_3 = 'N/A', flight_attendant_4 = 'N/A' WHERE flight_id = '5G';
UPDATE flightassignment SET pilot = 'N/A', copilot = 'N/A', flight_attendant_1 = 'N/A', flight_attendant_2 = 'N/A', flight_attendant_3 = 'N/A', flight_attendant_4 = 'N/A' WHERE flight_id = '5H';
UPDATE flightassignment SET pilot = 'N/A', copilot = 'N/A', flight_attendant_1 = 'N/A', flight_attendant_2 = 'N/A', flight_attendant_3 = 'N/A', flight_attendant_4 = 'N/A' WHERE flight_id = '5I';
UPDATE flightassignment SET pilot = 'N/A', copilot = 'N/A', flight_attendant_1 = 'N/A', flight_attendant_2 = 'N/A', flight_attendant_3 = 'N/A', flight_attendant_4 = 'N/A' WHERE flight_id = '5J';
UPDATE flightassignment SET pilot = 'N/A', copilot = 'N/A', flight_attendant_1 = 'N/A', flight_attendant_2 = 'N/A', flight_attendant_3 = 'N/A', flight_attendant_4 = 'N/A' WHERE flight_id = '6A';
UPDATE flightassignment SET pilot = 'N/A', copilot = 'N/A', flight_attendant_1 = 'N/A', flight_attendant_2 = 'N/A', flight_attendant_3 = 'N/A', flight_attendant_4 = 'N/A' WHERE flight_id = '6B';
UPDATE flightassignment SET pilot = 'N/A', copilot = 'N/A', flight_attendant_1 = 'N/A', flight_attendant_2 = 'N/A', flight_attendant_3 = 'N/A', flight_attendant_4 = 'N/A' WHERE flight_id = '6C';
UPDATE flightassignment SET pilot = 'N/A', copilot = 'N/A', flight_attendant_1 = 'N/A', flight_attendant_2 = 'N/A', flight_attendant_3 = 'N/A', flight_attendant_4 = 'N/A' WHERE flight_id = '6D';
UPDATE flightassignment SET pilot = 'N/A', copilot = 'N/A', flight_attendant_1 = 'N/A', flight_attendant_2 = 'N/A', flight_attendant_3 = 'N/A', flight_attendant_4 = 'N/A' WHERE flight_id = '6E';
UPDATE flightassignment SET pilot = 'N/A', copilot = 'N/A', flight_attendant_1 = 'N/A', flight_attendant_2 = 'N/A', flight_attendant_3 = 'N/A', flight_attendant_4 = 'N/A' WHERE flight_id = '6F';
UPDATE flightassignment SET pilot = 'N/A', copilot = 'N/A', flight_attendant_1 = 'N/A', flight_attendant_2 = 'N/A', flight_attendant_3 = 'N/A', flight_attendant_4 = 'N/A' WHERE flight_id = '6G';
UPDATE flightassignment SET pilot = 'N/A', copilot = 'N/A', flight_attendant_1 = 'N/A', flight_attendant_2 = 'N/A', flight_attendant_3 = 'N/A', flight_attendant_4 = 'N/A' WHERE flight_id = '6H';
UPDATE flightassignment SET pilot = 'N/A', copilot = 'N/A', flight_attendant_1 = 'N/A', flight_attendant_2 = 'N/A', flight_attendant_3 = 'N/A', flight_attendant_4 = 'N/A' WHERE flight_id = '6I';
UPDATE flightassignment SET pilot = 'N/A', copilot = 'N/A', flight_attendant_1 = 'N/A', flight_attendant_2 = 'N/A', flight_attendant_3 = 'N/A', flight_attendant_4 = 'N/A' WHERE flight_id = '6J';