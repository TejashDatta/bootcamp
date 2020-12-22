function Person (name, age) {
  this.name = name;
  this.age = age;
  this.display = function () {return this.name + this.age};
}

var person = new Person('john', 22);
