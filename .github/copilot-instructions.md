# Copilot Instructions for This Repository

## Repository Purpose

This repository provides reusable GitHub Actions workflows and shared linting configuration for `super-linter`.

Primary goal:

- Ensure teams consume a consistent linting setup across repositories.

This repository is not an application runtime project. Changes should focus on workflow reliability, configuration consistency, and clear maintenance.

## Source of Truth

The reusable workflow behavior is based on the official `super-linter` project:

- https://github.com/super-linter/super-linter

Scope of this dependency policy:

- `.github/workflows/super-linter.yml`
- `.github/workflows/super-linter-non-slim.yml`

Apply `super-linter` compatibility and naming alignment rules only to these two workflows.

When adding or changing linter flags, environment variables, or workflow behavior:

1. Prefer documented `super-linter` inputs and env variables.
2. Keep naming aligned with upstream conventions (`VALIDATE_*`, `*_FILE_NAME`, etc.).
3. Avoid introducing custom behavior that conflicts with upstream semantics.

## Language Policy

Use English only for all human-readable content in this repository, including:

- Markdown documentation
- YAML comments
- Code comments
- Pull request descriptions generated from this repo context
- Commit message suggestions generated from this repo context

Do not introduce German or mixed-language documentation/comments.

## Editing Guidelines

When modifying reusable workflows (especially `super-linter` workflows):

1. Keep include-mode and exclude-mode logic consistent.
2. If a new `VALIDATE_*` input is added, wire it in all required places:
   - `workflow_call.inputs`
   - include-mode `if` condition
   - include-mode `env` mapping
   - exclude-mode `if` condition (if applicable)
   - exclude-mode explicit disable (`false`) when needed
3. Preserve backward compatibility for existing consumers whenever possible.
4. Keep defaults conservative (`false`) for optional linters unless explicitly requested otherwise.

## Safety and Scope

- Do not add secrets or tokens to workflow files.
- Do not hardcode repository-specific private paths beyond existing patterns.
- Keep changes minimal and focused on linting standardization.

## Validation Expectations

After workflow edits, verify:

1. YAML syntax is valid.
2. Input names match env usage exactly.
3. Conditions do not accidentally enable extra linters.
4. Comments remain concise and in English.

## Preferred Change Style

- Make small, reviewable changes.
- Prefer explicitness over clever shortcuts in workflow logic.
- Add short comments only when behavior is non-obvious.
