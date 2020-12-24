var string = 'abc hello my name is hello 123';

string.length;

string.indexOf('hello');
string.indexOf('hello', 7);
string.lastIndexOf('hello');
string.lastIndexOf('hello', 7);
string.indexOf('non-exist');
string.search('hello');

string.slice(5, 10);
string.slice(-20, -10);
string.slice(10);
string.slice(-12);

string.substring(5, 10);
string.substring(5);

string.substr(10, 5);
string.substr(10);
string.substr(-12);

string.replace('hello', 'konnichiwa');
string.replace(/HELLO/ig, 'konnichiwa');

string.toLowerCase();
string.toUpperCase();

string.concat('word1', 'word2');

string = '   hello  ';

string.trim();

string.charAt(4);
string[4];
string.charCodeAt(4);

string.split('');

string = 'list, of, elements';
string.split(',');
string.split('|');

number = '6';
number.padStart(4, 0);
number.padEnd(4, 0);
