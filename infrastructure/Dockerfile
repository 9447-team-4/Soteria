FROM microsoft/aspnetcore:1.1.1
 
RUN apt-get update \
 && apt-get install -y openvpn \
 && rm -rf /var/lib/apt/lists/*
 
COPY ./vpn /etc/openvpn
 
WORKDIR /app
COPY ./ .
COPY ./startup.sh .
 
CMD sh ./startup.sh