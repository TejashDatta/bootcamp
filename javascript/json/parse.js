// reviver

var text = '{ "name": "John", "birth": "1986-12-14"}';
var obj = JSON.parse(text, function (key, value) {
  if (key == "birth") {
    return new Date(value);
  } else {
    return value;
  }
});
