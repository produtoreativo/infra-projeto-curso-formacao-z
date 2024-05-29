FROM docker.io/bitnami/magento:2

RUN apt-get update && apt-get install -y curl

# Install Elastic APM
ENV ELASTIC_APM_ENABLED false
ENV ELASTIC_APM_SERVER_URL=apm:8200
ENV ELASTIC_APM_SERVICE_NAME=magento
ENV ELASTIC_APM_ENVIRONMENT=development

RUN curl -LOs  https://github.com/elastic/apm-agent-php/releases/download/v1.13.0/apm-agent-php_1.13.0_amd64.deb && \
  dpkg -i apm-agent-php_1.13.0_amd64.deb && \
  rm apm-agent-php_1.13.0_amd64.deb

# Install Elastic metricbeat
RUN curl -LOs https://artifacts.elastic.co/downloads/beats/metricbeat/metricbeat-7.17.19-amd64.deb && dpkg -i metricbeat-7.17.19-amd64.deb && rm metricbeat-7.17.19-amd64.deb
COPY  --chown=root:root metricbeat.yml /etc/metricbeat/metricbeat.yml

# Para funcionar metricbeat
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh


ENTRYPOINT [ "/entrypoint.sh" ]
CMD [ "/opt/bitnami/scripts/magento/run.sh" ]