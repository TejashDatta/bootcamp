docker build -t example:v1 -f- . <<EOF
FROM ubuntu
COPY example.txt .
RUN cat /example.txt
EOF
