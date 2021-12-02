// create array of global variable demos
let demos = []

// function to set demos
const setDemos = (data) => {
  demos = data;
}

let options = []
const setOptions = (results) => {
  options = results;
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
async function editDemo (id) {
  document.querySelector('#modal-buttons').innerHTML =
  `<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
  <button type="button" class="btn btn-primary" id="save-edit-demo" onclick="updateDemo('${id}')">Save changes</button>`

  const flight_id = demos.filter(demo => demo.flight_id === id)[0].flight_id;
  const pilot = demos.filter(demo => demo.flight_id === id)[0].pilot; 
  const copilot = demos.filter(demo => demo.flight_id === id)[0].copilot; 
  const flight_attendant_1 = demos.filter(demo => demo.flight_id === id)[0].flight_attendant_1;
  const flight_attendant_2 = demos.filter(demo => demo.flight_id === id)[0].flight_attendant_2; 
  const flight_attendant_3 = demos.filter(demo => demo.flight_id === id)[0].flight_attendant_3; 
  const flight_attendant_4 = demos.filter(demo => demo.flight_id === id)[0].flight_attendant_4;
  const departure_airport = demos.filter(demo => demo.flight_id === id)[0].departure_airport;

  document.querySelector('#edit-demo-label').innerHTML = "Assign Crew for Flight " + flight_id;
  document.querySelector('#edited-pilot').value = pilot;
  document.querySelector('#edited-copilot').value = copilot;
  document.querySelector('#edited-flightattendant1').value = flight_attendant_1;
  document.querySelector('#edited-flightattendant2').value = flight_attendant_2;
  document.querySelector('#edited-flightattendant3').value = flight_attendant_3;
  document.querySelector('#edited-flightattendant4').value = flight_attendant_4;
  
  await displaySelectOptions(departure_airport, 'pilot');
  await displaySelectOptions(departure_airport, 'copilot');
  await displaySelectOptions(departure_airport, 'flight attendant');
}

// function to display demos
const displayDemos = () => {
  demos.sort((a, b) => { //sort in ascending order
    return a.flight_id.localeCompare(b.flight_id);
  });
  
  const demoTable = document.querySelector('#demo-table');

  // display all demos by modifying the HTML in "demo-table", adds edit and delete buttons as well
  let tableHTML = "";
  demos.map(demo =>{
    pilotid = "pilot" + demo.flight_id;
    copilotid = "copilot" + demo.flight_id;
    flight_attendant_1 = "flight_attendant_1" + demo.flight_id;
    flight_attendant_2  = "flight_attendant_2" + demo.flight_id;
    flight_attendant_3  = "flight_attendant_3" + demo.flight_id;
    flight_attendant_4  = "flight_attendant_4" + demo.flight_id;
    editid = "edit" + demo.flight_id;
    arrival_time = demo.scheduled_arrival_time
    arrival_time = arrival_time.replace(/T|Z|.000/gi, ' ')
    departure_time = demo.scheduled_departure_time
    departure_time = departure_time.replace(/T|Z|.000/gi, ' ')
    if (demo.flight_id.includes('A')||demo.flight_id.includes('C')||demo.flight_id.includes('E')){
      tableHTML +=
      `<tr Flight ID=${demo.flight_id}>
      <th>${demo.flight_id}</th>
      <th>${demo.departure_airport}</th>
      <th>${demo.arrival_airport}</th>
      <th>${demo.pilot}</th>
      <th>${demo.copilot}</th>
      <th>${departure_time}</th>
      <th>${arrival_time}</th>
      <th>${demo.flight_attendant_1}</th>
      <th>${demo.flight_attendant_2}</th>
      <th>${demo.flight_attendant_3}</th>
      <th>${demo.flight_attendant_4}</th>
      <th><button class="btn btn-dark" type="button" data-toggle="modal" data-target="#edit-modal" onclick="editDemo('${demo.flight_id}')">Edit</button></th>
      </tr>`;
    }
    else{
      tableHTML +=
      `<tr Flight ID=${demo.flight_id}>
      <th>${demo.flight_id}</th>
      <th>${demo.departure_airport}</th>
      <th>${demo.arrival_airport}</th>
      <th>${demo.pilot}</th>
      <th>${demo.copilot}</th>
      <th>${departure_time}</th>
      <th>${arrival_time}</th>
      <th>${demo.flight_attendant_1}</th>
      <th>${demo.flight_attendant_2}</th>
      <th>${demo.flight_attendant_3}</th>
      <th>${demo.flight_attendant_4}</th>
      </tr>`;
    }
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
    const response = await fetch("/flightassignments")
    const jsonData = await response.json();
    setDemos(jsonData);
    displayDemos();
  } catch (err) {
    console.log(err.message);
  }
}

// update a demo description
async function updateDemo(id) {
  try {
    repeatedvalue = false;
    const pilot = document.querySelector('#edited-pilot').value;
    const copilot = document.querySelector('#edited-copilot').value
    const flight_attendant_1 = document.querySelector('#edited-flightattendant1').value;
    const flight_attendant_2 = document.querySelector('#edited-flightattendant2').value;
    const flight_attendant_3 = document.querySelector('#edited-flightattendant3').value;
    const flight_attendant_4 = document.querySelector('#edited-flightattendant4').value;
    idtemp = id.replace( /[^\d.]/g, '' ) + '_';

    const flight_attendants = [flight_attendant_1, flight_attendant_2, flight_attendant_3, flight_attendant_4];

    for (i = 0; i < flight_attendants.length; i++){
      for (j = 0; j < flight_attendants.length; j++){
        if (j <= i)
          continue;
        if ((flight_attendants[i] == flight_attendants[j]) && (flight_attendants[i] != 'N/A')){
          repeatedvalue = true

          document.querySelector('#edit-form').innerHTML += `<div class="alert alert-danger alert-dismissible">
                                                              <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                                              <strong>Error!</strong> Duplicate SSN value detected. Please close and reselect values.
                                                            </div>`;
                                                        
          break;
        }
      }
    }

    if (!repeatedvalue){
      const body = {pilot: pilot, copilot: copilot, flight_attendant_1: flight_attendant_1, flight_attendant_2: flight_attendant_2, 
        flight_attendant_3: flight_attendant_3, flight_attendant_4: flight_attendant_4};
        
      const response = await fetch(`/flightassignments/${idtemp}`, {
        method: "PUT",
        headers: {"Content-Type": "application/json"},
        body: JSON.stringify(body)
      })
      
      let demo = demos.find(t => t.flight_id === id);
      demo.pilot = pilot;
      demo.copilot = copilot;
      demo.flight_attendant_1 = flight_attendant_1;
      demo.flight_attendant_2 = flight_attendant_2;
      demo.flight_attendant_3 = flight_attendant_3;
      demo.flight_attendant_4 = flight_attendant_4;

      let demo1 = demos;
      
      if (id.includes('A')){
        demo1 = demos.find(t => t.flight_id === id.replace(/A/g, 'B'));
      }

      else if (id.includes('C')){
        demo1 = demos.find(t => t.flight_id === id.replace(/C/g, 'D'));
      }

      else if (id.includes('E')){
        demo1 = demos.find(t => t.flight_id === id.replace(/E/g, 'F'));
      }

      demo1.pilot = pilot;
      demo1.copilot = copilot;
      demo1.flight_attendant_1 = flight_attendant_1;
      demo1.flight_attendant_2 = flight_attendant_2;
      demo1.flight_attendant_3 = flight_attendant_3;
      demo1.flight_attendant_4 = flight_attendant_4;

      displayDemos();
      document.querySelector('#edit-form').innerHTML += `<div class="alert alert-success alert-dismissible">
                                                            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                                            <strong>Success!</strong> Please close to see the changes made.
                                                          </div>`;
    }
    
  } catch (err) {
    console.log(err.message);
  }
}

async function displaySelectOptions(departure_airport, job) {
  try {
    const response = await fetch(`/flightassignments/${departure_airport}/${job}`)
    const jsonData = await response.json();

    if (job == 'pilot'){
      dropdownlisthtml = document.querySelector('#edited-pilot');
    }
    else if (job == 'copilot'){
      dropdownlisthtml = document.querySelector('#edited-copilot');
    }
    else if (job == 'flight attendant'){
      dropdownlisthtml1 = document.querySelector('#edited-flightattendant1');
      dropdownlisthtml2 = document.querySelector('#edited-flightattendant2');
      dropdownlisthtml3 = document.querySelector('#edited-flightattendant3');
      dropdownlisthtml4 = document.querySelector('#edited-flightattendant4');
    }

    setOptions(jsonData);
  
    let listhtml = "";
    options.map(option => {
      listhtml +=
      `<option value="${option.social_security_num}">${option.social_security_num}</option>`;
    })

    if (job != 'flight attendant'){
      dropdownlisthtml.innerHTML = '<option value="N/A">N/A</option>'
      dropdownlisthtml.innerHTML += listhtml
    }
      
    else{
      dropdownlisthtml1.innerHTML = '<option value="N/A">N/A</option>'
      dropdownlisthtml2.innerHTML = '<option value="N/A">N/A</option>'
      dropdownlisthtml3.innerHTML = '<option value="N/A">N/A</option>'
      dropdownlisthtml4.innerHTML = '<option value="N/A">N/A</option>'
      dropdownlisthtml1.innerHTML += listhtml
      dropdownlisthtml2.innerHTML += listhtml
      dropdownlisthtml3.innerHTML += listhtml
      dropdownlisthtml4.innerHTML += listhtml
    }
  } catch (err) {
    console.log(err.message);
  }
}