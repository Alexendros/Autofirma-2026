# Autofirma-2026

Meta-repositorio comunitario sobre el [Cliente @firma / Autofirma](https://github.com/ctt-gob-es/clienteafirma) del **CTT** (Agencia Estatal de Administración Digital).

**Objetivo rector:** un cliente **construible, auditable y sustituible** respecto a Autofirma **1.9.x** — mismos formatos de firma, mismo protocolo `afirma://`, reintegración upstream. No sustituye la plataforma `@firma` ni VALIDe.

**MVP operativo:** [docs/MVP.md](docs/MVP.md) — un comando: `bash scripts/mvp.sh`

[![License: GPL-2.0+ OR EUPL-1.1](https://img.shields.io/badge/license-GPL--2.0%2B%20%7C%20EUPL--1.1-blue.svg)](LICENSE)
[![Baseline](https://img.shields.io/badge/baseline-Autofirma%201.9.1-informational.svg)](docs/BASELINE.txt)
[![Upstream](https://img.shields.io/badge/upstream-ctt--gob--es%2Fclienteafirma-success.svg)](https://github.com/ctt-gob-es/clienteafirma)

---

## Comparativa con Autofirma oficial

### Producto y gobernanza

| Aspecto | Autofirma oficial (CTT / AEAD) | Autofirma-2026 (este meta-repo) |
|--------|--------------------------------|----------------------------------|
| Código fuente | [ctt-gob-es/clienteafirma](https://github.com/ctt-gob-es/clienteafirma) | Mismos orígenes; clones locales **no** van en git (ver `.gitignore`) |
| Versión de producto de referencia | Binarios **1.9** / **1.9.1–1.9.2** (macOS) en [firmaelectronica.gob.es](https://firmaelectronica.gob.es/descargas) | Línea de código **1.9.1** (`pom`), commit en [docs/BASELINE.txt](docs/BASELINE.txt) |
| Maven Central | `afirma-client` **1.8.2** (desfasado respecto a binarios) | Build local desde fuente 1.9.1 |
| Releases públicas del código | Sin releases GitHub versionadas del cliente | Release local firmable (`scripts/f3-release.sh`) + meta-repo versionado |
| Roadmap / OT | Mantenimiento por órdenes de trabajo contratadas | Programa F0–F10 público ([docs/ESTADO-FASES.md](docs/ESTADO-FASES.md)) |
| Relación con el Estado | Producto oficial | Continuador técnico; **no** competencia; PRs/issues upstream ([#572](https://github.com/ctt-gob-es/clienteafirma/issues/572)) |
| Licencia | GPL 2+ / EUPL 1.1 | **Se conserva** (requisito de compatibilidad) |

### Tecnología y seguridad

| Aspecto | Oficial (1.9.1 en `master`) | Autofirma-2026 |
|--------|-----------------------------|----------------|
| Target de compilación | Java **1.8** | F1: JDK 8; F5: **runtime JDK 21** verificado con vectores |
| Proveedor cripto | SpongyCastle **1.58** (~72 ficheros) | Inventariado; migración a BouncyCastle **aplazada** hasta F2 verde ([docs/F4](docs/F4-INVENTARIO-CRIPTO.md)) |
| PDF (PAdES) | `afirma-lib-itext` 1.7 (`com.aowagie`) | Sin re-fork; coordinar con `openpdf-afirma` |
| CI abierta | No (en el upstream público) | GitHub Actions: build + vectores + harness de validación |
| SBOM / checksums | No en releases de código | CycloneDX + `SHA256SUMS` (+ GPG si hay clave) |
| Tests de no-regresión | Unitarios en módulos; sin puerta de vectores F2 | `scripts/f2-regression.sh` + `tests/validation-harness` |
| Trust TLS por defecto | Incluye `disableSslChecks` / dummy trust | **Documentado**; no se endurece el default a ciegas |

### Compatibilidad funcional (debe mantenerse)

| Capacidad | Oficial | Autofirma-2026 (objetivo / estado) |
|-----------|---------|-------------------------------------|
| CAdES / XAdES / PAdES / FacturaE | Sí | Sí — vectores F2 |
| Cofirma / contrafirma | Sí | Sí — vectores F2 |
| Protocolo `afirma://` | Sí | Sí — `.desktop` + portal de prueba F6 |
| Servidor trifásico | WAR 2.9.x | WAR **2.9.1** construido; Jakarta en línea aparte |
| DNIe | jmulticard / OpenSC | Guion hardware; **no** en CI |
| Validación de certificados (plataforma) | No (es `@firma` / VALIDe) | Igual: solo integridad local de firmas |
| Linux `.deb` / `.rpm` | Oficiales en portal de descargas | Empaquetado comunitario F6 (`packaging/`) |

### Alcance: qué es y qué no es

| Sí | No |
|----|-----|
| Cliente de escritorio + WAR trifásico del repo `clienteafirma` | Plataforma `@firma` federada, VALIDe, TS@, Port@firmas, Cl@ve |
| Integr@ / FIRe como pista (F9) | Reimplementar validación estatal |
| Documentación ciudadana y de ingeniería | Telemetría o servidores propios obligatorios |

---

## Contenido de este repositorio

| Ruta | Descripción |
|------|-------------|
| [propuesta-autofirma-2026.md](propuesta-autofirma-2026.md) | Manifiesto / programa corregido |
| [docs/](docs/) | Fases, inventario cripto, accesibilidad, upstream, ciudadano |
| [scripts/](scripts/) | Build, vectores, validación, release, paquetes Linux |
| [tests/validation-harness/](tests/validation-harness/) | Tests de integridad de firmas |
| [vectors/](vectors/) | Entradas y manifiesto F2 (salidas regenerables) |
| [packaging/](packaging/) | Portal `afirma://` y staging DEB/RPM |
| [.github/workflows/](.github/workflows/) | CI de línea base |

Clones locales recomendados (no versionados): `clienteafirma`, `integra`, `fire`; toolchains en `tools/` (JDK 8/21, Maven).

---

## Arranque rápido

```bash
# MVP: clona baseline, construye, valida F2, deja evidencia en dist/
bash scripts/mvp.sh

# O paso a paso:
# 1) Toolchain: Temurin 8 (+ Maven) bajo ./tools/ o del sistema
# 2) git clone https://github.com/ctt-gob-es/clienteafirma.git clienteafirma
# 3) mvn -B clean install -DskipTests -Denv=install  (en clienteafirma, JDK 8)
# 4) bash scripts/f2-validate.sh
```

Más detalle: [docs/MVP.md](docs/MVP.md), [docs/VALIDATION-TESTS.md](docs/VALIDATION-TESTS.md), [docs/SETUP.md](docs/SETUP.md).

---

## Documentación esencial

| Documento | Para qué |
|-----------|----------|
| [docs/MVP.md](docs/MVP.md) | Definición y arranque del MVP operativo |
| [docs/CIUDADANO.md](docs/CIUDADANO.md) | Qué firma el programa y qué no |
| [docs/SETUP.md](docs/SETUP.md) | Entorno, clones y builds |
| [docs/ESTADO-FASES.md](docs/ESTADO-FASES.md) | Estado F0–F10 |
| [docs/VALIDATION-TESTS.md](docs/VALIDATION-TESTS.md) | Suites de validación |
| [docs/F4-INVENTARIO-CRIPTO.md](docs/F4-INVENTARIO-CRIPTO.md) | SpongyCastle / iText / TLS |
| [docs/F10-UPSTREAM.md](docs/F10-UPSTREAM.md) | Issues/PRs hacia el CTT |
| [CHANGELOG.md](CHANGELOG.md) | Historial del meta-repo |
| [CONTRIBUTING.md](CONTRIBUTING.md) | Cómo contribuir |
| [SECURITY.md](SECURITY.md) | Divulgación de vulnerabilidades |
| [LICENSE](LICENSE) | GPL-2.0+ / EUPL-1.1 |

---

## Versión del meta-repo

Este repositorio versiona **documentación, scripts y harness**, no sustituye el número de producto Autofirma 1.9.1.

- Tag actual del meta-repo: ver [Releases](https://github.com/Alexendros/Autofirma-2026/releases)
- Esquema: SemVer del meta-proyecto (`v0.y.z`); la línea de producto upstream se indica en `docs/BASELINE.txt`

---

## Atribución

Código y producto Autofirma: **Agencia Estatal de Administración Digital / Centro de Transferencia de Tecnología**, licencia dual **GPL 2+ / EUPL 1.1**.

Autofirma-2026: trabajo comunitario de documentación, CI y validación sobre esa base.
