'Tej'.constructor;
(3.25).constructor;

[3, 5].constructor === Array;

var date = new Date();
date.constructor = Date;

String(123);
String(false);

var number = + "5";

Number(true);
Number(date);
date.getTime();
