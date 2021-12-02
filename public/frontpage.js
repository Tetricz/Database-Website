
async function resetDB() {
  try {
    console.log('Resetting Database')
    
    await fetch("/reset", {
      method: "POST",
      headers: { "Content-Type": "application/json" }
    });
    
    document.querySelector('#edit-form').innerHTML += `<div class="alert alert-success alert-dismissible">
                                                            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                                            <strong>Database Reset</strong>
                                                          </div>`;
  } catch (err) {
    console.log(err.message);
  }
}