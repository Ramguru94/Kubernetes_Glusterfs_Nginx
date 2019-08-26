FROM ubuntu:18.04

RUN apt-get -y update
RUN apt-get -y install build-essential software-properties-common nginx vim
RUN apt-get update -y && apt-get -y install python-pip && pip install certbot-dns-cloudflare && pip install cryptography==2.3 \
    && mkdir /etc/nginx/conf_template && mkdir /root/.secrets && chmod 0700 /root/.secrets/

COPY . /etc/nginx/conf_template
COPY cloudflare.ini /root/.secrets/cloudflare.ini
RUN chmod 0400 /root/.secrets/cloudflare.ini \
    && chmod +x /etc/nginx/conf_template/lets_cloudflare.sh \
    && sh /etc/nginx/conf_template/lets_cloudflare.sh \
    && cd /etc/letsencrypt && openssl dhparam -out ssl-dhparams-2048.pem 2048 \
    && rm /etc/nginx/sites-enabled/default \
    && (crontab -l 2>/dev/null; echo "14 5 * * * /usr/local/bin/certbot renew --quiet --post-hook "/usr/sbin/service nginx reload" > /dev/null 2>&1")| crontab -


EXPOSE 80
STOPSIGNAL SIGTERM

CMD ["nginx", "-g", "daemon off;"]
