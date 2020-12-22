var i = 0;
while (true) {
  if (i >= 10) {
    break;
  }
  console.log(i);
  i++;
}

var i = 0;
while (i < 10) {
  if (i == 5) {
    continue;
  }
  console.log(i);
  i++;
}

code: {
  console.log('hello')
  break code;
  console.log('hello')
}
