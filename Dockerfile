FROM ubuntu:18.04

RUN apt-get -y update && apt-get -y install apache2 python3 python3-venv libaugeas0 &&  python3 -m venv /opt/certbot && /opt/certbot/bin/pip install --upgrade pip && /opt/certbot/bin/pip install certbot certbot-apache && ln -s /opt/cert>

COPY ./ya-krevedko.ru.conf /etc/apache2/sites-available/ya-krevedko.ru.conf

RUN a2enmod rewrite && a2dissite 000-default.conf && a2ensite ya-krevedko.ru.conf && /etc/init.d/apache2 restart

CMD ["/usr/sbin/apache2ctl","-D","FOREGROUND"]

EXPOSE 80
EXPOSE 443