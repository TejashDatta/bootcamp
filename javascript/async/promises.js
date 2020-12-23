let fileWait =  new Promise((resolve, reject) => {
  if (0 === 0)
    setTimeout(() => resolve('hello'), 2000);
  else
    reject()
});

fileWait.then(val => {console.log(val)}, () => console.error('error'));
