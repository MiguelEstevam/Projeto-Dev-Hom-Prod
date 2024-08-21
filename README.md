# Projeto Dev-Hom-Prod

## Descrição

Este projeto é um sistema de gerenciamento de ambientes de desenvolvimento, homologação e produção. O objetivo é facilitar o gerenciamento de diferentes ambientes de desenvolvimento e deploy, assegurando que o código possa ser desenvolvido, testado e implantado de forma eficiente e ordenada.

## Estrutura do Repositório

O repositório está estruturado em três branches principais para diferentes estágios do desenvolvimento:

- **DEV**: Branch de desenvolvimento, onde o código é constantemente alterado e testado.
- **HOM**: Branch de homologação, onde o código é preparado para testes finais antes da produção.
- **PROD**: Branch de produção, onde o código está pronto para ser implantado em ambientes de produção.

## Estrutura do Projeto

- **dev/**: Contém os arquivos e configurações específicas para o ambiente de desenvolvimento.
- **hom/**: Contém os arquivos e configurações específicas para o ambiente de homologação.
- **prod/**: Contém os arquivos e configurações específicas para o ambiente de produção.

## Requisitos

Certifique-se de ter as seguintes ferramentas instaladas:

- [Git](https://git-scm.com/)
- [Terraform](https://www.terraform.io/)
- [AWS CLI](https://aws.amazon.com/cli/)

## Configuração Inicial

1. **Clone o Repositório**

   ```bash
   git clone https://github.com/MiguelEstevam/Projeto-Dev-Hom-Prod.git
   cd Projeto-Dev-Hom-Prod
