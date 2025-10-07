# learn-terragrunt

This project contains code using terraform and terragrunt

## Terraform code

Folder (iac-terraform-live-v1) contains terraform code for deploying vnet and subnets to dev and stg (staging) environments

### Initialise Variables

```shell
export TF_VAR_azure_tenant_id='xxxx-xxx-xxxx-xx-xxxxx'
export TF_VAR_subscription='xxxx-xxx-xxxx-xx-xxxxx'
export TF_VAR_azure_client_secret='4vn8Qxxxxx-xxx-xxx'
```

### Execution

Navigate to the corresponding environment folder (ex: dev or stg) and follow the steps below.

- Initialise: terraform init
- Validate: terraform validate
- Plan: terraform plan
- Apply: terraform apply, review the config and provide yes or no to apply the changes
