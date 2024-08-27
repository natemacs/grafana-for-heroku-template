FROM grafana/grafana as grafana

ARG PORT 

ENV PORT=${PORT}
ENV GF_INSTALL_PLUGINS grafana-clock-panel,natel-discrete-panel,briangann-gauge-panel,vonage-status-panel,neocat-cal-heatmap-panel,grafana-piechart-panel
ENV GF_SECURITY_ALLOW_EMBEDDING true
ENV GF_AUTH_ANONYMOUS_ENABLED true

ADD entrypoint.sh /
ADD grafana.ini.template /etc/grafana/grafana.ini.template


USER root
RUN apk --no-cache add \
    icu-dev \
    gettext \
    gettext-dev

RUN envsubst "\$PORT" < /etc/grafana/grafana.ini.template > /etc/grafana/grafana.ini

ENTRYPOINT [ "/run.sh" ]