# Mac clipboard handoff check

A small, privacy-minded test for people who move between two Macs. The script creates a harmless text marker on the Mac where you run it, writes **only that marker** to the current clipboard with `pbcopy`, and prints the expected marker. It never reads your previous clipboard contents, changes system settings, or sends data to a server.

## Quick test

1. On Mac A, review `make-marker.zsh`, then run `zsh make-marker.zsh`. The script prints a marker beginning `MAC-HANDOFF-` and puts that same marker on Mac A's clipboard.
2. Without copying anything else on Mac A, paste into a blank text document on Mac B. Compare the pasted text character for character with Mac A's printed marker.
3. Repeat from Mac B to Mac A. Test each direction separately.
4. If your workflow also needs older copies, make a second harmless marker on the **same** Mac and check its local history. A successful current-item paste on another Mac does not prove that older history is shared.

The test is intentionally limited to plain text. A successful result does not prove that images, files, or folders will transfer. A failed paste does not identify the cause by itself: check the devices' network and account requirements, whether a clipboard app is paired and active, and whether either Mac copied a newer item after the marker.

## What the result means

| Observation | Useful next check |
| --- | --- |
| Marker pastes on both Macs | Current text handoff works at the time of this test. Test the content types you actually need separately. |
| Marker pastes only in one direction | Check the receiving Mac's connection, active group, and sync settings, then create a fresh marker in the failing direction. |
| Marker stays only on its original Mac | Check both Macs' connectivity and the requirements of the specific sync method. Do not treat this as a history failure. |
| A previous marker is missing from history | Check history recording, retention, content exclusions, and the original Mac. |

Apple's [Universal Clipboard requirements](https://support.apple.com/en-us/102430) apply when using that built-in feature. If you use Deskferry, the [Mac clipboard sync guide](https://deskferry.net/mac-clipboard-sync/) explains pairing and content-type limits. Deskferry syncs new copies between approved Macs in the same active group; its [Mac clipboard history guide](https://deskferry.net/mac-clipboard-history/) covers earlier items stored locally on each Mac. Deskferry's Mac App Store release is still in preparation, so consult the site for current availability.

## Privacy and limits

Run this only on Macs you own or administer. Use the generated marker rather than a password, token, customer document, or private image. The marker may be retained by any clipboard-history app already running on the source Mac; delete the test entry if you do not need it. `pbcopy` replaces the current clipboard item, so finish or save anything important before running the script.

This repository is maintained by the Deskferry team as a practical troubleshooting aid. It is not a benchmark of any clipboard product.
