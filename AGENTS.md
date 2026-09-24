## Learned User Preferences

- Responder en español; labels, workflows, commits y nombres de checks en inglés técnico cuando aplique a GitHub/CI.
- Al implementar un plan de Cursor: no editar el fichero del plan; reutilizar los to-dos ya creados y completarlos hasta el final.
- Antes de mutaciones de plataforma (crear repo remoto, push inicial, publicación), pedir confirmación explícita y proceder solo tras un sí.
- Documentación orientada a contraste con Autofirma oficial (tablas comparativas) y a objetivos comprobables por fase.
- Los planes deben recuperar el programa original con revisión crítica (correcciones, ampliaciones y adiciones) antes de ejecutar oleadas nuevas.

## Learned Workspace Facts

- Meta-repositorio comunitario Autofirma-2026: cliente construible/auditable/sustituible respecto a Autofirma 1.9.x (mismos formatos y protocolo `afirma://`); no sustituye `@firma`, VALIDe, TS@, Port@firmas ni Cl@ve.
- Remoto público: `https://github.com/Alexendros/Autofirma-2026`; rama por defecto `master`.
- Clones locales `clienteafirma/`, `integra/`, `fire/`, toolchains en `tools/` y `dist/` están en `.gitignore` y no van al meta-repo.
- CI debe hacer checkout de `ctt-gob-es/clienteafirma` en el SHA de `docs/BASELINE.txt` (línea 1.9.1); no asumir el árbol local `clienteafirma/` en Actions.
- Programa por fases F0–F10; estado en `docs/ESTADO-FASES.md`; manifiesto en `propuesta-autofirma-2026.md`.
- Migración SpongyCastle→BouncyCastle aplazada hasta F2 verde; no endurecer TLS/`disableSslChecks` por defecto sin preferencia explícita.
- Seguimiento upstream: issue `ctt-gob-es/clienteafirma#572`; licencia conservada GPL-2.0+ / EUPL-1.1.
