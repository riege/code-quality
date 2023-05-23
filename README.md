# Riege Software Code Quality

Linter configurations and GitHub workflows for linting source code.

## Super Linter

Use this workflow if your repository consists of multiple file formats (e.g. Java, XML, Terraform). The [Super Linter action](https://github.com/github/super-linter) is quite a beast but there is virtually nothing this action cannot lint.

Add a new workflow file like [this one](.github/workflows/lint.yml) or add the following lines to a existing workflow:

```yaml
  call-lint-workflow:
    uses: "riege/code-quality/.github/workflows/super-linter.yml@main"
```

## Terraform TFLint

This workflow is intended for repositories consisting of Terraform files only. It's super small and fast and properly lints child modules.

Usage:

```yaml
jobs:
  lint:
    uses: riege/code-quality/.github/workflows/tflint.yml@main
```
