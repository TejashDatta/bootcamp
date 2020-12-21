var person = {
  firstName: "John",
  lastName : "Doe",
  language : "",
  get lang() {
    return this.language;
  },
  set lang(lang) {
    this.language = lang.toUpperCase();
  }
};

Object.defineProperty(person, 'age', {
  set : function(age) {this.age = age;}
});

person.lang = 'english';
person.lang;
