# 下記コマンドを shell script ととして コードする

# データベースに接続する (ホスト・ユーザ・パスワード指定)
psql -h localhost -p 5432 -d db1 -U user1 -p pass;

# "-c" オプションでログインせずにクエリを実行する
psql -U postgres -d db1 -c 'SELECT * FROM t_user;'

# "<" リダイレクトを用い、ログインせずにクエリ(.sql)を実行する
psql -U postgres -d db1  < query.sql
