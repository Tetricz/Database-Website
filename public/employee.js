// create array of global variable demos
let demos = []

let newssn = ''

let sickvacationdays = {}

// function to set demos
const setDemos = (data) => {
  demos = data;
}

async function viewquerysql() {
  try {  
    const response = await fetch("/readquerysql", {
      method: "POST",
      headers: { "Content-Type": "application/json" }
    });

    const jsonData = await response.json();
    
    document.querySelector('#edit-demo-body').innerHTML = jsonData;

  } catch (err) {
    console.log(err.message);
  }
}

// function edit demo (connected with updateDemo below)
const editDemo = (id) => {
  document.querySelector('#modal-buttons').innerHTML =
  `<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
  <button type="button" class="btn btn-primary" id="save-edit-demo" onclick="updateDemo('${id}')">Save changes</button>`
  
  document.querySelector('#edited-first-name').value = document.querySelector(`#firstname${id}`).innerHTML;
  document.querySelector('#edited-last-name').value = document.querySelector(`#lastname${id}`).innerHTML;
  document.querySelector('#edited-email').value = document.querySelector(`#email${id}`).innerHTML;
  document.querySelector('#edited-street-address').value = document.querySelector(`#streetaddress${id}`).innerHTML;
  document.querySelector('#edited-city').value = document.querySelector(`#city${id}`).innerHTML;
  document.querySelector('#edited-country').value = document.querySelector(`#country${id}`).innerHTML;
  document.querySelector('#edited-sickleave').value = document.querySelector(`#sickleave${id}`).innerHTML;
  document.querySelector('#edited-vacationdays').value = document.querySelector(`#vacationdays${id}`).innerHTML;
}

async function insertDemo (id) {
  var first_name = document.querySelector('#new-firstname').value
  var last_name = document.querySelector('#new-lastname').value
  var email = document.querySelector('#new-email').value
  var gender = document.querySelector('#new-gender').value
  var street_address = document.querySelector('#new-address').value
  var city = document.querySelector('#new-city').value
  var country = document.querySelector('#new-country').value
  var job = document.querySelector('#new-job').value
  var airport_code = document.querySelector('#new-airport-code').value
  var sick_leave = document.querySelector('#new-sickleave').innerHTML
  var vacation_days = document.querySelector('#new-vacationdays').innerHTML
  console.log(sick_leave, vacation_days)
  if(first_name == '' || last_name == '' || email == ''|| street_address == ''||
      city == '' || country == '')
  { 
    document.querySelector('#alert').innerHTML += `<div class="alert alert-danger alert-dismissible">
                                                            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                                            <strong>Unsuccessful!</strong> Please don't leave any box empty
                                                          </div>`;
  }
  else if (!isLetterSpace.test(first_name) || !isLetterSpace.test(last_name)){
    document.querySelector('#alert').innerHTML += `<div class="alert alert-danger alert-dismissible">
                                                            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                                            <strong>Unsuccessful!</strong> Please enter letters or spaces for your name.
                                                          </div>`;
  }
  
  else if (!email.includes('@') && !email.includes('.')){
    document.querySelector('#alert').innerHTML += `<div class="alert alert-danger alert-dismissible">
                                                            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                                            <strong>Unsuccessful!</strong> Please enter a valid email address.
                                                          </div>`;
  }

  else if (!isLetterSpace.test(first_name) || !isLetterSpace.test(last_name)){
    document.querySelector('#alert').innerHTML += `<div class="alert alert-danger alert-dismissible">
                                                            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                                            <strong>Unsuccessful!</strong> Please enter letters or spaces for your name.
                                                          </div>`;
  }
  else {
    try {
      const body = {id: id, first_name: first_name, last_name: last_name, email: email, gender: gender,
                      street_address: street_address, city: city, country: country, job: job, airport_code: airport_code, sick_leave: sick_leave, vacation_days: vacation_days};
      const response = await fetch(`/insertemployee/`, {
        method: "POST",
        headers: {"Content-Type": "application/json"},
        body: JSON.stringify(body)
      })
      
      selectDemos()
      
      document.querySelector('#alert').innerHTML += `<div class="alert alert-success alert-dismissible">
                                                              <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                                              <strong>Success!</strong> Please close to see the changes made.
                                                            </div>`;
    
    } catch (err) {
      console.log(err.message);
    }
  }
}

const changebenefits = () => {
  let job = document.querySelector('#new-job').value;
  if (job === "pilot" ||job ===  "copilot") {
    document.querySelector('#new-benefits').innerHTML = "Medical Retirement Travel Expenses";
    document.querySelector('#new-sickleave').innerHTML = 9;
    document.querySelector('#new-vacationdays').innerHTML = 16;
  }
  else if (job === "flight attendant"){
    document.querySelector('#new-benefits').innerHTML = "Medical Retirement Travel Expenses";
    document.querySelector('#new-sickleave').innerHTML = 9;
    document.querySelector('#new-vacationdays').innerHTML = 14;
  }
  else if (job === "ground crew" ||job ===  "office worker"){
    document.querySelector('#new-benefits').innerHTML = "Medical Retirement Workers Compensation";
    document.querySelector('#new-sickleave').innerHTML = 9;
    document.querySelector('#new-vacationdays').innerHTML = 14;
  }
}

// function to display demos
const displayDemos = () => {
  const demoTable = document.querySelector('#demo-table');

  ssnexists = true;
  while (ssnexists) {
    newssn = Math.floor(100000000 + Math.random() * 900000000).toString()
    newssn = `${newssn.substring(0,3)}-${newssn.substring(3,5)}-${newssn.substring(5,10)}`
    for (let i = 0; i < demos.length; i++) {
      if (demos[i].social_security_num === "500-79-5396"){
        ssnexists = false;
        break;
      }
    }
  }
  document.querySelector('#new-ssn').innerHTML = newssn;

  // display all demos by modifying the HTML 
  let tableHTML = "";

  demos.map(demo =>{
      firstnameid = "firstname" + demo.social_security_num;
      lastnameid = "lastname" + demo.social_security_num;
      emailid = "email" + demo.social_security_num;
      streetaddressid  = "streetaddress" + demo.social_security_num;
      cityid  = "city" + demo.social_security_num;
      countryid  = "country" + demo.social_security_num;
      sickleaveid  = "sickleave" + demo.social_security_num;
      vacationdaysid  = "vacationdays" + demo.social_security_num;
      jobid  = "job" + demo.social_security_num;
      editid  = "edit" + demo.social_security_num;

      let benefits = ''
      demo.medical_benefits === true ?  benefits += 'Medical ' : null
      demo.retirement_benefits === true ?  benefits += 'Retirement ' : null
      demo.travel_expenses === true ?  benefits += 'Travel Expenses ' : null
      demo.workers_compensation === true ?  benefits += 'Workers Compensation ' : null
      
      tableHTML +=
      `<tr Social Security Number=${demo.social_security_num}>
      <th>${demo.social_security_num}</th>
      <th id = "${firstnameid}">${demo.first_name}</th>
      <th id = "${lastnameid}">${demo.last_name}</th>
      <th id = "${emailid}">${demo.email}</th>
      <th>${demo.gender}</th>
      <th id = "${streetaddressid}">${demo.street_num}</th>
      <th id = "${cityid}">${demo.city}</th>
      <th id = "${countryid}">${demo.country}</th>
      <th id = "${jobid}">${demo.job}</th>
      <th>${demo.current_airport_code}</th> 
      <th>${benefits}</th>
      <th id = ${sickleaveid}>${demo.sick_leave}</th>
      <th id = ${vacationdaysid}>${demo.vacation_days}</th>   
      <th><button class="btn btn-dark" type="button" data-toggle="modal" data-target="#edit-modal" id = "${editid}" onclick="editDemo('${demo.social_security_num}')">Edit</button></th>
      </tr>`;
  })
  demoTable.innerHTML = tableHTML;
}

// select all exisiting demos (rows in database) upon website opening
selectDemos();

changebenefits();
document.querySelector('#addemployee').addEventListener("click", function() {insertDemo(newssn)});

// The following are async function to select, insert, update and delete demos
// select all the demo
async function selectDemos() {
  // use try... catch... to catch error
  try {
    const response = await fetch("/employee_info")
    const jsonData = await response.json();

    setDemos(jsonData);

    displayDemos();

  } catch (err) {
    console.log(err.message);
  }
  try {
    const response = await fetch("/sickvacationdays")
    const jsonData = await response.json();

    jsonData.map (days => {
      sickvacationdays[days.job] = new Array();
      sickvacationdays[days.job].push(days.sick_leave, days.vacation_days);
    })

  } catch (err) {
    console.log(err.message);
  }
}

const isLetterSpace = new RegExp ('^[A-Za-z ]+$')
const isNumber = new RegExp ('^[0-9]+$')

// update a demo description
async function updateDemo(id) {

  //const SSN = document.querySelector('#edited-SSN').value;
  var first_name = document.querySelector('#edited-first-name').value;
  var last_name = document.querySelector('#edited-last-name').value;
  var email = document.querySelector('#edited-email').value;
  var street_address = document.querySelector('#edited-street-address').value;
  var city = document.querySelector('#edited-city').value;
  var country = document.querySelector('#edited-country').value;
  var sickleave = document.querySelector('#edited-sickleave').value;
  var vacationdays = document.querySelector('#edited-vacationdays').value;
  var job = document.querySelector(`#job${id}`).innerHTML;

  //Make sure no input boxes are empty
  if(first_name == '' || last_name == '' || email == ''|| street_address == ''||
      city == '' || country == '')
  { 
    document.querySelector('#edit-form').innerHTML += `<div class="alert alert-danger alert-dismissible">
                                                            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                                            <strong>Unsuccessful!</strong> Please don't leave any box empty
                                                          </div>`;
  }
  else if (!isLetterSpace.test(first_name) || !isLetterSpace.test(last_name)){
    document.querySelector('#alert').innerHTML += `<div class="alert alert-danger alert-dismissible">
                                                            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                                            <strong>Unsuccessful!</strong> Please enter letters or spaces for your name.
                                                          </div>`;
  }
  
  else if (!email.includes('@') && !email.includes('.')){
    document.querySelector('#alert').innerHTML += `<div class="alert alert-danger alert-dismissible">
                                                            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                                            <strong>Unsuccessful!</strong> Please enter a valid email address.
                                                          </div>`;
  }

  else if (!isLetterSpace.test(first_name) || !isLetterSpace.test(last_name)){
    document.querySelector('#alert').innerHTML += `<div class="alert alert-danger alert-dismissible">
                                                            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                                            <strong>Unsuccessful!</strong> Please enter letters or spaces for your name.
                                                          </div>`;
  }

  else if (sickvacationdays[job][0] < sickleave || sickvacationdays[job][1] < vacationdays ){
    document.querySelector('#edit-form').innerHTML += `<div class="alert alert-danger alert-dismissible">
                                                            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                                            <strong>Unsuccessful!</strong> You cannot add days higher than the initial sick leave and vacation days.
                                                          </div>`;
  }
  
  else if (!isNumber.test(sickleave) || !isNumber.test(vacationdays)){
    document.querySelector('#edit-form').innerHTML += `<div class="alert alert-danger alert-dismissible">
                                                            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                                            <strong>Unsuccessful!</strong> Please enter a number value for sick leave and vacation days.
                                                          </div>`;
  }
  
  else if (!isLetterSpace.test(first_name) || !isLetterSpace.test(last_name)){
    document.querySelector('#edit-form').innerHTML += `<div class="alert alert-danger alert-dismissible">
                                                            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                                            <strong>Unsuccessful!</strong> Please enter letters or spaces for your name.
                                                          </div>`;
  }
  
  else if (!email.includes('@') && !email.includes('.')){
    document.querySelector('#edit-form').innerHTML += `<div class="alert alert-danger alert-dismissible">
                                                            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                                            <strong>Unsuccessful!</strong> Please enter a valid email address.
                                                          </div>`;
  }

  else if (!isLetterSpace.test(first_name) || !isLetterSpace.test(last_name)){
    document.querySelector('#edit-form').innerHTML += `<div class="alert alert-danger alert-dismissible">
                                                            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                                            <strong>Unsuccessful!</strong> Please enter letters or spaces for your name.
                                                          </div>`;
  }

  else
  {
    //Edit the database
    try {
      const body = {first_name: first_name, last_name: last_name, email: email,
                      street_address: street_address, city: city, country: country, sick_leave: sickleave, vacation_days: vacationdays};
      const response = await fetch(`/employee_info/${id}`, {
        method: "PUT",
        headers: {"Content-Type": "application/json"},
        body: JSON.stringify(body)
      })
  
      selectDemos()
      
      document.querySelector('#edit-form').innerHTML += `<div class="alert alert-success alert-dismissible">
                                                              <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                                              <strong>Success!</strong> Please close to see the changes made.
                                                            </div>`;
    
    } catch (err) {
      console.log(err.message);
    }
  }
}

