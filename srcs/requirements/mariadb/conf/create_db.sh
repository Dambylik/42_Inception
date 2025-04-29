#!bin/sh
#Первый блок кода проверяет, запущен ли mysql (по наличию одноимённой базы), и если нет, то запускает его. 
#Проверка на случай чего нехорошего, по факту наш mysql должен быть установлен и запущен, а этот блок обычно пропускается.
if [ ! -d "/var/lib/mysql/mysql" ]; then

        chown -R mysql:mysql /var/lib/mysql

        # init database
        mysql_install_db --basedir=/usr --datadir=/var/lib/mysql --user=mysql --rpm

        tfile=`mktemp`
        if [ ! -f "$tfile" ]; then
                return 1
        fi
fi

#Второй блок проверяет, существует ли база с именем wordpress. Её у нас, конечно же, нету, и, проваливаясь внутрь 
#этого блока, мы записываем в созданный на шаге 1.2 файл для sql-запросов sql-код для создания этой базы. 
#Код использует переменные окружения, которые мы передадим из env-файла. В этом же блоке мы выполняем данный код 
#и удаляем лишний файл конфигурации, умело заметая следы, как настоящие тру-хацкеры.

if [ ! -d "/var/lib/mysql/wordpress" ]; then

        cat << EOF > /tmp/create_db.sql
USE mysql;
FLUSH PRIVILEGES;
DELETE FROM     mysql.user WHERE User='';
DROP DATABASE test;
DELETE FROM mysql.db WHERE Db='test';
DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT}';
CREATE DATABASE ${DB_NAME} CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE USER '${DB_USER}'@'%' IDENTIFIED by '${DB_PASS}';
GRANT ALL PRIVILEGES ON wordpress.* TO '${DB_USER}'@'%';
FLUSH PRIVILEGES;
EOF
        # run init.sql
        /usr/bin/mysqld --user=mysql --bootstrap < /tmp/create_db.sql
        rm -f /tmp/create_db.sql
fi