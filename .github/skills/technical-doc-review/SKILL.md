---
name: technical-doc-review
description: "Review technical documentation with brutally honest, evidence-based scoring. Use for backend docs, handbooks, API docs, architecture docs, migration guides, and runbooks. Produces strengths, gaps, risk calls, and prioritized rewrite actions."
argument-hint: "Provide doc path(s), intended audience, and doc type (reference/tutorial/runbook/RFC)."
user-invocable: true
---
# Technical Document Review Skill

## When to use
- You need rigorous, unsweetened feedback on a technical document.
- You want section-level scoring and concrete rewrite priorities.
- You need audience fit analysis from junior to senior.
- You need a go/no-go quality verdict before publishing.

## Procedure
1. Classify the artifact
- Determine if the document is a reference, tutorial, runbook, RFC, or hybrid.
- If not explicit, infer from structure and usage language.

2. Build evidence map
- Extract major sections and key claims.
- Mark where each claim is supported (examples, constraints, caveats, tests).

3. Apply scoring rubric
- Use [rubric](./references/rubric.md).
- Score each dimension 0-100 with one-line evidence.

4. Pressure-test for real-world backend use
- Check operational safety, migration and rollback logic, failure handling.
- Check provider/platform variance where relevant.
- Check if examples are production-safe or only happy-path.

5. Evaluate by seniority
- Score junior, mid, senior usability separately.
- Identify where guidance is under-specified for each group.

6. Produce actionable output
- Use [output template](./references/output-template.md).
- List critical findings first, then strengths, then top fixes.

## Guardrails
- No politeness inflation.
- No score without evidence.
- No broad praise unless tied to concrete sections.
- Always state residual risk if published without fixes.

## Deliverable contract
Always return:
- Executive verdict
- Risk-ordered findings
- Dimension score table
- Strengths to preserve
- Top 5 fixes
- Junior/Mid/Senior fit scores
- Publish-now risk statement
