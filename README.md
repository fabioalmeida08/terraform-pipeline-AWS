# Projeto: Pipeline com Terraform e GitHub Actions

Este repositório é um projeto de aprendizado que demonstra como implementar uma pipeline de infraestrutura como código (IaC) utilizando Terraform e GitHub Actions. O objetivo é explorar conceitos como automação de CI/CD, gerenciamento de ambientes, uso de secrets e environments do GitHub, e integração com AWS.

# Visão Geral

O projeto consiste em uma pipeline automatizada que:

1. Valida e aplica configurações do Terraform em diferentes ambientes (dev e prod).

2. Utiliza GitHub Actions para orquestrar o fluxo de trabalho.

3. Aproveita secrets do GitHub para gerenciar credenciais sensíveis.

4. Usa environments do GitHub para separar e gerenciar ambientes de implantação.

5. Implementa boas práticas como validação de código, automação de deploy e controle de acesso.


## Funcionalidades Principais

1. **Pipeline com GitHub Actions**:
   - O workflow é acionado por push nas branches `develop` e `main`.
   - Define dinamicamente o ambiente (`dev` ou `prod`) com base na branch.
   - Utiliza a API do GitHub para validar os environments configurados no repositório.

2. **Terraform como IaC**:
   - Define infraestrutura como código usando Terraform.
   - Utiliza o backend remoto do terraform em um bucket do s3
   - Utiliza variáveis de ambiente (`TF_VAR_*`) para configurar ambientes dinamicamente.

3. **Gerenciamento de Secrets**:
   - Credenciais sensíveis (como chaves da AWS) são armazenadas em **secrets** do GitHub.
   - O workflow assume uma role na AWS usando OIDC (OpenID Connect) para autenticação segura.

4. **Environments do GitHub**:
   - Ambientes (`dev` e `prod`) são configurados no repositório para separar implantações.
   - O workflow valida se o ambiente existe antes de prosseguir.

5. **Automação de Deploy**:
   - Aplica automaticamente as mudanças no ambiente correto com base na branch.
   - Valida o código Terraform antes de aplicar as mudanças.

## Como Funciona o Workflow

1. **Trigger**:
   - O workflow é acionado por push nas branches `develop` e `main`.

2. **Definição do Ambiente**:
   - O ambiente (`dev` ou `prod`) é definido dinamicamente com base na branch.

3. **Autenticação na AWS**:
   - O GitHub Actions assume uma role na AWS usando OIDC.

4. **Validação do Terraform**:
   - O código Terraform é validado antes da aplicação.

5. **Aplicação ou Destruição**:
   - O workflow aplica as mudanças no ambiente correto.
   - Opcionalmente, destrói recursos com base na configuração em `destroy_config.json`.