#!/usr/bin/env bash
set -euo pipefail

SCOPE="${1:-project}"

if [ "$SCOPE" = "--global" ]; then
  SKILL_DIR="$HOME/.claude/skills"
  AGENT_DIR="$HOME/.agents"
else
  SKILL_DIR=".claude/skills"
  AGENT_DIR=".agents"
fi

echo "Installing the Claude to LinkedIn connector"
echo "Scope: $SCOPE"
echo ""

mkdir -p "$SKILL_DIR" "$AGENT_DIR" output

for s in skills/*/; do
  name=$(basename "$s")
  mkdir -p "$SKILL_DIR/$name"
  cp "$s/SKILL.md" "$SKILL_DIR/$name/SKILL.md"
  echo "  installed  $name"
done

if [ ! -f "$AGENT_DIR/outreach-context.md" ]; then
  cp templates/outreach-context.md "$AGENT_DIR/outreach-context.md"
  echo "  created    $AGENT_DIR/outreach-context.md"
else
  echo "  skipped    $AGENT_DIR/outreach-context.md already exists"
fi

echo ""
echo "Seven skills installed."
echo ""
echo "Two things left:"
echo "  1. Fill in $AGENT_DIR/outreach-context.md"
echo "  2. Connect the send half at https://www.prosp.ai"
echo ""
echo "Then run the connector test in the README."
