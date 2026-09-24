# Contributing to Autofirma-2026

### Propósito de este documento

- **Objetivos:** Explicar setup, flujo de rama/PR y reglas para contribuir sin romper formatos Autofirma 1.9.x ni el protocolo `afirma://`.
- **Estructura:** Principios → workflow → commits → qué no commitear → conducta.
- **Contenido a integrar según contexto:** Adapta Make y scripts de este meta-repo. No copies un flujo npm/monorepo. El build de `clienteafirma` y `scripts/f2-regression.sh` viven en `build-baseline`; no son required del job `test` ligero.

Idioma: este fichero, `README.md` y `docs/` en español cuando el lector es ciudadano o contribuidor. Identificadores de CI y nombres de jobs en inglés (`quality`, `test`, `smoke`).

## Principles

1. **Do not break** Autofirma 1.9.x formats or `afirma://` without F2 vectors green.
2. **Prefer upstream**: generic fixes → propose to [ctt-gob-es/clienteafirma](https://github.com/ctt-gob-es/clienteafirma) (see [docs/F10-UPSTREAM.md](docs/F10-UPSTREAM.md)).
3. **Keep the dual licence** GPL-2.0+ / EUPL-1.1 for code that ships with the client.
4. **No secrets** in the tree (tokens, production certs, private keys).

## Workflow

1. Fork / branch from `master`.
2. Always: `make quality && make test && make smoke` (fachada del meta-repo; no clona upstream).
3. For crypto or packaging changes: run `bash scripts/f2-regression.sh` and `cd tests/validation-harness && mvn -B test -Dvectors.dir=$PWD/../../vectors` (requiere `autofirma.jar` de la línea base).
4. Open a PR against this meta-repo with a short “why” and link to the phase (F1–F10).
5. English for CI identifiers and commit subjects is fine; Spanish for docs aimed at citizens is preferred.

## Commit messages

Conventional Commits encouraged:

- `docs:` documentation
- `test:` validation harness / vectors
- `ci:` workflows
- `chore:` tooling, ignore rules
- `feat:` / `fix:` only when they change scripts or harness behaviour

## What not to commit

- `tools/`, `clienteafirma/`, `integra/`, `fire/`, `dist/`, `vectors/out/`, `** /target/`

## Code of conduct (short)

Be respectful. This is public-interest software used in mandatory procedures; assume good faith and prioritise citizen safety over clever hacks.
