let fileWait =  new Promise((resolve, reject) => {
  if (0 === 0)
    setTimeout(() => resolve('hello'), 2000);
  else
    reject()
});

fileWait.then(value => {console.log(value)}, () => console.error('error'));
