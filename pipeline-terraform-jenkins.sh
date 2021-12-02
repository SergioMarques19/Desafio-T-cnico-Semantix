#!/bin/bash

# Entrando no diretório do projeto terraform.

cd /root/terraform/semantix

# Iniciando as configurações e conexão com a AWS.

sudo terraform init

sleep 5

# Verificar se o ambiente está correto para ser criado.

sudo terraform plan

sleep 5

#Criando o ambiente.

sudo terraform apply -auto-approve
