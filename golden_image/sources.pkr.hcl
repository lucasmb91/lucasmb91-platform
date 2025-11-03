source "amazon-ebs" "rhel" {
  ami_name      = "rhel-10-${var.gitVersion}"
  instance_type = "t3.micro"
  region        = "us-east-1"

  source_ami_filter {
    filters = {
      name                = "RHEL-10*x86_64*"
      root-device-type    = "ebs"
      virtualization-type = "hvm"
    }
    most_recent = true
    owners      = ["309956199498"] #ID Oficial da RedHat
  }

  ssh_username = "ec2-user"
}
