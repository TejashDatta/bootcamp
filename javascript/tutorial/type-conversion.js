'Tej'.constructor;
(3.25).constructor;

[3, 5].constructor === Array;

var d = new Date();
d.constructor = Date;

String(123);
String(false);

var n = + "5";

Number(true);
Number(d);
d.getTime();
