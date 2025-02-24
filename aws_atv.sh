#!/bin/bash
# Log de todas as ações
logfile=/var/log/instance_setup.log

echo  "Iniciando o script de instalação" > $logfile

# Atualizar pacotes
echo "Atualizando pacotes do sistema" | tee -a $logfile
sudo apt update -y >> $logfile

# Instalar o Apache
echo "Instalando o Apache" | tee -a $logfile
sudo apt install -y apache2 >> $logfile

# Iniciar o Apache
echo "Iniciando o serviço Apache" | tee -a $logfile
sudo systemctl start apache2 >> $logfile
sudo systemctl enable apache2 >> $logfile

# Instalando Git
echo "Instalando Git..." | tee -a $logfile
sudo apt install -y git >> $logfile

# Clonando Repositório
echo "Clonando repositório com site e movendo para pasta /var/www/html/..." | tee -a $logfile
sudo git clone https://github.com/IsaquePerez/Atividade-no-ambiente-linux.git /tmp/atividade >> $logfile
