# helix-trade-backtest-pipe

`helix-trade-backtest-pipe` explores trading systems with a small Zig codebase and local fixtures. The technical goal is to design a Zig verification harness for backtest systems, covering state machine modeling, transition tables, and failure-oriented tests.

## Problem It Tries To Make Smaller

This is intentionally local and self-contained so it can be inspected without credentials, services, or seeded history.

## Helix Trade Backtest Pipe Review Notes

For a quick review, compare `portfolio drift` with `spread pressure` before reading the middle cases.

## Working Pieces

- `fixtures/domain_review.csv` adds cases for spread pressure and fill risk.
- `metadata/domain-review.json` records the same cases in structured form.
- `config/review-profile.json` captures the read order and the two review questions.
- `examples/helix-trade-backtest-walkthrough.md` walks through the case spread.
- The Zig code includes a review path for `portfolio drift` and `spread pressure`.
- `docs/field-notes.md` explains the strongest and weakest cases.

## Design Notes

The implementation keeps the scoring rule plain: reward signal and confidence, preserve slack, penalize drag, then classify the result into a review lane.

The Zig implementation avoids hidden state so fixture changes are easy to reason about.

## Example Run

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File scripts/verify.ps1
```

## Tests

The same command runs the local verification path. The highest-scoring domain case is `edge` at 216, which lands in `ship`. The most cautious case is `stale` at 175, which lands in `ship`.

## Known Limits

This remains a local project with deterministic fixtures. It does not depend on credentials, hosted services, or live data. Future work should add richer malformed inputs before widening the public API.
