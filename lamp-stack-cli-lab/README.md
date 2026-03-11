AWS EC2: Troubleshooting e Deploy de Stack LAMP via AWS CLI
Visão Geral

Este projeto demonstra habilidades avançadas de diagnóstico e correção de falhas em infraestrutura AWS. O objetivo foi utilizar a AWS CLI para lançar uma instância EC2 com uma Stack LAMP (Linux, Apache, MariaDB, PHP) e resolver problemas intencionais no script de deploy e nas configurações de rede.

<img width="3136" height="1536" alt="image" src="https://github.com/user-attachments/assets/9034477b-fc4a-4f42-9f8f-1b3a61c8727f" />


O Desafio

O laboratório consistiu em executar um script Shell (create-lamp-instance-v2.sh) que continha erros lógicos e de configuração. A missão foi identificar por que o servidor não subia e, após subir, por que a aplicação web não estava acessível.
Problemas Resolvidos:

    Erro de AMI (InvalidAMIID.NotFound): Diagnóstico de ID de imagem incorreto ou região divergente no comando run-instances.

    Falha de Conectividade (Porta 80): Uso da ferramenta nmap para identificar que, embora a instância estivesse rodando, o tráfego HTTP estava bloqueado ou o serviço não respondia.

    Verificação de Logs (Cloud-init): Monitoramento do log /var/log/cloud-init-output.log para validar se o script de User Data instalou corretamente o banco de dados MariaDB e o PHP.

🛠️ Tecnologias e Ferramentas

    AWS CLI: Configuração de perfis e execução de comandos complexos de infraestrutura.

    EC2 & Security Groups: Configuração de firewalls e instâncias.

    Stack LAMP: Apache, MariaDB e PHP integrados em uma única instância.

    nmap: Utilizado para scan de portas e diagnóstico de rede.

    Linux SysAdmin: Edição de scripts via VI/Vim, análise de logs e gestão de serviços (systemctl/httpd).

omo o Diagnóstico foi Realizado
1. Debug do Script Bash

Analisei o script de automação para garantir que as variáveis de VPC_ID, SUBNET_ID e AMI_ID estavam sendo coletadas dinamicamente via filtros da CLI, corrigindo o erro de "Image ID not found".
2. Scan de Rede com nmap

Para validar se o Security Group estava permitindo tráfego, utilizei:
Bash

sudo yum install -y nmap
nmap -Pn <PUBLIC-IP>

Isso permitiu confirmar se as portas 22 (SSH) e 80 (HTTP) estavam abertas no nível de rede.
Inspeção de User Data

Acompanhei o deploy da aplicação em tempo real para garantir que o banco de dados do café fosse criado corretamente:
Bash

sudo tail -f /var/log/cloud-init-output.log

Resultado Final

Após as correções, a Café Web Application foi implantada com sucesso. A aplicação permite navegar pelo menu, realizar pedidos e persistir os dados no banco de dados MariaDB local, validando a integração completa da Stack LAMP.
