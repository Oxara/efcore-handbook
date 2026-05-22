# Technical Doc Critic - Reuse In New Projects

This project contains a reusable customization pack:
- Custom agent
- Custom instruction
- Custom skill (+ references)

## Install into another project

Run this from the current repository root:

```powershell
./tools/install-doc-critic.ps1 -TargetProjectPath "C:\Projects\my-new-backend-project"
```

If destination files already exist and you want to overwrite them:

```powershell
./tools/install-doc-critic.ps1 -TargetProjectPath "C:\Projects\my-new-backend-project" -Force
```

## What gets installed

- `.github/agents/technical-doc-critic.agent.md`
- `.github/instructions/technical-doc-quality.instructions.md`
- `.github/skills/technical-doc-review/SKILL.md`
- `.github/skills/technical-doc-review/references/rubric.md`
- `.github/skills/technical-doc-review/references/output-template.md`

## Notes

- This keeps the agent project-scoped by design.
- For every new project, run the installer once.
- After install, reopen chat (or reload VS Code window) in the target project.
