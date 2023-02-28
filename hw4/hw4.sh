#/bin/sh

#1 a) создать пользователя, используя утилиту useradd;
sudo useradd -m -d /home/testuser -s /bin/sh testuser

#1 b) удалить пользователя, используя утилиту userdel;

sudo userdel -r testuser

#2 a) создать группу с использованием утилит;

sudo groupadd testgrp
sudo groupmod -n newgrp testgrp

#2 b) попрактиковаться в смене групп у пользователей;

sudo usermod -aG user testuser

groups testuser

sudo usermod -g 1000 testuser

sudo gpasswd -a testuser cdrom


#2c) удалить пользователя из группы.
#удалит из всех групп, оставит только указанную
sudo usermod -G testgrp testuser
sudo usermod -G "" testuser

sudo gpasswd -d testuser cdrom

#3. Добавить пользователя, имеющего право выполнять команды/действия от 
#имени суперпользователя. Сделать так, чтобы sudo не требовал пароль для 
#выполнения команд.

sudo useradd -m -d /home/admin -s /bin/bash admin
sudo passwd admin
sudo usermod -aG sudo admin
sudo visudo
#добавить строку после root:
#admin	ALL=(ALL)	NOPASSWD:ALL
#выход ^X с сохранением

#4. Создать два произвольных файла. Первому присвоить права на чтение и запись
# для владельца и группы, только на чтение — для всех. Второму присвоить 
#права на чтение и запись только для владельца. Сделать это в численном 
#и символьном виде.

touch file1 file2

chmod 664 file1
chmod 600 file2

chmod ug=rw,o=r file1
chmod u=rw,go-rwx file2

#5. * Создать группу developer и нескольких пользователей, входящих в неё. 
#Создать директорию для совместной работы. Сделать так, чтобы созданные 
#одними пользователями файлы могли изменять другие пользователи этой группы.

sudo groupadd developer
sudo useradd -m -d /home/dev1 -g developer -s /bin/bash dev1
sudo useradd -m -d /home/dev2 -g developer -s /bin/bash dev2
sudo useradd -m -d /home/dev3 -g developer -s /bin/bash dev3

sudo mkdir /var/developer
sudo chown user:developer /var/developer
sudo chown g+s /var/developer

#su dev1; umask 002
#su dev1; umask 002
#su dev1; umask 002
#либо владельцу добавлять запись группе после создания файла
