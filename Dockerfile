FROMubuntu:16.04
RUN apt-get update
RUN apt-get install -y mongodb-server ruby-full ruby-dev build-essential git
RUNgem install bundler

COPY mongod.conf /etc/mongod.conf
COPY db_config /app/db_config
COPY start.sh /start.sh

RUN cd /reddit && bundle install
RUN mkdir -p /data/db
RUNchmod 0777 /start.sh

CMD ["/start.sh"]

