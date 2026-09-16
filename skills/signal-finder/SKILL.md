---
name: signal-finder
description: Find a dated, verifiable reason to contact each lead now rather than later. Use after a list exists and before any copy is written.
---

# Signal Finder

One signal per lead, ranked by how close it sits to a budget decision.

## Tier 1, budget is already moving

- Hiring for the role your offer replaces or supports
- Raised in the last 90 days
- New leader in post, last 60 days
- Publicly named the exact problem, last 30 days

## Tier 2, the problem is visible

- Their site or content shows the specific gap
- Commented on a competitor's post
- Expanding into a new market or location
- Competitor of an existing customer

## Tier 3

ICP fit only, no observable trigger.

## Rules

Every signal must be verifiable and DATED. Record the date and the
URL, because it appears in the first message and they will check it.

No signal means write NONE. Never stretch an attribute into a
trigger. "Works at a SaaS company" is fit, not intent, and using it
as intent is the clearest tell that a message was generated.

Add `signal`, `tier`, `date` and `source_url` columns to the CSV.

## Fail closed

If a source cannot be reached to verify a date, write NONE rather
than an undated signal.
