var days = ['monday', 'tuesday', 'wednesday'];

days[2];
days[2] = 'thursday';

days;

days.length;

days.sort();

var last = days[days.length - 1];

for (i = 0; i < days.length; i++) {
  console.log(days[i]);
}

days.forEach(function(day) {
  console.log(day);
});

days.push('thursday');
days[days.length] = 'friday';
days[10] = 'holes';

Array.isArray(days);

days instanceof Array;
