const express = require('express');
const app = express();
const cors = require('cors');
const pool = require('./creds');
const fs = require('fs');
const sqlfile = './query.sql'
const transfile = './transactions.sql'


//////////////////////////////////////////////
// add for keroku use
app.use(express.static('public'));

// middleware
app.use(cors());
app.use(express.json());      //req.body

//get = SELECT, post = INSERT, delete = DELETE, put = UPDATE

//get all flightassignments
app.get('/demos', async(req, res)=>{
  try{
    const q_string = `SELECT * FROM flightassignment`
    const allDemos = await pool.query(q_string);
    appendtofile(sqlfile, q_string)
    res.json(allDemos.rows);
    // console.log(allDemos);
  } catch(err){
    console.log(err.message);
  }
});

//get all officeshifts
app.get('/officeshifts', async(req, res)=>{
  try{
    const q_string = `SELECT * FROM officeshift`
    const allDemos = await pool.query(q_string);
    appendtofile(sqlfile, q_string)
    res.json(allDemos.rows);
    // console.log(allDemos);
  } catch(err){
    console.log(err.message);
  }
});

//get all employee information (Peter Dinh)
app.get('/employee_info', async(req, res)=>{
  try{
    const q_string = `SELECT social_security_num, first_name, last_name, email, gender, street_num, city, country, ep.job, current_airport_code, medical_benefits, retirement_benefits FROM employee AS ep
                      JOIN job AS jb
                        ON ep.job = jb.job
                      ORDER BY first_name, last_name`
    const allDemos = await pool.query(q_string);
    appendtofile(sqlfile, q_string)
    res.json(allDemos.rows);
    // console.log(allDemos);
  } catch(err){
    console.log(err.message);
  }
});

//get all payments
app.get('/payments', async(req, res)=>{
  try{
    const q_string = `SELECT social_security_num, job, normal_hours, CAST (payrate AS FLOAT), overtime_hours, CAST (overtime_payrate AS FLOAT), (normal_hours * payrate + overtime_hours * overtime_payrate) * taxes AS taxes, (normal_hours * payrate + overtime_hours * overtime_payrate) * (1 - taxes) AS monthly_salary
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
                        ) AS t3`
    const payments = await pool.query(q_string);
    appendtofile(sqlfile, q_string)
    res.json(payments.rows);
    // console.log(allDemos);
  } catch(err){
    console.log(err.message);
  }
});

//get SSNs for flightassignment by departure_airport and job
app.get('/demos/:departure_airport/:job', async(req, res)=>{
  try{
    const {departure_airport, job} = req.params;
    const q_string = `SELECT social_security_num 
                      FROM employee 
                      WHERE current_airport_code = $1 AND job = $2`
    const demo = await pool.query(q_string, [departure_airport, job]);
    appendtofile(sqlfile, q_string)
    res.json(demo.rows);
  } catch(err){
    console.log(err.message);
  }
});

//get SSNs for officeshifts by office_id and job
app.get('/officeshifts/:office_id/:job', async(req, res)=>{
  try{
    const {office_id, job} = req.params;
    const q_string = `SELECT social_security_num FROM employee 
                      WHERE current_airport_code = 
                      (SELECT airport_code
                        FROM office
                        WHERE office_num = $1) 
                        AND job = $2`
    const demo = await pool.query(q_string, [office_id, job]);
    appendtofile(sqlfile, q_string)
    res.json(demo.rows);
  } catch(err){
    console.log(err.message);
  }
});

//insert a demo
app.post('/demos', async(req, res)=>{ //call post function from main.js (insert)
    try{
      const {key, description} = req.body;
      // console.log(key, description);
      const newDemo = await pool.query(`INSERT INTO demo (key, description) VALUES($1, $2) RETURNING *`, [key, description]);
      
      res.json(newDemo.rows[0]);        
    } catch(err){
      console.log(err.message);
    }
  });

//reset the database to initial state
//uses the files in table_sql to generate the database
app.post("/reset", async (req, res) => {
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

//update a flightassignment by flight_id
app.put("/demos/:id", async (req, res) => {
  try {
    const { id } = req.params;
    const {pilot, copilot, flight_attendant_1, flight_attendant_2, 
      flight_attendant_3, flight_attendant_4} = req.body;
    const q_string_1 = 'BEGIN'
    await pool.query(q_string_1)
    const q_string_2 = `UPDATE flightassignment SET pilot = $2, copilot = $3, flight_attendant_1 = $4, flight_attendant_2 = $5, 
                        flight_attendant_3 = $6, flight_attendant_4 = $7
                        WHERE flight_id LIKE $1`
    const updateDemo = await pool.query(q_string_2, [id, pilot, copilot, flight_attendant_1, flight_attendant_2, 
                                          flight_attendant_3, flight_attendant_4]);
    const q_string_3 = 'COMMIT'
    await pool.query(q_string_3)
    const q_string = q_string_1 + '\n' + q_string_2 + '\n' + q_string_3
    appendtofile(transfile, q_string)

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
    const q_string_1 = 'BEGIN'
    await pool.query(q_string_1)
    const q_string_2 = `UPDATE officeshift SET ground_worker_1 = $2, ground_worker_2 = $3, office_worker_1 = $4, office_worker_2 = $5
                        WHERE shift_id = $1`
    const updateDemo = await pool.query(q_string_2, [id, ground_worker_1, ground_worker_2, office_worker_1, office_worker_2]);
    const q_string_3 = 'COMMIT'
    await pool.query(q_string_3)
    const q_string = q_string_1 + '\n' + q_string_2 + '\n' + q_string_3
    appendtofile(transfile, q_string)
    res.json({ground_worker_1, ground_worker_2, office_worker_1, office_worker_2})
  } catch (err) {
    console.error(err.message);
  }
});

//update payment by social_security_num
app.put("/payments/:id", async (req, res) => {
  try {
    const { id } = req.params;
    const {normal_hours, overtime_hours, taxes, monthly_salary} = req.body;
    const q_string_1 = 'BEGIN'
    await pool.query(q_string_1)
    const q_string_2 = `UPDATE payment SET normal_hours = $2, overtime_hours = $3, taxes = $4, monthly_salary = $5 
                        WHERE social_security_num = $1`
    const updateDemo = await pool.query(q_string_2, [id, normal_hours, overtime_hours, taxes, monthly_salary]);
    const q_string_3 = 'COMMIT'
    await pool.query(q_string_3)
    const q_string = q_string_1 + '\n' + q_string_2 + '\n' + q_string_3
    appendtofile(transfile, q_string)
    res.json({normal_hours, overtime_hours, taxes, monthly_salary})
  } catch (err) {
    console.error(err.message);
  }
});

//update a employee information by id (Peter Dinh)
app.put("/employee_info/:id", async (req, res) => {
  try {
    const { id } = req.params;
    const { first_name, last_name, email, gender, street_address, city, country, current_airport_code } = req.body;

    const q_string_1 = 'BEGIN' 
    await pool.query(q_string_1)
    const q_string_2 = `UPDATE employee SET first_name = $2, last_name = $3, email = $4, gender = $5, street_num = $6, city = $7, country = $8, current_airport_code = $9 
    WHERE social_security_num = $1`
    const updateDemo = await pool.query(q_string_2,
      [id, first_name, last_name, email, gender, street_address, city, country, current_airport_code]);
    const q_string_3 = 'COMMIT'
    await pool.query(q_string_3)
    const q_string = q_string_1 + '\n' + q_string_2 + '\n' + q_string_3
    appendtofile(transfile, q_string)
    res.json({first_name, last_name, email, gender, street_address, city, country, current_airport_code})

  } catch (err) {
    console.error(err.message);
  }
});


app.get('/shifts', function(req, res) {
  res.sendFile(__dirname + '/public/officeshift.html')
});

app.get('/employees', function(req, res) {
  res.sendFile(__dirname + '/public/employee.html')
});

app.get('/flights', function(req, res) {
  res.sendFile(__dirname + '/public/flightassignment.html')
});

app.get('/payroll', function(req, res) {
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
  try {
    fs.appendFile(filename, text + '\n', (err) =>{
			if (err) throw err;
		})
  } catch (err) {
    console.log(err)
  }
}
