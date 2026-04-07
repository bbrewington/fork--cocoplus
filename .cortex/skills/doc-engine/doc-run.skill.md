---
name: "doc-run"
description: "Generate documentation for Snowflake objects. Runs SQL to extract column metadata, creates a data dictionary, and builds a lineage diagram. Usage: /doc run [schema.table] or /doc run (for all accessible tables)."
version: "1.0.0"
author: "CocoPlus"
tags:
  - cocoplus
  - doc-engine
---

Your objective is to generate documentation for Snowflake objects.

Before proceeding, verify that `.cocoplus/` exists.
If not: output "CocoPlus is not initialized. Run `/pod init` first." Then stop.

Parse argument: `/doc run [schema.table]`
If no argument: document all accessible tables (use SHOW TABLES to enumerate).

## For Each Table

Execute:

```sql
DESCRIBE TABLE [schema].[table];
```

Capture: column name, data type, nullable, default, comment.

Then execute for lineage:
```sql
SELECT *
FROM SNOWFLAKE.ACCOUNT_USAGE.OBJECT_DEPENDENCIES
WHERE REFERENCED_OBJECT_NAME = '[table]'
   OR REFERENCING_OBJECT_NAME = '[table]'
LIMIT 100;
```

## Generate Data Dictionary

Write `.cocoplus/docs/[schema]-[table]-datadict.md`:

```markdown
# Data Dictionary: [schema].[table]

**Generated:** [ISO 8601 timestamp]
**Schema:** [schema]
**Table:** [table]

## Columns

| Column | Type | Nullable | Default | Description |
|--------|------|----------|---------|-------------|
[one row per column — use existing comment as description, or "(no description)" if empty]

## Lineage
**Upstream (depends on):**
[list of tables this table reads from]

**Downstream (consumed by):**
[list of tables/views/procedures that reference this table]
```

Write `.cocoplus/docs/schema-lineage.md` with a summary of all lineage relationships.

Output: "Documentation generated. [N] tables documented. Files written to .cocoplus/docs/."
