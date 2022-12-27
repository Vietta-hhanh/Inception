FROM debian:buster

ARG CERTS_ DOMAIN_NAME_

EXPOSE 443 80
RUN apt upgrade && apt update && apt install -y nginx openssl
RUN chown -R www-data:www-data /var/www/* && \
    chmod 744 /var/www/* && \
    rm /etc/nginx/sites-enabled/default
COPY conf/nginx.conf /etc/nginx/sites-available/hhanh    
RUN mkdir -p ${CERTS_} && \
    openssl req -newkey rsa:2048 -nodes -keyout $CERTS_/hhanh.key -x509 -days 365 -subj '/C=RU/ST=Moscow/L=Moscow/O=School21/OU=School21MSC/emailAddress=hhanh@student.21-school.ru/CN=localhost' -out $CERTS_/hhanh.crt && \
    chown -R www-data:www-data $CERTS_ && \
    sed -i "s|CERTS_|$CERTS_|g" /etc/nginx/sites-available/hhanh && \
    sed -i "s|DOMAIN_NAME_|$DOMAIN_NAME_|g" /etc/nginx/sites-available/hhanh && \
    rm -rf /etc/nginx/sites-available/default && \
    ln -s /etc/nginx/sites-available/hhanh /etc/nginx/sites-enabled/hhanh
CMD nginx -g "daemon off;" 
