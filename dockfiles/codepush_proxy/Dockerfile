FROM daocloud.io/zhulux/ngx_cache_purge:master-897ce3e
COPY nginx.conf /etc/nginx/nginx.conf
RUN mkdir /var/tmp/nginx && mkdir /var/tmp/nginx/cache && mkdir /var/tmp/nginx/proxy_temp_dir && chmod 777 /var/tmp/nginx/cache
