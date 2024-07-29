#! /bin/bash
clear
echo " "
echo " Todo ambiente GO será PARADO, porém nada será destruido. Iniciando paralização em 5 segundos, para cancelar CTRL + C"
echo " " 
sleep 5
echo " ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- "
echo " "
echo " Iniciando a parada do ambiente..."
echo " "
echo " ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- "
echo " "
echo " Iniciando a parada do PGAdmin... "
echo " "
sudo docker stop f2-modulo1-curso1-projeto-go-testes-pgadmin-compose-1
echo " "
echo " Conteiner PGAdmin parado."
echo " " 
echo " ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- "
echo " "
echo " Iniciando a parada do banco de dados PostgreSQL..."
echo " "
sudo docker stop f2-modulo1-curso1-projeto-go-testes-postgres-1
echo " "
echo " Conteiner do banco de dados PostGreSQL paralizado."
echo " "
echo " ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- "
echo " "
echo " Parando a aplicação..."
echo " " 
echo " Identificação do PID do processo onde a aplicação (main.go) para tentar paralizar de forma automática."
echo " "
echo " [ "$(ps aux | grep main.go | grep -v grep | head -n 1 | awk '{print $2}')" ] <-- mantando esse processo..."
echo " "
sudo kill -9 $(ps aux | grep main.go | grep -v grep | head -n 1 | awk '{print $2}')
echo " "
echo " Verificando se tem mais algum processo rodando escutando na porta 8080."
echo " "
echo " [ "$(lsof -i :8080 | grep -v PID | head -n 2 | awk '{print $2}')" ] <-- matando o proesso... "
echo " "
sudo kill -9 $(lsof -i :8080 | grep -v PID | head -n 2 | awk '{print $2}') 
echo " "
echo "Aplicação encerrada!"
echo " " 
echo " ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- "
echo " "
echo " "
echo "Para ter certeza que não tem mais nada rodando na porta 8080 usada pela aplicação."
echo
echo "    lsof -i :8080"
echo " "
echo " Se voltar algum PID então o processo precisará ser matado manualmente."
echo 
echo "    sudo kill -9 PID-NUMBER "
echo " " 
echo " Para subir novamente a infraestrutura e a aplicação, no terminal 1 execute uma das opções: "
echo " "
echo " 1 - start do ambiente."
echo "     ./start-ambiente.sh "
echo " "
echo " 2 - reconstrução completa do ambiente."
echo "    ./criar-ambiente.sh "
echo " "
echo " ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- "
echo " "

