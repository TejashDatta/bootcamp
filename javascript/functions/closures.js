var add = (function () {
  var counter = 0;
  return function () {counter++; return counter};
})();

add();
add();
add();
