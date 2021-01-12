# initdb shell command options:
#   -D directory of cluster
#   --locale, C no setting
#   -E --encoding
#   -U --username, default: current user
#   --data-checksums --k 

initdb -D /var/lib/pgsql/10/data2 --locale=C --encoding=UTF8
