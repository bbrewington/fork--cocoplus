---
name: "patterns-view"
description: "List all patterns in the CocoGrove pattern library (.cocoplus/grove/patterns/). Optional tag filter: /patterns view [tag]."
version: "1.0.0"
author: "CocoPlus"
tags:
  - cocoplus
  - cocogrove
---

Your objective is to list CocoGrove patterns.

Before proceeding, verify that `.cocoplus/` exists.
If not: output "CocoPlus is not initialized. Run `/pod init` first." Then stop.

List all `.md` files in `.cocoplus/grove/patterns/`. If directory is empty:
Output: "No patterns in CocoGrove yet. Use `/patterns promote [finding-id]` to promote a CocoCupper finding."
Then stop.

Parse optional tag filter: `/patterns view [tag]`

For each pattern file, read the YAML frontmatter to extract: name, domain, tags, summary.
If a tag filter is provided, only include patterns whose tags include the filter value.

Output:
```
# CocoGrove Pattern Library

| Pattern | Domain | Tags | Summary |
|---------|--------|------|---------|
[one row per pattern]

Total: [N] patterns. Use pattern names in prompts by referencing .cocoplus/grove/patterns/[name].md
```
