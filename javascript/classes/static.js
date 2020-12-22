class Name {
  constructor(first, last) {
    this.first = first;
    this.last = last;
  }
  full() {
    return this.first + this.last;
  }
  static validLanguageCheck(lang) {
    return lang === 'english';
  }
}

Name.validLanguageCheck('english');

