// create array of global variable demos
let demos = []

// function to set demos
const setDemos = (data) => {
  demos = data;
}

// function edit demo (connected with updateDemo below)
const editDemo = (id) => {
  const flight_id = demos.filter(demo => demo.flight_id === id)[0].flight_id;
  const pilot = demos.filter(demo => demo.flight_id === id)[0].pilot; 
  const copilot = demos.filter(demo => demo.flight_id === id)[0].pilot; 
  const flight_attendant_1 = demos.filter(demo => demo.flight_id === id)[0].flight_attendant_1;
  const flight_attendant_2 = demos.filter(demo => demo.flight_id === id)[0].flight_attendant_2; 
  const flight_attendant_3 = demos.filter(demo => demo.flight_id === id)[0].flight_attendant_3; 
  const flight_attendant_4 = demos.filter(demo => demo.flight_id === id)[0].flight_attendant_4;
  document.querySelector('#edit-demo-label').innerHTML = "Assign Crew for Flight " + flight_id;
  document.querySelector('#edited-pilot').value = pilot;
  document.querySelector('#edited-copilot').value = copilot;
  document.querySelector('#edited-flightattendant1').value = flight_attendant_1;
  document.querySelector('#edited-flightattendant2').value = flight_attendant_2;
  document.querySelector('#edited-flightattendant3').value = flight_attendant_3;
  document.querySelector('#edited-flightattendant4').value = flight_attendant_4;
  //document.querySelector('#save-edit-demo').addEventListener("click", function() {updateDemo(id)});
}

// function to display demos
const displayDemos = () => {
  /*
  demos.sort((a, b) => { //sort in ascending order
    return a.key - b.key;
  });
  */
  const demoTable = document.querySelector('#demo-table');

  // display all demos by modifying the HTML in "demo-table", adds edit and delete buttons as well
  let tableHTML = "";
  demos.map(demo =>{
    arrival_time = demo.scheduled_arrival_time
    arrival_time = arrival_time.replace(/T|Z|.000/gi, ' ')
    departure_time = demo.scheduled_departure_time
    departure_time = departure_time.replace(/T|Z|.000/gi, ' ')
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
    <th><button class="btn btn-warning" type="button" data-toggle="modal" data-target="#edit-modal" onclick="editDemo('${demo.flight_id}')">Edit</button></th>
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
    const response = await fetch("http://localhost:5000/demos")
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
/*
// insert a new demo
async function insertDemo() {
  // read the demo description from input
  const inputKey = document.querySelector('#demo-key');
  const inputDesc = document.querySelector('#demo-description');
  const key = inputKey.value;
  const description = inputDesc.value;
  // console.log(key, description);

  // use try... catch... to catch error
  try {
    // insert new demo to "http://localhost:5000/demos", with "POST" method
    const body = { key: key, description: description };

    // connect to heroku, remove localhost:port
    const response = await fetch("http://localhost:5000/demos", { //get localhost/demos, use post to load info from inputKey/Desc into it
    // const response = await fetch("/demos", {
      method: "POST",
      headers: { "Content-Type": "application/json" }, //tell the server what kind of data is sent (json)
      body: JSON.stringify(body) //change json into string
    });
    const newDemo = await response.json(); //getting the result of the post (info inserted)
    demos.push(newDemo);
    displayDemos();
    inputKey.value=''; //resets inputKey and Desc for next input
    inputDesc.value='';
  } catch (err) {
    console.log(err.message);
  }
}
/*
// delete a demo by id
async function deleteDemo(id) {
  try {
    // delete a demo from "http://localhost:5000/demos/${id}", with "DELETE" method
    // connect to heroku, remove localhost:port
    const deletedDemo = await fetch(`http://localhost:5000/demos/${id}`, {
    // const deletedDemo = await fetch(`/demos/${id}`, {
      method: "DELETE"
    })
    const deleteDemo = await deletedDemo.json();
    demos = demos.filter(demo => demo.key != deleteDemo.key);
    displayDemos();

  } catch (err) {
    console.log(err.message);
  }
}

// update a demo description
async function updateDemo(id) {
  
  const key = document.querySelector('#edited-key').value;
  const description = document.querySelector('#edited-description').value;
  // console.log(key)
  // console.log(description);

  try {
    // update a demo from "http://localhost:5000/demos/${id}", with "PUT" method
    // connect to heroku, remove localhost:port
    const body = {key: key, description: description};
    const response = await fetch(`http://localhost:5000/demos/${id}`, {
    // const response = await fetch(`/demos/${id}`, {
      method: "PUT",
      headers: {"Content-Type": "application/json"},
      body: JSON.stringify(body)
    })

    let demo = demos.find(t => t.key === id);
    demo.key = key;
    demo.description = description;
    displayDemos();

  } catch (err) {
    console.log(err.message);
  }
}
*/
