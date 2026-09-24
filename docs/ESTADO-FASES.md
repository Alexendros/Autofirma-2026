# Autofirma-2026 — estado de fases

**MVP operativo (meta v0.1.1):** [docs/MVP.md](MVP.md) — `bash scripts/mvp.sh`  
**v0.2.0:** fork BC `Alexendros/clienteafirma` @ `crypto/bouncycastle-jdk18on` + CI dual; ver [W2-BOUNCYCASTLE-PREFLIGHT.md](W2-BOUNCYCASTLE-PREFLIGHT.md)

| Fase | Estado | Evidencia |
|------|--------|-----------|
| F0 Manifiesto | Hecho | `propuesta-autofirma-2026.md` |
| F1 Línea base 1.9.1 | Hecho | `docs/BASELINE.txt`, `docs/build-f1.log` |
| F2 Vectores | Hecho | `scripts/f2-regression.sh`, `vectors/` |
| F3 Cadena suministro | Hecho | `.github/workflows/` (SHA pins), Dependabot, actionlint |
| F4 Inventario cripto | Hecho | `docs/F4-INVENTARIO-CRIPTO.md` (migración BC aplazada) |
| F5 JDK 21 runtime | Hecho | `docs/F5-JDK21.md` |
| F6 Paquetes Linux | Hecho | `packaging/*.deb`, portal de prueba |
| F7 Accesibilidad | Informe | `docs/F7-ACCESIBILIDAD.md` (sesión Orca pendiente) |
| F8 Trifásico | Hecho | WAR 2.9.1 + `docs/F8-TRIFASICA.md` |
| F9 Integr@/FIRe | Hecho | FIRe OK; Integr@ bloqueado iText HTTP — `docs/F9-INTEGRA-FIRE.md` |
| F10 Upstream | Tabla | `docs/F10-UPSTREAM.md` |
