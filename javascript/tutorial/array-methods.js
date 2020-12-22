var days = ['monday', 'tuesday', 'wednesday'];

days.toString();

days.join(' * ');

days.pop();

days.shift();

days.unshift('sunday'); // returns length

delete days[2]; // -> undefined

days.splice(2, 1);

days.splice(1, 2, 'new', 'days', 'added');

days.splice(2, 0, 'add without deleting');

var arr1 = ["Emil", "Tobias", "Linus"];
var fruits = ["Banana", "Orange", "Lemon", "Apple", "Mango"];

days.concat(arr1, fruits);

fruits.slice(2, 5);
fruits.slice(2);
