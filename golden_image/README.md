## Golden Image
Creating 2 images for differente cloud providers with the same process utilizing Packer Community

### Required Setup
Install Packer
https://developer.hashicorp.com/packer/tutorials/docker-get-started/get-started-install-cli

#### AWS

Configure AWS Credentials (I prefer to use environment variables in this case)
https://developer.hashicorp.com/packer/integrations/hashicorp/amazon#environment-variables

Configure AWS IAM Permissions to build the image
https://developer.hashicorp.com/packer/integrations/hashicorp/amazon#iam-task-or-instance-role

And then:

```bash
export AWS_ACCESS_KEY_ID=<access-key>
export AWS_SECRET_ACCESS_KEY=<secret-key>
export AWS_DEFAULT_REGION=<region>
```

#### Azure

Configure Azure Credentials
Since I'm not an Azure guy, I had a lot of problems with this setup and when I've tried to use environment variables, in the same way I've used in AWS, It has not worked.
So I've tried to configure default variablesin variables.pkr.hcl to get the environment variables and It has worked out.

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

