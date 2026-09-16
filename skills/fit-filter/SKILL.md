---
name: fit-filter
description: Filter and grade a prospect list before any enrichment or copywriting. Run on the cheapest model at the lowest effort. Use immediately after list building.
---

# Fit Filter

Read the ICP and the disqualifiers in `.agents/outreach-context.md`.

## Per row

Return exactly one of KEEP, DROP or UNSURE, with a reason of 12
words maximum.

- KEEP: matches the job title band and the company size band
- DROP: fails either, or is a competitor, or too small for the price
- UNSURE: headline is ambiguous. Do not guess.

KEEP and UNSURE go to `output/filtered.csv`.
DROP goes to `output/dropped.csv`, so the filter can be audited when
someone later asks why a company was excluded.

Report the drop rate. Below 40% usually means the search was too
narrow rather than the list being unusually good.

## Then grade what survives

Eight dimensions, 1 to 10: ICP fit, title accuracy, affordability,
data completeness, deduplication, recency, reachability, signal
strength.

Average into a letter.

```
A  9.0+   send today
B  7.5+   send
C  6.0+   fix the two lowest first
D  4.5+   rebuild the list
F  below  rebuild the ICP, not the list
```

## Fail closed

Below B, stop. Name the two lowest dimensions and the fix for each.
Do not pass a failing list downstream.

Signal strength predicts reply rate better than any other dimension.
A B-grade list where most rows carry a tier 1 signal beats an A-grade
list with none.

## Why cheap

This touches every row, so it is the highest-volume call in the
connector and has the least reasoning in it. Running it at high
effort is where the cost advantage disappears.
