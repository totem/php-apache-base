FROM totem/ubuntu:raring
 
RUN apt-get update --fix-missing && apt-get upgrade -y
RUN apt-get install -y apache2 apache2-mpm-prefork apache2-utils libapache2-mod-php5 libapr1 libaprutil1 mysql-common php5 php5-cli php5-common php5-mysql ca-certificates ssl-cert

RUN apt-get clean && rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*

RUN ln -s /etc/apache2/mods-available/rewrite.load /etc/apache2/mods-enabled/
RUN ln -s /apache/etc2/mods-available/proxy.conf /etc/apache2/mods-enabled/
RUN ln -s /etc/apache2/mods-available/proxy_http.load /etc/apache2/mods-enabled/
RUN ln -s /etc/apache2/mods-available/proxy.load /etc/apache2/mods-enabled/

ENTRYPOINT ["/usr/bin/php"]
CMD ["--version"]
