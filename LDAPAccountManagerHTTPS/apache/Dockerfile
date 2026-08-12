FROM ldapaccountmanager/lam:latest

RUN a2enmod ssl

COPY lam-ssl.conf /etc/apache2/sites-available/lam-ssl.conf

RUN a2ensite lam-ssl.conf
