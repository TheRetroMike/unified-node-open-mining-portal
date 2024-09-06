FROM node:10.19.0-buster
RUN apt-get update
RUN apt-get install -y sudo git nano curl

WORKDIR /opt/
RUN git clone https://github.com/TheRetroMike/unified-node-open-mining-portal

WORKDIR /opt/unified-node-open-mining-portal
RUN npm update
RUN rm -rf pool_configs
RUN rm -rf coins
RUN rm config.json.example

RUN ln -s /opt/config/config.json /opt/unified-node-open-mining-portal/config.json
RUN ln -s /opt/config/pool_configs /opt/unified-node-open-mining-portal/pool_configs
RUN ln -s /opt/config/coins /opt/unified-node-open-mining-portal/coins

RUN apt-get install -y redis-server

CMD service redis-server restart; node init.js
