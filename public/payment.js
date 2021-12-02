// create array of global variable demos
let demos = []

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

// function to display demos
const displayDemos = () => {
  
  demos.sort((a, b) => { //sort in ascending order
    return a.social_security_num-b.social_security_num;
  });
  
  const demoTable = document.querySelector('#demo-table');

  let tableHTML = "";
  demos.map(demo =>{
    tableHTML +=
    `<tr>
    <th>${demo.social_security_num}</th>
    <th>${demo.job}</th>
    <th>${demo.normal_hours}</th>
    <th>\$${demo.payrate.toFixed(2)}</th>
    <th>${demo.overtime_hours}</th>
    <th>\$${demo.overtime_payrate.toFixed(2)}</th>
    <th>\$${demo.taxes.toFixed(2)}</th>
    <th>\$${demo.monthly_salary.toFixed(2)}</th>
    </tr>`;
  })
  demoTable.innerHTML = tableHTML;
}

selectDemos();

async function selectDemos() {
  try {
    const response = await fetch("/payments")
    const jsonData = await response.json();
    setDemos(jsonData);
    displayDemos();
  } catch (err) {
    console.log(err.message);
  }
}