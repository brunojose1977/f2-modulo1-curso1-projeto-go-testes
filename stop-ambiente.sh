#! /bin/bash
clear
echo " "
echo " Todo ambiente GO será PARADO, porém nada será destruido. Iniciando paralização em 5 segundos, para cancelar CTRL + C"
echo " " 
sleep 5
echo " Iniciando a paralização do ambiente..."
echo " "
sudo docker stop f2-modulo1-curso1-projeto-go-testes-pgadmin-compose-1
echo " "
echo " Conteiner PGAdmin parado."
echo " " 
sudo docker stop f2-modulo1-curso1-projeto-go-testes-postgres-1
echo " "
echo " Conteiner do banco de dados PostGreSQL paralizado."
echo " "
echo " Identificação do PID do processo onde a aplicação está rodando para tentar paralizar de forma automática."
echo " "
ps aux | grep main.go | grep -v grep | head -n 1 | awk '{print $2}'
echo " "
echo " Matando o processo... "
echo " "
sudo kill -9 $(ps aux | grep main.go | grep -v grep | head -n 1 | awk '{print $2}')
echo " "
echo "Aplicação encerrada!"
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
( ./executar-aplicação.sh ) e siga o passo a passo novamente. "
echo " "
