./configure --user=nginx --group=nginx --prefix=/usr/local/nginx \
        --with-http_stub_status_module \
        --with-http_ssl_module \
        --with-http_gzip_static_module \
        --with-http_sub_module \
        --with-stream \
        --with-pcre \
        --with-http_realip_module \
        --with-stream \
        --add-module=/usr/local/nginx_upstream_check_module-master \
        --add-module=/usr/local/nginx-module-vts-0.2.1
