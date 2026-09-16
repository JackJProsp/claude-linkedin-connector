---
name: list-builder
description: Build a raw prospect list from any LinkedIn source. Use when starting a new campaign, when the pipeline needs new names, or when someone asks who we should be contacting.
---

# List Builder

Read `.agents/outreach-context.md` before anything.

## Sources, highest intent first

1. Commenters and likers on a relevant post, yours or a competitor's
2. Attendees of a relevant LinkedIn event
3. Members of a relevant group
4. Search matching the ICP
5. Job boards, for companies hiring the role your offer supports

Source 1 first, always. Someone who commented on a post about your
exact topic has done something. Someone matching a search filter has
done nothing.

## Capture per row

Full name, headline, company, company size, location, LinkedIn URL,
and the source it came from.

Write to `output/prospects.csv` with a `linkedin_url` column. That
header name is required by the import later. Do not rename it.

## Rules

- Enrich nothing at this stage. Look up no emails.
- Most of this list is discarded by fit-filter, and enrichment is
  priced per lookup.
- Record the source per row. Downstream skills read it.

## Fail closed

If `outreach-context.md` has no ICP filled in, stop and say so.
Building a list against an assumed ICP wastes the filter pass too.
