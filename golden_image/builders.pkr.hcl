build {
  name = "rhel-aws"
  sources = [
    "source.amazon-ebs.rhel",
    "source.azure-arm.rhel"
  ]

  provisioner "shell" {
    inline = ["echo Running $(cat /etc/os-release | grep VERSION= | sed 's/\"//g' | sed 's/VERSION=//g')."]
  }
}