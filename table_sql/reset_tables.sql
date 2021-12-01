create table airport (
	airport_code VARCHAR(3) PRIMARY KEY,
    city VARCHAR(50),
    airport_name VARCHAR(50)
);

insert into airport (airport_code, city, airport_name) values ('PEK', 'Beijing', 'Beijing Capital International Airport');
insert into airport (airport_code, city, airport_name) values ('SYD', 'Sydney', 'Sydney Airport');
insert into airport (airport_code, city, airport_name) values ('LAX', 'Los Angeles', 'Los Angeles International Airport');
insert into airport (airport_code, city, airport_name) values ('CDG', 'Paris', 'Charles de Gaulle Airport');
insert into airport (airport_code, city, airport_name) values ('GRU', 'Sao Paulo', 'Guarulhos International Airport');
create table country (
	country VARCHAR(50) PRIMARY KEY,
    taxes DEC(10,2)
);

insert into country (country, taxes) values ('United States', 0.22);
insert into country (country, taxes) values ('Australia', 0.325);
insert into country (country, taxes) values ('Brazil', 0.275);
insert into country (country, taxes) values ('France', 0.25);
insert into country (country, taxes) values ('China', 0.35);

create table employee (
	social_security_num VARCHAR(50) PRIMARY KEY,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	email VARCHAR(50),
	gender VARCHAR(50),
	street_num VARCHAR(50),
	city VARCHAR(50),
	country VARCHAR(50),
	job VARCHAR(20),
	current_airport_code VARCHAR(3)
);

insert into employee (social_security_num, first_name, last_name, email, gender, street_num, city, country, job, current_airport_code) values ('110-01-2872', 'Maurise', 'Dello', 'mdello0@list-manage.com', 'Male', '80325', 'Sydney', 'Australia', 'pilot', 'SYD');
insert into employee (social_security_num, first_name, last_name, email, gender, street_num, city, country, job, current_airport_code) values ('107-61-8604', 'Cynthea', 'Creeber', 'ccreeber1@jiathis.com', 'Female', '1122', 'Sydney', 'Australia', 'pilot', 'SYD');
insert into employee (social_security_num, first_name, last_name, email, gender, street_num, city, country, job, current_airport_code) values ('730-51-8952', 'Torry', 'McClelland', 'tmcclelland2@admin.ch', 'Female', '1', 'Beijing', 'China', 'pilot', 'PEK');
insert into employee (social_security_num, first_name, last_name, email, gender, street_num, city, country, job, current_airport_code) values ('145-84-0374', 'Rori', 'Abram', 'rabram3@java.com', 'Female', '6', 'Beijing', 'China', 'pilot', 'PEK');
insert into employee (social_security_num, first_name, last_name, email, gender, street_num, city, country, job, current_airport_code) values ('108-33-3304', 'Merry', 'Sylett', 'msylett4@yahoo.com', 'Female', '3715', 'Paris', 'France', 'pilot', 'CDG');
insert into employee (social_security_num, first_name, last_name, email, gender, street_num, city, country, job, current_airport_code) values ('620-45-9432', 'Kip', 'Acaster', 'kacaster5@geocities.jp', 'Female', '2661', 'Paris', 'France', 'pilot', 'CDG');
insert into employee (social_security_num, first_name, last_name, email, gender, street_num, city, country, job, current_airport_code) values ('830-55-4393', 'Cross', 'Monckman', 'cmonckman6@bing.com', 'Male', '3259', 'Los Angeles', 'United States', 'pilot', 'LAX');
insert into employee (social_security_num, first_name, last_name, email, gender, street_num, city, country, job, current_airport_code) values ('619-11-9230', 'Sheeree', 'Martynov', 'smartynov7@stanford.edu', 'Female', '96090', 'Los Angeles', 'United States', 'pilot', 'LAX');
insert into employee (social_security_num, first_name, last_name, email, gender, street_num, city, country, job, current_airport_code) values ('605-24-9827', 'Maritsa', 'Manuely', 'mmanuely8@twitter.com', 'Male', '5', 'Sao Paulo', 'Brazil', 'pilot', 'GRU');
insert into employee (social_security_num, first_name, last_name, email, gender, street_num, city, country, job, current_airport_code) values ('500-79-5396', 'Abbe', 'Laurence', 'alaurence9@g.co', 'Female', '5542', 'Sao Paulo', 'Brazil', 'pilot', 'GRU');
insert into employee (social_security_num, first_name, last_name, email, gender, street_num, city, country, job, current_airport_code) values ('640-04-0209', 'Emiline', 'Mair', 'emaira@vkontakte.ru', 'Male', '5655', 'Sydney', 'Australia', 'copilot', 'SYD');
insert into employee (social_security_num, first_name, last_name, email, gender, street_num, city, country, job, current_airport_code) values ('796-77-4286', 'Gisela', 'Stockings', 'gstockingsb@arizona.edu', 'Male', '417', 'Sydney', 'Australia', 'copilot', 'SYD');
insert into employee (social_security_num, first_name, last_name, email, gender, street_num, city, country, job, current_airport_code) values ('313-24-1819', 'Charisse', 'Cornill', 'ccornillc@newsvine.com', 'Male', '6654', 'Beijing', 'China', 'copilot', 'PEK');
insert into employee (social_security_num, first_name, last_name, email, gender, street_num, city, country, job, current_airport_code) values ('791-38-6298', 'Terry', 'Durrant', 'tdurrantd@bizjournals.com', 'Male', '504', 'Beijing', 'China', 'copilot', 'PEK');
insert into employee (social_security_num, first_name, last_name, email, gender, street_num, city, country, job, current_airport_code) values ('216-31-8755', 'Tish', 'Rymell', 'trymelle@home.pl', 'Female', '827', 'Paris', 'France', 'copilot', 'CDG');
insert into employee (social_security_num, first_name, last_name, email, gender, street_num, city, country, job, current_airport_code) values ('874-40-1427', 'Jeanette', 'Yele', 'jyelef@gov.uk', 'Male', '2', 'Paris', 'France', 'copilot', 'CDG');
insert into employee (social_security_num, first_name, last_name, email, gender, street_num, city, country, job, current_airport_code) values ('603-14-9498', 'Zerk', 'Gyorffy', 'zgyorffyg@ebay.co.uk', 'Male', '07', 'Los Angeles', 'United States', 'copilot', 'LAX');
insert into employee (social_security_num, first_name, last_name, email, gender, street_num, city, country, job, current_airport_code) values ('386-94-2181', 'Vladimir', 'Lahrs', 'vlahrsh@un.org', 'Male', '4345', 'Los Angeles', 'United States', 'copilot', 'LAX');
insert into employee (social_security_num, first_name, last_name, email, gender, street_num, city, country, job, current_airport_code) values ('545-56-1535', 'Jacki', 'Corsar', 'jcorsari@dailymotion.com', 'Female', '2', 'Sao Paulo', 'Brazil', 'copilot', 'GRU');
insert into employee (social_security_num, first_name, last_name, email, gender, street_num, city, country, job, current_airport_code) values ('280-33-7851', 'Malena', 'Ronchka', 'mronchkaj@blogtalkradio.com', 'Female', '13', 'Sao Paulo', 'Brazil', 'copilot', 'GRU');
insert into employee (social_security_num, first_name, last_name, email, gender, street_num, city, country, job, current_airport_code) values ('651-16-7448', 'Josiah', 'Steeples', 'jsteeplesk@diigo.com', 'Female', '02', 'Sydney', 'Australia', 'flight attendant', 'SYD');
insert into employee (social_security_num, first_name, last_name, email, gender, street_num, city, country, job, current_airport_code) values ('797-34-8039', 'Eleni', 'Tivolier', 'etivolierl@ebay.co.uk', 'Female', '51033', 'Sydney', 'Australia', 'flight attendant', 'SYD');
insert into employee (social_security_num, first_name, last_name, email, gender, street_num, city, country, job, current_airport_code) values ('482-95-7866', 'Bettine', 'Myderscough', 'bmyderscoughm@google.com.hk', 'Male', '16', 'Sydney', 'Australia', 'flight attendant', 'SYD');
insert into employee (social_security_num, first_name, last_name, email, gender, street_num, city, country, job, current_airport_code) values ('380-44-9639', 'Ceciley', 'Garrettson', 'cgarrettsonn@feedburner.com', 'Male', '8751', 'Sydney', 'Australia', 'flight attendant', 'SYD');
insert into employee (social_security_num, first_name, last_name, email, gender, street_num, city, country, job, current_airport_code) values ('302-96-8312', 'Luigi', 'Casse', 'lcasseo@google.ca', 'Male', '0', 'Sydney', 'Australia', 'flight attendant', 'SYD');
insert into employee (social_security_num, first_name, last_name, email, gender, street_num, city, country, job, current_airport_code) values ('438-83-7156', 'Sophi', 'Spacey', 'sspaceyp@wsj.com', 'Female', '16195', 'Sydney', 'Australia', 'flight attendant', 'SYD');
insert into employee (social_security_num, first_name, last_name, email, gender, street_num, city, country, job, current_airport_code) values ('185-47-7772', 'Merrilee', 'Praundl', 'mpraundlq@example.com', 'Male', '6204', 'Sydney', 'Australia', 'flight attendant', 'SYD');
insert into employee (social_security_num, first_name, last_name, email, gender, street_num, city, country, job, current_airport_code) values ('505-93-2986', 'Addy', 'Kristiansen', 'akristiansenr@edublogs.org', 'Female', '73', 'Sydney', 'Australia', 'flight attendant', 'SYD');
insert into employee (social_security_num, first_name, last_name, email, gender, street_num, city, country, job, current_airport_code) values ('649-79-0256', 'Jean', 'Kornel', 'jkornels@tinyurl.com', 'Female', '93', 'Beijing', 'China', 'flight attendant', 'PEK');
insert into employee (social_security_num, first_name, last_name, email, gender, street_num, city, country, job, current_airport_code) values ('377-44-5943', 'Chad', 'Bloore', 'cblooret@adobe.com', 'Male', '49', 'Beijing', 'China', 'flight attendant', 'PEK');
insert into employee (social_security_num, first_name, last_name, email, gender, street_num, city, country, job, current_airport_code) values ('871-48-7269', 'Padgett', 'Terney', 'pterneyu@shinystat.com', 'Male', '49', 'Beijing', 'China', 'flight attendant', 'PEK');
insert into employee (social_security_num, first_name, last_name, email, gender, street_num, city, country, job, current_airport_code) values ('715-68-4770', 'Jill', 'Packman', 'jpackmanv@mozilla.com', 'Female', '23559', 'Beijing', 'China', 'flight attendant', 'PEK');
insert into employee (social_security_num, first_name, last_name, email, gender, street_num, city, country, job, current_airport_code) values ('699-82-2750', 'Oren', 'Sharphurst', 'osharphurstw@state.gov', 'Female', '3', 'Beijing', 'China', 'flight attendant', 'PEK');
insert into employee (social_security_num, first_name, last_name, email, gender, street_num, city, country, job, current_airport_code) values ('809-07-6638', 'Gerry', 'Uglow', 'guglowx@slate.com', 'Male', '477', 'Beijing', 'China', 'flight attendant', 'PEK');
insert into employee (social_security_num, first_name, last_name, email, gender, street_num, city, country, job, current_airport_code) values ('876-04-4208', 'Vernice', 'Sargerson', 'vsargersony@patch.com', 'Female', '97602', 'Beijing', 'China', 'flight attendant', 'PEK');
insert into employee (social_security_num, first_name, last_name, email, gender, street_num, city, country, job, current_airport_code) values ('744-70-9032', 'Bonita', 'Molohan', 'bmolohanz@spiegel.de', 'Female', '1', 'Beijing', 'China', 'flight attendant', 'PEK');
insert into employee (social_security_num, first_name, last_name, email, gender, street_num, city, country, job, current_airport_code) values ('639-65-8935', 'Coriss', 'Chatwin', 'cchatwin10@so-net.ne.jp', 'Female', '417', 'Paris', 'France', 'flight attendant', 'CDG');
insert into employee (social_security_num, first_name, last_name, email, gender, street_num, city, country, job, current_airport_code) values ('297-87-6987', 'Johnath', 'Eloi', 'jeloi11@vimeo.com', 'Male', '63', 'Paris', 'France', 'flight attendant', 'CDG');
insert into employee (social_security_num, first_name, last_name, email, gender, street_num, city, country, job, current_airport_code) values ('538-77-3150', 'Dalia', 'Trowbridge', 'dtrowbridge12@google.fr', 'Female', '68', 'Paris', 'France', 'flight attendant', 'CDG');
insert into employee (social_security_num, first_name, last_name, email, gender, street_num, city, country, job, current_airport_code) values ('358-07-0438', 'Hermina', 'Griffiths', 'hgriffiths13@wp.com', 'Female', '93813', 'Paris', 'France', 'flight attendant', 'CDG');
insert into employee (social_security_num, first_name, last_name, email, gender, street_num, city, country, job, current_airport_code) values ('400-22-3899', 'Maiga', 'Wolfit', 'mwolfit14@sitemeter.com', 'Male', '2032', 'Paris', 'France', 'flight attendant', 'CDG');
insert into employee (social_security_num, first_name, last_name, email, gender, street_num, city, country, job, current_airport_code) values ('285-83-4457', 'Emelen', 'Spadazzi', 'espadazzi15@si.edu', 'Male', '388', 'Paris', 'France', 'flight attendant', 'CDG');
insert into employee (social_security_num, first_name, last_name, email, gender, street_num, city, country, job, current_airport_code) values ('776-46-0405', 'Florenza', 'Byway', 'fbyway16@goo.ne.jp', 'Male', '47159', 'Paris', 'France', 'flight attendant', 'CDG');
insert into employee (social_security_num, first_name, last_name, email, gender, street_num, city, country, job, current_airport_code) values ('270-40-3215', 'Taddeo', 'MacLaig', 'tmaclaig17@cyberchimps.com', 'Female', '93', 'Paris', 'France', 'flight attendant', 'CDG');
insert into employee (social_security_num, first_name, last_name, email, gender, street_num, city, country, job, current_airport_code) values ('413-97-9382', 'Davy', 'Dyka', 'ddyka18@pbs.org', 'Female', '228', 'Los Angeles', 'United States', 'flight attendant', 'LAX');
insert into employee (social_security_num, first_name, last_name, email, gender, street_num, city, country, job, current_airport_code) values ('691-97-4521', 'Darb', 'Gwyther', 'dgwyther19@nationalgeographic.com', 'Female', '670', 'Los Angeles', 'United States', 'flight attendant', 'LAX');
insert into employee (social_security_num, first_name, last_name, email, gender, street_num, city, country, job, current_airport_code) values ('687-95-5086', 'Kaleb', 'Krink', 'kkrink@slate.com', 'Male', '9', 'Los Angeles', 'United States', 'flight attendant', 'LAX');
insert into employee (social_security_num, first_name, last_name, email, gender, street_num, city, country, job, current_airport_code) values ('707-94-2947', 'Paxon', 'Pee', 'ppee1b@bloglines.com', 'Female', '9463', 'Los Angeles', 'United States', 'flight attendant', 'LAX');
insert into employee (social_security_num, first_name, last_name, email, gender, street_num, city, country, job, current_airport_code) values ('629-54-9891', 'See', 'Angel', 'sangel1c@comcast.net', 'Female', '1', 'Los Angeles', 'United States', 'flight attendant', 'LAX');
insert into employee (social_security_num, first_name, last_name, email, gender, street_num, city, country, job, current_airport_code) values ('853-49-6077', 'Raviv', 'Sante', 'rsante1d@answers.com', 'Female', '4082', 'Los Angeles', 'United States', 'flight attendant', 'LAX');
insert into employee (social_security_num, first_name, last_name, email, gender, street_num, city, country, job, current_airport_code) values ('863-43-5607', 'Catharine', 'Juster', 'cjuster1e@wunderground.com', 'Male', '7684', 'Los Angeles', 'United States', 'flight attendant', 'LAX');
insert into employee (social_security_num, first_name, last_name, email, gender, street_num, city, country, job, current_airport_code) values ('620-05-0442', 'Katy', 'Ribeiro', 'kribeiro1f@wisc.edu', 'Male', '73', 'Los Angeles', 'United States', 'flight attendant', 'LAX');
insert into employee (social_security_num, first_name, last_name, email, gender, street_num, city, country, job, current_airport_code) values ('347-67-1273', 'Jamie', 'Anthona', 'janthona1g@wikipedia.org', 'Male', '83', 'Sao Paulo', 'Brazil', 'flight attendant', 'GRU');
insert into employee (social_security_num, first_name, last_name, email, gender, street_num, city, country, job, current_airport_code) values ('645-26-2938', 'Windy', 'Roussell', 'wroussell1h@whitehouse.gov', 'Female', '56230', 'Sao Paulo', 'Brazil', 'flight attendant', 'GRU');
insert into employee (social_security_num, first_name, last_name, email, gender, street_num, city, country, job, current_airport_code) values ('222-16-3379', 'Shana', 'Barnard', 'sbarnard1i@google.co.jp', 'Female', '647', 'Sao Paulo', 'Brazil', 'flight attendant', 'GRU');
insert into employee (social_security_num, first_name, last_name, email, gender, street_num, city, country, job, current_airport_code) values ('763-40-1461', 'Tuck', 'Aubrey', 'taubrey1j@europa.eu', 'Female', '6708', 'Sao Paulo', 'Brazil', 'flight attendant', 'GRU');
insert into employee (social_security_num, first_name, last_name, email, gender, street_num, city, country, job, current_airport_code) values ('548-68-1810', 'Ashla', 'Packer', 'apacker1k@github.com', 'Female', '10898', 'Sao Paulo', 'Brazil', 'flight attendant', 'GRU');
insert into employee (social_security_num, first_name, last_name, email, gender, street_num, city, country, job, current_airport_code) values ('251-49-2858', 'Chadd', 'Rutigliano', 'crutigliano1l@nsw.gov.au', 'Female', '6164', 'Sao Paulo', 'Brazil', 'flight attendant', 'GRU');
insert into employee (social_security_num, first_name, last_name, email, gender, street_num, city, country, job, current_airport_code) values ('494-59-0750', 'Felipa', 'Gages', 'fgages1m@yandex.ru', 'Male', '83', 'Sao Paulo', 'Brazil', 'flight attendant', 'GRU');
insert into employee (social_security_num, first_name, last_name, email, gender, street_num, city, country, job, current_airport_code) values ('327-93-1213', 'Sonny', 'Carson', 'scarson1n@epa.gov', 'Male', '22', 'Sao Paulo', 'Brazil', 'flight attendant', 'GRU');
insert into employee (social_security_num, first_name, last_name, email, gender, street_num, city, country, job, current_airport_code) values ('572-73-2509', 'Ileana', 'Westell', 'iwestell1o@businessweek.com', 'Male', '1178', 'Sydney', 'Australia', 'ground crew', 'SYD');
insert into employee (social_security_num, first_name, last_name, email, gender, street_num, city, country, job, current_airport_code) values ('624-26-9878', 'Darsie', 'Leil', 'dleil1p@comsenz.com', 'Female', '99072', 'Sydney', 'Australia', 'ground crew', 'SYD');
insert into employee (social_security_num, first_name, last_name, email, gender, street_num, city, country, job, current_airport_code) values ('344-44-6533', 'Jorge', 'Jiras', 'jjiras1q@themeforest.net', 'Male', '67567', 'Sydney', 'Australia', 'ground crew', 'SYD');
insert into employee (social_security_num, first_name, last_name, email, gender, street_num, city, country, job, current_airport_code) values ('875-67-3477', 'Sallie', 'Ilewicz', 'silewicz1r@wisc.edu', 'Male', '939', 'Sydney', 'Australia', 'ground crew', 'SYD');
insert into employee (social_security_num, first_name, last_name, email, gender, street_num, city, country, job, current_airport_code) values ('689-20-0248', 'Christi', 'Hillitt', 'chillitt1s@qq.com', 'Female', '12', 'Beijing', 'China', 'ground crew', 'PEK');
insert into employee (social_security_num, first_name, last_name, email, gender, street_num, city, country, job, current_airport_code) values ('158-61-5318', 'Nanice', 'O''Fee', 'cofeeny2b@gnu.org', 'Female', '7643', 'Beijing', 'China', 'ground crew', 'PEK');
insert into employee (social_security_num, first_name, last_name, email, gender, street_num, city, country, job, current_airport_code) values ('549-31-5258', 'Donni', 'Adrien', 'dadrien1u@list-manage.com', 'Male', '31', 'Beijing', 'China', 'ground crew', 'PEK');
insert into employee (social_security_num, first_name, last_name, email, gender, street_num, city, country, job, current_airport_code) values ('253-64-5676', 'Ashleigh', 'Duckit', 'aduckit1v@elpais.com', 'Male', '3', 'Beijing', 'China', 'ground crew', 'PEK');
insert into employee (social_security_num, first_name, last_name, email, gender, street_num, city, country, job, current_airport_code) values ('847-39-5263', 'Ad', 'Yielding', 'ayielding1w@slideshare.net', 'Female', '44', 'Paris', 'France', 'ground crew', 'CDG');
insert into employee (social_security_num, first_name, last_name, email, gender, street_num, city, country, job, current_airport_code) values ('356-80-8376', 'Linzy', 'Lestrange', 'llestrange1x@plala.or.jp', 'Male', '6', 'Paris', 'France', 'ground crew', 'CDG');
insert into employee (social_security_num, first_name, last_name, email, gender, street_num, city, country, job, current_airport_code) values ('152-64-7694', 'Lydon', 'Fontelles', 'lfontelles1y@ovh.net', 'Female', '2', 'Paris', 'France', 'ground crew', 'CDG');
insert into employee (social_security_num, first_name, last_name, email, gender, street_num, city, country, job, current_airport_code) values ('705-81-7678', 'Tiffie', 'Grodden', 'tgrodden1z@wikia.com', 'Male', '53371', 'Paris', 'France', 'ground crew', 'CDG');
insert into employee (social_security_num, first_name, last_name, email, gender, street_num, city, country, job, current_airport_code) values ('417-72-7092', 'Dorie', 'Durran', 'ddurran20@gnu.org', 'Male', '129', 'Los Angeles', 'United States', 'ground crew', 'LAX');
insert into employee (social_security_num, first_name, last_name, email, gender, street_num, city, country, job, current_airport_code) values ('775-34-2397', 'Gloriana', 'Yitzhok', 'gyitzhok21@reference.com', 'Male', '6', 'Los Angeles', 'United States', 'ground crew', 'LAX');
insert into employee (social_security_num, first_name, last_name, email, gender, street_num, city, country, job, current_airport_code) values ('830-67-1251', 'Anne-marie', 'Ondra', 'aondra22@nature.com', 'Female', '459', 'Los Angeles', 'United States', 'ground crew', 'LAX');
insert into employee (social_security_num, first_name, last_name, email, gender, street_num, city, country, job, current_airport_code) values ('412-05-0498', 'Janaye', 'Worster', 'jworster23@mayoclinic.com', 'Female', '2', 'Los Angeles', 'United States', 'ground crew', 'LAX');
insert into employee (social_security_num, first_name, last_name, email, gender, street_num, city, country, job, current_airport_code) values ('770-85-5272', 'Cam', 'McCafferty', 'cmccafferty24@vimeo.com', 'Female', '52', 'Sao Paulo', 'Brazil', 'ground crew', 'GRU');
insert into employee (social_security_num, first_name, last_name, email, gender, street_num, city, country, job, current_airport_code) values ('825-31-2392', 'Elfrida', 'Synke', 'esynke25@google.pl', 'Female', '27927', 'Sao Paulo', 'Brazil', 'ground crew', 'GRU');
insert into employee (social_security_num, first_name, last_name, email, gender, street_num, city, country, job, current_airport_code) values ('286-78-3788', 'Catharina', 'Spearman', 'cspearman26@de.vu', 'Male', '88', 'Sao Paulo', 'Brazil', 'ground crew', 'GRU');
insert into employee (social_security_num, first_name, last_name, email, gender, street_num, city, country, job, current_airport_code) values ('813-86-6011', 'Erhart', 'Handscombe', 'ehandscombe27@cbc.ca', 'Male', '23', 'Sao Paulo', 'Brazil', 'ground crew', 'GRU');
insert into employee (social_security_num, first_name, last_name, email, gender, street_num, city, country, job, current_airport_code) values ('618-74-2864', 'Correna', 'Krout', 'ckrout28@webeden.co.uk', 'Female', '8095', 'Sydney', 'Australia', 'office worker', 'SYD');
insert into employee (social_security_num, first_name, last_name, email, gender, street_num, city, country, job, current_airport_code) values ('883-05-1109', 'Harald', 'Arnhold', 'harnhold29@statcounter.com', 'Female', '5', 'Sydney', 'Australia', 'office worker', 'SYD');
insert into employee (social_security_num, first_name, last_name, email, gender, street_num, city, country, job, current_airport_code) values ('732-70-4655', 'Henrie', 'Morkham', 'hmorkham2a@people.com.cn', 'Female', '156', 'Sydney', 'Australia', 'office worker', 'SYD');
insert into employee (social_security_num, first_name, last_name, email, gender, street_num, city, country, job, current_airport_code) values ('611-25-7292', 'Christi', 'O''Feeny', 'cofeeny2b@gnu.org', 'Female', '7643', 'Sydney', 'Australia', 'office worker', 'SYD');
insert into employee (social_security_num, first_name, last_name, email, gender, street_num, city, country, job, current_airport_code) values ('248-07-6582', 'Camilla', 'Mesnard', 'cmesnard1t@latimes.com', 'Female', '79', 'Beijing', 'China', 'office worker', 'PEK');
insert into employee (social_security_num, first_name, last_name, email, gender, street_num, city, country, job, current_airport_code) values ('422-04-9876', 'Arlyn', 'MacDonagh', 'amacdonagh2d@bbc.co.uk', 'Male', '922', 'Beijing', 'China', 'office worker', 'PEK');
insert into employee (social_security_num, first_name, last_name, email, gender, street_num, city, country, job, current_airport_code) values ('562-83-3028', 'Burt', 'Thornhill', 'bthornhill2e@dailymotion.com', 'Male', '4332', 'Beijing', 'China', 'office worker', 'PEK');
insert into employee (social_security_num, first_name, last_name, email, gender, street_num, city, country, job, current_airport_code) values ('626-55-7190', 'Valry', 'Middis', 'vmiddis2f@mozilla.com', 'Male', '63675', 'Beijing', 'China', 'office worker', 'PEK');
insert into employee (social_security_num, first_name, last_name, email, gender, street_num, city, country, job, current_airport_code) values ('449-46-1360', 'Hermina', 'Crossdale', 'hcrossdale2g@cdc.gov', 'Female', '6763', 'Paris', 'France', 'office worker', 'CDG');
insert into employee (social_security_num, first_name, last_name, email, gender, street_num, city, country, job, current_airport_code) values ('306-57-0871', 'Donnamarie', 'Burth', 'dburth2h@jiathis.com', 'Female', '22', 'Paris', 'France', 'office worker', 'CDG');
insert into employee (social_security_num, first_name, last_name, email, gender, street_num, city, country, job, current_airport_code) values ('686-02-3446', 'Worthy', 'Gascard', 'wgascard2i@yahoo.co.jp', 'Female', '7216', 'Paris', 'France', 'office worker', 'CDG');
insert into employee (social_security_num, first_name, last_name, email, gender, street_num, city, country, job, current_airport_code) values ('271-55-4883', 'Kellia', 'Ohlsen', 'kohlsen2j@friendfeed.com', 'Male', '3544', 'Paris', 'France', 'office worker', 'CDG');
insert into employee (social_security_num, first_name, last_name, email, gender, street_num, city, country, job, current_airport_code) values ('212-22-5576', 'Mahala', 'Spilling', 'mspilling2k@hostgator.com', 'Female', '811', 'Los Angeles', 'United States', 'office worker', 'LAX');
insert into employee (social_security_num, first_name, last_name, email, gender, street_num, city, country, job, current_airport_code) values ('261-95-1425', 'Adara', 'Legat', 'alegat2l@answers.com', 'Female', '50340', 'Los Angeles', 'United States', 'office worker', 'LAX');
insert into employee (social_security_num, first_name, last_name, email, gender, street_num, city, country, job, current_airport_code) values ('683-09-1046', 'Shawna', 'Crosbie', 'scrosbie2m@mail.ru', 'Female', '27786', 'Los Angeles', 'United States', 'office worker', 'LAX');
insert into employee (social_security_num, first_name, last_name, email, gender, street_num, city, country, job, current_airport_code) values ('884-53-3488', 'Taylor', 'Coonihan', 'tcoonihan2n@wix.com', 'Female', '883', 'Los Angeles', 'United States', 'office worker', 'LAX');
insert into employee (social_security_num, first_name, last_name, email, gender, street_num, city, country, job, current_airport_code) values ('382-89-0409', 'Brady', 'Goulborne', 'bgoulborne2o@themeforest.net', 'Male', '0', 'Sao Paulo', 'Brazil', 'office worker', 'GRU');
insert into employee (social_security_num, first_name, last_name, email, gender, street_num, city, country, job, current_airport_code) values ('360-18-7737', 'Albie', 'Crocombe', 'acrocombe2p@linkedin.com', 'Male', '79', 'Sao Paulo', 'Brazil', 'office worker', 'GRU');
insert into employee (social_security_num, first_name, last_name, email, gender, street_num, city, country, job, current_airport_code) values ('687-23-3706', 'Mariam', 'Tidgewell', 'mtidgewell2q@xing.com', 'Female', '5410', 'Sao Paulo', 'Brazil', 'office worker', 'GRU');
insert into employee (social_security_num, first_name, last_name, email, gender, street_num, city, country, job, current_airport_code) values ('217-29-5552', 'Kaleb', 'Krink', 'kkrink2r@microsoft.com', 'Female', '68', 'Sao Paulo', 'Brazil', 'office worker', 'GRU');

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
insert into flightassignment (flight_id, departure_airport, arrival_airport, scheduled_departure_time, scheduled_arrival_time) values ('01A','GRU', 'LAX', '2021-11-01 06:25+00'::timestamptz, '2021-11-01 19:25+00'::timestamptz);
insert into flightassignment (flight_id, departure_airport, arrival_airport, scheduled_departure_time, scheduled_arrival_time) values ('02A','LAX', 'CDG', '2021-11-01 09:55+00'::timestamptz, '2021-11-01 21:55+00'::timestamptz);
insert into flightassignment (flight_id, departure_airport, arrival_airport, scheduled_departure_time, scheduled_arrival_time) values ('03A','CDG', 'PEK', '2021-11-01 08:00+00'::timestamptz, '2021-11-01 19:00+00'::timestamptz);
insert into flightassignment (flight_id, departure_airport, arrival_airport, scheduled_departure_time, scheduled_arrival_time) values ('04A','PEK', 'SYD', '2021-11-01 00:10+00'::timestamptz, '2021-11-01 11:10+00'::timestamptz);
insert into flightassignment (flight_id, departure_airport, arrival_airport, scheduled_departure_time, scheduled_arrival_time) values ('05A','SYD', 'GRU', '2021-11-01 00:00+00'::timestamptz, '2021-11-01 17:00+00'::timestamptz);

--Day 2--
insert into flightassignment (flight_id, departure_airport, arrival_airport, scheduled_departure_time, scheduled_arrival_time) values ('01B','LAX', 'GRU', '2021-11-02 02:00+00'::timestamptz, '2021-11-02 15:00+00'::timestamptz);
insert into flightassignment (flight_id, departure_airport, arrival_airport, scheduled_departure_time, scheduled_arrival_time) values ('02B','CDG', 'LAX', '2021-11-02 06:00+00'::timestamptz, '2021-11-02 18:00+00'::timestamptz);
insert into flightassignment (flight_id, departure_airport, arrival_airport, scheduled_departure_time, scheduled_arrival_time) values ('03B','PEK', 'CDG', '2021-11-02 01:00+00'::timestamptz, '2021-11-02 12:00+00'::timestamptz);
insert into flightassignment (flight_id, departure_airport, arrival_airport, scheduled_departure_time, scheduled_arrival_time) values ('04B','SYD', 'PEK', '2021-11-02 05:55+00'::timestamptz, '2021-11-02 16:55+00'::timestamptz);
insert into flightassignment (flight_id, departure_airport, arrival_airport, scheduled_departure_time, scheduled_arrival_time) values ('05B','GRU', 'SYD', '2021-11-02 06:00+00'::timestamptz, '2021-11-02 23:00+00'::timestamptz);

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
UPDATE flightassignment SET pilot = 'N/A', copilot = 'N/A', flight_attendant_1 = 'N/A', flight_attendant_2 = 'N/A', flight_attendant_3 = 'N/A', flight_attendant_4 = 'N/A' WHERE flight_id = '01A';
UPDATE flightassignment SET pilot = 'N/A', copilot = 'N/A', flight_attendant_1 = 'N/A', flight_attendant_2 = 'N/A', flight_attendant_3 = 'N/A', flight_attendant_4 = 'N/A' WHERE flight_id = '02A';
UPDATE flightassignment SET pilot = 'N/A', copilot = 'N/A', flight_attendant_1 = 'N/A', flight_attendant_2 = 'N/A', flight_attendant_3 = 'N/A', flight_attendant_4 = 'N/A' WHERE flight_id = '03A';
UPDATE flightassignment SET pilot = 'N/A', copilot = 'N/A', flight_attendant_1 = 'N/A', flight_attendant_2 = 'N/A', flight_attendant_3 = 'N/A', flight_attendant_4 = 'N/A' WHERE flight_id = '04A';
UPDATE flightassignment SET pilot = 'N/A', copilot = 'N/A', flight_attendant_1 = 'N/A', flight_attendant_2 = 'N/A', flight_attendant_3 = 'N/A', flight_attendant_4 = 'N/A' WHERE flight_id = '05A';

UPDATE flightassignment SET pilot = 'N/A', copilot = 'N/A', flight_attendant_1 = 'N/A', flight_attendant_2 = 'N/A', flight_attendant_3 = 'N/A', flight_attendant_4 = 'N/A' WHERE flight_id = '01B';
UPDATE flightassignment SET pilot = 'N/A', copilot = 'N/A', flight_attendant_1 = 'N/A', flight_attendant_2 = 'N/A', flight_attendant_3 = 'N/A', flight_attendant_4 = 'N/A' WHERE flight_id = '02B';
UPDATE flightassignment SET pilot = 'N/A', copilot = 'N/A', flight_attendant_1 = 'N/A', flight_attendant_2 = 'N/A', flight_attendant_3 = 'N/A', flight_attendant_4 = 'N/A' WHERE flight_id = '03B';
UPDATE flightassignment SET pilot = 'N/A', copilot = 'N/A', flight_attendant_1 = 'N/A', flight_attendant_2 = 'N/A', flight_attendant_3 = 'N/A', flight_attendant_4 = 'N/A' WHERE flight_id = '04B';
UPDATE flightassignment SET pilot = 'N/A', copilot = 'N/A', flight_attendant_1 = 'N/A', flight_attendant_2 = 'N/A', flight_attendant_3 = 'N/A', flight_attendant_4 = 'N/A' WHERE flight_id = '05B';

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

create table job (
    job VARCHAR(20) PRIMARY KEY,
    payrate DECIMAL (5, 2),
    overtime_payrate DECIMAL (5, 2),
    medical_benefits BOOLEAN,
    retirement_benefits BOOLEAN,
    travel_expenses BOOLEAN,
    workers_compensation BOOLEAN,
    sick_leave INT,
    vacation_days INT
);

insert into job (job, payrate, overtime_payrate, medical_benefits, retirement_benefits, travel_expenses, workers_compensation, sick_leave, vacation_days) values ('pilot', 70, 85, TRUE, TRUE, TRUE, FALSE, 9, 16);
insert into job (job, payrate, overtime_payrate, medical_benefits, retirement_benefits, travel_expenses, workers_compensation, sick_leave, vacation_days) values ('copilot', 65, 80, TRUE, TRUE, TRUE, FALSE, 9, 16);
insert into job (job, payrate, overtime_payrate, medical_benefits, retirement_benefits, travel_expenses, workers_compensation, sick_leave, vacation_days) values ('flight attendant', 38, 46, TRUE, TRUE, TRUE, FALSE, 9, 14);
insert into job (job, payrate, overtime_payrate, medical_benefits, retirement_benefits, travel_expenses, workers_compensation, sick_leave, vacation_days) values ('ground crew', 25, 33, TRUE, TRUE, FALSE, TRUE, 9, 14);
insert into job (job, payrate, overtime_payrate, medical_benefits, retirement_benefits, travel_expenses, workers_compensation, sick_leave, vacation_days) values ('office worker', 30, 43, TRUE, TRUE, FALSE, TRUE, 9, 14);

create table office (
	office_num INT PRIMARY KEY,
    airport_code VARCHAR(3)
);

insert into office (office_num, airport_code) values (1, 'PEK');
insert into office (office_num, airport_code) values (2, 'SYD');
insert into office (office_num, airport_code) values (3, 'LAX');
insert into office (office_num, airport_code) values (4, 'CDG');
insert into office (office_num, airport_code) values (5, 'GRU');

create table officeshift (
    shift_id SERIAL PRIMARY KEY,
    office_id INT,
    shift_start TIMESTAMPTZ,
    shift_end TIMESTAMPTZ,
    ground_worker_1 VARCHAR(50),
    ground_worker_2 VARCHAR(50),
    office_worker_1 VARCHAR(50),
    office_worker_2 VARCHAR(50)
);

insert into officeshift (office_id, shift_start, shift_end, ground_worker_1, ground_worker_2, office_worker_1, office_worker_2) values (1, '2021-11-01 00:00+00', '2021-11-01 08:00+00', 'N/A', 'N/A', 'N/A', 'N/A');
insert into officeshift (office_id, shift_start, shift_end, ground_worker_1, ground_worker_2, office_worker_1, office_worker_2) values (1, '2021-11-01 08:00+00', '2021-11-01 16:00+00', 'N/A', 'N/A', 'N/A', 'N/A');
insert into officeshift (office_id, shift_start, shift_end, ground_worker_1, ground_worker_2, office_worker_1, office_worker_2) values (1, '2021-11-01 16:00+00', '2021-11-01 24:00+00', 'N/A', 'N/A', 'N/A', 'N/A');

insert into officeshift (office_id, shift_start, shift_end, ground_worker_1, ground_worker_2, office_worker_1, office_worker_2) values (1, '2021-11-02 00:00+00', '2021-11-02 08:00+00', 'N/A', 'N/A', 'N/A', 'N/A');
insert into officeshift (office_id, shift_start, shift_end, ground_worker_1, ground_worker_2, office_worker_1, office_worker_2) values (1, '2021-11-02 08:00+00', '2021-11-02 16:00+00', 'N/A', 'N/A', 'N/A', 'N/A');
insert into officeshift (office_id, shift_start, shift_end, ground_worker_1, ground_worker_2, office_worker_1, office_worker_2) values (1, '2021-11-02 16:00+00', '2021-11-02 24:00+00', 'N/A', 'N/A', 'N/A', 'N/A');

insert into officeshift (office_id, shift_start, shift_end, ground_worker_1, ground_worker_2, office_worker_1, office_worker_2) values (1, '2021-11-03 00:00+00', '2021-11-03 08:00+00', 'N/A', 'N/A', 'N/A', 'N/A');
insert into officeshift (office_id, shift_start, shift_end, ground_worker_1, ground_worker_2, office_worker_1, office_worker_2) values (1, '2021-11-03 08:00+00', '2021-11-03 16:00+00', 'N/A', 'N/A', 'N/A', 'N/A');
insert into officeshift (office_id, shift_start, shift_end, ground_worker_1, ground_worker_2, office_worker_1, office_worker_2) values (1, '2021-11-03 16:00+00', '2021-11-03 24:00+00', 'N/A', 'N/A', 'N/A', 'N/A');

insert into officeshift (office_id, shift_start, shift_end, ground_worker_1, ground_worker_2, office_worker_1, office_worker_2) values (1, '2021-11-04 00:00+00', '2021-11-04 08:00+00', 'N/A', 'N/A', 'N/A', 'N/A');
insert into officeshift (office_id, shift_start, shift_end, ground_worker_1, ground_worker_2, office_worker_1, office_worker_2) values (1, '2021-11-04 08:00+00', '2021-11-04 16:00+00', 'N/A', 'N/A', 'N/A', 'N/A');
insert into officeshift (office_id, shift_start, shift_end, ground_worker_1, ground_worker_2, office_worker_1, office_worker_2) values (1, '2021-11-04 16:00+00', '2021-11-04 24:00+00', 'N/A', 'N/A', 'N/A', 'N/A');

insert into officeshift (office_id, shift_start, shift_end, ground_worker_1, ground_worker_2, office_worker_1, office_worker_2) values (1, '2021-11-05 00:00+00', '2021-11-05 08:00+00', 'N/A', 'N/A', 'N/A', 'N/A');
insert into officeshift (office_id, shift_start, shift_end, ground_worker_1, ground_worker_2, office_worker_1, office_worker_2) values (1, '2021-11-05 08:00+00', '2021-11-05 16:00+00', 'N/A', 'N/A', 'N/A', 'N/A');
insert into officeshift (office_id, shift_start, shift_end, ground_worker_1, ground_worker_2, office_worker_1, office_worker_2) values (1, '2021-11-05 16:00+00', '2021-11-05 24:00+00', 'N/A', 'N/A', 'N/A', 'N/A');

insert into officeshift (office_id, shift_start, shift_end, ground_worker_1, ground_worker_2, office_worker_1, office_worker_2) values (1, '2021-11-06 00:00+00', '2021-11-06 08:00+00', 'N/A', 'N/A', 'N/A', 'N/A');
insert into officeshift (office_id, shift_start, shift_end, ground_worker_1, ground_worker_2, office_worker_1, office_worker_2) values (1, '2021-11-06 08:00+00', '2021-11-06 16:00+00', 'N/A', 'N/A', 'N/A', 'N/A');
insert into officeshift (office_id, shift_start, shift_end, ground_worker_1, ground_worker_2, office_worker_1, office_worker_2) values (1, '2021-11-06 16:00+00', '2021-11-06 24:00+00', 'N/A', 'N/A', 'N/A', 'N/A');

insert into officeshift (office_id, shift_start, shift_end, ground_worker_1, ground_worker_2, office_worker_1, office_worker_2) values (2, '2021-11-01 00:00+00', '2021-11-01 08:00+00', 'N/A', 'N/A', 'N/A', 'N/A');
insert into officeshift (office_id, shift_start, shift_end, ground_worker_1, ground_worker_2, office_worker_1, office_worker_2) values (2, '2021-11-01 08:00+00', '2021-11-01 16:00+00', 'N/A', 'N/A', 'N/A', 'N/A');
insert into officeshift (office_id, shift_start, shift_end, ground_worker_1, ground_worker_2, office_worker_1, office_worker_2) values (2, '2021-11-01 16:00+00', '2021-11-01 24:00+00', 'N/A', 'N/A', 'N/A', 'N/A');

insert into officeshift (office_id, shift_start, shift_end, ground_worker_1, ground_worker_2, office_worker_1, office_worker_2) values (2, '2021-11-02 00:00+00', '2021-11-02 08:00+00', 'N/A', 'N/A', 'N/A', 'N/A');
insert into officeshift (office_id, shift_start, shift_end, ground_worker_1, ground_worker_2, office_worker_1, office_worker_2) values (2, '2021-11-02 08:00+00', '2021-11-02 16:00+00', 'N/A', 'N/A', 'N/A', 'N/A');
insert into officeshift (office_id, shift_start, shift_end, ground_worker_1, ground_worker_2, office_worker_1, office_worker_2) values (2, '2021-11-02 16:00+00', '2021-11-02 24:00+00', 'N/A', 'N/A', 'N/A', 'N/A');

insert into officeshift (office_id, shift_start, shift_end, ground_worker_1, ground_worker_2, office_worker_1, office_worker_2) values (2, '2021-11-03 00:00+00', '2021-11-03 08:00+00', 'N/A', 'N/A', 'N/A', 'N/A');
insert into officeshift (office_id, shift_start, shift_end, ground_worker_1, ground_worker_2, office_worker_1, office_worker_2) values (2, '2021-11-03 08:00+00', '2021-11-03 16:00+00', 'N/A', 'N/A', 'N/A', 'N/A');
insert into officeshift (office_id, shift_start, shift_end, ground_worker_1, ground_worker_2, office_worker_1, office_worker_2) values (2, '2021-11-03 16:00+00', '2021-11-03 24:00+00', 'N/A', 'N/A', 'N/A', 'N/A');

insert into officeshift (office_id, shift_start, shift_end, ground_worker_1, ground_worker_2, office_worker_1, office_worker_2) values (2, '2021-11-04 00:00+00', '2021-11-04 08:00+00', 'N/A', 'N/A', 'N/A', 'N/A');
insert into officeshift (office_id, shift_start, shift_end, ground_worker_1, ground_worker_2, office_worker_1, office_worker_2) values (2, '2021-11-04 08:00+00', '2021-11-04 16:00+00', 'N/A', 'N/A', 'N/A', 'N/A');
insert into officeshift (office_id, shift_start, shift_end, ground_worker_1, ground_worker_2, office_worker_1, office_worker_2) values (2, '2021-11-04 16:00+00', '2021-11-04 24:00+00', 'N/A', 'N/A', 'N/A', 'N/A');

insert into officeshift (office_id, shift_start, shift_end, ground_worker_1, ground_worker_2, office_worker_1, office_worker_2) values (2, '2021-11-05 00:00+00', '2021-11-05 08:00+00', 'N/A', 'N/A', 'N/A', 'N/A');
insert into officeshift (office_id, shift_start, shift_end, ground_worker_1, ground_worker_2, office_worker_1, office_worker_2) values (2, '2021-11-05 08:00+00', '2021-11-05 16:00+00', 'N/A', 'N/A', 'N/A', 'N/A');
insert into officeshift (office_id, shift_start, shift_end, ground_worker_1, ground_worker_2, office_worker_1, office_worker_2) values (2, '2021-11-05 16:00+00', '2021-11-05 24:00+00', 'N/A', 'N/A', 'N/A', 'N/A');

insert into officeshift (office_id, shift_start, shift_end, ground_worker_1, ground_worker_2, office_worker_1, office_worker_2) values (2, '2021-11-06 00:00+00', '2021-11-06 08:00+00', 'N/A', 'N/A', 'N/A', 'N/A');
insert into officeshift (office_id, shift_start, shift_end, ground_worker_1, ground_worker_2, office_worker_1, office_worker_2) values (2, '2021-11-06 08:00+00', '2021-11-06 16:00+00', 'N/A', 'N/A', 'N/A', 'N/A');
insert into officeshift (office_id, shift_start, shift_end, ground_worker_1, ground_worker_2, office_worker_1, office_worker_2) values (2, '2021-11-06 16:00+00', '2021-11-06 24:00+00', 'N/A', 'N/A', 'N/A', 'N/A');

insert into officeshift (office_id, shift_start, shift_end, ground_worker_1, ground_worker_2, office_worker_1, office_worker_2) values (3, '2021-11-01 00:00+00', '2021-11-01 08:00+00', 'N/A', 'N/A', 'N/A', 'N/A');
insert into officeshift (office_id, shift_start, shift_end, ground_worker_1, ground_worker_2, office_worker_1, office_worker_2) values (3, '2021-11-01 08:00+00', '2021-11-01 16:00+00', 'N/A', 'N/A', 'N/A', 'N/A');
insert into officeshift (office_id, shift_start, shift_end, ground_worker_1, ground_worker_2, office_worker_1, office_worker_2) values (3, '2021-11-01 16:00+00', '2021-11-01 24:00+00', 'N/A', 'N/A', 'N/A', 'N/A');

insert into officeshift (office_id, shift_start, shift_end, ground_worker_1, ground_worker_2, office_worker_1, office_worker_2) values (3, '2021-11-02 00:00+00', '2021-11-02 08:00+00', 'N/A', 'N/A', 'N/A', 'N/A');
insert into officeshift (office_id, shift_start, shift_end, ground_worker_1, ground_worker_2, office_worker_1, office_worker_2) values (3, '2021-11-02 08:00+00', '2021-11-02 16:00+00', 'N/A', 'N/A', 'N/A', 'N/A');
insert into officeshift (office_id, shift_start, shift_end, ground_worker_1, ground_worker_2, office_worker_1, office_worker_2) values (3, '2021-11-02 16:00+00', '2021-11-02 24:00+00', 'N/A', 'N/A', 'N/A', 'N/A');

insert into officeshift (office_id, shift_start, shift_end, ground_worker_1, ground_worker_2, office_worker_1, office_worker_2) values (3, '2021-11-03 00:00+00', '2021-11-03 08:00+00', 'N/A', 'N/A', 'N/A', 'N/A');
insert into officeshift (office_id, shift_start, shift_end, ground_worker_1, ground_worker_2, office_worker_1, office_worker_2) values (3, '2021-11-03 08:00+00', '2021-11-03 16:00+00', 'N/A', 'N/A', 'N/A', 'N/A');
insert into officeshift (office_id, shift_start, shift_end, ground_worker_1, ground_worker_2, office_worker_1, office_worker_2) values (3, '2021-11-03 16:00+00', '2021-11-03 24:00+00', 'N/A', 'N/A', 'N/A', 'N/A');

insert into officeshift (office_id, shift_start, shift_end, ground_worker_1, ground_worker_2, office_worker_1, office_worker_2) values (3, '2021-11-04 00:00+00', '2021-11-04 08:00+00', 'N/A', 'N/A', 'N/A', 'N/A');
insert into officeshift (office_id, shift_start, shift_end, ground_worker_1, ground_worker_2, office_worker_1, office_worker_2) values (3, '2021-11-04 08:00+00', '2021-11-04 16:00+00', 'N/A', 'N/A', 'N/A', 'N/A');
insert into officeshift (office_id, shift_start, shift_end, ground_worker_1, ground_worker_2, office_worker_1, office_worker_2) values (3, '2021-11-04 16:00+00', '2021-11-04 24:00+00', 'N/A', 'N/A', 'N/A', 'N/A');

insert into officeshift (office_id, shift_start, shift_end, ground_worker_1, ground_worker_2, office_worker_1, office_worker_2) values (3, '2021-11-05 00:00+00', '2021-11-05 08:00+00', 'N/A', 'N/A', 'N/A', 'N/A');
insert into officeshift (office_id, shift_start, shift_end, ground_worker_1, ground_worker_2, office_worker_1, office_worker_2) values (3, '2021-11-05 08:00+00', '2021-11-05 16:00+00', 'N/A', 'N/A', 'N/A', 'N/A');
insert into officeshift (office_id, shift_start, shift_end, ground_worker_1, ground_worker_2, office_worker_1, office_worker_2) values (3, '2021-11-05 16:00+00', '2021-11-05 24:00+00', 'N/A', 'N/A', 'N/A', 'N/A');

insert into officeshift (office_id, shift_start, shift_end, ground_worker_1, ground_worker_2, office_worker_1, office_worker_2) values (3, '2021-11-06 00:00+00', '2021-11-06 08:00+00', 'N/A', 'N/A', 'N/A', 'N/A');
insert into officeshift (office_id, shift_start, shift_end, ground_worker_1, ground_worker_2, office_worker_1, office_worker_2) values (3, '2021-11-06 08:00+00', '2021-11-06 16:00+00', 'N/A', 'N/A', 'N/A', 'N/A');
insert into officeshift (office_id, shift_start, shift_end, ground_worker_1, ground_worker_2, office_worker_1, office_worker_2) values (3, '2021-11-06 16:00+00', '2021-11-06 24:00+00', 'N/A', 'N/A', 'N/A', 'N/A');

insert into officeshift (office_id, shift_start, shift_end, ground_worker_1, ground_worker_2, office_worker_1, office_worker_2) values (4, '2021-11-01 00:00+00', '2021-11-01 08:00+00', 'N/A', 'N/A', 'N/A', 'N/A');
insert into officeshift (office_id, shift_start, shift_end, ground_worker_1, ground_worker_2, office_worker_1, office_worker_2) values (4, '2021-11-01 08:00+00', '2021-11-01 16:00+00', 'N/A', 'N/A', 'N/A', 'N/A');
insert into officeshift (office_id, shift_start, shift_end, ground_worker_1, ground_worker_2, office_worker_1, office_worker_2) values (4, '2021-11-01 16:00+00', '2021-11-01 24:00+00', 'N/A', 'N/A', 'N/A', 'N/A');

insert into officeshift (office_id, shift_start, shift_end, ground_worker_1, ground_worker_2, office_worker_1, office_worker_2) values (4, '2021-11-02 00:00+00', '2021-11-02 08:00+00', 'N/A', 'N/A', 'N/A', 'N/A');
insert into officeshift (office_id, shift_start, shift_end, ground_worker_1, ground_worker_2, office_worker_1, office_worker_2) values (4, '2021-11-02 08:00+00', '2021-11-02 16:00+00', 'N/A', 'N/A', 'N/A', 'N/A');
insert into officeshift (office_id, shift_start, shift_end, ground_worker_1, ground_worker_2, office_worker_1, office_worker_2) values (4, '2021-11-02 16:00+00', '2021-11-02 24:00+00', 'N/A', 'N/A', 'N/A', 'N/A');

insert into officeshift (office_id, shift_start, shift_end, ground_worker_1, ground_worker_2, office_worker_1, office_worker_2) values (4, '2021-11-03 00:00+00', '2021-11-03 08:00+00', 'N/A', 'N/A', 'N/A', 'N/A');
insert into officeshift (office_id, shift_start, shift_end, ground_worker_1, ground_worker_2, office_worker_1, office_worker_2) values (4, '2021-11-03 08:00+00', '2021-11-03 16:00+00', 'N/A', 'N/A', 'N/A', 'N/A');
insert into officeshift (office_id, shift_start, shift_end, ground_worker_1, ground_worker_2, office_worker_1, office_worker_2) values (4, '2021-11-03 16:00+00', '2021-11-03 24:00+00', 'N/A', 'N/A', 'N/A', 'N/A');

insert into officeshift (office_id, shift_start, shift_end, ground_worker_1, ground_worker_2, office_worker_1, office_worker_2) values (4, '2021-11-04 00:00+00', '2021-11-04 08:00+00', 'N/A', 'N/A', 'N/A', 'N/A');
insert into officeshift (office_id, shift_start, shift_end, ground_worker_1, ground_worker_2, office_worker_1, office_worker_2) values (4, '2021-11-04 08:00+00', '2021-11-04 16:00+00', 'N/A', 'N/A', 'N/A', 'N/A');
insert into officeshift (office_id, shift_start, shift_end, ground_worker_1, ground_worker_2, office_worker_1, office_worker_2) values (4, '2021-11-04 16:00+00', '2021-11-04 24:00+00', 'N/A', 'N/A', 'N/A', 'N/A');

insert into officeshift (office_id, shift_start, shift_end, ground_worker_1, ground_worker_2, office_worker_1, office_worker_2) values (4, '2021-11-05 00:00+00', '2021-11-05 08:00+00', 'N/A', 'N/A', 'N/A', 'N/A');
insert into officeshift (office_id, shift_start, shift_end, ground_worker_1, ground_worker_2, office_worker_1, office_worker_2) values (4, '2021-11-05 08:00+00', '2021-11-05 16:00+00', 'N/A', 'N/A', 'N/A', 'N/A');
insert into officeshift (office_id, shift_start, shift_end, ground_worker_1, ground_worker_2, office_worker_1, office_worker_2) values (4, '2021-11-05 16:00+00', '2021-11-05 24:00+00', 'N/A', 'N/A', 'N/A', 'N/A');

insert into officeshift (office_id, shift_start, shift_end, ground_worker_1, ground_worker_2, office_worker_1, office_worker_2) values (4, '2021-11-06 00:00+00', '2021-11-06 08:00+00', 'N/A', 'N/A', 'N/A', 'N/A');
insert into officeshift (office_id, shift_start, shift_end, ground_worker_1, ground_worker_2, office_worker_1, office_worker_2) values (4, '2021-11-06 08:00+00', '2021-11-06 16:00+00', 'N/A', 'N/A', 'N/A', 'N/A');
insert into officeshift (office_id, shift_start, shift_end, ground_worker_1, ground_worker_2, office_worker_1, office_worker_2) values (4, '2021-11-06 16:00+00', '2021-11-06 24:00+00', 'N/A', 'N/A', 'N/A', 'N/A');

insert into officeshift (office_id, shift_start, shift_end, ground_worker_1, ground_worker_2, office_worker_1, office_worker_2) values (5, '2021-11-01 00:00+00', '2021-11-01 08:00+00', 'N/A', 'N/A', 'N/A', 'N/A');
insert into officeshift (office_id, shift_start, shift_end, ground_worker_1, ground_worker_2, office_worker_1, office_worker_2) values (5, '2021-11-01 08:00+00', '2021-11-01 16:00+00', 'N/A', 'N/A', 'N/A', 'N/A');
insert into officeshift (office_id, shift_start, shift_end, ground_worker_1, ground_worker_2, office_worker_1, office_worker_2) values (5, '2021-11-01 16:00+00', '2021-11-01 24:00+00', 'N/A', 'N/A', 'N/A', 'N/A');

insert into officeshift (office_id, shift_start, shift_end, ground_worker_1, ground_worker_2, office_worker_1, office_worker_2) values (5, '2021-11-02 00:00+00', '2021-11-02 08:00+00', 'N/A', 'N/A', 'N/A', 'N/A');
insert into officeshift (office_id, shift_start, shift_end, ground_worker_1, ground_worker_2, office_worker_1, office_worker_2) values (5, '2021-11-02 08:00+00', '2021-11-02 16:00+00', 'N/A', 'N/A', 'N/A', 'N/A');
insert into officeshift (office_id, shift_start, shift_end, ground_worker_1, ground_worker_2, office_worker_1, office_worker_2) values (5, '2021-11-02 16:00+00', '2021-11-02 24:00+00', 'N/A', 'N/A', 'N/A', 'N/A');

insert into officeshift (office_id, shift_start, shift_end, ground_worker_1, ground_worker_2, office_worker_1, office_worker_2) values (5, '2021-11-03 00:00+00', '2021-11-03 08:00+00', 'N/A', 'N/A', 'N/A', 'N/A');
insert into officeshift (office_id, shift_start, shift_end, ground_worker_1, ground_worker_2, office_worker_1, office_worker_2) values (5, '2021-11-03 08:00+00', '2021-11-03 16:00+00', 'N/A', 'N/A', 'N/A', 'N/A');
insert into officeshift (office_id, shift_start, shift_end, ground_worker_1, ground_worker_2, office_worker_1, office_worker_2) values (5, '2021-11-03 16:00+00', '2021-11-03 24:00+00', 'N/A', 'N/A', 'N/A', 'N/A');

insert into officeshift (office_id, shift_start, shift_end, ground_worker_1, ground_worker_2, office_worker_1, office_worker_2) values (5, '2021-11-04 00:00+00', '2021-11-04 08:00+00', 'N/A', 'N/A', 'N/A', 'N/A');
insert into officeshift (office_id, shift_start, shift_end, ground_worker_1, ground_worker_2, office_worker_1, office_worker_2) values (5, '2021-11-04 08:00+00', '2021-11-04 16:00+00', 'N/A', 'N/A', 'N/A', 'N/A');
insert into officeshift (office_id, shift_start, shift_end, ground_worker_1, ground_worker_2, office_worker_1, office_worker_2) values (5, '2021-11-04 16:00+00', '2021-11-04 24:00+00', 'N/A', 'N/A', 'N/A', 'N/A');

insert into officeshift (office_id, shift_start, shift_end, ground_worker_1, ground_worker_2, office_worker_1, office_worker_2) values (5, '2021-11-05 00:00+00', '2021-11-05 08:00+00', 'N/A', 'N/A', 'N/A', 'N/A');
insert into officeshift (office_id, shift_start, shift_end, ground_worker_1, ground_worker_2, office_worker_1, office_worker_2) values (5, '2021-11-05 08:00+00', '2021-11-05 16:00+00', 'N/A', 'N/A', 'N/A', 'N/A');
insert into officeshift (office_id, shift_start, shift_end, ground_worker_1, ground_worker_2, office_worker_1, office_worker_2) values (5, '2021-11-05 16:00+00', '2021-11-05 24:00+00', 'N/A', 'N/A', 'N/A', 'N/A');

insert into officeshift (office_id, shift_start, shift_end, ground_worker_1, ground_worker_2, office_worker_1, office_worker_2) values (5, '2021-11-06 00:00+00', '2021-11-06 08:00+00', 'N/A', 'N/A', 'N/A', 'N/A');
insert into officeshift (office_id, shift_start, shift_end, ground_worker_1, ground_worker_2, office_worker_1, office_worker_2) values (5, '2021-11-06 08:00+00', '2021-11-06 16:00+00', 'N/A', 'N/A', 'N/A', 'N/A');
insert into officeshift (office_id, shift_start, shift_end, ground_worker_1, ground_worker_2, office_worker_1, office_worker_2) values (5, '2021-11-06 16:00+00', '2021-11-06 24:00+00', 'N/A', 'N/A', 'N/A', 'N/A');

CREATE TABLE payment (
	social_security_num VARCHAR(50) PRIMARY KEY,
    job VARCHAR(20),
    normal_hours INT,
    overtime_hours INT,
    taxes DEC(10,2),
    monthly_salary DEC(10,2)
);

insert into payment (social_security_num, job, normal_hours, overtime_hours, taxes, monthly_salary) values ('110-01-2872', 'pilot', 0, 0, 0, 0);
insert into payment (social_security_num, job, normal_hours, overtime_hours, taxes, monthly_salary) values ('107-61-8604', 'pilot', 0, 0, 0, 0);
insert into payment (social_security_num, job, normal_hours, overtime_hours, taxes, monthly_salary) values ('730-51-8952', 'pilot', 0, 0, 0, 0);
insert into payment (social_security_num, job, normal_hours, overtime_hours, taxes, monthly_salary) values ('145-84-0374', 'pilot', 0, 0, 0, 0);
insert into payment (social_security_num, job, normal_hours, overtime_hours, taxes, monthly_salary) values ('108-33-3304', 'pilot', 0, 0, 0, 0);
insert into payment (social_security_num, job, normal_hours, overtime_hours, taxes, monthly_salary) values ('620-45-9432', 'pilot', 0, 0, 0, 0);
insert into payment (social_security_num, job, normal_hours, overtime_hours, taxes, monthly_salary) values ('830-55-4393', 'pilot', 0, 0, 0, 0);
insert into payment (social_security_num, job, normal_hours, overtime_hours, taxes, monthly_salary) values ('619-11-9230', 'pilot', 0, 0, 0, 0);
insert into payment (social_security_num, job, normal_hours, overtime_hours, taxes, monthly_salary) values ('605-24-9827', 'pilot', 0, 0, 0, 0);
insert into payment (social_security_num, job, normal_hours, overtime_hours, taxes, monthly_salary) values ('500-79-5396', 'pilot', 0, 0, 0, 0);
insert into payment (social_security_num, job, normal_hours, overtime_hours, taxes, monthly_salary) values ('640-04-0209', 'copilot', 0, 0, 0, 0);
insert into payment (social_security_num, job, normal_hours, overtime_hours, taxes, monthly_salary) values ('796-77-4286', 'copilot', 0, 0, 0, 0);
insert into payment (social_security_num, job, normal_hours, overtime_hours, taxes, monthly_salary) values ('313-24-1819', 'copilot', 0, 0, 0, 0);
insert into payment (social_security_num, job, normal_hours, overtime_hours, taxes, monthly_salary) values ('791-38-6298', 'copilot', 0, 0, 0, 0);
insert into payment (social_security_num, job, normal_hours, overtime_hours, taxes, monthly_salary) values ('216-31-8755', 'copilot', 0, 0, 0, 0);
insert into payment (social_security_num, job, normal_hours, overtime_hours, taxes, monthly_salary) values ('874-40-1427', 'copilot', 0, 0, 0, 0);
insert into payment (social_security_num, job, normal_hours, overtime_hours, taxes, monthly_salary) values ('603-14-9498', 'copilot', 0, 0, 0, 0);
insert into payment (social_security_num, job, normal_hours, overtime_hours, taxes, monthly_salary) values ('386-94-2181', 'copilot', 0, 0, 0, 0);
insert into payment (social_security_num, job, normal_hours, overtime_hours, taxes, monthly_salary) values ('545-56-1535', 'copilot', 0, 0, 0, 0);
insert into payment (social_security_num, job, normal_hours, overtime_hours, taxes, monthly_salary) values ('280-33-7851', 'copilot', 0, 0, 0, 0);
insert into payment (social_security_num, job, normal_hours, overtime_hours, taxes, monthly_salary) values ('651-16-7448', 'flight attendant', 0, 0, 0, 0);
insert into payment (social_security_num, job, normal_hours, overtime_hours, taxes, monthly_salary) values ('797-34-8039', 'flight attendant', 0, 0, 0, 0);
insert into payment (social_security_num, job, normal_hours, overtime_hours, taxes, monthly_salary) values ('482-95-7866', 'flight attendant', 0, 0, 0, 0);
insert into payment (social_security_num, job, normal_hours, overtime_hours, taxes, monthly_salary) values ('380-44-9639', 'flight attendant', 0, 0, 0, 0);
insert into payment (social_security_num, job, normal_hours, overtime_hours, taxes, monthly_salary) values ('302-96-8312', 'flight attendant', 0, 0, 0, 0);
insert into payment (social_security_num, job, normal_hours, overtime_hours, taxes, monthly_salary) values ('438-83-7156', 'flight attendant', 0, 0, 0, 0);
insert into payment (social_security_num, job, normal_hours, overtime_hours, taxes, monthly_salary) values ('185-47-7772', 'flight attendant', 0, 0, 0, 0);
insert into payment (social_security_num, job, normal_hours, overtime_hours, taxes, monthly_salary) values ('505-93-2986', 'flight attendant', 0, 0, 0, 0);
insert into payment (social_security_num, job, normal_hours, overtime_hours, taxes, monthly_salary) values ('649-79-0256', 'flight attendant', 0, 0, 0, 0);
insert into payment (social_security_num, job, normal_hours, overtime_hours, taxes, monthly_salary) values ('377-44-5943', 'flight attendant', 0, 0, 0, 0);
insert into payment (social_security_num, job, normal_hours, overtime_hours, taxes, monthly_salary) values ('871-48-7269', 'flight attendant', 0, 0, 0, 0);
insert into payment (social_security_num, job, normal_hours, overtime_hours, taxes, monthly_salary) values ('715-68-4770', 'flight attendant', 0, 0, 0, 0);
insert into payment (social_security_num, job, normal_hours, overtime_hours, taxes, monthly_salary) values ('699-82-2750', 'flight attendant', 0, 0, 0, 0);
insert into payment (social_security_num, job, normal_hours, overtime_hours, taxes, monthly_salary) values ('809-07-6638', 'flight attendant', 0, 0, 0, 0);
insert into payment (social_security_num, job, normal_hours, overtime_hours, taxes, monthly_salary) values ('876-04-4208', 'flight attendant', 0, 0, 0, 0);
insert into payment (social_security_num, job, normal_hours, overtime_hours, taxes, monthly_salary) values ('744-70-9032', 'flight attendant', 0, 0, 0, 0);
insert into payment (social_security_num, job, normal_hours, overtime_hours, taxes, monthly_salary) values ('639-65-8935', 'flight attendant', 0, 0, 0, 0);
insert into payment (social_security_num, job, normal_hours, overtime_hours, taxes, monthly_salary) values ('297-87-6987', 'flight attendant', 0, 0, 0, 0);
insert into payment (social_security_num, job, normal_hours, overtime_hours, taxes, monthly_salary) values ('538-77-3150', 'flight attendant', 0, 0, 0, 0);
insert into payment (social_security_num, job, normal_hours, overtime_hours, taxes, monthly_salary) values ('358-07-0438', 'flight attendant', 0, 0, 0, 0);
insert into payment (social_security_num, job, normal_hours, overtime_hours, taxes, monthly_salary) values ('400-22-3899', 'flight attendant', 0, 0, 0, 0);
insert into payment (social_security_num, job, normal_hours, overtime_hours, taxes, monthly_salary) values ('285-83-4457', 'flight attendant', 0, 0, 0, 0);
insert into payment (social_security_num, job, normal_hours, overtime_hours, taxes, monthly_salary) values ('776-46-0405', 'flight attendant', 0, 0, 0, 0);
insert into payment (social_security_num, job, normal_hours, overtime_hours, taxes, monthly_salary) values ('270-40-3215', 'flight attendant', 0, 0, 0, 0);
insert into payment (social_security_num, job, normal_hours, overtime_hours, taxes, monthly_salary) values ('413-97-9382', 'flight attendant', 0, 0, 0, 0);
insert into payment (social_security_num, job, normal_hours, overtime_hours, taxes, monthly_salary) values ('691-97-4521', 'flight attendant', 0, 0, 0, 0);
insert into payment (social_security_num, job, normal_hours, overtime_hours, taxes, monthly_salary) values ('687-95-5086', 'flight attendant', 0, 0, 0, 0);
insert into payment (social_security_num, job, normal_hours, overtime_hours, taxes, monthly_salary) values ('707-94-2947', 'flight attendant', 0, 0, 0, 0);
insert into payment (social_security_num, job, normal_hours, overtime_hours, taxes, monthly_salary) values ('629-54-9891', 'flight attendant', 0, 0, 0, 0);
insert into payment (social_security_num, job, normal_hours, overtime_hours, taxes, monthly_salary) values ('853-49-6077', 'flight attendant', 0, 0, 0, 0);
insert into payment (social_security_num, job, normal_hours, overtime_hours, taxes, monthly_salary) values ('863-43-5607', 'flight attendant', 0, 0, 0, 0);
insert into payment (social_security_num, job, normal_hours, overtime_hours, taxes, monthly_salary) values ('620-05-0442', 'flight attendant', 0, 0, 0, 0);
insert into payment (social_security_num, job, normal_hours, overtime_hours, taxes, monthly_salary) values ('347-67-1273', 'flight attendant', 0, 0, 0, 0);
insert into payment (social_security_num, job, normal_hours, overtime_hours, taxes, monthly_salary) values ('645-26-2938', 'flight attendant', 0, 0, 0, 0);
insert into payment (social_security_num, job, normal_hours, overtime_hours, taxes, monthly_salary) values ('222-16-3379', 'flight attendant', 0, 0, 0, 0);
insert into payment (social_security_num, job, normal_hours, overtime_hours, taxes, monthly_salary) values ('763-40-1461', 'flight attendant', 0, 0, 0, 0);
insert into payment (social_security_num, job, normal_hours, overtime_hours, taxes, monthly_salary) values ('548-68-1810', 'flight attendant', 0, 0, 0, 0);
insert into payment (social_security_num, job, normal_hours, overtime_hours, taxes, monthly_salary) values ('251-49-2858', 'flight attendant', 0, 0, 0, 0);
insert into payment (social_security_num, job, normal_hours, overtime_hours, taxes, monthly_salary) values ('494-59-0750', 'flight attendant', 0, 0, 0, 0);
insert into payment (social_security_num, job, normal_hours, overtime_hours, taxes, monthly_salary) values ('327-93-1213', 'flight attendant', 0, 0, 0, 0);
insert into payment (social_security_num, job, normal_hours, overtime_hours, taxes, monthly_salary) values ('572-73-2509', 'ground crew', 0, 0, 0, 0);
insert into payment (social_security_num, job, normal_hours, overtime_hours, taxes, monthly_salary) values ('624-26-9878', 'ground crew', 0, 0, 0, 0);
insert into payment (social_security_num, job, normal_hours, overtime_hours, taxes, monthly_salary) values ('344-44-6533', 'ground crew', 0, 0, 0, 0);
insert into payment (social_security_num, job, normal_hours, overtime_hours, taxes, monthly_salary) values ('875-67-3477', 'ground crew', 0, 0, 0, 0);
insert into payment (social_security_num, job, normal_hours, overtime_hours, taxes, monthly_salary) values ('689-20-0248', 'ground crew', 0, 0, 0, 0);
insert into payment (social_security_num, job, normal_hours, overtime_hours, taxes, monthly_salary) values ('158-61-5318', 'ground crew', 0, 0, 0, 0);
insert into payment (social_security_num, job, normal_hours, overtime_hours, taxes, monthly_salary) values ('549-31-5258', 'ground crew', 0, 0, 0, 0);
insert into payment (social_security_num, job, normal_hours, overtime_hours, taxes, monthly_salary) values ('253-64-5676', 'ground crew', 0, 0, 0, 0);
insert into payment (social_security_num, job, normal_hours, overtime_hours, taxes, monthly_salary) values ('847-39-5263', 'ground crew', 0, 0, 0, 0);
insert into payment (social_security_num, job, normal_hours, overtime_hours, taxes, monthly_salary) values ('356-80-8376', 'ground crew', 0, 0, 0, 0);
insert into payment (social_security_num, job, normal_hours, overtime_hours, taxes, monthly_salary) values ('152-64-7694', 'ground crew', 0, 0, 0, 0);
insert into payment (social_security_num, job, normal_hours, overtime_hours, taxes, monthly_salary) values ('705-81-7678', 'ground crew', 0, 0, 0, 0);
insert into payment (social_security_num, job, normal_hours, overtime_hours, taxes, monthly_salary) values ('417-72-7092', 'ground crew', 0, 0, 0, 0);
insert into payment (social_security_num, job, normal_hours, overtime_hours, taxes, monthly_salary) values ('775-34-2397', 'ground crew', 0, 0, 0, 0);
insert into payment (social_security_num, job, normal_hours, overtime_hours, taxes, monthly_salary) values ('830-67-1251', 'ground crew', 0, 0, 0, 0);
insert into payment (social_security_num, job, normal_hours, overtime_hours, taxes, monthly_salary) values ('412-05-0498', 'ground crew', 0, 0, 0, 0);
insert into payment (social_security_num, job, normal_hours, overtime_hours, taxes, monthly_salary) values ('770-85-5272', 'ground crew', 0, 0, 0, 0);
insert into payment (social_security_num, job, normal_hours, overtime_hours, taxes, monthly_salary) values ('825-31-2392', 'ground crew', 0, 0, 0, 0);
insert into payment (social_security_num, job, normal_hours, overtime_hours, taxes, monthly_salary) values ('286-78-3788', 'ground crew', 0, 0, 0, 0);
insert into payment (social_security_num, job, normal_hours, overtime_hours, taxes, monthly_salary) values ('813-86-6011', 'ground crew', 0, 0, 0, 0);
insert into payment (social_security_num, job, normal_hours, overtime_hours, taxes, monthly_salary) values ('618-74-2864', 'office worker', 0, 0, 0, 0);
insert into payment (social_security_num, job, normal_hours, overtime_hours, taxes, monthly_salary) values ('883-05-1109', 'office worker', 0, 0, 0, 0);
insert into payment (social_security_num, job, normal_hours, overtime_hours, taxes, monthly_salary) values ('732-70-4655', 'office worker', 0, 0, 0, 0);
insert into payment (social_security_num, job, normal_hours, overtime_hours, taxes, monthly_salary) values ('611-25-7292', 'office worker', 0, 0, 0, 0);
insert into payment (social_security_num, job, normal_hours, overtime_hours, taxes, monthly_salary) values ('248-07-6582', 'office worker', 0, 0, 0, 0);
insert into payment (social_security_num, job, normal_hours, overtime_hours, taxes, monthly_salary) values ('422-04-9876', 'office worker', 0, 0, 0, 0);
insert into payment (social_security_num, job, normal_hours, overtime_hours, taxes, monthly_salary) values ('562-83-3028', 'office worker', 0, 0, 0, 0);
insert into payment (social_security_num, job, normal_hours, overtime_hours, taxes, monthly_salary) values ('626-55-7190', 'office worker', 0, 0, 0, 0);
insert into payment (social_security_num, job, normal_hours, overtime_hours, taxes, monthly_salary) values ('449-46-1360', 'office worker', 0, 0, 0, 0);
insert into payment (social_security_num, job, normal_hours, overtime_hours, taxes, monthly_salary) values ('306-57-0871', 'office worker', 0, 0, 0, 0);
insert into payment (social_security_num, job, normal_hours, overtime_hours, taxes, monthly_salary) values ('686-02-3446', 'office worker', 0, 0, 0, 0);
insert into payment (social_security_num, job, normal_hours, overtime_hours, taxes, monthly_salary) values ('271-55-4883', 'office worker', 0, 0, 0, 0);
insert into payment (social_security_num, job, normal_hours, overtime_hours, taxes, monthly_salary) values ('212-22-5576', 'office worker', 0, 0, 0, 0);
insert into payment (social_security_num, job, normal_hours, overtime_hours, taxes, monthly_salary) values ('261-95-1425', 'office worker', 0, 0, 0, 0);
insert into payment (social_security_num, job, normal_hours, overtime_hours, taxes, monthly_salary) values ('683-09-1046', 'office worker', 0, 0, 0, 0);
insert into payment (social_security_num, job, normal_hours, overtime_hours, taxes, monthly_salary) values ('884-53-3488', 'office worker', 0, 0, 0, 0);
insert into payment (social_security_num, job, normal_hours, overtime_hours, taxes, monthly_salary) values ('382-89-0409', 'office worker', 0, 0, 0, 0);
insert into payment (social_security_num, job, normal_hours, overtime_hours, taxes, monthly_salary) values ('360-18-7737', 'office worker', 0, 0, 0, 0);
insert into payment (social_security_num, job, normal_hours, overtime_hours, taxes, monthly_salary) values ('687-23-3706', 'office worker', 0, 0, 0, 0);
insert into payment (social_security_num, job, normal_hours, overtime_hours, taxes, monthly_salary) values ('217-29-5552', 'office worker', 0, 0, 0, 0);