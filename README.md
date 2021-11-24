# code-quality

Linter configurations and Github Action workflow for super-linter

## How To Use

Add a new workflow file like [this one](.github/workflows/lint.yml).

Or add the following line to a existing workflow:

```yaml
  call-lint-workflow:
    uses: "riege/code-quality/.github/workflows/super-linter.yml@main"
```
