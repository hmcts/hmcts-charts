# docmosis-docmosis-unified

Helm chart used by the Jenkins pipeline to deploy `docmosis/docmosis-unified` to preview (PRs) and AAT (master) for verification. It wraps the generic `base` chart (1.4.2, `language: java`).

- Environment variables come from the existing `docmosis-secret` in the `docmosis` namespace (`envFromSecret`). It is managed by Flux and only read here; it must exist in the target cluster.
- The chart does not mount templates. Templates are mounted from Azure Storage via Flux, not through this chart.
- Bump `version` in `Chart.yaml` on every PR; the pipeline enforces this.
