# Tests de validación (Autofirma-2026)

## Qué se valida

| Capa | Qué comprueba | Cómo |
|------|---------------|------|
| Generación F2 | Firma CLI CAdES/XAdES/PAdES/FacturaE + cofirma/contrafirma | `scripts/f2-regression.sh` |
| Integridad local | `SignValider` sobre vectores; datos correctos vs adulterados | `tests/validation-harness` |
| Upstream validation | Tests CTT de `afirma-crypto-validation` | Maven `-pl afirma-crypto-validation` |
| Upstream CAdES/PDF | Suite unitaria (sin DNIe / sin Red SARA) | Maven `-pl afirma-crypto-cades,afirma-crypto-pdf` |

## Qué no se valida aquí

- Revocación OCSP / confianza de CA de producción (certificado ANF de prueba).
- VALIDe / WS `@firma` (Red SARA) — ver `docs/VALIDE_MANUAL.md`.
- OOXML/ODF: el factory no tiene validador (`SignValiderFactory` avisa).
- DNIe hardware — `scripts/dnie-hardware-check.sh`.

## Ejecutar

```bash
export JAVA_HOME=$PWD/tools/jdk8
export PATH=$PWD/tools/apache-maven-3.9.9/bin:$JAVA_HOME/bin:$PATH
bash scripts/f2-validate.sh
# o solo harness:
bash scripts/f2-regression.sh
cd tests/validation-harness && mvn -B test -Dvectors.dir=$PWD/../../vectors
```

Criterio de aceptación del harness: la firma no está corrupta ni desalineada con los datos; un KO solo por certificado de prueba **sí** se acepta.

## Resultados locales (2026-09-23)

| Suite | Resultado |
|-------|-----------|
| `validation-harness` | 9 tests, 0 fallos |
| `afirma-crypto-validation` | 11 tests, 0 fallos |
| `afirma-crypto-cades` | 24 tests (1 skipped), 0 fallos |
| `afirma-crypto-pdf` (filtro sin Baseline/DNIe) | 31 tests (4 skipped), 0 fallos |
