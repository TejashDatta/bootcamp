docker build -t redhat-ssh .

docker run -it -p 9090:22 redhat-ssh

ssh root@0.0.0.0 -p 9090
