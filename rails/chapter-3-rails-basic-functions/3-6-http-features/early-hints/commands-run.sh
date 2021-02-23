sudo apt install h2o

sudo openssl req -nodes -x509 -new \
  -days 36500 -subj "/CN=localhost" \
  -keyout /usr/local/etc/h2o/localhost.key \
  -out /usr/local/etc/h2o/localhost.crt

sudo h2o -c /usr/local/etc/h2o/h2o.conf
