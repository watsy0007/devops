FROM daocloud.io/zhulux/common_gems:gems_v5.0.0.4

RUN apt-get update && \
    apt-get install nodejs -y && \
    apt-get install npm -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

EXPOSE 80

CMD ["bash"]
