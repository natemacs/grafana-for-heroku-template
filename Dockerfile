FROM grafana/grafana-enterprise as grafana
ENTRYPOINT []

ARG PORT 

ENV PORT=${PORT}
ENV GF_INSTALL_PLUGINS grafana-clock-panel,natel-discrete-panel,briangann-gauge-panel,vonage-status-panel,neocat-cal-heatmap-panel,grafana-piechart-panel

USER root
ADD grafana.ini.template /etc/grafana/grafana.ini.template
ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

RUN apk --no-cache add \
    icu-dev \
    gettext \
    gettext-dev

ENTRYPOINT [ "/entrypoint.sh" ]