console.log(this);

function myFunction() {
  console.log(this);
}

var object = {
  myFunction : function() {
    console.log(this);
  }
}

var obj2 = {};

object.myFunction.call(object2);
