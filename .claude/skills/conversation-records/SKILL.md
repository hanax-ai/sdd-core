---
name: conversation-records
description: Use for capturing, locating, updating, summarizing, or archiving SDD-Core repository conversation outcomes. Routes GLOBAL, FRAMEWORK-DEFINITION, and OPERATIONAL-GOVERNANCE records through the single root conversations policy. It never writes an adopter or external repository.
---

# Conversation Records

This skill operates under `conversations/SYNC-POLICY.md` and creates no new
write permission.

## Route

Every record is written under root `conversations/` and declares one domain:

- `global`;
- `framework-definition`; or
- `operational-governance`.

Adopter or application outcomes belong to their independent repository. Report
that destination as out of scope; do not write it from SDD-Core authority.

## Capture

1. Read the policy, README, template, and local index.
2. Confirm a ratified durable outcome exists. Exploration without authority is
   disposable.
3. Deduplicate by topic, related artifacts, and status.
4. Copy `TEMPLATE.md`; use `YYYY-MM-DD-<topic>.md`.
5. Cite the exact ratifying artifact and fill every front-matter field.
6. Scan for secrets, private infrastructure, personal data, and transcripts.
7. Add or update the local index.

## Update and supersession

Before modifying an existing record, show the exact diff and obtain explicit
confirmation. Do not rewrite ratified history. Supersede with cross-links or
mark archived; never silently delete a record.

## Retrieval and summaries

Read the index first. Cite record filenames and status. Name missing evidence
instead of inferring it. A summary becomes a record only when the user asks to
persist it.

## Authority boundary

A record, summary, review, or status is evidence only. It cannot create Gate 1,
Gate 2, merge, release, deployment, external-write, or remediation authority.
