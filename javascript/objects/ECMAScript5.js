var person = {
  firstName: "John",
  lastName : "Doe",
};

Object.defineProperty(person, "language", {
  value: "English",
  writable: false, 
  enumerable: false, 
  configurable: false
});

Object.getOwnPropertyNames(person);
Object.keys(person);
