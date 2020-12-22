function Person (name, age) {
  this.name = name;
  this.age = age;
  this.display = function () {return this.name + this.age};
}

Person.prototype.city = "kolkata";

Person.prototype.legalAge = function () {
  return this.age >= 18;
};
