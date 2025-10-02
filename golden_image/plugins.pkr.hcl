packer {
    required_plugins {
        ansible = {
            source = "github.com/hashicorp/ansible"
            version = "˜> 1"
        }

        azure = {
            source  = "github.com/hashicorp/azure"
            version = "~> 2"
        }
  }
}
