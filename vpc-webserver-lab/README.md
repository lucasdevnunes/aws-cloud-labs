Implementação de Rede VPC e Servidor Web na AWS

Descrição:
Este projeto demonstra a criação de uma infraestrutura de rede isolada e segura na AWS, utilizando uma VPC (Virtual Private Cloud), subnets públicas e privadas em múltiplas zonas de disponibilidade, e a implantação de um servidor Apache (EC2) com script de automação.

Arquitetura do Projeto:

    VPC: 10.0.0.0/16

    Subnets: 2 Públicas (para tráfego web) e 2 Privadas (para banco de dados/back-end).

    Segurança: Security Groups configurados para permitir tráfego HTTP (porta 80).

    Instância: EC2 T3.micro com Amazon Linux 2.

    Conectividade: Internet Gateway para acesso externo e NAT Gateway para permitir que subnets privadas baixem atualizações.

Destaques Técnicos:

    Alta Disponibilidade: Configuração de subnets em diferentes Zonas de Disponibilidade (us-west-2a e us-west-2b).

    User Data Script: Automação da instalação do servidor Apache, PHP e deploy da aplicação via script Bash no provisionamento da instância.

    Segurança de Rede: Separação lógica de camadas (Public vs Private) e aplicação de regras de firewall (Security Groups).
