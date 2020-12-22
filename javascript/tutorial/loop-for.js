var cars = ["BMW", "Volvo", "Mini"];
var person = {fname:"John", lname:"Doe", age:25};

for (i = 0; i < cars.length; i++) {
  console.log(cars[i]);
}

var car;
for (car of cars) {
  console.log(car);
}

var prop;
for (prop in person) {
  console.log(prop);
}
