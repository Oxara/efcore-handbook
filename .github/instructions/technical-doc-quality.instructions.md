---
description: "Use when creating or reviewing technical docs, backend handbooks, runbooks, RFCs, API docs, migration guides, and reference materials. Enforces strict quality bars and honest scoring."
name: "Technical Documentation Quality Standard"
---
# Technical Documentation Quality Standard

Use this instruction whenever the task involves drafting, editing, or reviewing technical documentation.

## Intent First
- Identify document intent explicitly: reference, tutorial, runbook, RFC, or design note.
- If intent is reference, optimize for fast lookup and decision support.
- If intent is tutorial, optimize for learning progression and rationale.

## Quality Gates
- Accuracy: no speculative claims without caveats.
- Currency: note version assumptions (.NET, EF Core, provider, API version).
- Operability: include failure modes, rollback strategy, and safe defaults for production-impacting topics.
- Verifiability: include test/validation steps for important procedures.
- Audience coverage: clarify what juniors can execute safely and what requires senior judgement.

## Required Structure For Reviews
1. Findings first (highest risk first)
2. Evidence-backed scoring (0-100)
3. Strengths second
4. Actionable fixes last

## Scoring Discipline
- Do not cluster all scores in 80-90.
- Penalize missing operational safety heavily.
- Penalize shallow examples that fail in real systems.
- Reward explicit tradeoff analysis and anti-pattern warnings.

## Anti-Patterns
- Marketing tone instead of technical precision.
- Big code blocks without context, constraints, or failure cases.
- Missing assumptions (environment, versions, provider differences).
- Advice that is unsafe for production use.
- Vague recommendations without measurable outcomes.
