# Review Journal

The review surface for `helix-trade-backtest-pipe` is deliberately narrow: one fixture, one scoring rule, and one local check.

The local checks classify each case as `ship`, `watch`, or `hold`. That gives the project a small review vocabulary that matches its trading systems focus without claiming live deployment or external usage.

## Cases

- `baseline`: `spread pressure`, score 204, lane `ship`
- `stress`: `fill risk`, score 180, lane `ship`
- `edge`: `portfolio drift`, score 216, lane `ship`
- `recovery`: `quote width`, score 201, lane `ship`
- `stale`: `spread pressure`, score 175, lane `ship`

## Note

The repository should be understandable without pretending it is larger than it is.
