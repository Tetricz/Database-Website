/*
SSN and flight_id are a composite key
duration should be derived from flights
*/

DROP TABLE flight_shift;

CREATE TABLE flight_shift(
    social_security_num VARCHAR(50),
    flight_id INT,
    duration INT
);