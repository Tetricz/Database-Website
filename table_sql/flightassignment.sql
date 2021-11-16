create table flightassignment (
	flight_id VARCHAR(2),
    departure_airport VARCHAR (3),
    arrival_airport VARCHAR (3),
    pilot VARCHAR (50),
    copilot VARCHAR (50),
    scheduled_depature_time DATETIME,
    scheduled_arrival_time DATETIME,
    actual_depature_time DATETIME,
    actual_arrival_time DATETIME,
    flight_attendant_1 VARCHAR (50),
    flight_attendant_2 VARCHAR (50),
    flight_attendant_3 VARCHAR (50),
    flight_attendant_4 VARCHAR (50)
);

--Day 1--
insert into flightassignment (flight_id, departure_airport, arrival_airport, pilot, copilot, departure_time, arrival_time) values (GRU, LAX);
insert into flightassignment (flight_id, departure_airport, arrival_airport, pilot, copilot, departure_time, arrival_time) values (LAX, CDG);
insert into flightassignment (flight_id, departure_airport, arrival_airport, pilot, copilot, departure_time, arrival_time) values (CDG, PEK);
insert into flightassignment (flight_id, departure_airport, arrival_airport, pilot, copilot, departure_time, arrival_time) values (PEK, SYD);
insert into flightassignment (flight_id, departure_airport, arrival_airport, pilot, copilot, departure_time, arrival_time) values (SYD, GRU);

insert into flightassignment (flight_id, departure_airport, arrival_airport, pilot, copilot, departure_time, arrival_time) values (LAX, PEK);
insert into flightassignment (flight_id, departure_airport, arrival_airport, pilot, copilot, departure_time, arrival_time) values (PEK, SYD);
insert into flightassignment (flight_id, departure_airport, arrival_airport, pilot, copilot, departure_time, arrival_time) values (SYD, GRU);
insert into flightassignment (flight_id, departure_airport, arrival_airport, pilot, copilot, departure_time, arrival_time) values (GRU, CDG);
insert into flightassignment (flight_id, departure_airport, arrival_airport, pilot, copilot, departure_time, arrival_time) values (CDG, LAX);

--Day 2--
insert into flightassignment (flight_id, departure_airport, arrival_airport, pilot, copilot, departure_time, arrival_time) values (PEK, GRU);
insert into flightassignment (flight_id, departure_airport, arrival_airport, pilot, copilot, departure_time, arrival_time) values (GRU, SYD);
insert into flightassignment (flight_id, departure_airport, arrival_airport, pilot, copilot, departure_time, arrival_time) values (SYD, LAX);
insert into flightassignment (flight_id, departure_airport, arrival_airport, pilot, copilot, departure_time, arrival_time) values (LAX, CDG);
insert into flightassignment (flight_id, departure_airport, arrival_airport, pilot, copilot, departure_time, arrival_time) values (CDG, PEK);

insert into flightassignment (flight_id, departure_airport, arrival_airport, pilot, copilot, departure_time, arrival_time) values (SYD, PEK);
insert into flightassignment (flight_id, departure_airport, arrival_airport, pilot, copilot, departure_time, arrival_time) values (PEK, LAX);
insert into flightassignment (flight_id, departure_airport, arrival_airport, pilot, copilot, departure_time, arrival_time) values (LAX, CDG);
insert into flightassignment (flight_id, departure_airport, arrival_airport, pilot, copilot, departure_time, arrival_time) values (CDG, GRU);
insert into flightassignment (flight_id, departure_airport, arrival_airport, pilot, copilot, departure_time, arrival_time) values (GRU, SYD);

--Day 3--
insert into flightassignment (flight_id, departure_airport, arrival_airport, pilot, copilot, departure_time, arrival_time) values (CDG, LAX);
insert into flightassignment (flight_id, departure_airport, arrival_airport, pilot, copilot, departure_time, arrival_time) values (LAX, SYD);
insert into flightassignment (flight_id, departure_airport, arrival_airport, pilot, copilot, departure_time, arrival_time) values (SYD, GRU);
insert into flightassignment (flight_id, departure_airport, arrival_airport, pilot, copilot, departure_time, arrival_time) values (GRU, PEK);
insert into flightassignment (flight_id, departure_airport, arrival_airport, pilot, copilot, departure_time, arrival_time) values (PEK, CDG);

insert into flightassignment (flight_id, departure_airport, arrival_airport, pilot, copilot, departure_time, arrival_time) values (PEK, LAX);
insert into flightassignment (flight_id, departure_airport, arrival_airport, pilot, copilot, departure_time, arrival_time) values (LAX, CDG);
insert into flightassignment (flight_id, departure_airport, arrival_airport, pilot, copilot, departure_time, arrival_time) values (CDG, GRU);
insert into flightassignment (flight_id, departure_airport, arrival_airport, pilot, copilot, departure_time, arrival_time) values (GRU, SYD);
insert into flightassignment (flight_id, departure_airport, arrival_airport, pilot, copilot, departure_time, arrival_time) values (SYD, PEK);

--Day 4--
insert into flightassignment (flight_id, departure_airport, arrival_airport, pilot, copilot, departure_time, arrival_time) values (LAX, CDG);
insert into flightassignment (flight_id, departure_airport, arrival_airport, pilot, copilot, departure_time, arrival_time) values (LAX, PEK);
insert into flightassignment (flight_id, departure_airport, arrival_airport, pilot, copilot, departure_time, arrival_time) values (CDG, GRU);
insert into flightassignment (flight_id, departure_airport, arrival_airport, pilot, copilot, departure_time, arrival_time) values (CDG, PEK);
insert into flightassignment (flight_id, departure_airport, arrival_airport, pilot, copilot, departure_time, arrival_time) values (SYD, LAX);
insert into flightassignment (flight_id, departure_airport, arrival_airport, pilot, copilot, departure_time, arrival_time) values (SYD, GRU);
insert into flightassignment (flight_id, departure_airport, arrival_airport, pilot, copilot, departure_time, arrival_time) values (GRU, LAX);
insert into flightassignment (flight_id, departure_airport, arrival_airport, pilot, copilot, departure_time, arrival_time) values (GRU, SYD);
insert into flightassignment (flight_id, departure_airport, arrival_airport, pilot, copilot, departure_time, arrival_time) values (PEK, SYD);
insert into flightassignment (flight_id, departure_airport, arrival_airport, pilot, copilot, departure_time, arrival_time) values (PEK, CDG);

--Day 5--
insert into flightassignment (flight_id, departure_airport, arrival_airport, pilot, copilot, departure_time, arrival_time) values (LAX, GRU);
insert into flightassignment (flight_id, departure_airport, arrival_airport, pilot, copilot, departure_time, arrival_time) values (LAX, SYD);
insert into flightassignment (flight_id, departure_airport, arrival_airport, pilot, copilot, departure_time, arrival_time) values (CDG, PEK);
insert into flightassignment (flight_id, departure_airport, arrival_airport, pilot, copilot, departure_time, arrival_time) values (CDG, LAX);
insert into flightassignment (flight_id, departure_airport, arrival_airport, pilot, copilot, departure_time, arrival_time) values (SYD, PEK);
insert into flightassignment (flight_id, departure_airport, arrival_airport, pilot, copilot, departure_time, arrival_time) values (SYD, LAX);
insert into flightassignment (flight_id, departure_airport, arrival_airport, pilot, copilot, departure_time, arrival_time) values (GRU, SYD);
insert into flightassignment (flight_id, departure_airport, arrival_airport, pilot, copilot, departure_time, arrival_time) values (GRU, CDG);
insert into flightassignment (flight_id, departure_airport, arrival_airport, pilot, copilot, departure_time, arrival_time) values (PEK, GRU);
insert into flightassignment (flight_id, departure_airport, arrival_airport, pilot, copilot, departure_time, arrival_time) values (PEK, CDG);

--Day 6--
insert into flightassignment (flight_id, departure_airport, arrival_airport, pilot, copilot, departure_time, arrival_time) values (LAX, SYD);
insert into flightassignment (flight_id, departure_airport, arrival_airport, pilot, copilot, departure_time, arrival_time) values (LAX, CDG);
insert into flightassignment (flight_id, departure_airport, arrival_airport, pilot, copilot, departure_time, arrival_time) values (CDG, SYD);
insert into flightassignment (flight_id, departure_airport, arrival_airport, pilot, copilot, departure_time, arrival_time) values (CDG, GRU);
insert into flightassignment (flight_id, departure_airport, arrival_airport, pilot, copilot, departure_time, arrival_time) values (SYD, GRU);
insert into flightassignment (flight_id, departure_airport, arrival_airport, pilot, copilot, departure_time, arrival_time) values (SYD, PEK);
insert into flightassignment (flight_id, departure_airport, arrival_airport, pilot, copilot, departure_time, arrival_time) values (GRU, LAX);
insert into flightassignment (flight_id, departure_airport, arrival_airport, pilot, copilot, departure_time, arrival_time) values (GRU, PEK);
insert into flightassignment (flight_id, departure_airport, arrival_airport, pilot, copilot, departure_time, arrival_time) values (PEK, LAX);
insert into flightassignment (flight_id, departure_airport, arrival_airport, pilot, copilot, departure_time, arrival_time) values (PEK, CDG);