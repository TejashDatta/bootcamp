try {
  throw 'error';
}
catch(error) {
  console.log(error.name, error.message);
}
finally {
  console.log('finally');
}
