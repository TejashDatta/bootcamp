# pagination
rails g kaminari:views bootstrap4

# commands to install elastic search on ubuntu:
# https://linuxize.com/post/how-to-install-elasticsearch-on-ubuntu-18-04/

sudo /usr/share/elasticsearch/bin/elasticsearch-plugin install analysis-kuromoji
sudo systemctl restart elasticsearch

rails r Event.reindex
