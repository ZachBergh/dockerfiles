Kibana4 Docker image

To configure the Elasticsearch URL pass in the environment variable ELASTICSEARCH_URL:

docker run -d -p 49898:5601 --name kibina \
--link es:es \
-e ELASTICSEARCH_URL=http://10.1.0.13:9200 jimmidyson/kibana4:latest

