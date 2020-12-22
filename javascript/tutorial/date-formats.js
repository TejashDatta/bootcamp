// ISO
new Date("2020-03-25");
new Date("2020-03");
new Date("2015");
new Date("2015-03-25T12:00:00Z");
new Date("2015-03-25T12:00:00+9:00");

// short
new Date("03/25/2015");

// long
new Date("Mar 25 2015");
new Date("25 Mar 2015");
new Date("25 March 2015");
new Date("March, 20, 2015");
new Date("MARCH, 20, 2015");

Date.parse("Mar 25 2015");
