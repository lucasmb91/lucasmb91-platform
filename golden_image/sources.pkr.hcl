source "amazon-ebs" "rhel" {
  ami_name      = "golden-image-{{timestamp}}"
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

  #assume_role {
  #  role_arn = "arn:aws:iam::{{account_id}}:role/{{role_name}}"
  #}

  ssh_username = "ec2-user"
}
