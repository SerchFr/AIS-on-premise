FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y \
    dovecot-core \
    dovecot-imapd \
    dovecot-ldap \
    ldap-utils

RUN groupadd -g 5000 vmail && \
    useradd -u 5000 -g vmail \
    -d /var/mail/vhosts \
    -s /usr/sbin/nologin vmail && \
    mkdir -p /var/mail/vhosts && \
    chown -R vmail:vmail /var/mail/vhosts

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
