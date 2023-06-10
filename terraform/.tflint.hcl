# https://github.com/terraform-linters/tflint/blob/master/docs/user-guide/config.md
# https://github.com/github/super-linter/blob/main/TEMPLATES/.tflint.hcl
config {
  module = false
  force  = false
}

plugin "terraform" {
  enabled = true
  preset  = "all"
}

# add special rules for MS Azure Resource Manager
plugin "azurerm" {
  enabled = true
  version = "0.24.0"
  source  = "github.com/terraform-linters/tflint-ruleset-azurerm"
}

# we do not want to enforce specifying a required Terraform version as we usually run the configs with the latest version
rule "terraform_required_version" {
  enabled = false
}

# some modules simply don't have outputs or variables
rule "terraform_standard_module_structure" {
  enabled = false
}

# child modules usually don't specify their provider versions
# if it's also missing in the root module then Terraform will complain
rule "terraform_required_providers" {
  enabled = false
}
