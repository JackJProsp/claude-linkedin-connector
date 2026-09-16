---
name: merge-prompt-writer
description: Convert message copy into prompts that personalise per lead at send time. Use as the last writing step before a sequence is built.
---

# Merge Prompt Writer

This is how one sequence personalises across a whole list without
writing a hundred drafts.

## Syntax, keep the two distinct

```
{{double curly}}   the platform's own profile data
[square brackets]  instructions to the AI
```

Variables: first name, last name, headline, biography, job title,
company, last post. Plus any custom variable imported from the CSV,
so the signal column from signal-finder is usable here.

## Rules

- ONLY the opening line varies. Keep the ask identical across leads
  so results are comparable and failure is diagnosable.
- State length explicitly, in characters.
- Say what to do when a variable is empty. Never allow "Hi ,".
- Ban the burnt openers inside the prompt itself.
- One instruction per bracket. Compound instructions get
  half-followed.

## Shape

```
Hi {{first name}},
[One sentence referencing {{signal}}. Be specific about the actual
detail, not the category. Under 90 characters. If {{signal}} is
empty, use {{headline}} instead. Never open with "I came across".]
[Then this line unchanged:] Worth a quick look at how [X] handle
this?
```

## Always preview

Run sample outputs against real contacts in the campaign before
sending. That catches the prompt that reads fine on lead one and
produces something odd on lead five.

Write to `output/merge-prompts.md`.
