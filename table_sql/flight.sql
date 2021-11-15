/*
arrival and departure codes are airport_id
airport id is planned to later be refactored to airport codes

right now the dep_code and ar_code are ints, these will likely need to be changed
*/

DROP TABLE flight;

CREATE TABLE flight (
	flight_id INT,
    pilot VARCHAR(20),
    co-pilot VARCHAR(20),
    departure_code INT,
    arrival_code INT,
    planned_departure DATE,
    planned_arrival DATE,
    actual_departure DATE,
    actual_arrival DATE,
    crew1 VARCHAR(20),
    crew2 VARCHAR(20),
    crew3 VARCHAR(20),
    crew4 VARCHAR(20)
);


insert into flight (flight_id, pilot, co-pilot, departure_code, arrival_code, planned_departure, planned_arrival, actual_departure, actual_arrival, crew1, crew2, crew3, crew4) 
values ();
