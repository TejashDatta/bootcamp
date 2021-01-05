#　httpdサービスを起動、停止

sudo systemctl start httpd
sudo systemctl stop httpd

sudo systemctl status httpd

# restart: httpdサービスを停止して再起動

sudo systemctl restart httpd

# reload: httpdサービスを停止しないで設定ファイルを再読み込み

sudo systemctl reload httpd

# システム起動時点でhttpdサービスを起動するかどうか設定

sudo systemctl enable httpd
sudo systemctl disable httpd
