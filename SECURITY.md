# Security Policy

### Propósito de este documento

- **Objetivos:** Declarar versiones soportadas, el canal privado de avisos y la superficie (scripts, CI, harness, clones locales).
- **Estructura:** Versiones soportadas → cobertura → cómo reportar → no-objetivos.
- **Contenido a integrar según contexto:** Adapta versiones del meta-repo y el baseline 1.9.1. No copies la política de un SaaS. No pegues claves, P12 de producción ni tokens en issues públicos.

## Supported versions (meta-repo)

| Version | Supported |
|---------|-----------|
| `v0.1.x` (meta-repo docs/scripts) | Yes |
| Autofirma product line 1.9.1 (upstream code you build locally) | Follow CTT guidance; this project tracks that baseline |

## What this project covers

- Scripts, CI, documentation and the local validation harness in **this** repository.
- Issues found while building or validating [ctt-gob-es/clienteafirma](https://github.com/ctt-gob-es/clienteafirma) against the Autofirma-2026 programme.

## Reporting a vulnerability

1. **Do not** open a public issue for vulnerabilities that could put citizens’ signatures or private keys at risk.
2. Prefer email to the maintainer of this fork (GitHub account [Alexendros](https://github.com/Alexendros)) via GitHub Security Advisories on this repository when enabled, or a private contact channel listed on the profile.
3. For defects clearly in **official** Autofirma / `@firma`, also notify the upstream maintainers (`soporte.afirma@correo.gob.es` as published by AEAD) and/or open a carefully worded upstream issue **without** exploit details.

Please include: affected commit/baseline (`docs/BASELINE.txt`), OS, JDK, steps to reproduce, and impact.

## Non-goals

This project does not operate VALIDe, `@firma` production services, or a national TSA. Certificate revocation against production CAs is out of local CI scope.
