// create array of global variable demos
let demos = []

// function to set demos
const setDemos = (data) => {
  demos = data;
}

// function to display demos
const displayDemos = () => {
  
  demos.sort((a, b) => { //sort in ascending order
    return a.social_security_num-b.social_security_num;
  });
  
  const demoTable = document.querySelector('#demo-table');

  // display all demos by modifying the HTML in "demo-table", adds edit and delete buttons as well
  let tableHTML = "";
  demos.map(demo =>{
    tableHTML +=
    `<tr>
    <th>${demo.social_security_num}</th>
    <th>${demo.job}</th>
    <th>${demo.normal_hours}</th>
    <th>${demo.payrate}</th>
    <th>${demo.overtime_hours}</th>
    <th>${demo.overtime_payrate}</th>
    <th>${demo.taxes}</th>
    <th>${demo.monthly_salary}</th>
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
    const response = await fetch("http://localhost:5000/payments")
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
    // update a demo from "http://localhost:5000/demos/${id}", with "PUT" method
    // connect to heroku, remove localhost:port
      const body = {normal_hours, overtime_hours, taxes, monthly_salary};
        
      const response = await fetch(`http://localhost:5000/payments/${id}`, {
      // const response = await fetch(`/demos/${id}`, {
        method: "PUT",
        headers: {"Content-Type": "application/json"},
        body: JSON.stringify(body)
      })
      
      let demo = demos.find(t => t.id === id);
      demo.normal_hours = normal_hours;
      demo.overtime_hours = overtime_hours;
      demo.taxes = taxes;
      demo.monthly_salary = monthly_salary;

      displayDemos();  
  } catch (err) {
    console.log(err.message);
  }
}