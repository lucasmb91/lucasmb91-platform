build {
  name = "rhel"
  sources = [
    "source.amazon-ebs.rhel",
    "source.azure-arm.rhel"
  ]

  provisioner "shell" {
    inline = ["echo Running $(cat /etc/os-release | grep VERSION= | sed 's/\"//g' | sed 's/VERSION=//g')."]
  }

  #Need to add sudo inside shell script
  provisioner "shell" {
    script = "scripts/cis_example_sudo.sh"
  }

  #Run the entire script as root user
  provisioner "shell" {
    script = "scripts/package_example.sh"
    execute_command = "sudo {{.Path}}"
  }
}
