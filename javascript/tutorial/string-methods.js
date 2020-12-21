var str = 'abc hello my name is hello 123';

str.length;

str.indexOf('hello');
str.indexOf('hello', 7);
str.lastIndexOf('hello');
str.lastIndexOf('hello', 7);
str.indexOf('non-exist');
str.search('hello');

str.slice(5, 10);
str.slice(-20, -10);
str.slice(10);
str.slice(-12);

str.substring(5, 10);
str.substring(5);

str.substr(10, 5);
str.substr(10);
str.substr(-12);

str.replace('hello', 'konnichiwa');
str.replace(/HELLO/ig, 'konnichiwa');

str.toLowerCase();
str.toUpperCase();

str.concat('word1', 'word2');

str = '   hello  ';

str.trim();

str.charAt(4);
str[4];
str.charCodeAt(4);

str.split('');

str = 'list, of, elements';
str.split(',');
str.split('|');

num = '6';
num.padStart(4, 0);
num.padEnd(4, 0);
