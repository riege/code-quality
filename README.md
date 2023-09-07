# Riege Software Code Quality

Linter configurations and GitHub workflows for linting source code.

## Super Linter

Use this workflow if your repository consists of multiple file formats (e.g. Java, XML, Terraform). The [Super Linter action](https://github.com/github/super-linter) is quite a beast but there is virtually nothing this action cannot lint.

Add a new workflow file like [this one](.github/workflows/lint.yml) or add the following lines to a existing workflow:

```yaml
  call-lint-workflow:
    uses: "riege/code-quality/.github/workflows/super-linter.yml@v1.0.0"
```

## Terraform

The workflow `terraform.yml` is intended for repositories consisting of Terraform files only. It's small and fast and properly checks Terraform configurations.

Usage:

```yaml
jobs:
  lint:
    uses: riege/code-quality/.github/workflows/terraform.yml@v1.0.0
    with:
      skip_init: false
      skip_validate: false
    secrets: inherit
```

- use `skip_init: true` if `terraform init` doesn't work properly during workflow run.
- use `skip_validate: true` if `terraform validate` doesn't work properly during workflow run.
- use `secrets: inherit` if you need access to Terraform Cloud e.g. to use Terraform workspaces in `data` sources.
