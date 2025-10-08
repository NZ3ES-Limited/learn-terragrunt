# Terragrunt Code

Created terragrunt code using existing module

## Tree Structure

```bash
iac-terragrunt-live-v1
├── dev
│   ├── jumpbox
│   │   └── terragrunt.hcl
│   └── network
│       └── terragrunt.hcl
├── README.md
├── root.hcl
└── stg
    ├── jumpbox
    │   └── terragrunt.hcl
    └── network
        └── terragrunt.hcl
```

## Initialise Variables

```shell
export TF_VAR_azure_client_secret='4vn8Qxxxxx-xxx-xxx'
export TF_VAR_azure_subscription='xxxx-xxx-xxxx-xx-xxxxx'
export TF_VAR_azure_tenant_id='xxxx-xxx-xxxx-xx-xxxxx'
export TF_VAR_azure_client_id='xxxx-xxx-xxxx-xx-xxxxx'
```

## Execution

Navigate to the corresponding environment folder (ex: dev or stg) or traverse to the unit (ex: dev/network OR dev/jumphost) and follow the steps below.

- Initialise: terraform run --all init
- Validate: terraform run --all validate
- Plan: terraform run --all plan
- Apply: terraform run --all apply

## Generate Graph

- terragrunt dag graph | dot -Tsvg > graph.svg
