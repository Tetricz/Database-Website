const express = require('express');
const app = express();
const cors = require('cors');
const pool = require('./creds');
const sql = 'query.sql'

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
    const allDemos = await pool.query(`SELECT * FROM flightassignment`);
    //appendtofile(sql, "Test")
    res.json(allDemos.rows);
    // console.log(allDemos);
  } catch(err){
    console.log(err.message);
  }
});

//get all officeshifts
app.get('/officeshifts', async(req, res)=>{
  try{
    const allDemos = await pool.query(`SELECT * FROM officeshift`);
    res.json(allDemos.rows);
    // console.log(allDemos);
  } catch(err){
    console.log(err.message);
  }
});

//get all payments
app.get('/payments', async(req, res)=>{
  try{
    const allDemos = await pool.query(`SELECT social_security_num, job, normal_hours, CAST (payrate AS FLOAT), overtime_hours, CAST (overtime_payrate AS FLOAT), (normal_hours * payrate + overtime_hours * overtime_payrate) * taxes AS taxes, (normal_hours * payrate + overtime_hours * overtime_payrate) * (1 - taxes) AS monthly_salary
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
                                  ) AS t3`);
    res.json(allDemos.rows);
    // console.log(allDemos);
  } catch(err){
    console.log(err.message);
  }
});

//get SSNs for flightassignment by departure_airport and job
app.get('/demos/:departure_airport/:job', async(req, res)=>{
  try{
    const {departure_airport, job} = req.params;
    const demo = await pool.query(`SELECT social_security_num 
                                  FROM employee 
                                  WHERE current_airport_code = $1 AND job = $2`, [departure_airport, job]);
    res.json(demo.rows);
  } catch(err){
    console.log(err.message);
  }
});

//get SSNs for officeshifts by office_id and job
app.get('/officeshifts/:office_id/:job', async(req, res)=>{
  try{
    const {office_id, job} = req.params;
    const demo = await pool.query(`SELECT social_security_num FROM employee 
                                    WHERE current_airport_code = 
                                    (SELECT airport_code
                                      FROM office
                                      WHERE office_num = $1) 
                                      AND job = $2`, [office_id, job]);
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

//update a flightassignment by flight_id
app.put("/demos/:id", async (req, res) => {
  try {
    const { id } = req.params;
    const {pilot, copilot, flight_attendant_1, flight_attendant_2, 
      flight_attendant_3, flight_attendant_4} = req.body;
    await pool.query('BEGIN')
    const updateDemo = await pool.query(`UPDATE flightassignment SET pilot = $2, copilot = $3, flight_attendant_1 = $4, flight_attendant_2 = $5, 
                                        flight_attendant_3 = $6, flight_attendant_4 = $7
                                        WHERE flight_id LIKE $1`, [id, pilot, copilot, flight_attendant_1, flight_attendant_2, 
                                          flight_attendant_3, flight_attendant_4]);
    await pool.query('COMMIT')
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
    await pool.query('BEGIN')
    const updateDemo = await pool.query(`UPDATE officeshift SET ground_worker_1 = $2, ground_worker_2 = $3, office_worker_1 = $4, office_worker_2 = $5
                                        WHERE shift_id = $1`, [id, ground_worker_1, ground_worker_2, office_worker_1, office_worker_2]);
    await pool.query('COMMIT')
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
    await pool.query('BEGIN')
    const updateDemo = await pool.query(`UPDATE payment SET normal_hours = $2, overtime_hours = $3, taxes = $4, monthly_salary = $5 
                                        WHERE social_security_num = $1`, [id, normal_hours, overtime_hours, taxes, monthly_salary]);
    await pool.query('COMMIT')
    res.json({normal_hours, overtime_hours, taxes, monthly_salary})
  } catch (err) {
    console.error(err.message);
  }
});

app.get('*', function(req, res) {
  res.sendFile(path.join(__dirname + '/public/index.html'));
});

// set up the server listening at port 5000 (the port number can be changed)
const port = process.env.PORT || 5000;
app.listen(port, ()=>{
  console.log(`server has started on port ${port}`);
});

async function appendtofile(filename, text){
  const fs = require('fs');
  fs.appendFile(filename, text + '\n', (err) => {
    if (err){
      console.log(err)
      return
    }
  });
}