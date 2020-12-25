$.post('eg.asp',
  {
    name: 'teajsh',
    age: 22,
  },
  function (data, status) {
    alert(data + ' ' + status);
  });
