var x = 70.1234;
x.toString();

x.toExponential();
x.toExponential(3);

x.toFixed(2);

x.toPrecision(4);

x = new Number(32);
x.valueOf();

Number('  10   ');
Number('10.33');
Number('10, 33'); //NaN

Number(new Date());

parseInt('10 years');
parseInt('10 30');
parseInt('10.30');

parseFloat('10 years');
parseFloat('10 30');
parseFloat('10.30');

Number.MAX_VALUE;
Number.MIN_VALUE;
Number.POSITIVE_INFINITY;
Number.NEGATIVE_INFINITY;
Number.NaN;
