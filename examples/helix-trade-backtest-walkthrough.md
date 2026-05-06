# Helix Trade Backtest Pipe Walkthrough

I use this file as a small checklist before changing the Zig implementation.

| Case | Focus | Score | Lane |
| --- | --- | ---: | --- |
| baseline | spread pressure | 204 | ship |
| stress | fill risk | 180 | ship |
| edge | portfolio drift | 216 | ship |
| recovery | quote width | 201 | ship |
| stale | spread pressure | 175 | ship |

Start with `edge` and `stale`. They create the widest contrast in this repository's fixture set, which makes them better review anchors than the middle cases.

The next useful expansion would be a malformed fixture around fill risk and quote width.
