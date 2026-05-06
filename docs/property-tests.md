# Property Tests

The property checks for `helix-trade-backtest-pipe` focus on score movement, not broad snapshots.

The score rule for this repository weighs signal by 2, slack by 1, confidence by 2, and drag by 4. The important properties are monotonic signal, drag penalty, threshold consistency, and fixture id stability.

Run `powershell -NoProfile -ExecutionPolicy Bypass -File scripts/verify.ps1` from the repository root.
