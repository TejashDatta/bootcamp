var nums = [45, 4, 9, 16, 25];

nums.forEach(function(value, index, array) {
  console.log(value, index);
});

nums.map(function(value, index, array) {
  return value + 20;
});

nums.filter(function(value, index, array) {
  return value > 10;
});

var sum = nums.reduce(function(total, value, index, array) {
  return total + value;
});

var sum10 = nums.reduceRight(function(total, value, index, array) {
  return total + value;
}, 10);

nums.every(function(value, index, array) {
  return value > 30;
});

nums.some(function(value, index, array) {
  return value > 30;
});

var fruits = ["Apple", "Orange", "Apple", "Mango"];
var a = fruits.indexOf("Apple");

var a = fruits.lastIndexOf("Apple");

nums.find(function(value, index, array) {
  return value > 18;
});

nums.findIndex(function(value, index, array) {
  return value > 18;
});
