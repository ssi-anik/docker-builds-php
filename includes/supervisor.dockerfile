# install supervisor and copy file
RUN apt-get update \
    && apt-get install --no-install-recommends -y cron supervisor \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY ./conf/supervisord/supervisord.conf /etc/supervisor/supervisord.conf
