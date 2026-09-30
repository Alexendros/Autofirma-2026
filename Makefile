# Autofirma-2026 — fachada local del meta-repo (P0 shell).
# No clona clienteafirma ni construye autofirma.jar.

SCRIPTS := $(wildcard scripts/*.sh)

.PHONY: help quality lint test smoke validate review360 review360-r2 remediation360

help:
	@printf '%s\n' \
	  'make quality         bash -n + shellcheck on scripts/' \
	  'make test            meta-repo invariants (no clienteafirma)' \
	  'make smoke           --help and presence checks' \
	  'make validate        quality + test + smoke' \
	  'make review360       verify CODE-REVIEW-360 findings' \
	  'make review360-r2    verify CODE-REVIEW-360-R2 findings' \
	  'make remediation360  verify post-audit mitigations' \
	  'make lint            alias of quality'

quality lint:
	@for f in $(SCRIPTS); do bash -n $$f && echo "OK $$f"; done
	@if command -v shellcheck >/dev/null 2>&1; then \
		shellcheck -S error -x $(SCRIPTS); \
	else \
		echo "shellcheck no instalado; omitido (CI lo instala)"; \
	fi

test:
	bash scripts/ci-meta-test.sh

smoke:
	bash scripts/ci-smoke.sh

validate: quality test smoke

review360:
	bash scripts/verify-code-review-360.sh

review360-r2:
	bash scripts/verify-code-review-360-r2.sh

remediation360:
	bash scripts/verify-remediation-360.sh
