// create array of global variable demos
let demos = []

// function to set demos
const setDemos = (data) => {
  demos = data;
}

// function edit demo (connected with updateDemo below)
const editDemo = (id) => {
  document.querySelector('#edited-first-name').value = document.querySelector(`#firstname${id}`).innerHTML;
  document.querySelector('#edited-last-name').value = document.querySelector(`#lastname${id}`).innerHTML;
  document.querySelector('#edited-email').value = document.querySelector(`#email${id}`).innerHTML;
  document.querySelector('#edited-gender').value = document.querySelector(`#gender${id}`).innerHTML;
  document.querySelector('#edited-street-address').value = document.querySelector(`#streetaddress${id}`).innerHTML;
  document.querySelector('#edited-city').value = document.querySelector(`#city${id}`).innerHTML;
  document.querySelector('#edited-country').value = document.querySelector(`#country${id}`).innerHTML;
  document.querySelector('#save-edit-demo').addEventListener("click", function() {updateDemo(id)});
}

// function to display demos
const displayDemos = () => {
  
  const demoTable = document.querySelector('#demo-table');

  // display all demos by modifying the HTML 
  let tableHTML = "";

  demos.map(demo =>{
      firstnameid = "firstname" + demo.social_security_num;
      lastnameid = "lastname" + demo.social_security_num;
      emailid = "email" + demo.social_security_num;
      genderid  = "gender" + demo.social_security_num;
      streetaddressid  = "streetaddress" + demo.social_security_num;
      cityid  = "city" + demo.social_security_num;
      countryid  = "country" + demo.social_security_num;
      editid  = "edit" + demo.social_security_num;

      tableHTML +=
      `<tr Social Security Number=${demo.social_security_num}>
      <th>${demo.social_security_num}</th>
      <th id = "${firstnameid}">${demo.first_name}</th>
      <th id = "${lastnameid}">${demo.last_name}</th>
      <th id = "${emailid}">${demo.email}</th>
      <th id = "${genderid}">${demo.gender}</th>
      <th id = "${streetaddressid}">${demo.street_num}</th>
      <th id = "${cityid}">${demo.city}</th>
      <th id = "${countryid}">${demo.country}</th>
      <th >${demo.job}</th>
      <th>${demo.current_airport_code}</th>      
      <th><button class="btn btn-dark" type="button" data-toggle="modal" data-target="#edit-modal" id = "${editid}" onclick="editDemo('${demo.social_security_num}')">Edit</button></th>
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
    const response = await fetch("http://localhost:5000/employee_info")
    const jsonData = await response.json();

    setDemos(jsonData);
    
    displayDemos();

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

  //Make sure no input boxes are empty
  if(first_name == '' || last_name == '' || email == '' || gender == '' || street_address == ''||
      city == '' || country == '')
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
      const body = {first_name: first_name, last_name: last_name, email: email, gender: gender,
                      street_address: street_address, city: city, country: country};
      const response = await fetch(`http://localhost:5000/employee_info/${id}`, {
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

