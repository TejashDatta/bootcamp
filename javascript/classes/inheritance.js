class Name {
  constructor(first, last) {
    this.first = first;
    this.last = last;
  }
  full() {
    return this.first + this.last;
  }
}

class SuffixedName extends Name {
  constructor(first, last, suffix) {
    super(first, last);
    this.suffix = suffix;
  }
  fullSuffixed() {
    return full() + this.suffix;
  }
  get lang() {
    return this.lang;
  }
  set lang(lang) {
    this.lang = lang;
  }
}
