# Terraform Module

Created a module from the terraform code folder iac-terraform-live-v1

## Tree Structure

```bash
iac-terraform-live-v2-modules
├── dev
│   ├── main.tf
│   ├── provider.tf
│   └── variables.tf
├── stg
│    ├── main.tf
│    ├── provider.tf
│    └── variables.tf
├── modules
│   └── network
│       ├── main.tf
│       ├── outputs.tf
│       └── variables.tf
├── README.md
```

## Initialise Variables

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
