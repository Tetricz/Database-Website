const express = require('express');
const app = express();
const cors = require('cors');
const pool = require('./creds');
const sql = 'query.sql'
const transactions = 'transaction.sql'

//////////////////////////////////////////////
// add for keroku use
app.use(express.static('public'));

// middleware
app.use(cors());
app.use(express.json());      //req.body

//get = SELECT, post = INSERT, delete = DELETE, put = UPDATE

let recentsql = ''

//get all flightassignments
app.get('/flightassignments', async(req, res)=>{
  try{
    sqlquery = 'SELECT * FROM flightassignment;'
    const allDemos = await pool.query(sqlquery);
    recentsql = ''
    recentsql += `${sqlquery}                                                                           `;
    appendtofile(sql, `/*Selects all fields from flightassignment table to display-->*/\n` + sqlquery)
    res.json(allDemos.rows);
  } catch(err){
    console.log(err.message);
  }
});

//get all officeshifts
app.get('/officeshifts', async(req, res)=>{
  try{
    sqlquery = 
`SELECT shift_id, officeshift.office_id, airport_code, shift_start, shift_end, ground_worker_1, ground_worker_2, office_worker_1, office_worker_2 
FROM officeshift, office 
WHERE officeshift.office_id = office_num;`
    const allDemos = await pool.query(sqlquery);
    recentsql = ''
    recentsql += `${sqlquery}\n`;
    appendtofile(sql, `/*Selects all fields from officeshift table and airport_code from office table to display-->*/\n` + sqlquery)
    res.json(allDemos.rows);
  } catch(err){
    console.log(err.message);
  }
});

//get all employee information (Peter Dinh)
app.get('/employee_info', async(req, res)=>{
  try{
    sqlquery = 
`SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, employee.job,
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation, employee.sick_leave, employee.vacation_days FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;`;
    const allDemos = await pool.query(sqlquery);
    recentsql = ''
    recentsql += `${sqlquery}\n`;
    appendtofile(sql, `/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->*/\n` + sqlquery)
    res.json(allDemos.rows);
  } catch(err){
    console.log(err.message);
  }
});

app.get('/sickvacationdays', async(req, res)=>{
  try{
    sqlquery = 
`SELECT job, sick_leave, vacation_days 
FROM job;`;
    const allDemos = await pool.query(sqlquery);
    recentsql = ''
    recentsql += `${sqlquery}\n`;
    appendtofile(sql, `/*Gets the sick leave and vacation days for jobs to validate sick/leave/vacation days edited for employees-->*/\n` + sqlquery)
    res.json(allDemos.rows);
  } catch(err){
    console.log(err.message);
  }
});

//get all payments
app.get('/payments', async(req, res)=>{
  try{
  sqlquery =
`SELECT social_security_num, job, normal_hours, CAST (payrate AS FLOAT), overtime_hours, CAST (overtime_payrate AS FLOAT), (normal_hours * payrate + overtime_hours * overtime_payrate) * taxes AS taxes, (normal_hours * payrate + overtime_hours * overtime_payrate) * (1 - taxes) AS monthly_salary
FROM (
  SELECT t1.social_security_num, job, taxes, payrate, overtime_payrate,
      CASE    
          WHEN hours_worked - 40 <= 0 THEN hours_worked
          WHEN hours_worked - 40 > 0 THEN 40
      END normal_hours,
      CASE
          WHEN hours_worked - 40 <= 0 THEN 0
          WHEN hours_worked - 40 > 0 THEN hours_worked - 40
      END overtime_hours
  FROM 
      (SELECT pilot AS social_security_num, SUM(DATE_PART('day', scheduled_arrival_time - scheduled_departure_time) * 24 + 
          DATE_PART('hour', scheduled_arrival_time - scheduled_departure_time)) AS hours_worked
      FROM flightassignment
      WHERE pilot NOT LIKE 'N/A'
      GROUP BY pilot
      UNION
      SELECT copilot AS social_security_num, SUM(DATE_PART('day', scheduled_arrival_time - scheduled_departure_time) * 24 + 
          DATE_PART('hour', scheduled_arrival_time - scheduled_departure_time)) AS hours_worked
      FROM flightassignment
      WHERE copilot NOT LIKE 'N/A'
      GROUP BY copilot
      UNION
      SELECT flight_attendant_1 AS social_security_num, SUM(DATE_PART('day', scheduled_arrival_time - scheduled_departure_time) * 24 + 
          DATE_PART('hour', scheduled_arrival_time - scheduled_departure_time)) AS hours_worked
      FROM flightassignment
      WHERE flight_attendant_1 NOT LIKE 'N/A'
      GROUP BY flight_attendant_1
      UNION
      SELECT flight_attendant_2 AS social_security_num, SUM(DATE_PART('day', scheduled_arrival_time - scheduled_departure_time) * 24 + 
          DATE_PART('hour', scheduled_arrival_time - scheduled_departure_time)) AS hours_worked
      FROM flightassignment
      WHERE flight_attendant_2 NOT LIKE 'N/A'
      GROUP BY flight_attendant_2
      UNION
      SELECT flight_attendant_3 AS social_security_num, SUM(DATE_PART('day', scheduled_arrival_time - scheduled_departure_time) * 24 + 
          DATE_PART('hour', scheduled_arrival_time - scheduled_departure_time)) AS hours_worked
      FROM flightassignment
      WHERE flight_attendant_3 NOT LIKE 'N/A'
      GROUP BY flight_attendant_3
      UNION
      SELECT flight_attendant_4 AS social_security_num, SUM(DATE_PART('day', scheduled_arrival_time - scheduled_departure_time) * 24 + 
          DATE_PART('hour', scheduled_arrival_time - scheduled_departure_time)) AS hours_worked
      FROM flightassignment
      WHERE flight_attendant_4 NOT LIKE 'N/A'
      GROUP BY flight_attendant_4
      UNION
      SELECT ground_worker_1 AS social_security_num, SUM(DATE_PART('day', shift_end - shift_start) * 24 + 
          DATE_PART('hour', shift_end - shift_start)) AS hours_worked
      FROM officeshift
      WHERE ground_worker_1 NOT LIKE 'N/A'
      GROUP BY ground_worker_1
      UNION
      SELECT ground_worker_2 AS social_security_num, SUM(DATE_PART('day', shift_end - shift_start) * 24 + 
          DATE_PART('hour', shift_end - shift_start)) AS hours_worked
      FROM officeshift
      WHERE ground_worker_2 NOT LIKE 'N/A'
      GROUP BY ground_worker_2
      UNION
      SELECT office_worker_1 AS social_security_num, SUM(DATE_PART('day', shift_end - shift_start) * 24 + 
          DATE_PART('hour', shift_end - shift_start)) AS hours_worked
      FROM officeshift
      WHERE office_worker_1 NOT LIKE 'N/A'
      GROUP BY office_worker_1
      UNION
      SELECT office_worker_2 AS social_security_num, SUM(DATE_PART('day', shift_end - shift_start) * 24 + 
          DATE_PART('hour', shift_end - shift_start)) AS hours_worked
      FROM officeshift
      WHERE office_worker_2 NOT LIKE 'N/A'
      GROUP BY office_worker_2) AS t1
  JOIN 
      (SELECT employee.job, taxes, social_security_num, payrate, overtime_payrate 
      FROM employee, job, country 
      WHERE employee.job = job.job AND country.country = employee.country) AS t2 
      ON t1.social_security_num = t2.social_security_num
) AS t3;`
    const allDemos = await pool.query(sqlquery);
    recentsql = ''
    recentsql += `${sqlquery}\n`;
    appendtofile(sql, `/*Selects ssn, hours worked, overtime hours worked, normal payrate, overtime payrate, taxes and
    monthly salary from employee, flightassignmens, job and country tables.
    We find all the flights/office shifts assigned to a social security number, get the total hours worked, place anything worked above 40 hours as overtime,
    then we pull from the job table to get the payrate for the employee and calculate their monthly salary by multiplying hours worked by the appropriate
    payrate. Lastly we get the tax for the employee's country and multiply it by the previous result, and subtract it to get the monthly salary-->*/\n` + sqlquery)
    res.json(allDemos.rows);
    await paymentupdate(allDemos.rows);
  } catch(err){
    console.log(err.message);
  }
});

//get SSNs for flightassignment by departure_airport and job
app.get('/flightassignments/:departure_airport/:job', async(req, res)=>{
  try{
    const {departure_airport, job} = req.params;
    sqlquery = ''
    sqlquery =
`SELECT social_security_num 
FROM employee 
WHERE current_airport_code = '${departure_airport}' AND job = '${job}';`
    const demo = await pool.query(sqlquery);
    recentsql = ''
    recentsql += `${sqlquery}\n`;
    appendtofile(sql, `/*Selects ssns to assign that have their current_airport_code the same as the flight departure airport code: ${departure_airport} and job: ${job}-->*/\n` + sqlquery)
    res.json(demo.rows);
  } catch(err){
    console.log(err.message);
  }
});

//get SSNs for officeshifts by office_id and job
app.get('/officeshifts/:office_id/:job', async(req, res)=>{
  try{
    const {office_id, job} = req.params;
    sqlquery =
`SELECT social_security_num FROM employee 
WHERE current_airport_code = 
  (SELECT airport_code
    FROM office
    WHERE office_num = ${office_id}) 
    AND job = '${job}';`
    const demo = await pool.query(sqlquery);
    recentsql = ''
    recentsql += `${sqlquery}\n`;
    appendtofile(sql, `/*Selects ssns to assign that have their current_airport_code the same as the office id: ${office_id} airport code and job: ${job}-->*/\n` + sqlquery)
    res.json(demo.rows);
  } catch(err){
    console.log(err.message);
  }
});

//update a flightassignment by flight_id
app.put("/flightassignments/:id", async (req, res) => {
  try {
    const { id } = req.params;
    const {pilot, copilot, flight_attendant_1, flight_attendant_2, 
      flight_attendant_3, flight_attendant_4} = req.body;
    transactionquery =
`UPDATE flightassignment SET pilot = '${pilot}', copilot = '${copilot}', flight_attendant_1 = '${flight_attendant_1}', flight_attendant_2 = '${flight_attendant_2}', 
flight_attendant_3 = '${flight_attendant_3}', flight_attendant_4 = '${flight_attendant_4}'
WHERE flight_id LIKE '${id}';`
    await pool.query('BEGIN')
    await pool.query(transactionquery);
    await pool.query('COMMIT')
    transactionquery = 'BEGIN;\n' + transactionquery + '\nCOMMIT;'
    recentsql = ''
    recentsql += `${transactionquery}\n`;
    appendtofile(transactions, `/*Update both flights starting with flight_id: ${id} and assign pilot: ${pilot}, copilot: ${copilot}, 
    and flightattendants: ${flight_attendant_1}, ${flight_attendant_2}, ${flight_attendant_3}, ${flight_attendant_4}
    to it*/\n` + transactionquery)
    res.json({pilot, copilot, flight_attendant_1, flight_attendant_2, 
      flight_attendant_3, flight_attendant_4})
  } catch (err) {
    console.error(err.message);
  }
});

//update a officeshift by shift_id
app.put("/officeshifts/:id", async (req, res) => {
  try {
    const { id } = req.params;
    const {ground_worker_1, ground_worker_2, office_worker_1, office_worker_2} = req.body;
    transactionquery =
`UPDATE officeshift 
SET ground_worker_1 = '${ground_worker_1}', ground_worker_2 = '${ground_worker_2}', office_worker_1 = '${office_worker_1}', office_worker_2 = '${office_worker_2}'
WHERE shift_id = ${id};`
    await pool.query('BEGIN')
    await pool.query(transactionquery);
    await pool.query('COMMIT')
    transactionquery = 'BEGIN;\n' + transactionquery + '\nCOMMIT;'
    recentsql = ''
    recentsql += `${transactionquery}\n`;
    appendtofile (transactions, `/*Update shiftid: ${id} and assign groundworkers: ${ground_worker_1}, ${ground_worker_2} 
    and office workers: ${office_worker_1}, ${office_worker_2} to it*/\n` + transactionquery)
    res.json({ground_worker_1, ground_worker_2, office_worker_1, office_worker_2})
  } catch (err) {
    console.error(err.message);
  }
});

//update payment by social_security_num
async function paymentupdate (payments) {
  try {
    if(payments.length != 0) {
      employees = ''
      t1 =
      `SET normal_hours = CASE social_security_num\n`
          t2 =
      `    overtime_hours = CASE social_security_num\n`
          t3 =
      `    taxes = CASE social_security_num\n`
          t4 =
      `    monthly_salary = CASE social_security_num\n`
          t5 = ''
          payments.map ((payment, index) => (
            index === payments.length - 1 ? employees += `${payment.social_security_num}`: employees += `${payment.social_security_num}, `,
            index === payments.length - 1 ? t1 += `                     WHEN '${payment.social_security_num}' THEN ${payment.normal_hours}` 
            : t1 += `                     WHEN '${payment.social_security_num}' THEN ${payment.normal_hours}\n`,
      
            index === payments.length - 1 ? t2 += `                     WHEN '${payment.social_security_num}' THEN ${payment.overtime_hours}` 
            : t2 += `                     WHEN '${payment.social_security_num}' THEN ${payment.overtime_hours}\n`,
      
            index === payments.length - 1 ? t3 += `                     WHEN '${payment.social_security_num}' THEN ${payment.taxes.toFixed(2)}` 
            : t3 += `                     WHEN '${payment.social_security_num}' THEN ${payment.taxes.toFixed(2)}\n`,
      
            index === payments.length - 1 ? t4 += `                     WHEN '${payment.social_security_num}' THEN ${payment.monthly_salary.toFixed(2)}` 
            : t4 += `                     WHEN '${payment.social_security_num}' THEN ${payment.monthly_salary.toFixed(2)}\n`,
            index === payments.length - 1 ? t5 += `'${payment.social_security_num}'`:t5 += `'${payment.social_security_num}', `
          ))
          transactionquery = `Update payment\n` + t1 + `\n                   END,\n` + t2 + `\n                   END,\n` + t3 + `\n                   END,\n` + t4 + `\n                   END\n` + `WHERE social_security_num IN (` + t5 + `);`
          await pool.query('BEGIN')
          await pool.query(transactionquery);
          await pool.query('COMMIT')
          transactionquery = 'BEGIN;\n' + transactionquery + '\nCOMMIT;'
          recentsql = ''
          recentsql += `${transactionquery}\n`;
          appendtofile (transactions, `/*Update the normal hours, overtime hours, taxes and monthly salary in the payment table for employees: ${employees}*/\n` + transactionquery)
    }
  } catch (err) {
    console.error(err.message);
  }
}

//update a employee information by id (Peter Dinh)
app.put("/employee_info/:id", async (req, res) => {
  try {
    const { id } = req.params;
    const { first_name, last_name, email, street_address, city, country, sick_leave, vacation_days} = req.body;
    transactionquery =
`UPDATE employee
SET first_name = '${first_name}', last_name = '${last_name}', email = '${email}', street_num = '${street_address}', city = '${city}', country = '${country}',
sick_leave = ${sick_leave}, vacation_days = ${vacation_days}
WHERE social_security_num = '${id}';`
    await pool.query('BEGIN')
    await pool.query(transactionquery);
    await pool.query('COMMIT')
    transactionquery = 'BEGIN;\n' + transactionquery + '\nCOMMIT;'
    recentsql = ''
    recentsql += `${transactionquery}\n`;
    appendtofile (transactions, `/*Update employee: ${id} information and change their name to: ${first_name} ${last_name}, email: ${email},
    streetnum: ${street_address}, city: ${city}, country: ${country}, sick leave: ${sick_leave}, vacation days: ${vacation_days}*/\n` + transactionquery)
    res.json({first_name, last_name, email, street_address, city, country})
  } catch (err) {
    console.error(err.message);
  }
});

app.post("/insertemployee", async (req, res) => {
  try {
    const { id, first_name, last_name, email, gender, street_address, city, country, job, airport_code, sick_leave, vacation_days} = req.body;
    transactionquery1 =
`INSERT INTO employee (social_security_num, first_name, last_name, email, gender, street_num, city, country, job, current_airport_code, sick_leave, vacation_days)
VALUES ('${id}','${first_name}','${last_name}','${email}','${gender}','${street_address}','${city}','${country}','${job}','${airport_code}',${sick_leave},${vacation_days});`
    transactionquery2 =
`INSERT INTO payment (social_security_num, job, normal_hours, overtime_hours, taxes, monthly_salary)
VALUES ('${id}', '${job}', 0, 0, 0, 0);`
    await pool.query('BEGIN')
    await pool.query(transactionquery1);
    await pool.query(transactionquery2);
    await pool.query('COMMIT')
    recentsql = ''
    recentsql += 'BEGIN;\n' + transactionquery1 + "\n" + transactionquery2 + '\nCOMMIT\n;';
    appendtofile (transactions, `/*Insert a new employee: ${id} into employee table with the name: ${first_name} ${last_name}, email: ${email}
    , gender: ${gender}, street address: ${street_address}, city: ${city}, country: ${country}, 
    job: ${job}, current airport code: ${airport_code}, sick leave: ${sick_leave}, vacation days: ${vacation_days}. We also insert this 
    employee into payment and set their normal hours, overtime_hours,
    taxes and monthly salary to 0.*/\n` + 'BEGIN;\n' + transactionquery1 + "\n" + transactionquery2 + '\nCOMMIT;')
    res.send('Success')
  } catch (err) {
    console.log(err)
  }
});

//reset the database to initial state
//uses the files in table_sql to generate the database
app.post("/reset", async (req, res) => {
  var fs = require('fs');
  try {
    var del_sql = fs.readFileSync('./table_sql/drop_tables.sql').toString()
    var init_sql = fs.readFileSync('./table_sql/reset_tables.sql').toString()
    await pool.query(del_sql)
    await pool.query(init_sql)
    res.send('Success')
  } catch (err) {
    console.log(err)
  }
});

app.get('/team19.pdf', function(req, res){
  res.sendFile(__dirname + '/team19.pdf')
});

app.get('/query.sql', function(req, res) {
  res.sendFile(__dirname + '/query.sql')
});

app.get('/text_query', function(req, res){
  var fs = require('fs');
  var text = fs.readFileSync('./query.sql').toString().replace(/\n/g, '<br>')
  res.send(`<head><link rel="stylesheet" href="resource://content-accessible/plaintext.css">
  <title>Transactions</title></head><sql>${text}</sql>`)
});

app.get('/transaction.sql', function(req, res) {
  res.sendFile(__dirname + '/transaction.sql')
});

app.get('/text_transaction', function(req, res){
  var fs = require('fs');
  var text = fs.readFileSync('./transaction.sql').toString().replace(/\n/g, '<br>')
  res.send(`<head><link rel="stylesheet" href="resource://content-accessible/plaintext.css">
  <title>Transactions</title></head><sql>${text}</sql>`)
});

app.get('/officeshift', function(req, res) {
  res.sendFile(__dirname + '/public/officeshift.html')
});

app.get('/employee', function(req, res) {
  res.sendFile(__dirname + '/public/employee.html')
});

app.get('/flightassignment', function(req, res) {
  res.sendFile(__dirname + '/public/flightassignment.html')
});

app.get('/payment', function(req, res) {
  res.sendFile(__dirname + '/public/payment.html')
});

app.get('/', function(req, res) {
  res.sendFile(path.join(__dirname + '/public/index.html'));
});

app.post("/readquerysql", async (req, res) => {
  var fs = require('fs');
  try {
    res.json(recentsql)
  } catch (err) {
    console.log(err)
  }
});

// set up the server listening at port 5000 (the port number can be changed)
const port = process.env.PORT || 5000;
app.listen(port, ()=>{
  console.log(`started on *:${port} \nopen http://127.0.0.1:5000`);
});

async function appendtofile(filename, text){
  var fs = require('fs');
  var logStream = fs.createWriteStream(filename, {flags: 'a'});
  logStream.write(text + '\n', (err) => {
    if (err){
      console.log(err)
      return
    }
  });
}