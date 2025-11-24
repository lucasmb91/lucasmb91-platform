# lucasmb91-platform
Repo to store platform engineering codes, IaC, pipelines and automation.

## Golden Image
Creating 2 images for differente cloud providers with the same process utilizing Packer Community

## Configuring RH Ansible Automation Platform

Download it at: [AAP 2.6 Containerized Setup - RHEL10 x86](https://access.cdn.redhat.com/content/origin/files/sha256/bb/bba0abf16fec6979463dd841f77c539185abccfd139189edda0eb2c3465a7c07/ansible-automation-platform-containerized-setup-2.6-2.tar.gz?user=eba4ec0f767e33bcd8b1fc6bf1faa40d&_auth_=1763434512_fe2c134ef1a50dceeb0d81a5ad53561a)

Get a Registry:

[Access this link with your account](https://access.redhat.com/terms-based-registry/)
Click on "New Service Account"
Get the account name and valid token


Run as root user
```bash
useradd -m -c "AAP User" -s /bin/bash aap
echo "aap ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/aap
passwd aap
#created a separate filesystem for aap
chown aap:aap /aap
scp ansible-containerized-setup.tar.gz aap@myhost:/aap/
su - aap
tar xvf /aap/ansible-containerized-setup.tar.gz
mv /aap/ansible-containerized-setup /aap/ansible-install
cd /aap/ansible-install
sed -i 's/<set your own>/aap123/g' inventory-growth
sed -i 's/aap.example.org/myhost/g' inventory-growth
sed -i 's/<your RHN username>/<registry user with id>/g' inventory-growth
sed -i 's/<your RHN password>/<registry-token>/g' inventory-growth
sed -i '/ansible_connection=local/a\client_request_timeout=240' inventory-growth

ansible-playbook -i inventory-growth ansible.containerized_installer.install