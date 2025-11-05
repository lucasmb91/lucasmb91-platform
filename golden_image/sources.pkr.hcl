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
  client_id       = var.azure_client_id
  client_secret   = var.azure_client_secret
  tenant_id       = var.azure_tenant_id
  subscription_id = var.azure_subscription_id

  managed_image_name                = "rhel-10-${var.gitVersion}"
  managed_image_resource_group_name = var.azure_resource_group
  location                          = "East US"
  vm_size                           = "Standard_B1s"

  os_type         = "Linux"
  image_publisher = "RedHat"
  image_offer     = "RHEL"
  image_sku       = "10-gen2"
  image_version   = "latest"
}