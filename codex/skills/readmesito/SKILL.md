---
name: readmesito
description: Generate a new README or update an existing README for a software project. Use when asked to create, refresh, revise, or bring a project README up to date.
metadata:
  short-description: Write clear, evidence-based project READMEs
---

# readmesito 

Write for the project's intended users. Keep claims specific and supported by the repository; distinguish working features from planned work.

## Create or update

- If the README is missing, create it using the rules below.
- If a README exists, update it in place against the current repository. Preserve accurate content and useful structure; correct stale claims, commands, links, and examples, and document verified changes. Keep a targeted update focused on the user's requested scope; rewrite broadly only when requested or needed to make the README accurate.
- When invoked without a mode, update the existing README or create one if absent. Apply the same evidence, screenshot, and verification rules in either case.

## Workflow

1. Read repository instructions and inspect only the README, manifest, source, and docs needed to confirm purpose, setup, architecture, persistence, platform support, and status.
2. When useful, review two or three official READMEs from comparable projects for structure. Do not copy wording or imply their features apply here.
3. Write a concise README covering what the project does, key features, setup and run commands, architecture and important tradeoffs, and verification or contribution details where supported. Add diagrams, screenshots, badges, or roadmap only when they clarify real, verified information.
4. Capture screenshots only from the real app, using synthetic or temporary data. Never expose private or production data or fabricate screenshots. If safe capture is unavailable, omit screenshots.
5. Edit the README in place. Preserve separate manuals. Do not claim unsupported licensing, downloads, benchmarks, CI results, or platform support.
6. Check local links, image paths, and technical descriptions against the repository; inspect the final diff. Run checks only when requested or needed. Do not commit, publish, or change repository visibility unless explicitly asked.

Keep the introduction product-focused and technical explanations concrete. Omit sections that add no useful information.
