# Claude to LinkedIn Connector

Seven Claude skills plus an MCP config that let Claude research
LinkedIn leads, write the outreach, and hand a ready sequence to a
sender.

There is no official Claude to LinkedIn connector. Nothing in Claude
reaches LinkedIn on its own. This repo is the two halves that make it
work, wired together.

**The read half** is MCP. It lets Claude pull profile data, search
results and post engagers, so the agent researches rather than
guesses.

**The send half** is [Prosp](https://www.prosp.ai). It delivers the
messages, paced under the platform's thresholds, from infrastructure
built for it.

A model driving a browser session on your own account produces
activity from an unusual environment, at machine pace, from an IP
that does not match your history. That is the fastest route to a
restriction, and the account is the asset. Hence two halves.

---

## Install

```bash
git clone https://github.com/JackJProsp/claude-linkedin-connector
cd claude-linkedin-connector
./install.sh
```

For every project rather than this one:

```bash
./install.sh --global
```

Then two things:

1. Fill in `.agents/outreach-context.md`
2. Connect the send half at [prosp.ai](https://www.prosp.ai)

---

## What gets installed

```
.claude/skills/
├── list-builder/          where the list comes from
├── signal-finder/         the dated reason to contact them now
├── fit-filter/            keep, drop, unsure, then grade A to F
├── opener-writer/         the first message
├── sequence-builder/      four touches, node by node
├── merge-prompt-writer/   per-lead personalisation at send time
└── reply-router/          seven categories, escalates when unsure

.agents/outreach-context.md   the file every skill reads
output/                       where everything lands
```

---

## The MCP half

`.mcp.json` ships with two servers configured:

| Server | What it gives Claude |
|---|---|
| LinkupAPI | Profile lookups, search, post engagers |
| Firecrawl | Company sites and pages LinkedIn does not expose |

Start with LinkupAPI alone. It covers everything the skills need to
research a lead.

Keep three to five MCPs active. Each costs context at session start.

---

## Test it works

Two minutes, and it fails loudly if either half is wrong.

```
Test the connector end to end.

1. Using the LinkupAPI MCP, pull the profile at [YOUR LINKEDIN URL].
   Return the headline, the current company, and the date of the
   most recent post.

2. Pull the commenters on this post: [ANY POST URL]. Return the
   count, and the first five names with their headlines.

3. Tell me which of these you could NOT retrieve, and why.

Do not guess or fill gaps. If a field is unavailable, say so.
```

If step 2 returns commenters, the read half is live.

For the send half, import that same post URL into Prosp and check
the lead count matches what Claude reported. If the two numbers
agree, both halves are talking to the same LinkedIn.

---

## Run the whole agent

```
Take ownership of this from start to finish.

Read .agents/outreach-context.md.

GOAL: a launch-ready campaign, with every output in output/.

Run in order: list-builder, signal-finder, fit-filter,
opener-writer, sequence-builder, merge-prompt-writer.

Stop and wait for me at two points only:
- After fit-filter, so I can see the grade before you write copy
- After merge-prompt-writer, before anything is built in the sender

Between those, keep working. Make intermediate decisions and note
them rather than checking in.

Hard rules:
- Never invent a number, client name or result. Only what is in
  outreach-context.md.
- Grade the list before writing. Below B, rebuild rather than
  proceed.
- Never propose a send volume above my daily ceiling.

End with the two things I need to review and the daily send split.
```

Two stops, not six. The list grade and the final copy are the only
two decisions worth interrupting for. Everything between them is
reversible by editing a file.

---

## The ceiling

Every skill here is built inside one constraint rather than
pretending it away.

| Action | Free | Premium / Sales Nav |
|---|---|---|
| Connection requests | 20/day, 100/week | 30 to 50/day |
| Direct messages | ~100/week | ~150/week |
| Profile views | 80/day | 150/day |
| Comments | 60/day | 60/day |

**These are account-wide, not per campaign.** Three campaigns set to
20 each means the account attempts 60 a day. Split it: 10 + 5 + 5,
set per campaign.

Connection request limits and message limits are separate buckets,
so both run at full allocation at once. When LinkedIn caps an
account, only connection requests pause, and it resets in 2 to 3
days.

---

## Five ways this goes wrong

1. **Three campaigns at 20 each.** Limits are account-wide.
2. **A wait node after the connection request.** Acceptance
   auto-detects over two weeks. The wait node only slows it.
3. **Launching on a C-grade list.** Rebuilding costs an afternoon.
   A bad month costs a month.
4. **Changing three things after a bad week.** Then you know
   nothing. One change, always.
5. **Following up someone who already booked.** Tag on the booking,
   every time.

---

## Licence

MIT. Fork it, change the skills, ship your own version.

Built by [Prosp](https://www.prosp.ai).
