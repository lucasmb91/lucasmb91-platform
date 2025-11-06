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

source "azure-arm" "rhel" {
  managed_image_name                = "rhel-10-${var.gitVersion}"
  managed_image_resource_group_name = var.armResourceGroup
  build_resource_group_name         = var.armResourceGroup
  vm_size                           = "Standard_B1s"

  subscription_id = var.armSubscriptionId
  tenant_id       = var.armTenantId
  client_id       = var.AarmClientId
  client_secret   = var.armClientSecret

  os_type         = "Linux"
  image_publisher = "RedHat"
  image_offer     = "RHEL"
  image_sku       = "10-lvm-gen2"
}
