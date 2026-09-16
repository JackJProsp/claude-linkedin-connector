---
name: reply-router
description: Classify every inbound reply and route it. Runs continuously on the cheapest model. Use on every reply before drafting a response.
---

# Reply Router

## Categories, exactly one per reply

```
INTERESTED       Wants more, asks about the offer
TIMING           Interested, not now. Capture the date named.
OBJECTION        Price, fit, incumbent, capacity
WRONG_PERSON     Not their remit. Ask who owns it.
NOT_INTERESTED   Clear no. Thank them, stop, never pitch again.
AUTO_REPLY       Out of office. Reschedule to their return date.
ESCALATE         Anything below 8 confidence
```

Per reply: category, confidence 1 to 10, the sentence that decided
it, and the recommended next action.

## Rules

Below 8 confidence, always ESCALATE. Do not guess at tone. Sarcasm,
brevity and politeness all read the same in text.

Draft the reply for INTERESTED and OBJECTION, but never auto-send.
A human presses send on anything going out under their name.

Never auto-send to NOT_INTERESTED. A human closes that loop.

## For INTERESTED, decide IF before HOW

Ask for the meeting when they have named a problem, asked about
price or timeline, or two substantive messages have gone each way.

On a one-line reply, do not ask. Ask one more question that gets
them to name the problem.

## The ask

Name the length and the agenda. "15 minutes, three questions, no
deck." Offer the link AND two concrete times. Never "let me know
what works", because decision fatigue kills bookings.

Under 350 characters including the link.

After sending, tag the lead so the sequence stops. A follow-up
landing after someone has booked is the most avoidable bad
impression in the system.

## For OBJECTION

Read the objections list in `.agents/outreach-context.md` first. If
it is there, use the agreed response rather than inventing one.

Three moves: agree with the part that is true, add the one thing
they do not know, ask a question that moves it forward.

Never invent a number or comparison to answer an objection.
