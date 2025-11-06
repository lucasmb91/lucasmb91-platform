packer {
  required_plugins {
    amazon = {
      version = ">= 1.6.0"
      source  = "github.com/hashicorp/amazon"
    }
    azure = {
      source  = "github.com/hashicorp/azure"
      version = "~> 2"
    }
  }
}
