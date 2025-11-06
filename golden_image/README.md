## Golden Image
Creating 2 images for differente cloud providers with the same process utilizing Packer Community

### Required Setup
Install Packer
https://developer.hashicorp.com/packer/tutorials/docker-get-started/get-started-install-cli

Configure AWS Credentials (I prefer to use environment variables in this case)
https://developer.hashicorp.com/packer/integrations/hashicorp/amazon#environment-variables
Configure AWS IAM Permissions to build the image
https://developer.hashicorp.com/packer/integrations/hashicorp/amazon#iam-task-or-instance-role

Configure Azure Credentials
Since I'm not an Azure guy, I had a lot of problems with this setup and when I've tried to use environment variables, in the same way I've used in AWS, It has not worker.
So I've tried to configure default variables to get the environment variables and It Worked out.

```bash
az group create -n <resource group name> -l westus
az ad sp create-for-rbac --role Contributor --scopes /subscriptions/<subscription_id> --query "{ client_id: appId, client_secret: password, tenant_id: tenant }"
```

And then:

```bash
export ARM_TENANT_ID=<tenant-id>
export ARM_SUBSCRIPTION_ID=<subscription-id>
export ARM_CLIENT_ID=<client-id>
export ARM_CLIENT_SECRET=<client-secret>
export ARM_RESOURCE_GROUP=<resource-group>
```