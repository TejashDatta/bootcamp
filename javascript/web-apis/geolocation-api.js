navigator.geolocation.getCurrentPosition(cb, showErr);

function cb(position) {
  position.coords.latitude;
  position.coords.longitude;
}

function showErr(error) {
  switch(error.code) {
    case error.PERMISSION_DENIED:
      break;
    case error.POSITION_UNAVAILABLE:
      break;
    case error.TIMEOUT:
      break;
    case error.UNKNOWN_ERROR:
      break;
  }
}
