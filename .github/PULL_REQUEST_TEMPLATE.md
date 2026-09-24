<!-- canon-managed: true -->

### Propósito de este documento

- **Objetivos:** Plantilla de PR para describir el cambio y exigir las comprobaciones `quality` / `test` / `smoke` (Make) y los jobs homónimos de CI.
- **Estructura:** Qué cambia → checklist (Make, docs, artefactos, CI).
- **Contenido a integrar según contexto:** Adapta el checklist a este meta-repo. No copies plantillas de otro producto. `scripts/f2-regression.sh` y el build de `clienteafirma` son opt-in (workflow `build-baseline`), no required del job `test` ligero.

## Qué cambia

<!-- feat/fix/docs + alcance en una o dos frases -->

## Checklist

- [ ] `make quality && make test && make smoke`
- [ ] Si toca crypto o empaquetado: `bash scripts/f2-regression.sh` (requiere JAR de línea base)
- [ ] Docs actualizadas (`README.md`, fase F0–F10 o `docs/ESTADO-FASES.md` si cambia el contrato)
- [ ] Sin clones (`clienteafirma/`, `integra/`, `fire/`), `tools/`, `dist/` ni secretos
- [ ] CI `quality` / `test` / `smoke` en verde
