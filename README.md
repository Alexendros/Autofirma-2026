# Autofirma-2026 (archivado)

### Propósito de este documento

- **Objetivos:** Indicar que este meta-repositorio histórico está **archivado** y redirigir al monorepo canónico.
- **Estructura:** Aviso → destino canónico → qué quedó aquí.
- **Contenido a integrar según contexto:** No uses este repo para desarrollo nuevo. Conserva el enlace a licencia y al fork canónico.

> **Canónico:** [`Alexendros/clienteafirma`](https://github.com/Alexendros/clienteafirma) — código Autofirma 1.9.x + programa comunitario F0–F10 (vectores, packaging, gates, Archify).

Este repositorio (`Alexendros/Autofirma-2026`) fue el meta comunitario previo. Su contenido se absorbió en el fork y el remoto queda **archivado** (solo lectura).

| Antes (meta) | Ahora (monorepo) |
|--------------|------------------|
| Docs / fases / MVP | [`docs/`](https://github.com/Alexendros/clienteafirma/tree/master/docs) |
| Scripts / vectores / packaging | raíz de `clienteafirma` |
| CI `quality`/`test`/`smoke` + baseline | CI del fork + `build-baseline` |

Arranque:

```bash
git clone https://github.com/Alexendros/clienteafirma.git
cd clienteafirma
bash scripts/mvp.sh
```

Licencia: GPL-2.0+ / EUPL-1.1 (sin cambio).
