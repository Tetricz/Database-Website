create table job (
    job VARCHAR(20),
    payrate DECIMAL (3, 2),
    overtime_payrate DECIMAL (3, 2),
    benefits VARCHAR(20),
    sick_leave INT,
    vacation_days INT
);

insert into job (job, payrate, overtime_payrate, benefits, sick_leave, vacation_days) values ('pilot', '', '', 'medical, retirement, travel expenses', 9, 16);
insert into job (job, payrate, overtime_payrate, benefits, sick_leave, vacation_days) values ('copilot', '', '', 'medical, retirement, travel expenses', 9, 16);
insert into job (job, payrate, overtime_payrate, benefits, sick_leave, vacation_days) values ('flight attendant', '', '', 'medical, retirement, travel expenses', 9, 14);
insert into job (job, payrate, overtime_payrate, benefits, sick_leave, vacation_days) values ('ground crew', '', '', 'medical, retirement, workers compensation', 9, 14);
insert into job (job, payrate, overtime_payrate, benefits, sick_leave, vacation_days) values ('office worker', '', '', 'medical, retirement, stock investments', 9, 14);