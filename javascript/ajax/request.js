xhttp.open("GET", "eg.txt", true);
xhttp.send();

xhttp.open("POST", "test.asp", true);
xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
xhttp.send("fname=Henry&lname=Ford");

xhttp.onreadystatechange = function() {
  if (this.readyState == 4 && this.status == 200) {
    this.responseText;
  }
};
