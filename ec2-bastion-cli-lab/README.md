AWS EC2: Automação de Instâncias com AWS CLI e Bastion Host
Visão Geral

Este projeto demonstra o provisionamento e a gestão de instâncias Amazon EC2 utilizando dois métodos: o Console de Gerenciamento da AWS e a AWS CLI (Command Line Interface). O objetivo principal foi configurar um Bastion Host para servir de ponto de entrada seguro e, a partir dele, automatizar o deploy de um servidor web em uma infraestrutura de rede pré-existente.
Arquitetura do Projeto

<img width="928" height="702" alt="image" src="https://github.com/user-attachments/assets/1ce45efd-41bf-4bb0-b560-e9318e09b9b4" />


A solução implementada segue o padrão de segurança de camadas:

    Bastion Host: Uma instância EC2 em subnet pública configurada com uma IAM Role (Bastion-Role), permitindo a execução de comandos da AWS CLI sem a necessidade de chaves de acesso (Access Keys) expostas.

    Web Server: Uma segunda instância EC2, provisionada via CLI, configurada automaticamente como um servidor Apache funcional.

    Segurança: Uso de Security Groups específicos para SSH (acesso ao Bastion) e HTTP (acesso ao Web Server).

Tecnologias Utilizadas

    Amazon EC2: Instâncias t3.micro com Amazon Linux 2.

    AWS CLI: Utilizada para consultas (query) e criação de recursos.

    SSM Parameter Store: Recuperação dinâmica da última AMI (Amazon Machine Image) disponível.

    User Data Scripts: Automação do setup do servidor (Apache, PHP, extração de pacotes).

    Instance Metadata Service (IMDS): Coleta de informações em tempo real sobre a instância (Região e AZ).

Passo a Passo da Automação (CLI)

Um dos pontos altos deste lab foi a automação do deploy. Abaixo, os comandos principais executados dentro do Bastion Host:

    Recuperação Dinâmica da AMI:
    Em vez de usar um ID fixo, buscamos a imagem mais recente do Amazon Linux 2:
    Bash

    AMI=$(aws ssm get-parameters --names /aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2 --query 'Parameters[0].[Value]' --output text)

    Identificação de Recursos de Rede:
    Busca automática dos IDs de Subnet e Security Group baseada em Tags:
    Bash

    SUBNET=$(aws ec2 describe-subnets --filters 'Name=tag:Name,Values=Public Subnet' --query Subnets[].SubnetId --output text)
    SG=$(aws ec2 describe-security-groups --filters Name=group-name,Values=WebSecurityGroup --query SecurityGroups[].GroupId --output text)

    Lançamento da Instância com User Data:
    Provisionamento completo incluindo o script de inicialização do servidor web:
    Bash

    aws ec2 run-instances \
      --image-id $AMI \
      --subnet-id $SUBNET \
      --security-group-ids $SG \
      --user-data file://UserData.txt \
      --instance-type t3.micro \
      --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=Web Server}]'

Troubleshooting

Durante o laboratório, realizei a resolução de problemas em instâncias mal configuradas:

    Conectividade: Ajuste de regras de entrada (Inbound Rules) no Security Group para permitir acesso via EC2 Instance Connect.

    Serviços: Diagnóstico de falhas na inicialização do servidor Apache e correção de permissões de firewall para tráfego na porta 80.

Conclusão

Este laboratório validou a capacidade de operar a nuvem AWS de forma programática. O uso da CLI é um passo essencial para qualquer estratégia de DevOps e Infraestrutura como Código (IaC), garantindo que o ambiente seja replicável, rápido e menos propenso a erros humanos.
