FROM daocloud.io/zhulux/common_gems:gems_v4.2.6.1

RUN apt-get update && apt-get upgrade -y && \
    apt-get install nodejs -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

CMD ['bash']
