# Code coverage

Coverage is collected with **Verilator** over a merged database of **20 lockstep-clean seeds**
(`coverage_merged/m1a_farm.dat`), DUT-scoped, on the final frozen RTL. Coverage from any seed that
diverged from Spike or timed out is **never** counted.

Two numbers are reported per metric:

- **Raw** — every coverage point in the DUT, un-waived.
- **In-SKU effective** — raw minus code that is *cold by construction* in the default SKU
  (features disabled in this configuration: PMP with 0 entries, inactive debug trigger,
  address-bound decode arms, out-of-SKU instruction arms). Exclusions are reviewed structural
  waivers under [`../dv/cov/waivers/`](../dv/cov/waivers).

| Metric | Raw | Out-of-SKU / excluded | In-SKU debt | **Effective** |
| --- | --- | --- | --- | --- |
| Line | 318 / 420 (75.7%) | 102 | 0 | **100.0%** (318 / 318) |
| Branch | 309 / 440 (70.2%) | 114 | 17 | **94.8%** (309 / 326) |
| Expr / Cond | 205 / 336 (61.0%) | 121 | 10 | **95.3%** (205 / 215) |
| Toggle | 12704 / 21218 (59.9%) | 7546 <sup>†</sup> | 968 | **92.9%** (12704 / 13672) |

<sup>†</sup> Toggle exclusions: 5833 out-of-SKU + 514 structural + 1199 address-bound.

Defensible bar: 90%. Effective coverage clears it on every metric, and matches or exceeds the M1
baseline (line 90.0, branch 93.1, expr 95.3, toggle 92.4).

## Line 100%

In-SKU line debt is 0 on the final build. This is reached with real stimulus plus reviewed source
pragmas on defensive / reserved-decode arms whose behaviour is directed-verified (illegal-instruction
traps, wait-state paths). See [`../dv/cov/`](../dv/cov) for the coverage bind and the waiver schema.

## Honest disclosure

- Numbers are the *effective* (in-SKU) methodology; the raw percentages are lower and are shown
  above alongside — coverage of features disabled in this SKU is excluded by construction, not
  claimed.
- One dense-injection coverage seed hit a watchdog timeout (non-termination, not a data divergence);
  its coverage is excluded and the line-100% result does not depend on it.
- Correctness authority remains Spike per-commit lockstep; coverage is a completeness measure, not a
  correctness proof.
- Independent DV-lead sign-off of the exclusion lists is **pending**.
