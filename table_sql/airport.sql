/*
airport_id is to be changed to a VARCHAR that is the airport_code, this is to be determined later
for now we will use 1-38 as ids for the various airports

airport names are randomly generated

country is taken from the employee table
*/
DROP TABLE airport;

create table airport (
	airport_id INT, 
	airport_name VARCHAR(51),
    country VARCHAR(2)
);

insert into airport (airport_id, airport_name, country) values (1, 'Robenia', (SELECT DISTINCT(country) FROM employee ORDER BY country LIMIT 1 OFFSET 0));
insert into airport (airport_id, airport_name, country) values (2, 'Atlanta', (SELECT DISTINCT(country) FROM employee ORDER BY country LIMIT 1 OFFSET 1));
insert into airport (airport_id, airport_name, country) values (3, 'Ignatius', (SELECT DISTINCT(country) FROM employee ORDER BY country LIMIT 1 OFFSET 2));
insert into airport (airport_id, airport_name, country) values (4, 'Morris', (SELECT DISTINCT(country) FROM employee ORDER BY country LIMIT 1 OFFSET 3));
insert into airport (airport_id, airport_name, country) values (5, 'Tammie', (SELECT DISTINCT(country) FROM employee ORDER BY country LIMIT 1 OFFSET 4));
insert into airport (airport_id, airport_name, country) values (6, 'Kent', (SELECT DISTINCT(country) FROM employee ORDER BY country LIMIT 1 OFFSET 5));
insert into airport (airport_id, airport_name, country) values (7, 'Broderic', (SELECT DISTINCT(country) FROM employee ORDER BY country LIMIT 1 OFFSET 6));
insert into airport (airport_id, airport_name, country) values (8, 'Rozelle', (SELECT DISTINCT(country) FROM employee ORDER BY country LIMIT 1 OFFSET 7));
insert into airport (airport_id, airport_name, country) values (9, 'Glory', (SELECT DISTINCT(country) FROM employee ORDER BY country LIMIT 1 OFFSET 8));
insert into airport (airport_id, airport_name, country) values (11, 'Marylin', (SELECT DISTINCT(country) FROM employee ORDER BY country LIMIT 1 OFFSET 9));
insert into airport (airport_id, airport_name, country) values (11, 'Quint', (SELECT DISTINCT(country) FROM employee ORDER BY country LIMIT 1 OFFSET 10));
insert into airport (airport_id, airport_name, country) values (12, 'Ambrosio', (SELECT DISTINCT(country) FROM employee ORDER BY country LIMIT 1 OFFSET 11));
insert into airport (airport_id, airport_name, country) values (13, 'Jack', (SELECT DISTINCT(country) FROM employee ORDER BY country LIMIT 1 OFFSET 12));
insert into airport (airport_id, airport_name, country) values (14, 'Hedi', (SELECT DISTINCT(country) FROM employee ORDER BY country LIMIT 1 OFFSET 13));
insert into airport (airport_id, airport_name, country) values (15, 'Dillon', (SELECT DISTINCT(country) FROM employee ORDER BY country LIMIT 1 OFFSET 14));
insert into airport (airport_id, airport_name, country) values (16, 'Alfred', (SELECT DISTINCT(country) FROM employee ORDER BY country LIMIT 1 OFFSET 15));
insert into airport (airport_id, airport_name, country) values (17, 'Reilly', (SELECT DISTINCT(country) FROM employee ORDER BY country LIMIT 1 OFFSET 16));
insert into airport (airport_id, airport_name, country) values (18, 'Gayler', (SELECT DISTINCT(country) FROM employee ORDER BY country LIMIT 1 OFFSET 17));
insert into airport (airport_id, airport_name, country) values (19, 'Ive', (SELECT DISTINCT(country) FROM employee ORDER BY country LIMIT 1 OFFSET 18));
insert into airport (airport_id, airport_name, country) values (21, 'Clark', (SELECT DISTINCT(country) FROM employee ORDER BY country LIMIT 1 OFFSET 19));
insert into airport (airport_id, airport_name, country) values (21, 'Beltran', (SELECT DISTINCT(country) FROM employee ORDER BY country LIMIT 1 OFFSET 20));
insert into airport (airport_id, airport_name, country) values (22, 'Romain', (SELECT DISTINCT(country) FROM employee ORDER BY country LIMIT 1 OFFSET 21));
insert into airport (airport_id, airport_name, country) values (23, 'Ninette', (SELECT DISTINCT(country) FROM employee ORDER BY country LIMIT 1 OFFSET 22));
insert into airport (airport_id, airport_name, country) values (24, 'Philippa', (SELECT DISTINCT(country) FROM employee ORDER BY country LIMIT 1 OFFSET 23));
insert into airport (airport_id, airport_name, country) values (25, 'Corrianne', (SELECT DISTINCT(country) FROM employee ORDER BY country LIMIT 1 OFFSET 24));
insert into airport (airport_id, airport_name, country) values (26, 'Christina', (SELECT DISTINCT(country) FROM employee ORDER BY country LIMIT 1 OFFSET 25));
insert into airport (airport_id, airport_name, country) values (27, 'Joanna', (SELECT DISTINCT(country) FROM employee ORDER BY country LIMIT 1 OFFSET 26));
insert into airport (airport_id, airport_name, country) values (28, 'Matias', (SELECT DISTINCT(country) FROM employee ORDER BY country LIMIT 1 OFFSET 27));
insert into airport (airport_id, airport_name, country) values (29, 'Devondra', (SELECT DISTINCT(country) FROM employee ORDER BY country LIMIT 1 OFFSET 28));
insert into airport (airport_id, airport_name, country) values (31, 'Teodoor', (SELECT DISTINCT(country) FROM employee ORDER BY country LIMIT 1 OFFSET 29));
insert into airport (airport_id, airport_name, country) values (31, 'Lanae', (SELECT DISTINCT(country) FROM employee ORDER BY country LIMIT 1 OFFSET 30));
insert into airport (airport_id, airport_name, country) values (32, 'Faustine', (SELECT DISTINCT(country) FROM employee ORDER BY country LIMIT 1 OFFSET 31));
insert into airport (airport_id, airport_name, country) values (33, 'Merline', (SELECT DISTINCT(country) FROM employee ORDER BY country LIMIT 1 OFFSET 32));
insert into airport (airport_id, airport_name, country) values (34, 'Kalindi', (SELECT DISTINCT(country) FROM employee ORDER BY country LIMIT 1 OFFSET 33));
insert into airport (airport_id, airport_name, country) values (35, 'Alayne', (SELECT DISTINCT(country) FROM employee ORDER BY country LIMIT 1 OFFSET 34));
insert into airport (airport_id, airport_name, country) values (36, 'Cesaro', (SELECT DISTINCT(country) FROM employee ORDER BY country LIMIT 1 OFFSET 35));
insert into airport (airport_id, airport_name, country) values (37, 'Dore', (SELECT DISTINCT(country) FROM employee ORDER BY country LIMIT 1 OFFSET 36));
insert into airport (airport_id, airport_name, country) values (38, 'Jocelin', (SELECT DISTINCT(country) FROM employee ORDER BY country LIMIT 1 OFFSET 37));