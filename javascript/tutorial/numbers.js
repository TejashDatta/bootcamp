var x = 3.555;
x = 4;
x = 124e6;
x = 124e-6;

0.2 + 0.1; 

var x = 5;
var y = 'str';

x + y;

y + x;


'25' / '5';
'25' * '5';
'25' - '5';
'25' ** '5';
'25' + '5';

100 / 'str'; //NaN
100 / '10';

isNaN(100 / 'str');

var x = NaN;
var y = 5;
var z = x + y; //NaN

var x = NaN;
var y = '5';
var z = x + y; //NaN5

typeof NaN;

typeof Infinity;

-2 / 0; // -Infinity

var x = 0xFF;

x.toString(2);

var y = new Number(255);
var z = new Number(255);

x == y;
x === y;
y == z;
