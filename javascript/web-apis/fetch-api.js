fetch('https://www.w3schools.com/js/js_api_fetch.asp')
  .then(resp => console.log(resp))
  .then(data => example(data))
