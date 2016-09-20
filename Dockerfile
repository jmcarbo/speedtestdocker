FROM ubuntu
RUN apt-get update && apt-get install -y wget curl
RUN wget https://github.com/zpeters/speedtest/releases/download/v1.0.2-c/speedtest-linux-amd64-v1.0.2-c
RUN chmod +x /speedtest-linux-amd64-v1.0.2-c
ADD do.sh /do.sh
RUN chmod +x /do.sh
CMD "/do.sh"
