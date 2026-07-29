---
id: adopter-knowledge-instructions
title: Adopter Knowledge Instructions
artifact_type: instructions
category: knowledge
authority_tier: adopter
status: template
version: 1.0.0
access_level: public
---

# Adopter Knowledge Instructions

Ground dependent work in authoritative sources before authoring it. Register
the source identity, canonical location, immutable revision, retrieval date,
and content digest. Separate source facts from inference and unresolved
questions.

Load and resolve knowledge in this order: the pinned SDD-Core GLOBAL
constitution and grounding registry, the applicable SDD-Core internal-domain
constitution and registry, then this adopter's constitution and knowledge.
Adopter sources may refine local use but never override GLOBAL or domain
authority. Stop on any conflicting identity, pin, digest, or rule.

Keep one topic per Markdown file, use YAML front matter, and connect related
material with relative Markdown links. Do not store credentials, connection
material, personal filesystem paths, or unredacted private data.

The [constitution](../.specify/memory/constitution.md) governs authority. The
[adoption record](../.sdd-core/adoption.yaml) binds the SDD-Core revision.
