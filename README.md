1. Download Ubuntu

2. Зашел в виртуальную машину)

3. Обновление версии
3.1. $ lsb_release -r (проверил версию ubuntu, у меня - 16.04) 
3.2. Выполнил команды $ sudo apt-get update(обновление пакетов), $ sudo apt-get dist-upgrade(обновил с разрешением конфликтов пакетов), $ sudo do-release-upgrade(обноление до полседней версии)
3.3. После этих шагов версия системы стала 18.04

4. Каталоги
4.1. /etc - основная часть конфигурационных файлов самой операционной системы (настройки сети, список пользователей, групп и т.д.) и различных программ (Apache, Samba и т. д.)
4.2. /home - должна(пользователь может выбрать другое место, но в целях безопасности, должна быть там) размещаться вся личная информация пользователей системы
4.3. /var -  для часто меняющихся данных. Здесь находятся журналы операционной системы, системные log-файлы, cache-файлы и т. д.

5. Установка terraform
5.1. $ wget https://releases.hashicorp.com/terraform/0.12.18/terraform_0.12.18_linux_amd64.zip (скачал zip файл с официального сфйта terraform)
5.2. $ unzip terraform_0.12.18_linux_amd64.zip (распаковал архив с помошью команды) 
5.3. $ mkdir downloads (решил хранить тераформ в папке downloads, так что создаю её)  
5.4. $ mv terraform downloads/ (переместил terraform в папку downloads) 
5.5. $ vim ~/.profile (решил прописать путь к тераформу, для доступа из любого места)
5.6. Добавил в profile файл строчку: export PATH="$PATH:~/downloads"
5.7. $ sorce ~/.profile (поскольку профайл автоматически не обновляется)
5.8. $ terraform --version (проверка версии terraform, у меня - 0.12.18)

6. Создание нового sudo пользователя
6.1 $ sudo -i (переход в root пользователя)
6.2 $ adduser sxsudo (создание нового пользователя)
6.3. $ usermod -aG sudo sxsudo (добавление пользователя в групу sudo)

7. Выполнение sudo без пароля
7.1. $ sudo visudo (открытие конфигурации sudo)
7.2. sxsudo ALL=(ALL) NOPASSWD: ALL (разрешение пользователю sxsudo выполнять sudo команды без ввода пароля)

8. Установка и работа с ZSH
8.1. $ sudo apt-get install zsh (установка стартового набора)
8.2. $ curl -L http://install.ohmyz.sh | sh (установка фреймворка Oh My ZSH!)
8.2. $ adduser sxzsh (создание пользователя для работы zsh)
8.3. $ chsh -s /bin/zsh sxzsh (установка оболочки zsh по умолчанию)
8.4. $ sudo shutdown -r 0 (перезагрузка системы для применнеия изменений)

9. Только cat

10. systemd vs init
10.1. Init являлся основоположником и по его методолгии строилась вся взяаимосвязсь процесов, старта, стопа на уровне ядре и тд. systemd был 
призван быть усовершенствованой версией добавив многопоточность и комплексность, ведь init разбивал все на мелкие подзадачи и т.д.
10.2. $ sudo touch /etc/systemd/system/my-daemon.service (создал service-файл)
10.3. $ sudo chmod 664 /etc/systemd/system/my-daemon.service (изменения прав доступа)
10.4. Открыл файл и добавил простейший скрипт
[Unit]
Description=MyService
[Service]
ExecStart=/usr/sbin/my-daemon
[Install]
WantedBy=multi-user.target
10.5. Основные команды для работы
$ sudo systemctl start foo-daemon
$ sudo systemctl stop foo-daemon
$ sudo systemctl restart foo-daemon
$ systemctl status foo-daemon

11. Обновление пакетов
11.1. $ apt-get update (для получения списка новых пактов, которые можно установить)
11.2. $ sudo apt-get upgrade (затем, для непосредственно выполнения обновления пакетов)
11.3. $ sudo apt-get install имя_пакета (для обновления только одного конкретного пакета)

12. Установка LAMP стака
12.1. $ sudo apt install apache2
12.2. $ sudo apt install mysql-server
12.3. $ sudo apt install php7.2 libapache2-mod-php7.2 php-mysql
12.4. $ sudo apt purge  apache2 mysql-server php7.2 libapache2-mod-php7.2 php-mysql (для удаления LAMP стака)

13. LAMP in Vagrant
13.1. $ sudo apt-get install vagrant (установка самого vagrant)
13.2. $ vagrant init
13.3. написание Vagrantfile (приложен)
13.4. написание скрипта для установки (приложен)
13.5. $ vagrant up
