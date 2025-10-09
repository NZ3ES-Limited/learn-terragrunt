# learn-terragrunt

This project contains code using terraform and terragrunt

## iac-terraform-live-v1

- This folder contains terraform code to deploy multiple environments
- Same code copied to multiple environments folder and adjust the values (either default values in variables or create <env_name>.tfvars)

## iac-terraform-live-v2-modules

- This folder contains terraform modules (simplified from the above folder) in modules folder
- Then create folder (ex: dev and stg) to use newly created modules to deploy in multiple environments

## iac-terragrunt-live-v1

- This folder contains terragrunt code to deploy multiple environments using the previouly created modules
  - root.hcl contains generate provider and backend files.
  - env folder (ex: dev or stg) contains terragrunt code, using the previously created (root.hcl)
  - terragrunt.hcl on each components (network and jumpbox) contains module and provide input values
