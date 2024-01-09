.PHONY: lint, lint-fix
## Lint:
lint: ## Run all available linters
	golangci-lint run --timeout=5m

lint-fix: ## Run all available linters and fix the issues
	golangci-lint run --timeout=5m --fix

.PHONY: run-test-db
run-test-db: ## Run test database
	docker-compose up -d db
