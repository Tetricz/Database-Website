const express = require('express');
const app = express();
const cors = require('cors');
const pool = require('./creds');
const sql = 'query.sql'
const transactions = 'transactions.sql'

//////////////////////////////////////////////
// add for keroku use
app.use(express.static('public'));

// middleware
app.use(cors());
app.use(express.json());      //req.body

//get = SELECT, post = INSERT, delete = DELETE, put = UPDATE

//get all flightassignments
app.get('/flightassignments', async(req, res)=>{
  try{
    sqlquery = 'SELECT * FROM flightassignment;'
    const allDemos = await pool.query(sqlquery);
    appendtofile(sql, sqlquery)
    res.json(allDemos.rows);
  } catch(err){
    console.log(err.message);
  }
});

//get all officeshifts
app.get('/officeshifts', async(req, res)=>{
  try{
    sqlquery = 'SELECT * FROM officeshift;'
    const allDemos = await pool.query(sqlquery);
    appendtofile(sql, sqlquery)
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
current_airport_code, medical_benefits, retirement_benefits, travel_expenses, workers_compensation FROM employee, job 
WHERE employee.job = job.job 
ORDER BY first_name, last_name;`;
    const allDemos = await pool.query(sqlquery);
    appendtofile(sql, `/*Selects ssn, first and last name, email, gender, street num, city, country, job, current airport code, and benefits from the employee and job tables-->*/\n` + sqlquery)
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
    transactionquery = `/*\nUpdate '${id}' on flightassignment table.\n The id is Number_ because it updates 2 flights at the same time.\n pilot = '${pilot}', copilot = '${copilot}', \ flight_attendant_1 = '${flight_attendant_1}',\
    flight_attendant_2 = '${flight_attendant_2}', flight_attendant_3 = '${flight_attendant_3}', flight_attendant_4 = '${flight_attendant_4}'\n*/\nBEGIN;\n${transactionquery}\nCOMMIT;\n`
    await appendtofile(transactions, transactionquery)
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
    transactionquery = `/*\nUpdate shift id ${id} on table officeshift with ground_worker_1 = '${ground_worker_1}', ground_worker_2 = '${ground_worker_2}', office_worker_1 = '${office_worker_1}', office_worker_2 = '${office_worker_2}\n*/\nBEGIN;\n${transactionquery}\nCOMMIT;`
    await appendtofile (transactions, transactionquery)
    res.json({ground_worker_1, ground_worker_2, office_worker_1, office_worker_2})
  } catch (err) {
    console.error(err.message);
  }
});

//update payment by social_security_num
async function paymentupdate (payments) {
  try {
    if(payments.length != 0) {
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
          appendtofile (transactions, transactionquery)
    }
  } catch (err) {
    console.error(err.message);
  }
}

//update a employee information by id (Peter Dinh)
app.put("/employee_info/:id", async (req, res) => {
  try {
    const { id } = req.params;
    const { first_name, last_name, email, gender, street_address, city, country} = req.body;
    transactionquery =
`UPDATE employee
SET first_name = '${first_name}', last_name = '${last_name}', email = '${email}', gender = '${gender}', street_num = '${street_address}', city = '${city}', country = '${country}'
WHERE social_security_num = '${id}';`
    await pool.query('BEGIN')
    await pool.query(transactionquery);
    await pool.query('COMMIT')
    transactionquery = `/*\nUpdate employee information on employee table where the SSN is ${id}.\n'${first_name}', last_name = '${last_name}', email = '${email}', gender = '${gender}', street_num = '${street_address}', city = '${city}', country = '${country}'\nWith  \n*/BEGIN;\n${transactionquery}\nCOMMIT;`
    await appendtofile (transactions, transactionquery)
    res.json({first_name, last_name, email, gender, street_address, city, country})
  } catch (err) {
    console.error(err.message);
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