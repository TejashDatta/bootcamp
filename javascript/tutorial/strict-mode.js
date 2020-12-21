"use strict";

x = 3; // error

var x = 3.14;
delete x; //error

function myFunction() {
  alert(this); // undefined
}
