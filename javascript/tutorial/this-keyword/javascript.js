console.log(this);

function myFunction() {
  console.log(this);
}

var obj = {
  myFunction : function() {
    console.log(this);
  }
}

var obj2 = {};

obj.myFunction.call(obj2);
