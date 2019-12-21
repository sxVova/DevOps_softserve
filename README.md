# Skliar Volodymyr

### 1. Download Ubuntu

### 2. Open virtual machine

### 3. Version update   
3.1. $ lsb_release -r (checked the ubuntu version, I have 16.04)  
3.2. Fulfilled commands $ sudo apt-get update(package update), $ sudo apt-get dist-upgrade(updated with packet conflict resolution), $ sudo do-release-upgrade(update to the latest version)   
3.3. After these steps, the system version became 18.04  

### 4.  Catalogs   
4.1. /etc - most of the configuration files of the operating system itself (network settings, list of users, groups, etc.) and various programs (Apache, Samba, etc.)   
4.2. /home - all personal information of system users should be posted (the user can choose another place, but for security reasons, should be there)    
4.3. /var - for frequently changing data. Here are the operating system logs, system log files, cache files, etc.  

### 5. Terraform installation  
5.1. $ wget https://releases.hashicorp.com/terraform/0.12.18/terraform_0.12.18_linux_amd64.zip (downloaded zip file from terraform official site)  
5.2. $ unzip terraform_0.12.18_linux_amd64.zip (unpacked the archive)  
5.3. $ mkdir downloads (I decided to store terraform in the downloads folder, so I create it)  
5.4. $ mv terraform downloads/ (moved terraform to downloads folder)   
5.5. $ vim ~ /.profile (decided to prescribe the path to teraform, for access from anywhere)  
5.6. Added a line to the profile file: export PATH="$PATH:~/downloads"  
5.7. $ sorce ~/.profile (since the profile is not automatically updated)  
5.8. $ terraform --version (checking the version of terraform, I have 0.12.18)  

### 6. Create a new sudo user     
6.1. $ sudo -i (go to root user)  
6.2. $ adduser sxsudo (create new user)  
6.3. $ usermod -aG sudo sxsudo (adding a user to the sudo group)  

### 7. Running sudo without password    
7.1. $ sudo visudo (opening sudo configuration)  
7.2. sxsudo ALL=(ALL) NOPASSWD: ALL (allowing sxsudo user to execute sudo commands without entering a password)  

### 8. Installation and operation with ZSH    
8.1. $ sudo apt-get install zsh (install starter kit)  
8.2. $ curl -L http://install.ohmyz.sh | sh (installation of the framework Oh My ZSH!)  
8.2. $ adduser sxzsh (creating a user for ZSH)  
8.3. $ chsh -s /bin/zsh sxzsh (setting default ZSH shell)  
8.4. $ sudo shutdown -r 0 (system reboot to apply changes)  

### 9. Only cat    
9.1. Open visudo  
9.2. sxvova ALL=(ALL) /bin/cat (add line to file)  

### 10. systemd vs init  
10.1. Init was the founder and, by his methodology, the whole relationship of processes, start, stop at the core level, etc. was built. . systemd was called to be an improved version adding multithreading and complexity, because init broke everything into small subtasks, etc.    
10.2. $ sudo touch /etc/systemd/system/my-daemon.service (created a service file)  
10.3. $ sudo chmod 664 /etc/systemd/system/my-daemon.service (permissions changes)  
10.4. Opened the file and added the simplest script  
[Unit]  
Description=MyService  
[Service]  
ExecStart=/usr/sbin/my-daemon  
[Install]  
WantedBy=multi-user.target  
10.5. Basic commands for work  
$ sudo systemctl start my-daemon  
$ sudo systemctl stop my-daemon  
$ sudo systemctl restart my-daemon  
$ systemctl status my-daemon  

### 11. Package Updates 
11.1. $ apt-get update (for a list of new packages that you can install)  
11.2. $ sudo apt-get upgrade (to directly perform the package update)  
11.3. $ sudo apt-get install имя_пакета (to update only one specific package)  

### 12. Install LAMP stack  
12.1. $ sudo apt install apache2  
12.2. $ sudo apt install mysql-server  
12.3. $ sudo apt install php7.2 libapache2-mod-php7.2 php-mysql  
12.4. $ sudo apt purge  apache2 mysql-server php7.2 libapache2-mod-php7.2 php-mysql (to remove LAMP stack)  

### 13. LAMP in Vagrant  
13.1. $ sudo apt-get install vagrant (vagrant installation)  
13.2. $ vagrant init  
13.3. writing Vagrantfile (attached)  
13.4. writing a script to install (attached)  
13.5. $ vagrant up  
