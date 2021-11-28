// create array of global variable demos
let demos = []

// function to set demos
const setDemos = (data) => {
  demos = data;
}

// function edit demo (connected with updateDemo below)
const editDemo = (id) => {
  document.querySelector('#save-edit-demo').addEventListener("click", function() {updateDemo(id)});
}

// function to display demos
const displayDemos = () => {
  
  const demoTable = document.querySelector('#demo-table');

  // display all demos by modifying the HTML 
  let tableHTML = "";
  demos.map(demo =>{
      tableHTML +=
      `<tr Social Security Number=${demo.social_security_num}>
      <th>${demo.social_security_num}</th>
      <th>${demo.first_name}</th>
      <th>${demo.last_name}</th>
      <th>${demo.email}</th>
      <th>${demo.gender}</th>
      <th>${demo.street_num}</th>
      <th>${demo.city}</th>
      <th>${demo.country}</th>
      <th>${demo.job}</th>
      <th>${demo.current_airport_code}</th>
      <th>${demo.medical_benefits}</th>
      <th>${demo.retirement_benefits}</th>
      <th><button class="btn btn-warning" type="button" data-toggle="modal" data-target="#edit-modal" onclick="editDemo('${demo.social_security_num}')">Edit</button></th>
      </tr>`;
  })
  demoTable.innerHTML = tableHTML;
}

// select all exisiting demos (rows in database) upon website opening
selectDemos();

// The following are async function to select, insert, update and delete demos
// select all the demo
async function selectDemos() {
  // use try... catch... to catch error
  try {
    // GET all demos from "http://localhost:5000/demos"
    const response = await fetch("/employee_info")
    // connect to heroku, remove localhost:port
    // const response = await fetch("/demos")
    const jsonData = await response.json();
    // console.log(jsonData);

    setDemos(jsonData);
    
    displayDemos();
    // setTimeout(() => {
    //   console.log(demos);
    // }, 100);

  } catch (err) {
    console.log(err.message);
  }
}


// update a demo description
async function updateDemo(id) {

  //const SSN = document.querySelector('#edited-SSN').value;
  var first_name = document.querySelector('#edited-first-name').value;
  var last_name = document.querySelector('#edited-last-name').value;
  var email = document.querySelector('#edited-email').value;
  var gender = document.querySelector('#edited-gender').value;
  var street_address = document.querySelector('#edited-street-address').value;
  var city = document.querySelector('#edited-city').value;
  var country = document.querySelector('#edited-country').value;
  //const job = document.querySelector('#edited-job').value;
  var current_airport_code = document.querySelector('#edited-current-airport-code').value;

  //Make sure no input boxes are empty
  if(first_name == '' || last_name == '' || email == '' || gender == '' || street_address == ''||
      city == '' || country == '' || current_airport_code == '')
  { 
    document.querySelector('#edit-form').innerHTML += `<div class="alert alert-danger alert-dismissible">
                                                            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                                            <strong>Unsuccessful!</strong> Please don't leave any box empty
                                                          </div>`;
  }

  else
  {
    //Edit the database
    try {
      // update a demo from "http://localhost:5000/demos/${id}", with "PUT" method
      // connect to heroku, remove localhost:port
      const body = {first_name: first_name, last_name: last_name, email: email, gender: gender,
                      street_address: street_address, city: city, country: country, current_airport_code: current_airport_code};
      const response = await fetch(`/employee_info/${id}`, {
      // const response = await fetch(`/demos/${id}`, {
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

