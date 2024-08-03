gofmt: ## Perform gofmt
	@echo Execute gofmt
	gofmt -s -w .
	goimports -w -local git.puresec.de/ ./


lint: ## Perform golangci-lint
	@echo Start golangci-lint
	golangci-lint run ./...


test-race: ## Checked for race-conditions
	@echo Überprüfe auf race-conditions

	go test -race -run=. -test.timeout=4000s ./... || exit 1;


test: ## Run tests
	go test ./...


cover: ## Creates a golang coverage report. Unit tests must be executed first.
	@echo The coverage report must be opened in the browser.

	$(GO) tool cover -html=cover.out
	$(GO) tool cover -html=ecover.out



## https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' ./Makefile | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
