---
name: sequence-builder
description: Turn outreach copy into a node-by-node sequence spec ready to build in a sender. Use after the copy exists and before anything is sent.
---

# Sequence Builder

Output a node list, not prose. Per node: action, delay before it,
exact copy, exit condition.

## The five nodes

```
1  Import from source
2  Condition: lead is 1st level
3  YES branch: message, using the merge prompt
4  NO branch: connection request, then message on acceptance
5  Wait 3 days, follow-up on a different angle, then add tag
```

## Rules

- Four touches maximum. After that the answer is no.
- Reply stops the sequence for that lead, always.
- A connection request auto-detects acceptance over two weeks, so
  NO WAIT NODE after one. This is the most common unnecessary node.
- Every touch a different angle. Never "just following up".
- Any voice note pairs with a written message, never sent alone.

## The ceiling

Recommended limits are roughly 20 connection requests a day and 100
messages a week, ACCOUNT-WIDE rather than per campaign.

State the daily send split against the ceiling in
`.agents/outreach-context.md`, allocated by tier.

## Fail closed

If the requested volume exceeds the ceiling, state the ceiling and
the required split rather than writing the sequence. Three campaigns
at 20 each means 60 attempts a day and a restricted account.

## Builder reference

Available actions: connection request, message, voice note, InMail,
message to open profile, comment on last post, reply comment, like
last post, visit profile, wait X days, add tag.

Available conditions: has LinkedIn URL, lead is 1st level, opened
message, lead is open profile, check data in column.
