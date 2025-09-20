#!/bin/bash

read -p "O Docker já está instalado(s/n)" BAIXAR_DOCKER
echo ''
if [ $BAIXAR_DOCKER = 'n' ]; then 
    sudo apt update && apt upgrade -y
    sudo apt install docker.io
    sudo systemctl start docker -y
    sudo systemctl enable docker
    echo "Docker Instalado com sucesso"
fi

echo "Baixando a imagem do SQL"
echo ''
sudo docker pull mysql:8
echo ''
read -sp "Digite a senha para o usuário ROOT:" SENHA_ROOT
echo ""
sudo docker run -d -p 3306:3306 --name ContainerBD -e "MYSQL_DATABASE=HealthGuard" -e "MYSQL_ROOT_PASSWORD='${SENHA_ROOT}'" mysql:8
