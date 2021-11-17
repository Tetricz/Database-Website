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
insert into job (job, payrate, overtime_payrate, medical_benefits, retirement_benefits, travel_expenses, workers_compensation, sick_leave, vacation_days) values ('ground crew', 20, 28, TRUE, TRUE, FALSE, TRUE, 9, 14);
insert into job (job, payrate, overtime_payrate, medical_benefits, retirement_benefits, travel_expenses, workers_compensation, sick_leave, vacation_days) values ('office worker', 25, 43, TRUE, TRUE, FALSE, TRUE, 9, 14);