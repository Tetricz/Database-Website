const express = require('express');
const app = express();
const cors = require('cors');
const pool = require('./creds');
const sql = 'sql.txt'

//////////////////////////////////////////////
// add for keroku use
app.use(express.static('public'));

// middleware
app.use(cors());
app.use(express.json());      //req.body

//get = SELECT, post = INSERT, delete = DELETE, put = UPDATE

//get all demo
app.get('/demos', async(req, res)=>{
  try{
    const allDemos = await pool.query(`SELECT * FROM flightassignment`);
    res.json(allDemos.rows);
    // console.log(allDemos);
  } catch(err){
    console.log(err.message);
  }
});

//get a demo by departure_airport
app.get('/demos/:departure_airport/:job', async(req, res)=>{
  try{
    const {departure_airport, job} = req.params;
    const demo = await pool.query(`SELECT social_security_num FROM employee 
                                    WHERE current_airport_code = $1 AND job = $2`, [departure_airport, job]);
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

//update a demo by id
app.put("/demos/:id", async (req, res) => {
  try {
    const { id } = req.params;
    const {pilot, copilot, flight_attendant_1, flight_attendant_2, 
      flight_attendant_3, flight_attendant_4} = req.body;
    const updateDemo = await pool.query(`UPDATE flightassignment SET pilot = $2, copilot = $3, flight_attendant_1 = $4, flight_attendant_2 = $5, 
                                        flight_attendant_3 = $6, flight_attendant_4 = $7
                                        WHERE flight_id LIKE $1`, [id, pilot, copilot, flight_attendant_1, flight_attendant_2, 
                                          flight_attendant_3, flight_attendant_4]);
    res.json({pilot, copilot, flight_attendant_1, flight_attendant_2, 
      flight_attendant_3, flight_attendant_4})
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