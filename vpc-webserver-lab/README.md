AWS Networking: Arquitetura de VPC e Deploy de Servidor Web
Visão Geral

Este projeto consistiu na criação de uma infraestrutura de rede personalizada na AWS para um cenário corporativo. O objetivo foi construir uma VPC (Virtual Private Cloud) do zero, garantindo a segregação de tráfego entre camadas públicas e privadas, além de configurar a conectividade necessária para um servidor web Apache.

<img width="1114" height="511" alt="image" src="https://github.com/user-attachments/assets/708324bb-dd21-431f-890f-b71f2b0c2d94" />


Arquitetura de Rede Implementada

A infraestrutura foi desenhada para ser segura e escalável, utilizando os seguintes componentes:

    VPC: Rede isolada com bloco CIDR 10.0.0.0/16.

    Subnets:

        Públicas: Localizadas em duas Zonas de Disponibilidade (AZs), permitindo acesso direto à internet via Internet Gateway.

        Privadas: Isoladas da internet externa, utilizando um NAT Gateway para permitir apenas saídas controladas (atualizações de software).

    Roteamento: Tabelas de rotas distintas para gerenciar o fluxo de tráfego entre as subnets e o mundo externo.

    Security Groups: Firewall virtual configurado para permitir apenas tráfego na porta 80 (HTTP) vindo de qualquer origem IPv4.

Tecnologias e Serviços

    Amazon VPC: Subnets, Route Tables, Internet Gateway e NAT Gateway.

    Amazon EC2: Instância t3.micro rodando Amazon Linux 2.

    Apache Web Server: Instalado via User Data Script no momento do lançamento.

    Bash Scripting: Automação do deploy da aplicação web.

Script de Inicialização (User Data)

Para garantir que o servidor subisse pronto para o uso, utilizei o seguinte script de automação Bash

Conclusão

A implementação bem-sucedida desta arquitetura demonstra o domínio sobre os fundamentos de rede na nuvem. A separação entre subnets públicas e privadas é uma boa prática de segurança essencial para proteger dados sensíveis enquanto mantém serviços acessíveis ao público.
