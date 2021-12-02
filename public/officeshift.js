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
const editDemo = (id) => {
  document.querySelector('#modal-buttons').innerHTML =
  `<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
  <button type="button" class="btn btn-primary" id="save-edit-demo" onclick="updateDemo(${id})">Save changes</button>`

  const shift_id = demos.filter(demo => demo.shift_id === id)[0].shift_id;
  const office_id = demos.filter(demo => demo.shift_id === id)[0].office_id;
  const ground_worker_1 = demos.filter(demo => demo.shift_id === id)[0].ground_worker_1;
  const ground_worker_2 = demos.filter(demo => demo.shift_id === id)[0].ground_worker_2; 
  const office_worker_1 = demos.filter(demo => demo.shift_id === id)[0].ground_worker_1; 
  const office_worker_2 = demos.filter(demo => demo.shift_id === id)[0].ground_worker_2;

  document.querySelector('#edit-demo-label').innerHTML = "Assign Workers for Shift " + shift_id;
  document.querySelector('#edited-groundworker1').value = ground_worker_1;
  document.querySelector('#edited-groundworker2').value = ground_worker_2;
  document.querySelector('#edited-officeworker1').value = office_worker_1;
  document.querySelector('#edited-officeworker2').value = office_worker_2;
  displaySelectOptions(office_id, 'ground crew')
  displaySelectOptions(office_id, 'office worker')
}

// function to display demos
const displayDemos = () => {
  
  demos.sort((a, b) => { //sort in ascending order
    return a.shift_id-b.shift_id;
  });
  
  const demoTable = document.querySelector('#demo-table');

  // display all demos by modifying the HTML in "demo-table", adds edit and delete buttons as well
  let tableHTML = "";
  demos.map(demo =>{
    shift_start = demo.shift_start
    shift_start = shift_start.replace(/T|Z|.000/gi, ' ')
    shift_end = demo.shift_end
    shift_end = shift_end.replace(/T|Z|.000/gi, ' ')
    tableHTML +=
    `<tr>
    <th>${demo.shift_id}</th>
    <th>${demo.office_id}</th>
    <th>${demo.airport_code}</th>
    <th>${shift_start}</th>
    <th>${shift_end}</th>
    <th>${demo.ground_worker_1}</th>
    <th>${demo.ground_worker_2}</th>
    <th>${demo.office_worker_1}</th>
    <th>${demo.office_worker_2}</th>
    <th><button class="btn btn-dark" type="button" data-toggle="modal" data-target="#edit-modal" onclick="editDemo(${demo.shift_id})">Edit</button></th>
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
    // GET all demos from "/demos"
    const response = await fetch("/officeshifts")
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
  // console.log(key)
  // console.log(description);

  try {
    // update a demo from "/demos/${id}", with "PUT" method
    // connect to heroku, remove localhost:port
    repeatedvalue = false;
    const ground_worker_1 = document.querySelector('#edited-groundworker1').value;
    const ground_worker_2 = document.querySelector('#edited-groundworker2').value;
    const office_worker_1 = document.querySelector('#edited-officeworker1').value;
    const office_worker_2 = document.querySelector('#edited-officeworker2').value;

    const ground_workers = [ground_worker_1, ground_worker_2];
    const office_workers = [office_worker_1, office_worker_2];

    for (i = 0; i < ground_workers.length; i++){
      for (j = 0; j < ground_workers.length; j++){
        if (j <= i)
          continue;
        if (((ground_workers[i] == ground_workers[j]) && (ground_workers[i] != 'N/A')) || ((office_workers[i] == office_workers[j]) && (office_workers[i] != 'N/A'))){
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
      const body = {ground_worker_1: ground_worker_1, ground_worker_2: ground_worker_2, office_worker_1: office_worker_1, office_worker_2: office_worker_2};
        
      const response = await fetch(`/officeshifts/${id}`, {
      // const response = await fetch(`/demos/${id}`, {
        method: "PUT",
        headers: {"Content-Type": "application/json"},
        body: JSON.stringify(body)
      })
      
      let demo = demos.find(t => t.shift_id === id);
      demo.ground_worker_1 = ground_worker_1;
      demo.ground_worker_2 = ground_worker_2;
      demo.office_worker_1 = office_worker_1;
      demo.office_worker_2 = office_worker_2;

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

async function displaySelectOptions(office_id, job) {
  try {
    // GET all demos from "/demos"
    const response = await fetch(`/officeshifts/${office_id}/${job}`)
    // connect to heroku, remove localhost:port
    const jsonData = await response.json();

    if (job == 'ground crew'){
      dropdownlisthtml1 = document.querySelector('#edited-groundworker1');
      dropdownlisthtml2 = document.querySelector('#edited-groundworker2');
    }

    else if (job == 'office worker'){
      dropdownlisthtml1 = document.querySelector('#edited-officeworker1');
      dropdownlisthtml2 = document.querySelector('#edited-officeworker2');
    }

    setOptions(jsonData);
  
    let listhtml = "";
    options.map(option => {
      listhtml +=
      `<option value="${option.social_security_num}">${option.social_security_num}</option>`;
    })

    dropdownlisthtml1.innerHTML = '<option value="N/A">N/A</option>'
    dropdownlisthtml2.innerHTML = '<option value="N/A">N/A</option>'
    dropdownlisthtml1.innerHTML += listhtml
    dropdownlisthtml2.innerHTML += listhtml

  } catch (err) {
    console.log(err.message);
  }
}