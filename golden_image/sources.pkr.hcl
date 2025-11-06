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
  managed_image_resource_group_name = var.ARM_RESOURCE_GROUP 
  build_resource_group_name	    = var.ARM_RESOURCE_GROUP
  vm_size                           = "Standard_B1s"

  subscription_id = var.ARM_SUBSCRIPTION_ID 
  tenant_id       = var.ARM_TENANT_ID 
  client_id       = var.ARM_CLIENT_ID 
  client_secret   = var.ARM_CLIENT_SECRET 

  os_type         = "Linux"
  image_publisher = "RedHat"
  image_offer     = "RHEL"
  image_sku       = "10-lvm-gen2"
}
