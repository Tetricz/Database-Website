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
