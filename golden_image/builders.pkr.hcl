build {
  name = "rhel"
  sources = [
    "source.amazon-ebs.rhel",
    "source.azure-arm.rhel"
  ]

  #Run single command
  provisioner "shell" {
    inline = ["echo Running $(cat /etc/os-release | grep VERSION= | sed 's/\"//g' | sed 's/VERSION=//g')."]
  }

  #Need to add sudo inside shell script
  provisioner "shell" {
    script = "scripts/cis_example_sudo.sh"
  }

  #Run the entire script as root user
  provisioner "shell" {
    script          = "scripts/package_example.sh"
    execute_command = "sudo {{.Path}}"
  }

  #Run ansible
  provisioner "ansible" {
    use_proxy               =  false
    playbook_file           =  "scripts/install_apache.yaml"
    ansible_env_vars        =  ["PACKER_BUILD_NAME={{ build_name }}"]
    inventory_file_template =  "{{ .HostAlias }} ansible_host={{ .ID }} ansible_user={{ .User }} ansible_ssh_common_args='-o StrictHostKeyChecking=no -o ProxyCommand=\"sh -c \\\"aws ssm start-session --target %h --document-name AWS-StartSSHSession --parameters portNumber=%p\\\"\"'\n"
  }
}
