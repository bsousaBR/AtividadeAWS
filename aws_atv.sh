#!/bin/bash
# Log de todas as ações
logfile=/var/log/instance_setup.log

echo "Iniciando o script de instalação" > $logfile

# Atualizar pacotes
echo "Atualizando pacotes do sistema" | tee -a $logfile
sudo yum check-update -y >> $logfile
sudo yum update -y >> $logfile

# Instalar o Apache (httpd no CentOS/RHEL)
echo "Instalando o Apache" | tee -a $logfile
sudo yum install -y httpd >> $logfile

# Iniciar o Apache
echo "Iniciando o serviço Apache" | tee -a $logfile
sudo systemctl start httpd >> $logfile
sudo systemctl enable httpd >> $logfile

# Instalando Git
echo "Instalando Git..." | tee -a $logfile
sudo yum install -y git >> $logfile

# Clonando Repositório
echo "Clonando repositório com site e movendo para pasta /var/www/html/..." | tee -a $logfile
sudo git clone https://github.com/IsaquePerez/Atividade-no-ambiente-linux.git /tmp/atividade >> $logfile
sudo mv /tmp/atividade/AtividadeAwsRestart/index.html /var/www/html/ >> $logfile

# Ajustando Permissões
echo "Ajustando permissões..." | tee -a $logfile
sudo chmod -R 755 /var/www/html/ >> $logfile

# Reiniciando Apache
echo "Reiniciando Apache..." | tee -a $logfile
sudo systemctl restart httpd >> $logfile
sudo systemctl status httpd >> $logfile

# Enviar solicitação POST
echo "Enviando solicitação POST para https://difusaotech.com.br/lab/aws/index.php" | tee -a $logfile
sudo curl -X POST -d "nome=Bruno Emanoel" https://difusaotech.com.br/lab/aws/index.php >> $logfile

echo "Script finalizado" | tee -a $logfile
