FROM docker:stable
RUN apk add --update bash
COPY run-elasticsearch.sh /run-elasticsearch.sh
RUN chmod a+x /run-elasticsearch.sh
ENTRYPOINT ["/run-elasticsearch.sh"]
