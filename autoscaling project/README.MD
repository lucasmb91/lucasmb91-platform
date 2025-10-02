# Projeto de AutoScaling

Esse projeto tem como objetivo automatizar o deploy de uma aplicação no modelo de "AutoScaling" em cloud.

## Componentes do Repositório

### Pipelines de Aplicação (diretório /app)

GitHub Actions realizando a parte de build da aplicação (se necessário for) e upload dela para um registry.

Scripts de implementação, realizando a parte de deploy da aplicação, seja com a instalação do pacote ou alterando os arquivos de configuração.

### Pipeline de InfraEstrutura (diretório /infra)

GitHub Actions como pipeline de InfraEstrutura e entregando a imagem versionada ao registry/target de cloud;
HCP Packer como builder da imagem;
Scripts com os pré-requisitos da aplicação, instalação de pacotes, diretórios, filesystems, usuários, configurações de SO;
Scripts de implementação da aplicação no HCP Packer.

### Infrastructure-as-a-code (diretório /terraform)

Repositório dos códigos de terraform criando os recursos necessários na cloud para entrega da solução.

### Pipeline (diretório /)

Realiza a orquestração de ambas as pipelines, com os triggers e fluxo de desenvolvimento, seguindo os passos:

- Realiza o build da aplicação/Trigger manual ou webhook no caso de pacote pronto;
- Ativa a pipeline de Infra com o HCP Packer preparando a imagem com os scripts de pré-requisitos e executando o passo de implementação da pipeline de aplicação, concluindo a pipeline do HCP Packer (infra);
- Executa as etapas de versionamento das imagens e repositorios e ativa o rollout das instâncias.