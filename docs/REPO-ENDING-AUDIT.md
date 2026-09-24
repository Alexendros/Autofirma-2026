# Readiness report — Autofirma-2026 — 2026-09-24

**Veredicto:** CONDITIONAL GO (MVP meta-repo)

**Modo:** remediación parcial tras auditoría 2026-09-23  
**Repo:** https://github.com/Alexendros/Autofirma-2026 (público)

## Resumen

El bloqueo SEV-1 (sin git/remoto) está **resuelto**. CI de línea base existe y ha corrido en GitHub Actions. En **v0.1.1** se cierran los gaps de cadena de suministro del meta-repo: Actions pinneadas por SHA, actionlint, Dependabot, MVP documentado y orquestado.

## Estado por fase

| Fase | Estado | Notas |
|---|---|---|
| A. Etiquetado | GO parcial | Tags `v0.1.0` / `v0.1.1`; labels GitHub opcionales |
| B. Versionado | GO | SemVer meta + `CHANGELOG.md`; producto = 1.9.1 en `BASELINE.txt` |
| C. Dependencias y docs | GO | `SECURITY.md`, `LICENSE`, `docs/MVP.md`, Dependabot |
| D. Pipeline | GO condicional | SHA pins + actionlint; **falta** branch protection en `master` (manual en settings) |
| E. Producción | N/A | Sin despliegue de servicio; artefacto = JAR/DEB local + CI artifacts |

## Remediación aplicada (v0.1.1)

- `actions/checkout@3d3c42e5…` (#v7.0.1)
- `actions/setup-java@de7274f0…` (#v6.0.1)
- `actions/upload-artifact@043fb46d…` (#v7.0.1)
- `actions/download-artifact@3e5f45b2…` (#v8.0.1)
- Workflow `workflow-lint.yml` (actionlint 1.7.7 + checksums oficiales)
- `.github/dependabot.yml`
- `scripts/mvp.sh` + `docs/MVP.md`

## Pendiente (no bloquea MVP)

1. **Branch protection** en `master`: require PR, require status checks (`build-linux-jdk8`, `f2-vectors`, `actionlint`).
2. Security Advisories privadas (settings del repo).
3. Oleada 2: SpongyCastle → BC (upstream #572).
4. Issue Integr@ AF2026-6 si se abre tracking formal.

## Cómo reproducir el MVP

```bash
bash scripts/mvp.sh
```

Evidencia en `dist/MVP-EVIDENCE.txt`. Detalle: [MVP.md](MVP.md).
