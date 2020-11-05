FROM docker.elastic.co/elasticsearch/elasticsearch:7.9.3
RUN mkdir -p /usr/share/elasticsearch/config/hunspell/


COPY --chown=elasticsearch:elasticsearch elasticsearch.yml /usr/share/elasticsearch/config/
COPY --chown=elasticsearch:elasticsearch hunspell.zip /usr/share/elasticsearch/config/


RUN cd /usr/share/elasticsearch/config/ && yes | unzip -o hunspell.zip
RUN rm /usr/share/elasticsearch/config/hunspell.zip
RUN chown elasticsearch:elasticsearch /usr/share/elasticsearch/config/ -R


RUN yes | elasticsearch-plugin install analysis-icu
RUN yes | elasticsearch-plugin install ingest-attachment
RUN yes | elasticsearch-plugin install mapper-size
