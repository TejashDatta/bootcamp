var car = {
  run: function (speed1, speed2) {
    console.log('run at ' + speed1 + ' ' + speed2);
  }
}

var car2 = {};

car.run.call(car2, 50, 40);
