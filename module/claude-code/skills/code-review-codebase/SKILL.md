---
name: code-review-codebase
description: Perform a code-review of the entire codebase
argument-hint: "[bugs|security|performance] (comma-separated, optional)"
disable-model-invocation: true
allowed-tools: Read, Glob, Grep
---

The requested review mode is: $ARGUMENTS

Match it case-insensitively against these focus areas:

- `bugs`: focus ONLY on logical or other bugs.
- `security`: focus ONLY on security issues.
- `performance`: focus ONLY on performance issues.

The mode may combine areas, such as `bugs,security` — review every listed area in that case.

If no mode is given above, or it matches none of the areas, perform a thorough, general code review.

Perform an in-depth code review of the entire codebase.

Carefully and thoroughly explore the codebase file-by-file to find potential issues and improvements.

Don't rush it, instead make sure you fully understand the code structure and architecture.

Create a detailed report of all your findings.
