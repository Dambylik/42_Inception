FROM debian:bullseye

# Configure debconf to use non-interactive frontend
ENV DEBIAN_FRONTEND=noninteractive

# Install apt-utils first to avoid warnings
RUN apt-get update && apt-get install -y apt-utils

# Installer MariaDB et nettoyer
RUN apt-get update && apt-get install -y mariadb-server \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Configurer les permissions
RUN mkdir -p /var/run/mysqld /var/lib/mysql /etc/mysql \
    && chown -R mysql:mysql /var/run/mysqld /var/lib/mysql /etc/mysql \
    && chmod -R 770 /var/run/mysqld /var/lib/mysql /etc/mysql

# Définir le répertoire de travail
WORKDIR /workspace

# Copier les fichiers nécessaires
COPY ./tools/setup.sh /setup.sh
COPY ./conf/my.cnf /etc/mysql/mariadb.conf.d/my.cnf

# Rendre le script exécutable
RUN chmod +x /setup.sh

# Exposer le port MySQL
EXPOSE 3306

# Lancer le script d'initialisation puis MariaDB
ENTRYPOINT ["/setup.sh"]