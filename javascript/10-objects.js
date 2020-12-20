var person = {
  firstName: 'Tejash',
  lastName: 'Datta',
  fullName: function() {
    return this.firstName + this.lastName;
  }
}

person.fullName();
