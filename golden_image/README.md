# Golden Image - Pré-Requisitos
- Ansible AWX rodando;
- Conta gratuita na azure (saldos podem ser creditados);
- Conta gratuita no Hashicorp HCP;

## Subindo uma versão de testes do AWX

### Download do repo da ultima versao
git clone -b 24.6.1 https://github.com/ansible/awx

### Setar a senha da base de dados local que vai subir pg_password
vi awx/tools/docker-compose/build/inventory

### Realizar o make da aplicação a partir do diretorio root
make docker-compose-build