# Contributing to Autofirma-2026

## Principles

1. **Do not break** Autofirma 1.9.x formats or `afirma://` without F2 vectors green.
2. **Prefer upstream**: generic fixes → propose to [ctt-gob-es/clienteafirma](https://github.com/ctt-gob-es/clienteafirma) (see [docs/F10-UPSTREAM.md](docs/F10-UPSTREAM.md)).
3. **Keep the dual licence** GPL-2.0+ / EUPL-1.1 for code that ships with the client.
4. **No secrets** in the tree (tokens, production certs, private keys).

## Workflow

1. Fork / branch from `master`.
2. For crypto or packaging changes: run `bash scripts/f2-regression.sh` and `cd tests/validation-harness && mvn -B test -Dvectors.dir=$PWD/../../vectors`.
3. Open a PR against this meta-repo with a short “why” and link to the phase (F1–F10).
4. English for CI identifiers and commit subjects is fine; Spanish for docs aimed at citizens is preferred.

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
