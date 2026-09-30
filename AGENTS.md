## Learned User Preferences

- Responder en español; labels, workflows, commits y nombres de checks en inglés técnico cuando aplique a GitHub/CI.
- Al implementar un plan de Cursor: no editar el fichero del plan; reutilizar los to-dos ya creados y completarlos hasta el final.
- Antes de mutaciones de plataforma (crear repo remoto, push inicial, publicación), pedir confirmación explícita y proceder solo tras un sí.
- Documentación orientada a contraste con Autofirma oficial (tablas comparativas) y a objetivos comprobables por fase; en revisiones amplias, informe dual (suite Archify HTML + markdown claro con tablas).
- Los planes deben recuperar el programa original con revisión crítica (correcciones, ampliaciones y adiciones) antes de ejecutar oleadas nuevas.
- Versionar artefactos Archify bajo `.archify/` en el meta-repo (no añadirlos a `.gitignore`).
- Cuando pida auditorías/revisiones «desde aquí sin subagentes», ejecutarlas en el agente padre y cerrar con gates/tests medibles y evidencia, no solo narrativa.
- En remediaciones post-auditoría: documentar primero playbook, método y tests de validación; implementar después.

## Learned Workspace Facts

- Meta-repositorio comunitario Autofirma-2026: cliente construible/auditable/sustituible respecto a Autofirma 1.9.x (mismos formatos y protocolo `afirma://`); no sustituye `@firma`, VALIDe, TS@, Port@firmas ni Cl@ve.
- Remoto público: `https://github.com/Alexendros/Autofirma-2026`; rama por defecto `master`.
- Clones locales `clienteafirma/`, `integra/`, `fire/`, toolchains en `tools/` y `dist/` están en `.gitignore` y no van al meta-repo.
- CI debe hacer checkout de `ctt-gob-es/clienteafirma` en el SHA de `docs/BASELINE.txt` (línea 1.9.1); no asumir el árbol local `clienteafirma/` en Actions.
- Fachada P0 del meta-repo: `make quality` / `make test` / `make smoke` (no clona ni construye `clienteafirma`). Jobs homónimos en `.github/workflows/ci.yml`.
- MVP operativo (meta v0.1.1): `docs/MVP.md` y `bash scripts/mvp.sh` (evidencia local en `dist/MVP-EVIDENCE.txt`).
- Programa por fases F0–F10; estado en `docs/ESTADO-FASES.md`; manifiesto en `propuesta-autofirma-2026.md`.
- SpongyCastle→BouncyCastle: F2 verde; fork comunitario `Alexendros/clienteafirma` rama `crypto/bouncycastle-jdk18on` (v0.2.0 / CI dual); PR upstream `ctt-gob-es/clienteafirma#573` cerrada sin merge; seguimiento en `#572`. No endurecer TLS/`disableSslChecks` por defecto sin preferencia explícita.
- Licencia conservada GPL-2.0+ / EUPL-1.1.
- Archify (mapas técnicos interactivos): skill en `~/.cursor/skills/archify`; CLI `node ~/.cursor/skills/archify/bin/archify.mjs`. Artefactos versionados bajo `.archify/` (suite canónica de 5 tipos: `architecture`, `workflow`, `sequence`, `dataflow`, `lifecycle`) con texto visible en **español sencillo**; `sources` y paths técnicos en inglés/forma de repo.
- Revisión/remediación 360º: informes `docs/CODE-REVIEW-360.md` (+ R2), playbook `docs/REMEDIATION-360.md`, gates `make review360` / `make review360-r2` / `make remediation360` (evidencia en `dist/`); batería en `docs/VALIDATION-TESTS.md`.
