# MVP operativo — Autofirma-2026

**Estado:** meta-repositorio con CI auditable, vectores F2 y build reproducible de Autofirma **1.9.1** desde fuente pública.

Este MVP no sustituye la descarga oficial ni la plataforma `@firma`. Ofrece lo que el canal gubernamental de código abierto no entrega de forma operativa: **compilar, verificar y empaquetar** el cliente con evidencia pública.

## Qué incluye (definición de “operativo”)

| Capacidad | Cómo |
|-----------|------|
| Línea base fijada | `docs/BASELINE.txt` + SHA en CI |
| Build JDK 8 | `scripts/mvp.sh` o CI `build-baseline` |
| JAR Autofirma | `clienteafirma/afirma-simple/target/autofirma.jar` |
| No-regresión firma | `scripts/f2-validate.sh` (vectores + harness) |
| Empaquetado Linux | `scripts/f6-package-linux.sh` / `packaging/` |
| Cadena de suministro CI | Actions **pinneadas por SHA**, Dependabot, actionlint |
| Evidencia local | `dist/MVP-EVIDENCE.txt` tras `scripts/mvp.sh` |

## Arranque en un comando

```bash
# Requisitos: JDK 8 + Maven (o bajo ./tools/), red para clonar CTT
bash scripts/mvp.sh
```

Opciones:

- `--skip-clone` si ya tienes `clienteafirma` en el SHA de baseline
- `--skip-package` si solo quieres build + F2

## Contra el desfase oficial (hechos, no eslóganes)

| Problema observado en el ecosistema oficial | Respuesta de este MVP |
|---------------------------------------------|------------------------|
| Binarios 1.9.x sin release GitHub versionada del código | Baseline SHA pública + script de release local (`f3-release.sh`) |
| Maven Central en 1.8.2 desfasado | Build desde fuente 1.9.1 pinneada |
| Sin CI pública en el cliente | Workflow `build-baseline` (build + F2 + tests + SBOM) |
| Dependencias cripto antiguas (SpongyCastle) sin plan visible | Inventario F4; migración BC diferida detrás de F2 |
| Confianza TLS relajada en código | Documentado; no se cambia el default a ciegas (rompe sedes) |
| Empaquetado Linux solo en portal | Scripts comunitarios DEB/RPM + portal `afirma://` de prueba |

## Qué NO es el MVP

- No es un sustituto legal de la descarga en [firmaelectronica.gob.es](https://firmaelectronica.gob.es/descargas) para trámites que exijan el instalador firmado por el Estado.
- No migra SpongyCastle → BouncyCastle (oleada 2 / issue upstream [#572](https://github.com/ctt-gob-es/clienteafirma/issues/572)).
- No construye Integr@ completo (bloqueado por iText legacy HTTP).
- No valida certificados en la plataforma `@firma` / VALIDe (fuera de alcance del cliente).

## Verificación rápida

```bash
# Tras mvp.sh
test -f clienteafirma/afirma-simple/target/autofirma.jar
test -f dist/MVP-EVIDENCE.txt
bash scripts/f2-validate.sh   # si ya construiste
```

CI verde en `master` = misma puerta que el ciudadano/desarrollador puede reproducir en local.

## Siguiente (post-MVP)

1. Migración BouncyCastle con F2 verde (v0.2.0).
2. Preferencia TLS strict opt-in.
3. Sesión EN 301 549 / a11y.
4. AppImage + smoke trifásico documentado.

Ver [ESTADO-FASES.md](ESTADO-FASES.md) y el plan de oleadas en `.cursor/plans/`.
