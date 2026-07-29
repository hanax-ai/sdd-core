---
name: session-capture
description: Use when asked to capture or save the current SDD-Core session as a conversation record. Reviews only visible evidence, routes GLOBAL and internal-domain outcomes through root conversations, validates the record, and reports external-repository outcomes as out of scope.
---

# Session Capture

## 1. Resolve scope

- Repository-wide outcome -> `domain: global`.
- Framework outcome -> `domain: framework-definition`.
- Operational-governance outcome -> `domain: operational-governance`.
- Adopter/application/external outcome -> its independent repository; do not
  write it under SDD-Core authority.

Mixed sessions may produce separate SDD-Core domain records. Never turn an
external outcome into a root record.

## 2. Confirm dependencies

Read `conversations/README.md`, `conversations/TEMPLATE.md`,
`conversations/SYNC-POLICY.md`, the conversation-records skill, and the exact
repository-local index path `conversations/_index.md`. Missing dependency
means stop; do not invent a substitute.

## 3. Review visible evidence

Extract purpose, verified facts, ratified decisions with citations, constraints,
actions, unresolved questions, and current repository evidence. Do not use
memory of another session or reconstruct missing reasoning.

## 4. Create or update

Follow the conversation-records procedure. Deduplicate first, fill strict front
matter, use the ratification date, and obtain explicit confirmation before
editing an existing record.

Use labels when helpful: `[FACT]`, `[DECISION]`, `[PROPOSAL]`,
`[ASSUMPTION]`, and `[UNRESOLVED]`.

## 5. Validate

Confirm correct domain metadata, naming, index entry, policy-conformant
visibility, valid citations, and a clean secret/transcript scan. Read the saved
record back before reporting.

Conversation capture adds no authority. Offer a skills-creator mining pass only
as a proposal; no self-approval.
