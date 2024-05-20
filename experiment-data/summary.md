# Experiment Data Results

Baseline:
p50: 1.57ms
p90: 1.74ms
p95: 1.82ms
p99: 2.09ms

LinkerD mTLS (no auth):
p50: 4.48ms
p90: 4.98ms
p95: 5.19ms
p99: 5.88ms

LinkerD mTLS + L4 auth:
p50: 4.19ms
p90: 4.65ms
p95: 4.85ms
p99: 5.51ms

LinkerD mTLS + L4/L7 auth:
p50: 4.12ms
p90: 4.49ms
p95: 4.66ms
p99: 5.18ms

1.21.0 Ambient mTLS 450RPS (no auth)
p50: 2.65ms
p90: 2.95ms
p95: 3.08ms
p99: 3.49ms

1.22.0 Ambient mTLS 450RPS (no auth)
p50: 2.36ms
p90: 2.56ms
p95: 2.67ms
p99: 2.96ms

Ambient mTLS 600RPS (no auth):
p50: 2.52ms
p90: 2.83ms
p95: 2.98ms
p99: 3.45ms

Ambient mTLS + L4 auth:
p50: 2.54ms
p90: 2.77ms
p95: 2.89ms
p99: 3.23ms

Ambient mTLS + L4/L7 auth:
p50: 5.57ms
p90: 6.33ms
p95: 6.65ms
p99: 7.72ms

Istio Sidecar mTLS (no auth):
p50: 6.38ms
p90: 7.11ms
p95: 7.54ms
p99: 9.27ms