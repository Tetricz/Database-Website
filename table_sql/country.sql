create table country (
	country VARCHAR(50) PRIMARY KEY,
    taxes DEC(10,2)
);

insert into country (country, taxes) values ('United States', 0.22);
insert into country (country, taxes) values ('Australia', 0.325);
insert into country (country, taxes) values ('Brazil', 0.275);
insert into country (country, taxes) values ('France', 0.25);
insert into country (country, taxes) values ('China', 0.35);