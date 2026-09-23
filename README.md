# Autofirma-2026

Fork / meta-repositorio comunitario sobre el [Cliente @firma (Autofirma)](https://github.com/ctt-gob-es/clienteafirma) del CTT.

**Objetivo rector:** cliente construible, auditable y sustituible respecto a Autofirma **1.9.x** — mismos formatos, mismo `afirma://`, reintegración upstream. Licencia **GPL 2+ / EUPL 1.1**.

## Documentos

| Doc | Contenido |
|-----|-----------|
| [propuesta-autofirma-2026.md](propuesta-autofirma-2026.md) | Manifiesto / programa corregido |
| [docs/ESTADO-FASES.md](docs/ESTADO-FASES.md) | Estado F0–F10 |
| [docs/CIUDADANO.md](docs/CIUDADANO.md) | Qué firma y qué no |
| [docs/F10-UPSTREAM.md](docs/F10-UPSTREAM.md) | Seguimiento de PRs/issues |

## Arranque rápido

```bash
export JAVA_HOME=$PWD/tools/jdk8   # tras descargar Temurin 8 en tools/
export PATH=$PWD/tools/apache-maven-3.9.9/bin:$JAVA_HOME/bin:$PATH
cd clienteafirma && mvn -B clean install -DskipTests -Denv=install
bash ../scripts/f2-regression.sh
bash ../scripts/f3-release.sh
bash ../scripts/f6-package-linux.sh
```

Atribución: Agencia Estatal de Administración Digital / CTT.
