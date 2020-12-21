try {
  throw 'error';
}
catch(err) {
  console.log(err.name, err.message);
}
finally {
  console.log('finally');
}
