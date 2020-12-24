async function exampleFunction() {
  return 'hello';
}

exampleFunction().then(
  val => console.log(val)
);

async function timedDisplay() {
  let message = new Promise(function(resolve, reject) {
    setTimeout(() => {
      resolve('hello');
    }, 2000);
  });
  console.log(await message);
}

timedDisplay();
