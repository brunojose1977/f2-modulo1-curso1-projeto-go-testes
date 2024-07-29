#! /bin/bash
clear
echo " "
echo " Iniciando os  conteineres de banco de dados..."
echo " " 
 sudo docker start f2-modulo1-curso1-projeto-go-testes-pgadmin-compose-1
 sudo docker start f2-modulo1-curso1-projeto-go-testes-postgres-1
echo " " 
echo " Ao final, abra um outro terminal e execute [./ver-ambiente.sh]"
echo " "
sleep 3
echo " "
echo " Inciando a aplicação de teste GO... "
echo " "
 go run main.go
echo " " 
