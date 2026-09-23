# Setup — Autofirma-2026

## Requirements

| Tool | Version | Notes |
|------|---------|--------|
| Git | 2.x | Clones upstream |
| JDK | **8** (build F1), **21** optional (runtime F5) | Temurin recommended under `tools/` |
| Maven | 3.9+ | Portable under `tools/apache-maven-*` |
| Linux | glibc x86_64 | Primary packaging target |

## Clone upstream projects (local only)

```bash
git clone --depth 1 https://github.com/ctt-gob-es/clienteafirma.git clienteafirma
git clone --depth 1 https://github.com/ctt-gob-es/integra.git integra   # optional F9
git clone --depth 1 https://github.com/ctt-gob-es/fire.git fire         # optional F9
```

Record the clienteafirma commit in `docs/BASELINE.txt` when you refresh the clone.

## Build Autofirma (product line)

```bash
export JAVA_HOME=$PWD/tools/jdk8
export PATH=$PWD/tools/apache-maven-3.9.9/bin:$JAVA_HOME/bin:$PATH
cd clienteafirma
mvn -B clean install -DskipTests -Denv=install
# Artifact: afirma-simple/target/autofirma.jar
```

## Validate

```bash
bash scripts/f2-regression.sh
cd tests/validation-harness && mvn -B test -Dvectors.dir=$PWD/../../vectors
```

Or: `bash scripts/f2-validate.sh` (includes upstream unit suites).

## Package Linux (optional)

```bash
bash scripts/f6-package-linux.sh
# Open packaging/portal-prueba/index.html to exercise afirma:// after install
```

## JDK 21 runtime check

```bash
export JAVA_HOME=$PWD/tools/jdk21
bash scripts/f2-regression.sh
```
