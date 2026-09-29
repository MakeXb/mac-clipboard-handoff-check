#!/bin/zsh
# Creates a harmless plain-text marker for a manual two-Mac paste test.
# Does not read the existing clipboard or use the network.

set -eu

if ! command -v pbcopy >/dev/null 2>&1; then
  print -u2 'pbcopy is required; run this script on macOS.'
  exit 1
fi

timestamp=$(date -u '+%Y%m%dT%H%M%SZ')
marker="MAC-HANDOFF-${timestamp}-${RANDOM}"

printf '%s' "$marker" | pbcopy
print "Copied this marker to this Mac's clipboard: $marker"
print 'Paste it into a blank text document on the other Mac, then compare exactly.'
print 'Run the test again in the opposite direction with a new marker.'
