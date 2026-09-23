# F7 — Accesibilidad (EN 301 549 / WCAG)

**Referencia escritorio:** EN 301 549 (no WCAG como estándar primario de Swing).
**Referencia HTML de invocación:** WCAG 2.2 AA.

## Localización de mensajes (flujos de firma)

Ya presentes en upstream 1.9.1 (`simpleafirmamessages_*`):

| Locale | Fichero |
|--------|---------|
| ES | `simpleafirmamessages_es_ES.properties` |
| CA | `simpleafirmamessages_ca_ES.properties` |
| EU | `simpleafirmamessages_eu_ES.properties` |
| GL | `simpleafirmamessages_gl_ES.properties` |
| VA | `simpleafirmamessages_va_ES.properties` |
| EN | `simpleafirmamessages_en_US.properties` |

Preparados para Weblate: copiar este directorio como componente; no se ha montado instancia Weblate en este ciclo.

## Auditoría de los tres flujos (checklist)

| Flujo | Teclado | Lector (Orca/NVDA) | Estado 2026-09-23 |
|-------|---------|--------------------|-------------------|
| 1. Elegir certificado | Pendiente prueba en GUI | Pendiente | Código: diálogos con `AccessibleContext` / mnemónicos en preferencias y restauración; **falta sesión con Orca** |
| 2. Introducir PIN | Pendiente | Pendiente | OT upstream ya añadió “pegar PIN”; verificar foco y anuncio del campo |
| 3. Confirmar firma | Pendiente | Pendiente | `confirmToSign` con nombre/descripción accesible |

### Hallazgos de código (sin sesión de lector aún)

- Uso extendido de `getAccessibleContext().setAccessibleName/Description` y `setMnemonic` en paneles de preferencias y restauración.
- `packaging/portal-prueba/index.html` incluye `lang="es"` y `role="status"` (punto de partida WCAG para la página de invocación).
- **Pendiente fechado:** sesión Orca + NVDA antes del informe EN 301 549 al 100 %. Fecha objetivo: al disponer de escritorio gráfico con ATK.

## Criterio de salida F7 (este ciclo)

- [x] Informe con fallos/pendientes fechados
- [x] Locales ES/CA/EU/GL/VA/EN documentados
- [x] Página de invocación mínima con base WCAG
- [ ] Correcciones de teclado/lector en los 3 flujos — **aplazadas a sesión GUI** (no bloquean build)

Cuando se complete la sesión Orca, actualizar esta tabla y abrir issues/PRs (F10).
