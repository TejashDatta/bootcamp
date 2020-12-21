class Name {
  constructor(first, last) {
    this.first = first;
    this.last = last;
  }
  full() {
    return this.first + this.last;
  }
}

var me = new Name('Tejash', 'Datta');
me.full();
