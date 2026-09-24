# Changelog

All notable changes to the **Autofirma-2026 meta-repository** are documented here.

Format based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/).
This project (meta-repo) adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).
The Autofirma **product** version remains **1.9.1** (see `docs/BASELINE.txt`).

## [Unreleased]

### Planned

- Session EN 301 549 with Orca on the three signing flows (F7)
- SpongyCastle → BouncyCastle migration behind F2 gate (F4 / upstream #572)

## [0.1.1] — 2026-09-24

### Added

- MVP operativo documentado (`docs/MVP.md`) y orquestador `scripts/mvp.sh`
- Workflow `workflow-lint` (actionlint con checksum de release)
- Dependabot para GitHub Actions y el harness Maven

### Security

- GitHub Actions pinneadas por SHA completo (`checkout` v7.0.1, `setup-java` v6.0.1, `upload-artifact` v7.0.1, `download-artifact` v8.0.1)
- `permissions: contents: read` y `timeout-minutes` en todos los jobs de CI

### Changed

- Baseline CI alineada con Actions actuales pinneadas; artefacto Maven restaurado entre jobs

## [0.1.0] — 2026-09-23

### Added

- Corrected programme manifesto (`propuesta-autofirma-2026.md`) and phase docs F0–F10
- Baseline tracking for clienteafirma **1.9.1**
- F2 regression script and vector inputs/manifest
- Validation harness (integrity + negative cases) and `scripts/f2-validate.sh`
- CI workflow skeleton (build, vectors, upstream unit tests, SBOM job)
- Linux packaging scripts and `afirma://` test portal
- Citizen-facing and security documentation
- Comparative README vs official Autofirma

### Known limits

- OpenPDF migration blocked; SpongyCastle retained pending gated migration
- Integr@ full reactor blocked by legacy HTTP iText coordinate
- Meta-repo does not vendor upstream source trees

[Unreleased]: https://github.com/Alexendros/Autofirma-2026/compare/v0.1.1...HEAD
[0.1.1]: https://github.com/Alexendros/Autofirma-2026/releases/tag/v0.1.1
[0.1.0]: https://github.com/Alexendros/Autofirma-2026/releases/tag/v0.1.0
