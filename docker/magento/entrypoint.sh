#!/bin/sh
chmod go-w /etc/metricbeat/metricbeat.yml

metricbeat modules enable system
#metricbeat modules enable apache

metricbeat run --strict.perms=false&

/opt/bitnami/scripts/magento/entrypoint.sh /opt/bitnami/scripts/magento/run.sh