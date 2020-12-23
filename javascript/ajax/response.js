var xhttp = new XMLHttpRequest();

xhttp.onreadystatechange = function() {
  if (this.readyState == 4 && this.status == 200) {
    this.responseText;
    this.getAllResponseHeaders();
    this.getResponseHeader("Last-Modified");
  }
};
